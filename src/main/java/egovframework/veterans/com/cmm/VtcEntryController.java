package egovframework.veterans.com.cmm;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.veterans.com.cmm.service.VtcDCService;
import egovframework.veterans.com.cmm.service.VtcEntryService;
import egovframework.veterans.com.cmm.service.VtcItemService;
import egovframework.veterans.com.cmm.service.VtcLockerService;
import egovframework.veterans.com.cmm.service.VtcMemberService;
import egovframework.veterans.com.cmm.service.VtcPaidService;
import egovframework.veterans.com.cmm.service.VtcSLOrderService;
import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.SLOrderDetail;
import egovframework.veterans.com.cmm.service.vo.SLOrderGroup;
import egovframework.veterans.com.cmm.service.vo.SLOrderItem;
import egovframework.veterans.com.cmm.service.vo.SLOrders;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.tblmember;
import egovframework.veterans.com.cmm.service.vo.tblmemberphoto;
import egovframework.veterans.com.cmm.service.vo.tblpaid;
import egovframework.veterans.lib.Functions;
import egovframework.veterans.lib.UNILockerController;
import egovframework.veterans.lib.service.CommonService;
import egovframework.veterans.lib.service.OfflinePayService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class VtcEntryController{

	Functions f = Functions.getInstance();

	private final HttpSession session;
	private final VtcMemberService vtcMemberService;
	private final VtcLockerService vtcLockerService;
	private final VtcEntryService vtcEntryService;
	private final CommonService commonService;
	private final VtcService VtcService;
	
	private final VtcPaidService VtcPaidService;
	private final OfflinePayService OfflinePayService;

	private final VtcDCService vtcDCService;

	private final VtcSLOrderService orderService;

	//TODO 출입관리-일일입장관리
	@GetMapping("OneDayOrder.do")
	public String OneDayOrder(ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			//model.addAttribute("script", "back");
			//return "redirect:login.do";
			model.addAttribute("script", "reload");
			return "common/msg";
		}

		List<SLOrderGroup> group = orderService.selectSLOrderGroup(users.getSiteCode());
		List<SLOrderItem> item = orderService.listSLOderItem(users.getSiteCode());

		log.debug("item : " + item);

		model.addAttribute("group", group);
		model.addAttribute("item", item);
		model.addAttribute("svrTime", group.get(0).getSvrTime());
		
		return "entry/oneday/oneDayOrder";
	}
	//
	@PostMapping("/GroupValue")
	@ResponseBody
	public Map<String, Object> groupValue(ModelMap model, @RequestParam(name = "value") int value) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			return null;
		}
		Map<String, Object> pkid = new HashMap<>();

		pkid.put("SiteCode", users.getSiteCode());
		pkid.put("value", value);

		List<SLOrderItem> groups = orderService.listGroupItem(pkid);
	   
		Map<String, Object> map = new HashMap<>();

		map.put("size", groups.size());
		map.put("list", groups);

		return map;
	}
	// 정원 체크
	@PostMapping("/Jungwon")
	@ResponseBody
	public Map<String,Object> jungwonChk(HttpServletRequest request) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			return null;
		}
		Map<String, Object> setSql = new HashMap<>();
		setSql.put("SiteCode", users.getSiteCode());
		setSql.put("SaleDate", f.formatDate(new Date(),"yMd"));
		setSql.put("ItemPKID", f.getNullToSpaceInt(request.getParameter("pkid")));

		int inwon = orderService.getOrderItemJungwon(setSql);
		setSql = orderService.getItemJungwon(setSql);
		setSql.put("inwon",inwon);

		return setSql;
	}

	//TODO 일일입장 - 할인 페이지
	@GetMapping("/order/discount.do")
	public String DiscountPage(ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			return null;
		}
		DC dc = new DC();
		dc.setSiteCode(users.getSiteCode());
		List<DC> dcList = vtcDCService.dclist(dc);
		model.addAttribute("dcList", dcList);
		return "entry/oneday/discount";
	}

	//TODO 일일입장 임시정보
	@PostMapping("orderTemp.do")
	@ResponseBody
	public int orderTemp(@RequestBody SLOrders orders) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			return 0;
		}
		orders.setSiteCode(users.getSiteCode());
		for(SLOrderDetail details: orders.getDetails()) {
			details.setSiteCode(users.getSiteCode());
			details.setTotalPrice(details.getAmount()*details.getUnitPrice());
			SLOrderItem item = new SLOrderItem();
			item.setSiteCode(users.getSiteCode());
			item.setPkid(details.getItemPKID());
			item = orderService.getOrderItemDetail(item);
			details.setAdultGbn(f.getNullToSpaceInt(item.getAdultGBN()));
			details.setFromTime(item.getFromTime());
			details.setToTime(item.getToTime());
			details.setGender(f.getNullToSpaceInt(item.getGender()));
			orders.setTotalPrice(orders.getTotalPrice()+details.getTotalPrice());
			orders.setTotalPrice(orders.getDCPrice()+details.getDCPrice());
		}
		//log.debug(orders.toString());
		return orderService.insertSLOrdersTemp(orders);
	}

	//TODO 일일입장 결제처리
	@PostMapping("orderinsert")
	@ResponseBody
	public int orderinsert(tblpaid tblpaid) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			return 0;
		}
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("SiteCode",users.getSiteCode());
		returnMap.put("SaleType",tblpaid.getSaleType());
		returnMap.put("tempSaleNo",tblpaid.getFPKID());
		returnMap.put("userPKID",users.getUserPKID());
		returnMap = OfflinePayService.insertSLOrders(returnMap);
		
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("saleDate", tblpaid.getSaleDate());
	    map.put("outputOrderNo", 0);
	    
	    tblpaid.setSiteCode(users.getSiteCode());
	    tblpaid.setFPKID(f.getNullToSpaceInt(returnMap.get("Group_SaleNo")));
	    tblpaid.setPaidGroupSaleNo(f.getNullToSpaceInt(returnMap.get("Group_SaleNo")));
	    VtcPaidService.callSelectReceiptNo(map);
	    tblpaid.setReceiptNo(String.valueOf(map.get("outputOrderNo")));

	    tblpaid.setAddUserPKID(users.getUserPKID());
	    tblpaid.setUpdUserPKID(users.getUserPKID());

	    VtcPaidService.tblpaidinsert(tblpaid);
	    if(!tblpaid.getPayType().equals("현금")
	    &&!tblpaid.getPayType().equals("계좌이체")) {
	    	VtcPaidService.tblElecAssignDataInsert(tblpaid);
	    }
		
		return tblpaid.getPKID();
	}

	//TODO 일일입장 전자키배정입장
	@PostMapping("orderentry.do")
	@ResponseBody
	public Map<String,Object> orderEntry(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			return null;
		}
		Map<String,Object> resultMap = new HashMap<String,Object>();

		String MemberID = f.getNullToSpaceStrValue(request.getParameter("MemberID"));
		int SaleNo 		= f.getNullToSpaceInt(request.getParameter("SaleNo"));
		boolean uniLock = Boolean.parseBoolean(request.getParameter("autoLockerUse"));
		String PosGBN	= f.getNullToSpaceStrValue(request.getParameter("PosGBN"));

		tblmember tblmember = new tblmember();
		tblmember.setMemberID(MemberID);
		tblmember.setSiteCode(users.getSiteCode());
		tblmember = vtcMemberService.tblmemberBymemberId(tblmember);

		tblmember.setSiteCode(users.getSiteCode());
		tblmember.setEntrySaleNo(SaleNo);
		tblmember.setToDay(f.formatDate(new Date(),"yMd"));
		List<Map<String,Object>> entryClassList = vtcEntryService.selectEntryClassInfo(tblmember);
		Map<String,Object> entryClass = entryClassList.get(0);

		if(uniLock) {
			int iAge = f.getAge(tblmember.getBirthDay());
			String sDaeSo = "";

			if(iAge == 0) {
				if(f.getNullToSpaceStrValue(tblmember.getTypeText()).indexOf("어린이") >= 0
				&& f.getNullToSpaceStrValue(tblmember.getTypeText()).indexOf("경로") >= 0) {
					sDaeSo = "소인";
				}else{
					sDaeSo = "대인";
				}
			}else {
				if(f.getNullToSpaceStrValue(tblmember.getTypeText()).indexOf("어린이") >= 0
				&& f.getNullToSpaceStrValue(tblmember.getTypeText()).indexOf("경로") >= 0) {
					sDaeSo = "소인";
				}else{
					if(iAge >= 60) {
						sDaeSo = "소인";	
					}else {
						sDaeSo = "대인";
					}
				}
			}
			
			int iUpjang = f.getNullToSpaceInt(entryClass.get("LockerCondition"));
			String strLockerCondition = f.getNullToSpaceStrValue(entryClass.get("UpjangName"));
			if(f.getNullToSpaceStrValue(entryClass.get("CategoryName")).indexOf("수영") >= 0) {
				strLockerCondition = "수영장";
			}else if(f.getNullToSpaceStrValue(entryClass.get("CategoryName")).indexOf("헬스") >= 0) {
				strLockerCondition = "헬스장";
			}
			int LngLockerManAddNum = f.getNullToSpaceInt(entryClass.get("LockerManAddNum"));
			int LngLockerWoManAddNum= f.getNullToSpaceInt(entryClass.get("LockerWoManAddNum"));

			/*if(!f.getNullToSpaceStrValue(request.getParameter("strLockerCondition")).equals("")) {
				strLockerCondition = f.getNullToSpaceStrValue(request.getParameter("strLockerCondition"));
				LngLockerManAddNum = f.getNullToSpaceInt(request.getParameter("LngLockerManAddNum"));
				LngLockerWoManAddNum = f.getNullToSpaceInt(request.getParameter("LngLockerWoManAddNum"));
			}*/
			
			int LockerType = 0;
			if(tblmember.getGenderText().equals("남자") && sDaeSo.equals("대인")) {
				LockerType = 0;
			}else if(tblmember.getGenderText().equals("남자") && sDaeSo.equals("소인")) {
				LockerType = 1;
			}else if(tblmember.getGenderText().equals("여자") && sDaeSo.equals("대인")) {
				LockerType = 2;
			}else {
				LockerType = 3;
			}
			Map<String,Object> siteIdSet = VtcService.selectSiteIdSet(users.getSiteCode());

			String IP = f.getNullToSpaceStrValue(siteIdSet.get("Locker_Svr_IP"));
			int Port = f.getNullToSpaceInt(siteIdSet.get("Locker_Svr_Port"));
			
			String result = UNILockerController.UniLockAutoB(users.getSiteCode(), MemberID, iUpjang, LockerType, IP, Port, strLockerCondition, LngLockerManAddNum, LngLockerWoManAddNum);
			if(result.equals("false")) {
				resultMap.put("Code","9999");
				resultMap.put("Msg","발권 실패!<br>락카확인 및 수동발권을 하십시요!");
				return resultMap;
			}else {
				Map<String,Object> setSql = new HashMap<String,Object>();
				setSql.put("SiteCode",users.getSiteCode());
				setSql.put("SaleNo",SaleNo);
				setSql.put("LockerPKID",result);

				if(MemberID.equals("")) {
					setSql.put("CustCode",MemberID);
					setSql.put("BaejungType","일일입장");
				}else {
					setSql.put("CustCode",MemberID);
					setSql.put("BaejungType","회원입장");
					setSql.put("KioskNo","");
				}
				/*if(tblmember.getGender() == 0) {
					setSql.put("Gender","F");
				}else {
					setSql.put("Gender","M");	
				}*/
				setSql.put("Gender",tblmember.getGender());
				setSql.put("PosGBN",PosGBN);
				setSql.put("UserPKID",users.getUserPKID());

				vtcEntryService.insertEntry(setSql);
				resultMap.put("lockerNo",result);
			}
		}else {
			Map<String,Object> setSql = new HashMap<String,Object>();
			setSql.put("SiteCode",users.getSiteCode());
			setSql.put("SaleNo",SaleNo);
			setSql.put("LockerPKID",-5000);

			if(MemberID.equals("")) {
				setSql.put("CustCode",MemberID);
				setSql.put("BaejungType","일일입장");
			}else {
				setSql.put("CustCode",MemberID);
				setSql.put("BaejungType","회원입장");
				setSql.put("KioskNo","");
			}
			/*if(tblmember.getGender() == 0) {
				setSql.put("Gender","F");
			}else {
				setSql.put("Gender","M");	
			}*/
			setSql.put("Gender",tblmember.getGender());
			setSql.put("PosGBN",PosGBN);
			setSql.put("UserPKID",users.getUserPKID());
			
			vtcEntryService.insertEntry(setSql);
			resultMap.put("lockerNo",0);
			
		}
		resultMap.put("Code","0000");
		resultMap.put("Msg",entryClass.get("CategoryName")+ " "+entryClass.get("JungName") +" "+ entryClass.get("DayName"));
		
		//fc.playAudio("/file/Sound/E.wav", response);
		return resultMap;
	}

	// TODO 출입관리- 출입관리 페이지
	@GetMapping("/entryManage.do")
	public String memEntryManage(tblmember tblmember, ModelMap model) throws Exception {
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
		   model.addAttribute("script", "reload");
	       return "common/msg";
	   }

	   Map<String,Object> setSql = new HashMap<String,Object>();
	   setSql.put("SiteCode",users.getSiteCode());
	   setSql.put("CodeGroupID",1);
	   List<Map<String,Object>> configList = commonService.selectCodeList(setSql);
	   model.addAttribute("configList", configList);
	   return "entry/entryManage";
	}

	//입장회원 조회
	@PostMapping("entryChk.do")
	@ResponseBody
	public Map<String,Object> memEntryChk(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return null;
		}

		String findvalue = request.getParameter("findvalue");
		String findcategory = request.getParameter("findcategory");
		Map<String, Object> find = new HashMap<>();
		find.put("findvalue", findvalue);
		find.put("findcategory", findcategory);
		List<tblmember> findlist = vtcMemberService.findmember(find);

		Map<String,Object> getMap = new HashMap<String,Object>();
		if (findlist.size() == 0) {
			getMap.put("code","9999");
		} else if (findlist.size() == 1) {
			if(Objects.isNull(findlist.get(0).getBarCode())||findlist.get(0).getBarCode().equals("")) {
				getMap.put("code","9998");
			}else {
				getMap.put("code","0000");
				getMap.put("member",findlist.get(0));
				tblmemberphoto tblmemberphoto = vtcMemberService.MemebrPhotoByMemberID(findlist.get(0).getMemberID());
				String base64Image = "";
				if(tblmemberphoto == null) {
					base64Image = null;
				}else {
					byte[] imageBytes = tblmemberphoto.getPhoto();
					if(imageBytes == null) {
						base64Image = null;
					}else {
						base64Image = Base64.getEncoder().encodeToString(imageBytes);
					}	
				}
				getMap.put("base64Image",base64Image);
			}
		} else {
			getMap.put("code","1111");
		}
		return getMap;
	}
	
	
	//TODO 출입관리 입장가능강좌 체크
	@PostMapping("memEntryChk.do")
	@ResponseBody 
	public Map<String,Object> memEntryChk(tblmember tblmember, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return null;
		}

		int msgType = 0;
		
		String chkWeekenInoutTime = f.getNullToSpaceStrValue(request.getParameter("chkWeekenInoutTime"));
		String chkOutYN = f.getNullToSpaceStrValue(request.getParameter("chkOutYN"));
		boolean bOK = false;
		boolean outState = false;

		tblmember = vtcMemberService.tblmemberBymemberId(tblmember);

		String resultMsg = "";

		int validCnt = 0;
		tblmember.setSiteCode(users.getSiteCode());
		tblmember.setToDay(f.formatDate(new Date(),"yMd"));
		List<Map<String,Object>> entryClassList = vtcEntryService.selectEntryClassInfo(tblmember);

		if(entryClassList.size() == 0) {
			resultMsg = "등록한 강습정보가 존재하지 않습니다.";
			msgType = 6;
		}

		List<Map<String,Object>> entryItemList = new ArrayList<>();

		for(Map<String,Object> entryClass:entryClassList) {
			Map<String,Object> entryItem = new HashMap<String,Object>();

			if((bOK == false && outState == false) || validCnt > 0 ) {
				if(f.getNullToSpaceIntDate(f.getcurDate().substring(0,8)) >= f.getNullToSpaceIntDate(entryClass.get("RFromDate"))
				&& f.getNullToSpaceIntDate(f.getcurDate().substring(0,8)) <= f.getNullToSpaceIntDate(entryClass.get("RToDate"))) {
					if(chkWeekenInoutTime.equals("true")) {//주말입장시간 제한없음(~23:00)
						switch(LocalDate.now().getDayOfWeek().getValue()) {
						case 6:
						case 7:
							entryClass.put("ToTime","23:00");
							break;
						}
					}
					Map<String,Object> setSql = new HashMap<String,Object>();
					setSql.put("SiteCode",users.getSiteCode());
					setSql.put("MemberID",tblmember.getMemberID());
					setSql.put("InDate",entryClass.get("INDATE"));
					setSql.put("SaleNo",entryClass.get("SaleNo"));

					if(chkOutYN.equals("true") && vtcEntryService.outEntry(setSql) > 0) {
						//퇴장처리
						outState = true;
						bOK = false;
						resultMsg = f.getNullToSpaceStrValue(entryClass.get("JungName")) + " 퇴장";
					}else {
						if(f.getNullToSpaceInt(entryClass.get("CNT")) > 0 
						&& f.getNullToSpaceInt(entryClass.get("CNT")) < f.getNullToSpaceInt(entryClass.get("InCnt"))) {
							if(!f.CheckClassDay(f.getNullToSpaceStrValue(entryClass.get("DayName")))) {
								//강습요일이 아닐경우
								bOK = false;
								resultMsg = "주중 강습회원 - 입장불가";
								msgType = 3;
							}else {
								//강습요일인 경우
								if(f.getNullToSpaceStrValue(entryClass.get("FromTime")).equals("")) {
									//입장시간 없음
									bOK = true;
									resultMsg = f.getNullToSpaceStrValue(entryClass.get("JungName")) + " 입장";
								}else {
									int iWeek = LocalDate.now().getDayOfWeek().getValue();
									String sInTime = "";
									switch(iWeek) {
									case 1:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("MonIn"));
										break;
									case 2:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("TuesIn"));
										break;
									case 3:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("WedNesIn"));
										break;
									case 4:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("ThursIn"));
										break;
									case 5:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("FriIn"));
										break;
									case 6:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("SaturIn"));
										break;
									case 7:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("SunIn"));
										break;
									}

									if(f.getNullToSpaceIntTime(f.getcurDate().substring(8,12)) >= f.getNullToSpaceIntTime(sInTime)
									&& f.getNullToSpaceIntTime(f.getcurDate().substring(8,12)) <= f.getNullToSpaceIntTime(entryClass.get("ToTime"))) {
										bOK = true;
										resultMsg = f.getNullToSpaceStrValue(entryClass.get("JungName")) +" 일일 "
												+ (f.getNullToSpaceInt(entryClass.get("CNT"))+1) + " 입장";
										validCnt++;
										entryItem.put("resultMsg",resultMsg);
										entryItem.put("SaleNo",entryClass.get("SaleNo"));
									}else {
										//입장 불가
										bOK = false;
										if(sInTime.equals(""))sInTime="00:00";
										resultMsg = "입장불가[입장가능 시간:"+sInTime+"] 현재시간: "+f.getcurDate().substring(8,10)+":"+f.getcurDate().substring(10,12);
										msgType = 3;
									}
								}
							}
						}else if(f.getNullToSpaceInt(entryClass.get("CNT")) == 0){
							if(!f.CheckClassDay(f.getNullToSpaceStrValue(entryClass.get("DayName")))) {
								//강습요일이 아닐경우
								bOK = false;
								resultMsg = "주중 강습회원 - 입장불가";
								msgType = 3;
							}else {
								//강습요일인 경우
								if(f.getNullToSpaceStrValue(entryClass.get("FromTime")).equals("")) {
									//입장시간 없음
									bOK = true;
									resultMsg = f.getNullToSpaceStrValue(entryClass.get("JungName")) + " 입장";
								}else {
									int iWeek = LocalDate.now().getDayOfWeek().getValue();
									String sInTime = "";
									switch(iWeek) {
									case 1:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("MonIn"));
										break;
									case 2:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("TuesIn"));
										break;
									case 3:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("WednesIn"));
										break;
									case 4:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("ThursIn"));
										break;
									case 5:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("FriIn"));
										break;
									case 6:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("SaturIn"));
										break;
									case 7:
										sInTime = f.getNullToSpaceStrValue(entryClass.get("SunIn"));
										break;
									}

									if(f.getNullToSpaceIntTime(f.getcurDate().substring(8,12)) >= f.getNullToSpaceIntTime(sInTime)
									&& f.getNullToSpaceIntTime(f.getcurDate().substring(8,12)) <= f.getNullToSpaceIntTime(entryClass.get("ToTime"))) {
										bOK = true;
										resultMsg = f.getNullToSpaceStrValue(entryClass.get("JungName")) + " 입장";
										validCnt++;
										entryItem.put("SaleNo",entryClass.get("SaleNo"));
									}else {
										//입장 불가
										bOK = false;
										if(sInTime.equals(""))sInTime="00:00";
										resultMsg = "입장불가[입장가능 시간:"+sInTime+"] 현재시간: "+f.getcurDate().substring(8,10)+":"+f.getcurDate().substring(10,12);
										msgType = 3;
									}
								}
							}
						}else if(f.getNullToSpaceInt(entryClass.get("CNT")) >= f.getNullToSpaceInt(entryClass.get("InCnt"))) {
							//입장 횟수 초과
							bOK = false;
							resultMsg = f.getNullToSpaceStrValue(entryClass.get("JungName")) + " 출입제한 : 하루 "
									+ f.getNullToSpaceInt(entryClass.get("CNT"))+"회 이상 입장 불가능";
							msgType = 2;
						}
					}
				}else{
					bOK = false;
					resultMsg = "기간이 유효한 강습정보가 존재하지 않습니다.";
					msgType = 4;
				}
				entryItem.put("ItemName",entryClass.get("JungName")+" "+entryClass.get("LevelName")+"("+ entryClass.get("DayName")+")"+" "+ entryClass.get("FromTime"));
				entryItem.put("responseCode",bOK);
				entryItem.put("resultMsg",resultMsg);
				entryItemList.add(entryItem);
			}else {
				
			}
		}

		Map<String,Object> resultCode = new HashMap<String,Object>();
		resultCode.put("validCnt",validCnt);
		resultCode.put("msgType",msgType);
		resultCode.put("entryItemList",entryItemList);
		
		/*if(validCnt==1) {
		}else if(validCnt > 1) {
		}else {
			switch(msgType) {
			case 1:
				
				break;
			case 2:
				fc.playAudio("/file/Sound/2회입장.wav", response);
				break;
			case 3:
				fc.playAudio("/file/Sound/입장시간아님.wav", response);
				break;
			case 4:
				fc.playAudio("/file/Sound/강습만료.wav", response);
				break;
			case 5:
				fc.playAudio("/file/Sound/입장처리실패.wav", response);
				break;
			case 6:
				fc.playAudio("/file/Sound/등록된강습정보 미존재.wav", response);
				break;
			}
		}*/

		return resultCode;
	}

	//TODO 출입관리 강좌입장
	@PostMapping("entry.do")
	@ResponseBody
	public Map<String,Object> memEntry(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			return null;
		}
		Map<String,Object> resultMap = new HashMap<String,Object>();

		String MemberID = f.getNullToSpaceStrValue(request.getParameter("MemberID"));
		int SaleNo 		= f.getNullToSpaceInt(request.getParameter("SaleNo"));
		boolean uniLock = Boolean.parseBoolean(request.getParameter("autoLockerUse"));
		String PosGBN	= f.getNullToSpaceStrValue(request.getParameter("PosGBN"));

		tblmember tblmember = new tblmember();
		tblmember.setMemberID(MemberID);
		tblmember.setSiteCode(users.getSiteCode());
		tblmember = vtcMemberService.tblmemberBymemberId(tblmember);

		tblmember.setSiteCode(users.getSiteCode());
		tblmember.setEntrySaleNo(SaleNo);
		tblmember.setToDay(f.formatDate(new Date(),"yMd"));
		List<Map<String,Object>> entryClassList = vtcEntryService.selectEntryClassInfo(tblmember);
		Map<String,Object> entryClass = entryClassList.get(0);

		if(uniLock) {
			int iAge = f.getAge(tblmember.getBirthDay());
			String sDaeSo = "";

			if(iAge == 0) {
				if(f.getNullToSpaceStrValue(tblmember.getTypeText()).indexOf("어린이") >= 0
				&& f.getNullToSpaceStrValue(tblmember.getTypeText()).indexOf("경로") >= 0) {
					sDaeSo = "소인";
				}else{
					sDaeSo = "대인";
				}
			}else {
				if(f.getNullToSpaceStrValue(tblmember.getTypeText()).indexOf("어린이") >= 0
				&& f.getNullToSpaceStrValue(tblmember.getTypeText()).indexOf("경로") >= 0) {
					sDaeSo = "소인";
				}else{
					if(iAge >= 60) {
						sDaeSo = "소인";	
					}else {
						sDaeSo = "대인";
					}
				}
			}
			
			int iUpjang = f.getNullToSpaceInt(entryClass.get("LockerCondition"));
			String strLockerCondition = f.getNullToSpaceStrValue(entryClass.get("UpjangName"));
			if(f.getNullToSpaceStrValue(entryClass.get("CategoryName")).indexOf("수영") >= 0) {
				strLockerCondition = "수영장";
			}else if(f.getNullToSpaceStrValue(entryClass.get("CategoryName")).indexOf("헬스") >= 0) {
				strLockerCondition = "헬스장";
			}
			int LngLockerManAddNum = f.getNullToSpaceInt(entryClass.get("LockerManAddNum"));
			int LngLockerWoManAddNum= f.getNullToSpaceInt(entryClass.get("LockerWoManAddNum"));

			/*if(!f.getNullToSpaceStrValue(request.getParameter("strLockerCondition")).equals("")) {
				strLockerCondition = f.getNullToSpaceStrValue(request.getParameter("strLockerCondition"));
				LngLockerManAddNum = f.getNullToSpaceInt(request.getParameter("LngLockerManAddNum"));
				LngLockerWoManAddNum = f.getNullToSpaceInt(request.getParameter("LngLockerWoManAddNum"));
			}*/
			
			int LockerType = 0;
			if(tblmember.getGenderText().equals("남자") && sDaeSo.equals("대인")) {
				LockerType = 0;
			}else if(tblmember.getGenderText().equals("남자") && sDaeSo.equals("소인")) {
				LockerType = 1;
			}else if(tblmember.getGenderText().equals("여자") && sDaeSo.equals("대인")) {
				LockerType = 2;
			}else {
				LockerType = 3;
			}
			Map<String,Object> siteIdSet = VtcService.selectSiteIdSet(users.getSiteCode());

			String IP = f.getNullToSpaceStrValue(siteIdSet.get("Locker_Svr_IP"));
			int Port = f.getNullToSpaceInt(siteIdSet.get("Locker_Svr_Port"));
			
			String result = UNILockerController.UniLockAutoB(users.getSiteCode(), MemberID, iUpjang, LockerType, IP, Port, strLockerCondition, LngLockerManAddNum, LngLockerWoManAddNum);
			if(result.equals("false")) {
				resultMap.put("Code","9999");
				resultMap.put("Msg","발권 실패!<br>락카확인 및 수동발권을 하십시요!");
				return resultMap;
			}else {
				Map<String,Object> setSql = new HashMap<String,Object>();
				setSql.put("SiteCode",users.getSiteCode());
				setSql.put("SaleNo",SaleNo);
				setSql.put("LockerPKID",result);

				if(MemberID.equals("")) {
					setSql.put("CustCode",MemberID);
					setSql.put("BaejungType","일일입장");
				}else {
					setSql.put("CustCode",MemberID);
					setSql.put("BaejungType","회원입장");
					setSql.put("KioskNo","");
				}
				/*if(tblmember.getGender() == 0) {
					setSql.put("Gender","F");
				}else {
					setSql.put("Gender","M");	
				}*/
				setSql.put("Gender",tblmember.getGender());
				setSql.put("PosGBN",PosGBN);
				setSql.put("UserPKID",users.getUserPKID());

				vtcEntryService.insertEntry(setSql);
				resultMap.put("lockerNo",result);
			}
		}else {
			Map<String,Object> setSql = new HashMap<String,Object>();
			setSql.put("SiteCode",users.getSiteCode());
			setSql.put("SaleNo",SaleNo);
			setSql.put("LockerPKID",-5000);

			if(MemberID.equals("")) {
				setSql.put("CustCode",MemberID);
				setSql.put("BaejungType","일일입장");
			}else {
				setSql.put("CustCode",MemberID);
				setSql.put("BaejungType","회원입장");
				setSql.put("KioskNo","");
			}
			/*if(tblmember.getGender() == 0) {
				setSql.put("Gender","F");
			}else {
				setSql.put("Gender","M");	
			}*/
			setSql.put("Gender",tblmember.getGender());
			setSql.put("PosGBN",PosGBN);
			setSql.put("UserPKID",users.getUserPKID());
			
			vtcEntryService.insertEntry(setSql);
			resultMap.put("lockerNo",0);
			
		}
		resultMap.put("Code","0000");
		resultMap.put("Msg",entryClass.get("CategoryName")+ " "+entryClass.get("JungName") +" "+ entryClass.get("DayName"));
		
		//fc.playAudio("/file/Sound/E.wav", response);
		return resultMap;
	}
	
	//TODO 출입관리 - 사물함조회, 강좌조회, 입장조회, 상담조회 
	@PostMapping("memLockerInfo.do")
	@ResponseBody
	public List<Map<String,Object>> memLockerInfo(tblmember tblmember, ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return null;
		}
		tblmember.setSiteCode(users.getSiteCode());
		List<Map<String,Object>> lockerList = vtcLockerService.selectPlockerInfo(tblmember);
		
		return lockerList;
	}

	@PostMapping("memClassInfo.do")
	@ResponseBody
	public List<Map<String,Object>> memClassInfo(tblmember tblmember, ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return null;
		}
		tblmember.setSiteCode(users.getSiteCode());
		tblmember.setToDay(f.formatDate(new Date(),"yMd"));
		List<Map<String,Object>> entryClassList = vtcEntryService.selectEntryClassInfo(tblmember);
		
		return entryClassList;
	}
	
	@PostMapping("memEntryInfo.do")
	@ResponseBody
	public List<Map<String,Object>> memEntryInfo(tblmember tblmember, ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return null;
		}
		tblmember.setSiteCode(users.getSiteCode());
		tblmember.setToDay(f.formatDate(new Date(),"yMd"));
		List<Map<String,Object>> entryClassList = vtcEntryService.selectEntryInfo(tblmember);
		
		return entryClassList;
	}
	
	@PostMapping("memTalkInfo.do")
	@ResponseBody
	public List<Map<String,Object>> memTalkInfo(tblmember tblmember, ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return null;
		}
		tblmember.setSiteCode(users.getSiteCode());
		tblmember.setToDay(f.formatDate(new Date(),"yMd"));
		List<Map<String,Object>> entryClassList = vtcEntryService.selectTalkInfo(tblmember);
		
		return entryClassList;
	}
}