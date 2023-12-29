package egovframework.veterans.com.cmm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.veterans.com.cmm.service.VtcItemService;
import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.VtcUserService;
import egovframework.veterans.com.cmm.service.vo.TblItem;
import egovframework.veterans.com.cmm.service.vo.TblItem_01;
import egovframework.veterans.com.cmm.service.vo.TblItem_02;
import egovframework.veterans.com.cmm.service.vo.TblItem_03;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.selectitem;
import egovframework.veterans.com.cmm.service.vo.tblCode;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@SessionAttributes("loginuserinfo")
public class VtcItemController{
   
   private final HttpSession session;
   
   private ApplicationContext applicationContext;

   private static final Logger LOGGER = LoggerFactory.getLogger(VtcItemController.class);
   
   public void afterPropertiesSet() throws Exception {}
   
   
   public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
      this.applicationContext = applicationContext;
      
      LOGGER.info("VtcItemController setApplicationContext method has called!");
   }
   
   @Resource(name="VtcItemService")
   protected VtcItemService vtcItemService;
   
   @Resource(name="VtcService")
   protected VtcService VtcServise;
   
   @Resource(name="VtcUserService")
   protected VtcUserService UserService;
   
   
   @PostMapping("clickValue.do")
   @ResponseBody
   public TblItem_01 handleClickedValues(@RequestParam(name = "itemId") int itemId, TblItem_01 item_01) throws Exception {
      Users users =  (Users) session.getAttribute("loginuserinfo");
      // 클라이언트에서 전송된 클릭된 값 사용하여 필요한 작업 수행
      System.out.println("클릭된 값들: " + itemId);
      
      
      Map<String, Object> map = new HashMap<>();
      item_01.setSiteCode(users.getSiteCode());
      item_01.setGroupID(itemId);
      item_01 = vtcItemService.getItem01(item_01);
      
      //map.put("item_01", item_01);
      
      System.out.println("item_01 : " + item_01);

      // 여기서는 예시로 클릭된 값을 출력하고 뷰 페이지로 이동
      return item_01;
   }
   @PostMapping("clickValue01.do")
   @ResponseBody
   public TblItem_02 handleClickedValuesitem02(@RequestParam(name = "itemId1") int itemId1, TblItem_02 item_02) throws Exception {
	   Users users =  (Users) session.getAttribute("loginuserinfo");
	   // 클라이언트에서 전송된 클릭된 값 사용하여 필요한 작업 수행
	   System.out.println("클릭된 값들: " + itemId1);
	   
	   
	   Map<String, Object> map = new HashMap<>();
	   
	   //map.put("item_01", item_01);
	   
	   
	   // 여기서는 예시로 클릭된 값을 출력하고 뷰 페이지로 이동
	   return item_02;
   }
   
   
   @GetMapping("/itemcode.do")
   public String listItemCode(ModelMap model, TblItem_01 item_01) throws Exception {
      
      Users users =  (Users) session.getAttribute("loginuserinfo");
      if(users ==null) {
         model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
         model.addAttribute("script", "back");

         return "common/msg";
      }
      Map<String, Object> obMap = new HashMap<>();
      obMap.put("SiteCode", users.getSiteCode());
      obMap.put("IsDelete", "N");
      
      item_01 = new TblItem_01();
      item_01.setSiteCode(users.getSiteCode());
      item_01.setIsDelete("N");
      
      int SortOrder = vtcItemService.getSortOrder(users.getSiteCode());
      int item02SortOrder = vtcItemService.getitem02SortOrder(users.getSiteCode());
      int item03SortOrder = vtcItemService.getitem03SortOrder(users.getSiteCode());
      int DefCode = vtcItemService.getitem03DefCode(users.getSiteCode());
      List<TblItem_01> list = vtcItemService.listItemCode(item_01);
      
      System.out.println("list : " + list);
      
      
      
      model.addAttribute("item01", item_01);
      
      model.addAttribute("SortOrder", SortOrder + 1);
      model.addAttribute("SortOrder02", item02SortOrder+1);
      model.addAttribute("SortOrder03", item03SortOrder+1);
      model.addAttribute("DefCode", DefCode+1);
      
      
      model.addAttribute("list", list);
      return "item/itemcode/itemcode";
   }
   
   @RequestMapping(value="/insertItem01.do")
   @ResponseBody
   public String insertItem01(TblItem_01 item_01, Model model, HttpServletRequest request) throws Exception {
      
      Users users = (Users) session.getAttribute("loginuserinfo");
      if(users ==null) {
          model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
          model.addAttribute("script", "back");

          return "common/msg";
       }
      
      int GroupID = vtcItemService.getGroupID(users.getSiteCode());
      String SiteCode = users.getSiteCode();
      String GroupName = request.getParameter("GroupName");
      String jsType = request.getParameter("jsType");
      String JungSiLotteryFromDate = request.getParameter("JungSiLotteryFromDate");
      String JungSiLotteryToDate = request.getParameter("JungSiLotteryToDate");
      String JungSiLotteryDate = request.getParameter("JungSiLotteryDate");
      String JungSiLotteryPayFromDate = request.getParameter("JungSiLotteryPayFromDate");
      String JungSiLotteryPayToDate = request.getParameter("JungSiLotteryPayToDate");
      String JungSiLotteryAddFromDate = request.getParameter("JungSiLotteryAddFromDate");
      String JungSiLotteryAddToDate = request.getParameter("JungSiLotteryAddToDate");
      String JungSi1Inlive = request.getParameter("JungSi1Inlive");
      
      String JungSi1Start = request.getParameter("JungSi1Start");
      String JungSi1S = JungSi1Start.substring(0, 10);
      String JungSi1TimeS = JungSi1Start.substring(JungSi1Start.length()-5, JungSi1Start.length());
      
      String JungSi1End = request.getParameter("JungSi1End");
      String JungSi1E = JungSi1End.substring(0, 10);
      String JungSi1TimeE = JungSi1Start.substring(JungSi1End.length()-5, JungSi1End.length());
      
      String JungSi1 = JungSi1S + "~" + JungSi1E;
      
      String JungSi2Start = request.getParameter("JungSi2Start");
      String JungS21S = JungSi2Start.substring(0, 10);
      String JungSi2TimeS = JungSi2Start.substring(JungSi2Start.length()-5, JungSi2Start.length());
      
      String JungSi2End = request.getParameter("JungSi2End");
      String JungS21E = JungSi2End.substring(0, 10);
      String JungSi2TimeE = JungSi2End.substring(JungSi2End.length()-5, JungSi2End.length());
      
      String JungSi2 = JungS21S + "~" + JungS21E;
      
      String JungSi3Start = request.getParameter("JungSi3Start");
      String JungSi3End = request.getParameter("JungSi3End");
      
      String JungSi3 = JungSi3Start + "~" + JungSi3End;
      
      String FromDate = request.getParameter("FromDate");
      String ToDate = request.getParameter("ToDate");
      int AgainMonth = Integer.parseInt(request.getParameter("AgainMonth"));
      String ItemRejectCnt = request.getParameter("ItemRejectCnt"); 
      int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
      String PayDelayTime = request.getParameter("PayDelayTime");
      String MonthSelNoChk = request.getParameter("MonthSelNo");
      System.out.println("MonthSelNoChk : " + MonthSelNoChk);
      String MonthSelNo = "";
      if(MonthSelNoChk.equals("Y") ) {
    	  MonthSelNo = MonthSelNoChk;
      } else {
    	  MonthSelNo = "N";
      }
      String WebYNChk = request.getParameter("WebYN");
      String WebYN = "";
      if(WebYNChk.equals("Y")) {
    	  WebYN = WebYNChk; 
      } else {
    	  WebYN = "N";
      }
    	  
      int AddUserPKID = users.getUserPKID();
      
      
      item_01.setGroupID(GroupID + 1);
      item_01.setSiteCode(SiteCode);
      item_01.setGroupName(GroupName);
      item_01.setJsType(jsType);
      item_01.setJungSiLotteryFromDate(JungSiLotteryFromDate);
      item_01.setJungSiLotteryToDate(JungSiLotteryToDate);
      item_01.setJungSiLotteryDate(JungSiLotteryDate);
      item_01.setJungSiLotteryPayFromDate(JungSiLotteryPayFromDate);
      item_01.setJungSiLotteryPayToDate(JungSiLotteryPayToDate);
      item_01.setJungSiLotteryAddFromDate(JungSiLotteryAddFromDate);
      item_01.setJungSiLotteryAddToDate(JungSiLotteryAddToDate);
      item_01.setJungSi1Inlive(JungSi1Inlive);
      item_01.setJungSi1(JungSi1);
      item_01.setJungSi1STime(JungSi1TimeS);
      item_01.setJungSi1ETime(JungSi1TimeE);
      item_01.setJungSi2(JungSi2);
      item_01.setJungSi2STime(JungSi2TimeS);
      item_01.setJungSi2ETime(JungSi2TimeE);
      item_01.setJungSi3(JungSi3);
      item_01.setFromDate(FromDate);
      item_01.setToDate(ToDate);
      item_01.setAgainMonth(AgainMonth);
      item_01.setItemRejectCnt(ItemRejectCnt);
      item_01.setPayDelayTime(PayDelayTime);
      item_01.setMonthSelNo(MonthSelNo);
      item_01.setWebYN(WebYN);
      item_01.setSortOrder(SortOrder);
      item_01.setAddUserPKID(AddUserPKID);
      
      
      vtcItemService.item01Insert(item_01);
      
      return "redirect:itemcode.do";
   }
   
   
   
   @RequestMapping(value="/insertItem02.do")
   @ResponseBody
   public String insertItem02(TblItem_02 item_02, ModelMap model, HttpServletRequest request) throws Exception {
	   
      Users users = (Users) session.getAttribute("loginuserinfo");
      if(users ==null) {
          model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
          model.addAttribute("script", "back");

          return "common/msg";
       }
      
      TblItem_01 item_01 = new TblItem_01();
      item_01.setSiteCode(users.getSiteCode());
      item_01.setIsDelete("N");
      
      List<TblItem_01> list = vtcItemService.listItemCode(item_01);
      
      
      try {
         String SiteCode = users.getSiteCode();
         String SubGroupName = request.getParameter("SubGroupName");
         int GroupID = Integer.parseInt(request.getParameter("GroupID"));
         int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
         int InTime = Integer.parseInt(request.getParameter("InTime"));
         int InEndTime = Integer.parseInt(request.getParameter("InEndTime"));
         int AddUserPKID = users.getUserPKID();
         
         item_02.setSiteCode(SiteCode);
         item_02.setGroupID(GroupID);
         item_02.setSubGroupName(SubGroupName);
         item_02.setSortOrder(SortOrder);
         item_02.setInTime(InTime);
         item_02.setInEndTime(InEndTime);
         item_02.setAddUserPKID(AddUserPKID);
         
         vtcItemService.item02Insert(item_02);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      
      model.addAttribute("list", list);
      return "redirect:itemcode.do";
   }
   
   
   @RequestMapping(value="/insertItem03.do")
   public String insertItem03(ModelMap model, HttpServletRequest requset, TblItem_03 item_03) throws Exception {
	   
      Users users = (Users) session.getAttribute("loginuserinfo");
      if(users ==null) {
			model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
			model.addAttribute("script", "back");

			return "common/msg";
      }
      try {
         String SiteCode = users.getSiteCode();
         String DefCode = requset.getParameter("DefCode");
         String LevelName = requset.getParameter("LevelName");
         int SortOrder = Integer.parseInt(requset.getParameter("SortOrder"));
         int AddUserPKID = users.getAddUserPKID();
         
         item_03.setSiteCode(SiteCode);
         item_03.setDefCode(DefCode);
         item_03.setLevelName(LevelName);
         item_03.setSortOrder(SortOrder);
         item_03.setAddUserPKID(AddUserPKID);
         
         vtcItemService.item03Insert(item_03);
         
         model.addAttribute("msg", "등록 되었습니다.");
         model.addAttribute("script", "reload");
 		
 		return "common/msg";
      } catch (Exception e) {
    	  e.printStackTrace();
    	  model.addAttribute("msg", "다시 사용하여주세요");
    	  model.addAttribute("script", "back");
    	  return "common/msg";
      }
		/* return "redirect:itemcode.do"; */
   }
   
  
   
   
   @RequestMapping(value="classinfo.do")
   public String classInfo(ModelMap model, tblCode code,selectitem selectitem) throws Exception {
	   
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users ==null) {
         model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
         model.addAttribute("script", "back");

         return "redirect:login.do";
	   }
	   
	   	TblItem_01 item_01 = new TblItem_01();
	   	item_01.setSiteCode(users.getSiteCode());
	   
	   	TblItem_02 item_02 = new TblItem_02();
	   	item_02.setSiteCode(users.getSiteCode());
		
		TblItem_03 item_03 = new TblItem_03();
		item_03.setSiteCode(users.getSiteCode());
	   
	   code.setSiteCode(users.getSiteCode());
	   code.setCodeGroupID("5");
	   
	   selectitem.setSiteCode(users.getSiteCode());
	   
	   List<selectitem> listSelectItem = vtcItemService.listSelectItemY(selectitem);
	   
	   System.out.println("listSelectItem : " + listSelectItem);
	   
	   
	   List<TblItem_01> listItem01 = vtcItemService.listItemCode(item_01);
	   List<TblItem_02> listItem02 = vtcItemService.listItem02(item_02);
	   List<TblItem_03> listItem03 = vtcItemService.liseItem03(item_03);
	   List<tblCode> listtblCode = VtcServise.listTblCode(code);
	   List<Users> listUsers = UserService.listUsers(users.getSiteCode());
	   int getItemCode = vtcItemService.getItemCode(users.getSiteCode());
	   
	   model.addAttribute("list", listSelectItem);
	   model.addAttribute("item01", listItem01);
	   model.addAttribute("item02", listItem02);
	   model.addAttribute("item03", listItem03);
	   model.addAttribute("tblcode", listtblCode);
	   model.addAttribute("User", listUsers);
	   model.addAttribute("ItemCode", getItemCode+1);
	   
	   
	   
	   return "item/class/classInfo";
   }
   
   @RequestMapping(value="insertClassInfo.do")
   @ResponseBody
   public String insertClassInfo(ModelMap model, HttpServletRequest request, TblItem tblItem) throws Exception {
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
	       model.addAttribute("script", "back");
		   return "redirect:login.do";
	   }
	   	  
	   	  System.out.println("tblItem.getOnMax() : " + tblItem.getOnMax());
	   	  System.out.println("tblItem.getCompanyPer() : " + tblItem.getCompanyPer());
	   	  System.out.println("tblItem.getSawonPer() : " + tblItem.getSawonPer());
	   	  System.out.println("getIsUse() : " + tblItem.getIsUse());
		  String SiteCode = users.getSiteCode();
		  String ItemCode = request.getParameter("ItemCode");
		  String Type = request.getParameter("Type");
		  int GroupID = Integer.parseInt(request.getParameter("GroupID"));
		  int SubGroupID = Integer.parseInt(request.getParameter("SubGroupID"));
		  int LevelID = Integer.parseInt(request.getParameter("LevelID"));
		  int DaeSangID = Integer.parseInt(request.getParameter("DaeSangID"));
		  String FromTime = request.getParameter("FromTime");
		  String ToTime = request.getParameter("ToTime");
		  int ClassCnt = Integer.parseInt(request.getParameter("ClassCnt"));
		  String Mon = request.getParameter("Mon");
		  String MonIn = request.getParameter("MonIn");
		  String Tues = request.getParameter("Tues");
		  String TuesIn = request.getParameter("TuesIn");
		  String Wednes = request.getParameter("Wednes");
		  String WednesIn = request.getParameter("WednesIn");
		  String Thurs = request.getParameter("Thurs");
		  String ThursIn = request.getParameter("ThursIn");
		  String Fri = request.getParameter("Fri");
		  String FriIn = request.getParameter("FriIn");
		  String Satur = request.getParameter("Satur");
		  String SaturIn = request.getParameter("SaturIn");
		  String Sun = request.getParameter("Sun");
		  String SunIn = request.getParameter("SunIn");
		  String Holy = request.getParameter("Holy");
		  String HolyIn = request.getParameter("HolyIn");
		  int OffMax = Integer.parseInt(request.getParameter("OffMax"));
		  /*int OnMax = Integer.parseInt(request.getParameter("OnMax"));*/
		  
		  int ItemMonth = Integer.parseInt(request.getParameter("ItemMonth"));
		  int InCnt = Integer.parseInt(request.getParameter("InCnt"));
		  int DamDangUserPKID = Integer.parseInt(request.getParameter("DamDangUserPKID"));
		  String YakChing = request.getParameter("YakChing");
		  String SalaryType = request.getParameter("SalaryType");
		  /*int CompanyPer = Integer.parseInt(request.getParameter("CompanyPer"));
		  int SawonPer = Integer.parseInt(request.getParameter("SawonPer"));*/
		  String chkPeriod = request.getParameter("chkPeriod");
		  String FromDate = request.getParameter("FromDate");
		  String ToDate = request.getParameter("ToDate");
		  String DcNoChk = request.getParameter("DcNoChk");
		  String OldAgeDCNoGbn = request.getParameter("OldAgeDCNoGbn");
		  String DcNo3MonthChk = request.getParameter("DcNo3MonthChk");
		  String nvat = request.getParameter("nvat");
		  String DefPrice = request.getParameter("DefPrice");
		  String Price1 = request.getParameter("Price1");
		  String Price2 = request.getParameter("Price2");
		  String Price3 = request.getParameter("Price3");
		  String Price4 = request.getParameter("Price4");
		  String IsUse = request.getParameter("IsUse");
		  String IsDelete = request.getParameter("IsDelete");
		  String WebYN = request.getParameter("WebYN");
		  String WebEnd = request.getParameter("WebEnd");
		  String ParkingTime = request.getParameter("ParkingTime");
		  int ageStart = Integer.parseInt(request.getParameter("ageStart"));
		  int ageEnd = Integer.parseInt(request.getParameter("ageEnd"));
		  String AgeYearGbn = request.getParameter("AgeYearGbn");
		  String LotteryGbn = request.getParameter("LotteryGbn");
		  String RecommendGbn = request.getParameter("RecommendGbn");
		  String inliveRegster = request.getParameter("inliveRegster");
		  String Intro = request.getParameter("Intro");
		  String Detail = request.getParameter("Detail");
		  String Note = request.getParameter("Note");
		  String Bigo = request.getParameter("Bigo");
		  
		  tblItem = new TblItem();
		  
		  tblItem.setSiteCode(SiteCode);
		  tblItem.setItemCode(ItemCode);
		  tblItem.setType(Type);
		  tblItem.setGroupID(GroupID);
		  tblItem.setSubGroupID(SubGroupID);
		  tblItem.setLevelID(LevelID);
		  tblItem.setDaeSangID(DaeSangID);
		  tblItem.setFromTime(FromTime);
		  tblItem.setToTime(ToTime);
		  tblItem.setClassCnt(ClassCnt);
		  tblItem.setMon(Mon);
		  tblItem.setMonIn(MonIn);
		  tblItem.setTues(Tues);
		  tblItem.setTuesIn(TuesIn);
		  tblItem.setWednes(Wednes);
		  tblItem.setWednesIn(WednesIn);
		  tblItem.setThurs(Thurs);
		  tblItem.setThursIn(ThursIn);
		  tblItem.setFri(Fri);
		  tblItem.setFriIn(FriIn);
		  tblItem.setSatur(Satur);
		  tblItem.setSaturIn(SaturIn);
		  tblItem.setSun(Sun);
		  tblItem.setSunIn(SunIn);
		  tblItem.setHoly(Holy);
		  tblItem.setHolyIn(HolyIn);
		  tblItem.setOffMax(OffMax);
		  tblItem.setOnMax(tblItem.getOnMax());
		  tblItem.setItemMonth(ItemMonth);
		  tblItem.setInCnt(InCnt);
		  tblItem.setDamDangUserPKID(DamDangUserPKID);
		  tblItem.setYakChing(YakChing);
		  tblItem.setSalaryType(SalaryType);
		  tblItem.setCompanyPer(tblItem.getCompanyPer());
		  tblItem.setSawonPer(tblItem.getSawonPer());
		  tblItem.setChkPeriod(chkPeriod);
		  tblItem.setFromDate(FromDate);
		  tblItem.setToDate(ToDate);
		  tblItem.setDcNoChk(DcNoChk);
		  tblItem.setOldAgeDCNoGbn(OldAgeDCNoGbn);
		  tblItem.setDcNo3MonthChk(DcNo3MonthChk);
		  tblItem.setNvat(nvat);
		  tblItem.setDefPrice(DefPrice);
		  tblItem.setPrice1(Price1);
		  tblItem.setPrice2(Price2);
		  tblItem.setPrice3(Price3);
		  tblItem.setPrice4(Price4);
		  tblItem.setIsUse(IsUse);
		  tblItem.setIsDelete(IsDelete);
		  tblItem.setWebYN(WebYN);
		  tblItem.setWebEnd(WebEnd);
		  tblItem.setParkingTime(ParkingTime);
		  tblItem.setAgeStart(ageStart);
		  tblItem.setAgeEnd(ageEnd);
		  tblItem.setAgeYearGbn(AgeYearGbn);
		  tblItem.setLotteryGbn(LotteryGbn);
		  tblItem.setRecommendGbn(RecommendGbn);
		  tblItem.setInliveRegster(inliveRegster);
		  tblItem.setIntro(Intro);
		  tblItem.setDetail(Detail);
		  tblItem.setNote(Note);
		  tblItem.setBigo(Bigo);
		  tblItem.setAddUserPKID(users.getUserPKID());
		  
		  vtcItemService.itemInsert(tblItem);
	      
	   return "redirect:classinfo.do";
   }
   
   @RequestMapping(value = "itemCode_check.do", method = RequestMethod.GET)
	public @ResponseBody String itemCode_Check(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
	       model.addAttribute("script", "back");
		   return "redirect:login.do";
	   }
		
	   TblItem tblItem = new TblItem();
	   tblItem.setSiteCode(users.getSiteCode());
	   tblItem.setItemCode(request.getParameter("Item_Code"));
		
	   tblItem = vtcItemService.itemCode_Chk(tblItem);
	   System.out.println("tblItem : " + tblItem);
	   if (tblItem != null && !tblItem.getItemCode().equals("")) {
		   return "false";
	   } else {
		   return "true";
	   }
	}
   
   @GetMapping(value="updateItem.do")
   public String updateTblItem(@RequestParam("ItemCode")String ItemCode, ModelMap model, tblCode code,selectitem selectitem) throws Exception {
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
	       model.addAttribute("script", "back");
		   return "redirect:login.do";
	   }
	   
	   System.out.println( "ItemCode : " +  ItemCode);
	   
	   
	   TblItem tblItem = new TblItem();
	   tblItem.setSiteCode(users.getSiteCode());
	   tblItem.setItemCode(ItemCode);
	   
	   TblItem_01 item_01 = new TblItem_01();
	   item_01.setSiteCode(users.getSiteCode());
	   
	   TblItem_02 item_02 = new TblItem_02();
		item_02.setSiteCode(users.getSiteCode());
		
		TblItem_03 item_03 = new TblItem_03();
		item_03.setSiteCode(users.getSiteCode());
	   
	   code.setSiteCode(users.getSiteCode());
	   code.setCodeGroupID("5");
	   
	   
	   selectitem.setSiteCode(users.getSiteCode());
	   List<selectitem> listSelectItem = vtcItemService.listSelectItemY(selectitem);
	   
	   
	   TblItem getItem = vtcItemService.getTblItem(tblItem);
	   List<TblItem_01> listItem01 = vtcItemService.listItemCode(item_01);
	   List<TblItem_02> listItem02 = vtcItemService.listItem02(item_02);
	   List<TblItem_03> listItem03 = vtcItemService.liseItem03(item_03);
	   List<tblCode> listtblCode = VtcServise.listTblCode(code);
	   List<Users> listUsers = UserService.listUsers(users.getSiteCode());
	   
	   model.addAttribute("list", listSelectItem);
	   model.addAttribute("item01", listItem01);
	   model.addAttribute("item02", listItem02);
	   model.addAttribute("item03", listItem03);
	   model.addAttribute("tblcode", listtblCode);
	   model.addAttribute("User", listUsers);
	   model.addAttribute("item", getItem);
	   
	   return "item/class/classUpdate";
   }
   
   @PostMapping(value="updateItem.do") 	   
   public String updateTblItemOK(ModelMap model, HttpServletRequest request, TblItem tblItem1) throws Exception {
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
	       model.addAttribute("script", "back");
		   return "redirect:login.do";
	   }
	   
	   try {
		   int ItemID = Integer.parseInt(request.getParameter("ItemID"));
			String ItemCode = request.getParameter("ItemCode");
			String Type = request.getParameter("Type");
			int GroupID = Integer.parseInt(request.getParameter("GroupID"));
			int SubGroupID = Integer.parseInt(request.getParameter("SubGroupID"));
			int LevelID = Integer.parseInt(request.getParameter("LevelID"));
			int DaeSangID = Integer.parseInt(request.getParameter("DaeSangID"));
			String FromTime = request.getParameter("FromTime");
			String ToTime = request.getParameter("ToTime");
			int ClassCnt = Integer.parseInt(request.getParameter("ClassCnt"));
			String Monchk = request.getParameter("Mon");
			String Mon = "";
			if (Monchk == null) {
				Mon = "N";
			} else {
				Mon = Monchk;
			}
			String MonIn = request.getParameter("MonIn");
			String Tueschk = request.getParameter("Tues");
			String Tues = "";
			if(Tueschk != null) {
				Tues = Tueschk;
			} else {
				Tues = "N";
			}
			String TuesIn = request.getParameter("TuesIn");
			String WednesChk = request.getParameter("Wednes");
			String Wednes = "";
			if(WednesChk != null) {
				Wednes = WednesChk;
			}else {
				Wednes = "N";
			}
			String WednesIn = request.getParameter("WednesIn");
			String ThursChk = request.getParameter("Thurs");
			String Thurs = "";
			if(ThursChk != null) {
				Thurs = ThursChk;
			}else {
				Thurs = "N";
			}
			String ThursIn = request.getParameter("ThursIn");
			String FriChk = request.getParameter("Fri");
			String Fri = "";
			if(FriChk != null) {
				Fri = FriChk;
			}else {
				Fri = "N";
			}
			String FriIn = request.getParameter("FriIn");
			String SaturChk = request.getParameter("Satur");
			String Satur = "";
			if(SaturChk != null) {
				Satur = SaturChk;
			}else {
				Satur = "N";
			}
			String SaturIn = request.getParameter("SaturIn");
			String SunChk = request.getParameter("Sun");
			String Sun = "";
			if(SunChk != null) {
				Sun = SunChk;
			}else {
				Sun = "N";
			}
			String SunIn = request.getParameter("SunIn");
			String HolyChk = request.getParameter("Holy");
			String Holy = "";
			if(HolyChk != null) {
				Holy = HolyChk;
			} else {
				Holy = "N";
			}
			String HolyIn = request.getParameter("HolyIn");
			int OffMax = Integer.parseInt(request.getParameter("OffMax"));
			/*int OnMax = Integer.parseInt(request.getParameter("OnMax"));*/
			int ItemMonth = Integer.parseInt(request.getParameter("ItemMonth"));
			/*int InCnt = Integer.parseInt(request.getParameter("InCnt"));*/
			int DamDangUserPKID = Integer.parseInt(request.getParameter("DamDangUserPKID"));
			String YakChing = request.getParameter("YakChing");
			String SalaryType = request.getParameter("SalaryType");
			/*int CompanyPer = Integer.parseInt(request.getParameter("CompanyPer"));
			int SawonPer = Integer.parseInt(request.getParameter("SawonPer"));*/
			String chkPeriod = request.getParameter("chkPeriod");
			String FromDate = request.getParameter("FromDate");
			String ToDate = request.getParameter("ToDate");
			String DcNoChk = request.getParameter("DcNoChk");
			String OldAgeDCNoGbn = request.getParameter("OldAgeDCNoGbn");
			String DcNo3MonthChk = request.getParameter("DcNo3MonthChk");
			
			String nvat = request.getParameter("nvat");
			String DefPrice = request.getParameter("DefPrice");
			String Price1 = request.getParameter("Price1");
			String Price2 = request.getParameter("Price2");
			String Price3 = request.getParameter("Price3");
			String Price4 = request.getParameter("Price4");
			String IsUse = request.getParameter("IsUse");
			String IsDeleteChk = request.getParameter("IsDelete");
			String IsDelete = "";
			if(IsDeleteChk != null) {
				IsDelete = IsDeleteChk;
			}else {
				IsDelete = "N";
			}
			String WebYN = request.getParameter("WebYN");
			String WebEnd = request.getParameter("WebEnd");
			String ParkingTime = request.getParameter("ParkingTime");
			/*int ageStart = Integer.parseInt(request.getParameter("ageStart"));
			int ageEnd = Integer.parseInt(request.getParameter("ageEnd"));*/
			String AgeYearGbn = request.getParameter("AgeYearGbn");
			String LotteryGbn = request.getParameter("LotteryGbn");
			String RecommendGbn = request.getParameter("RecommendGbn");
			String inliveRegster = request.getParameter("inliveRegster");
			String Intro = request.getParameter("Intro");
			String Detail = request.getParameter("Detail");
			String Note = request.getParameter("Note");
			String Bigo = request.getParameter("Bigo");
			
			TblItem tblItem = new TblItem();
			tblItem.setItemID(ItemID);
			tblItem.setSiteCode(users.getSiteCode());
			tblItem.setItemCode(ItemCode);
			tblItem.setType(Type);
			tblItem.setGroupID(GroupID);
			tblItem.setSubGroupID(SubGroupID);
			tblItem.setLevelID(LevelID);
			tblItem.setDaeSangID(DaeSangID);
			tblItem.setFromTime(FromTime);
			tblItem.setToTime(ToTime);
			tblItem.setClassCnt(ClassCnt);
			tblItem.setMon(Mon);
			tblItem.setMonIn(MonIn);
			tblItem.setTues(Tues);
			tblItem.setTuesIn(TuesIn);
			tblItem.setWednes(Wednes);
			tblItem.setWednesIn(WednesIn);
			tblItem.setThurs(Thurs);
			tblItem.setThursIn(ThursIn);
			tblItem.setFri(Fri);
			tblItem.setFriIn(FriIn);
			tblItem.setSatur(Satur);
			tblItem.setSaturIn(SaturIn);
			tblItem.setSun(Sun);
			tblItem.setSunIn(SunIn);
			tblItem.setHoly(Holy);
			tblItem.setHolyIn(HolyIn);
			tblItem.setOffMax(OffMax);
			tblItem.setOnMax(tblItem1.getOffMax());
			tblItem.setItemMonth(ItemMonth);
			tblItem.setInCnt(tblItem1.getInCnt());
			tblItem.setDamDangUserPKID(DamDangUserPKID);
			tblItem.setYakChing(YakChing);
			tblItem.setSalaryType(SalaryType);
			tblItem.setCompanyPer(tblItem1.getCompanyPer());
			tblItem.setSawonPer(tblItem1.getSawonPer());
			tblItem.setChkPeriod(chkPeriod);
			tblItem.setFromDate(FromDate);
			tblItem.setToDate(ToDate);
			tblItem.setDcNoChk(DcNoChk);
			tblItem.setOldAgeDCNoGbn(OldAgeDCNoGbn);
			tblItem.setDcNo3MonthChk(DcNo3MonthChk);
			tblItem.setNvat(nvat);
			tblItem.setDefPrice(DefPrice);
			tblItem.setPrice1(Price1);
			tblItem.setPrice2(Price2);
			tblItem.setPrice3(Price3);
			tblItem.setPrice4(Price4);
			tblItem.setIsUse(IsUse);
			tblItem.setIsDelete(IsDelete);
			tblItem.setWebYN(WebYN);
			tblItem.setWebEnd(WebEnd);
			tblItem.setParkingTime(ParkingTime);
			tblItem.setAgeStart(tblItem1.getAgeStart());
			tblItem.setAgeEnd(tblItem1.getAgeEnd());
			tblItem.setAgeYearGbn(AgeYearGbn);
			tblItem.setLotteryGbn(LotteryGbn);
			tblItem.setRecommendGbn(RecommendGbn);
			tblItem.setInliveRegster(inliveRegster);
			tblItem.setIntro(Intro);
			tblItem.setDetail(Detail);
			tblItem.setNote(Note);
			tblItem.setBigo(Bigo);
			tblItem.setUpdUserPKID(users.getUserPKID());
			
			vtcItemService.itemUpdate(tblItem);
			
			model.addAttribute("msg", "변경되었습니다.");
			model.addAttribute("script", "reload");
			
			return "common/msg";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "다시 사용하여주세요");
			model.addAttribute("script", "back");
			return "common/msg";
		}
   }
   
   @GetMapping(value="tblItemIsUse.do")
   public @ResponseBody Map<String, Object> tblitemList(selectitem selectitem) throws Exception {
	   
	   Map<String, Object> listSelectItem = new HashMap<>();
	   
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   
	   selectitem.setSiteCode(users.getSiteCode());
	   
	   List<selectitem> selectitems = vtcItemService.listSelectItemY(selectitem);
	   List<selectitem> selectItemsN = vtcItemService.listSelectItemN(selectitem);
	   List<selectitem> SelectItemIsDelte = vtcItemService.listSelectItemIsDelte(selectitem);
	   
	   listSelectItem.put("ItemUseY", selectitems);
	   listSelectItem.put("itemUseN", selectItemsN);
	   listSelectItem.put("IsDelete", SelectItemIsDelte);
	   
	   return listSelectItem;
   }
   
   @GetMapping("finditemlist")
   public String finditemlist(ModelMap model, selectitem selectitem, tblCode code,
		   @RequestParam(name="findvalue")String findvalue,
		   @RequestParam(name="findcategory")String findcategory) throws Exception {
	   Users users=(Users) session.getAttribute("loginuserinfo");
		if(users == null){
			
			return "redirect:login.do";
		}
		
		Map<String, Object> find = new HashMap<>();
		find.put("SiteCode", users.getSiteCode());
		find.put("findvalue", findvalue);
		find.put("findcategory", findcategory);
		
		List<selectitem> findlist = vtcItemService.findItem(find);
		System.out.println("findlist : " + findlist);
		System.out.println("findlist.get(0) : " + findlist.get(0));
		
		
		
		TblItem_01 item_01 = new TblItem_01();
		item_01.setSiteCode(users.getSiteCode());
		
		TblItem_02 item_02 = new TblItem_02();
		item_02.setSiteCode(users.getSiteCode());
		
		TblItem_03 item_03 = new TblItem_03();
		item_03.setSiteCode(users.getSiteCode());
   
		code.setSiteCode(users.getSiteCode());
		code.setCodeGroupID("5");
   
		selectitem.setSiteCode(users.getSiteCode());
		selectitem.setGroupName(findvalue);
		/*selectitem.setSubGroupName(findvalue);*/
		
		
   
		List<selectitem> listSelectItem = vtcItemService.listSelectItemY(selectitem);
		List<TblItem_01> listItem01 = vtcItemService.listItemCode(item_01);
		List<TblItem_02> listItem02 = vtcItemService.listItem02(item_02);
		List<TblItem_03> listItem03 = vtcItemService.liseItem03(item_03);
		List<tblCode> listtblCode = VtcServise.listTblCode(code);
		List<Users> listUsers = UserService.listUsers(users.getSiteCode());
		int getItemCode = vtcItemService.getItemCode(users.getSiteCode());
		
		model.addAttribute("list", listSelectItem);
		model.addAttribute("item01", listItem01);
		model.addAttribute("item02", listItem02);
		model.addAttribute("item03", listItem03);
		model.addAttribute("tblcode", listtblCode);
		model.addAttribute("User", listUsers);
		model.addAttribute("ItemCode", getItemCode+1);
   
		return "item/class/classInfo";
   }
   
   @PostMapping("/selectItemFind")
   @ResponseBody
   public Map<String, Object> findItemLitst(ModelMap model, selectitem selectitem, tblCode code,
		   @RequestParam(name="IsUse")String IsUse,
		   @RequestParam(name="Type")String Type,
		   @RequestParam(name="findvalue")String findvalue,
		   @RequestParam(name="findcategory")String findcategory) throws Exception {
	   Users users=(Users) session.getAttribute("loginuserinfo");
	   
	   System.out.println("IsUse : " + IsUse);
	   System.out.println("Type : " + Type);
	   System.out.println("findvalue : " + findvalue);
	   System.out.println("findcategory : " + findcategory);
	   
	   Map<String, Object> find = new HashMap<>();
	   find.put("SiteCode", users.getSiteCode());
	   find.put("IsUse", IsUse);
	   find.put("Type", Type);
	   find.put("findvalue", findvalue);
	   find.put("findcategory", findcategory);
	   
	   System.out.println("findvalue : " + find);
	   
	   List<selectitem> findlist = vtcItemService.findItem(find);
	   System.out.println("findlist : " + findlist);
	   
	   Map<String, Object> map = new HashMap<>();
	   map.put("size", findlist.size());
	   System.out.println("findlist.size() : " + findlist.size());
	   map.put("list", findlist);
	   
	   return map;
   }
   
   @GetMapping(value="/updateItem01.do")
   public String updateTblItem01(@RequestParam("groupID") int groupID, ModelMap model, HttpServletRequest request,
		   TblItem_01 TblItem_01) throws Exception {
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
	       model.addAttribute("script", "back");
		   return "redirect:login.do";
	   }
	   
	   System.out.println("groupID : " + groupID);
	   
	   TblItem_01.setSiteCode(users.getSiteCode());
	   TblItem_01.setGroupID(groupID);
	   
	   TblItem_01 = vtcItemService.getItem01(TblItem_01);
	   
	   System.out.println("TblItem_01 : " + TblItem_01);
	   
	   model.addAttribute("item01", TblItem_01);
	   
	   return "item/itemcode/item01update";
   }
   
   @PostMapping(value="/updateItem01.do")
   public String updateTblItem01OK(ModelMap model, TblItem_01 item_01, HttpServletRequest request) throws Exception {
	   
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
	       model.addAttribute("script", "back");
		   return "redirect:login.do";
	   }
	   
	   try {
		   item_01.setSiteCode(users.getSiteCode());
		   item_01.setUpdUserPKID(users.getUserPKID());
		   String JungSiType1StopChk = request.getParameter("JungSiType1StopChk");
		   String JungSiType1Stop = "";
		   if(JungSiType1StopChk == null) {
			   JungSiType1Stop = "N";
		   } else {
			   JungSiType1Stop = JungSiType1StopChk;
		   }
		   String JungSi3MonthGbnChk = request.getParameter("JungSi3MonthGbnChk");
		   String JungSi3MonthGbn = "";
		   if(JungSi3MonthGbnChk == null) {
			   JungSi3MonthGbn = "N";
		   } else {
			   JungSi3MonthGbn = JungSi3MonthGbnChk;
		   }
		   
		   /* 추첨접수 시작날짜 */
		   String LotteryFromDate = request.getParameter("LotteryFromDate");
		   if(LotteryFromDate == null) {
			   LotteryFromDate = "";
		   }
		   String LotteryFromTime = request.getParameter("LotteryFromTime");
		   if(LotteryFromTime == null) {
			   LotteryFromTime = "";
		   }
		   String JungSiLotteryFromDate = LotteryFromDate + " " + LotteryFromTime;
		   /* 추첨접수 종료날짜 */
		   String LotteryToDate = request.getParameter("LotteryToDate");
		   if(LotteryToDate == null) {
			   LotteryToDate = "";
		   }
		   String LotteryToTime = request.getParameter("LotteryToTime");
		   if(LotteryToTime == null ) {
			   LotteryToTime = "";
		   }
		   String JungSiLotteryToDate = LotteryToDate + " " + LotteryToTime;
		   /* 추첨결제 시작날짜 */
		   String LotteryPayFromDate = request.getParameter("LotteryPayFromDate");
		   if(LotteryPayFromDate ==  null) {
			   LotteryPayFromDate = "";
		   }
		   String LotteryPayFromTime = request.getParameter("LotteryPayFromTime");
		   if(LotteryPayFromTime == null) {
			   LotteryPayFromTime = "";
		   }
		   String JungSiLotteryPayFromDate = LotteryPayFromDate + " " + LotteryPayFromTime;
		   /* 추첨결제 종료날짜 */
		   String LotteryPayToDate = request.getParameter("LotteryPayToDate");
		   if(LotteryPayToDate == null) {
			   LotteryPayToDate = "";
		   }
		   String LotteryPayToTime = request.getParameter("LotteryPayToTime");
		   if(LotteryPayToTime == null) {
			   LotteryPayToTime = "";
		   }
		   String JungSiLotteryPayToDate = LotteryPayToDate + " " + LotteryPayToTime;
		   /* 추첨선착순 시작날짜 */
		   String LotteryAddFromDate = request.getParameter("LotteryAddFromDate");
		   if(LotteryAddFromDate == null) {
			   LotteryAddFromDate = "";
		   }
		   String LotteryAddFromTime = request.getParameter("LotteryAddFromTime");
		   if(LotteryAddFromTime == null) {
			   LotteryAddFromTime = "";
		   }
		   String JungSiLotteryAddFromDate = LotteryAddFromDate + " " + LotteryAddFromTime;
		   /* 추첨선착순 종료날짜 */
		   String LotteryAddToDate = request.getParameter("LotteryAddToDate");
		   if(LotteryAddToDate == null) {
			   LotteryAddToDate = "";
		   }
		   String LotteryAddToTime = request.getParameter("LotteryToTime");
		   if(LotteryAddToTime == null) {
			   LotteryAddToTime = "";
		   }
		   String JungSiLotteryAddToDate = LotteryAddToDate + " " + LotteryAddToTime;
		   
		   /* 신규 접수 */
		   String JungSi1Start = request.getParameter("JungSi1Start");
		   if(JungSi1Start == null) {
			   JungSi1Start	= "";
		   }
		   String JungSi1End = request.getParameter("JungSi1End");
		   if(JungSi1End == null) {
			   JungSi1End = "";
		   }
		   String JungSi1 = JungSi1Start + "~" + JungSi1End;
		   /* 재등록 */
		   String JungSi2Start = request.getParameter("JungSi2Start");
		   if(JungSi2Start == null) {
			   JungSi2Start = "";
		   }
		   String JungSi2End = request.getParameter("JungSi2End");
		   if(JungSi2End == null) {
			   JungSi2End = "";
		   }
		   String JungSi2 = JungSi2Start + "~" + JungSi2End;
		   /* 강습기간 */
		   String JungSi3Start = request.getParameter("JungSi3Start");
		   if(JungSi3Start == null) {
			   JungSi3Start = "";
		   }
		   String JungSi3End = request.getParameter("JungSi3End");
		   if(JungSi3End == null) {
			   JungSi3End = "";
		   }
		   String JungSi3 = JungSi3Start + "~" + JungSi3End;
		   
		   String MonthSelNoChk = request.getParameter("MonthSelNoChk");
		   String MonthSelNo = "";
		   if(MonthSelNoChk == null) {
			   MonthSelNo = "N";
		   } else {
			   MonthSelNo = MonthSelNoChk;
		   }
		   String WebYNChk = request.getParameter("WebYNChk");
		   String WebYN = "";
		   if(WebYNChk == null) {
			   WebYN = "N";
		   } else {
			   WebYN = WebYNChk;
		   }
		   String IsDeleteChk = request.getParameter("IsDeleteChk");
		   String IsDelete = "";
		   if(IsDeleteChk == null) {
			   IsDelete = "N";
		   } else {
			   IsDelete = IsDeleteChk;
		   }
		   item_01.setJungSiType1Stop(JungSiType1Stop);
		   item_01.setJungSi3MonthGbn(JungSi3MonthGbn);
		   item_01.setJungSiLotteryFromDate(JungSiLotteryFromDate);
		   item_01.setJungSiLotteryToDate(JungSiLotteryToDate);
		   item_01.setJungSiLotteryPayFromDate(JungSiLotteryPayFromDate);
		   item_01.setJungSiLotteryPayToDate(JungSiLotteryPayToDate);
		   item_01.setJungSiLotteryAddFromDate(JungSiLotteryAddFromDate);
		   item_01.setJungSiLotteryAddToDate(JungSiLotteryAddToDate);
		   item_01.setJungSi1(JungSi1);
		   item_01.setJungSi2(JungSi2);
		   item_01.setJungSi3(JungSi3);
		   item_01.setMonthSelNo(MonthSelNo);
		   item_01.setWebYN(WebYN);
		   item_01.setIsDelete(IsDelete);
		   
		   System.out.println("upd-item_01 : " + item_01);
		   
		   vtcItemService.updateItem01(item_01);
		   
		   model.addAttribute("msg", "변경되었습니다.");
		   model.addAttribute("script", "reload");
			
		   return "common/msg";
		   
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "다시 사용하여주세요");
			model.addAttribute("script", "back");
			return "common/msg";
		}
   }
   
   @GetMapping(value="/updateItem02.do")
   public String updateItem02(@RequestParam("subGroupID") int subGroupID, ModelMap model, HttpServletRequest request, 
		   TblItem_02 item_02, tblCode code,selectitem selectitem) throws Exception {
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
	       model.addAttribute("script", "back");
		   return "redirect:login.do";
	   }
	   
	   System.out.println("SubGroupID : " + subGroupID);
	   
	   TblItem_01 item_01 = new TblItem_01();
	   item_01.setSiteCode(users.getSiteCode());
	   
	   
	   List<TblItem_01> listItem01 = vtcItemService.listItemCode(item_01);
	   
	   item_02.setSiteCode(users.getSiteCode());
	   item_02.setSubGroupID(subGroupID);
	   
	   item_02 = vtcItemService.getItem02(item_02);
	   
	   System.out.println("item_02 : " + item_02);
	   
	   model.addAttribute("list", listItem01);
	   model.addAttribute("item02", item_02);
	   return "item/itemcode/item02update";
   }
   
   
   @PostMapping(value="/updateItem02.do")
   public String updateItem02OK(TblItem_02 item_02, ModelMap model, HttpServletRequest request) throws Exception {
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
	       model.addAttribute("script", "back");
		   return "redirect:login.do";
	   }
	   
	   try {
		   item_02.setSiteCode(users.getSiteCode());
		   item_02.setUpdUserPKID(users.getUserPKID());
		   String TimeChk = request.getParameter("TimeChk");
		   int InTimeChk = Integer.parseInt(request.getParameter("InTimeChk"));
		   int InTime = 0;
		   int InEndTimeChk = Integer.parseInt(request.getParameter("InEndTimeChk"));
		   int InEndTime = 0;
		   if(TimeChk == null) {
			   InTime  = 0;
			   InEndTime = 0;
		   } else {
			   InTime = InTimeChk;
			   InEndTime = InEndTimeChk;
		   }
		   
		   String IsDeleteChk = request.getParameter("IsDeleteChk");
		   String IsDelete = "";
		   if(IsDeleteChk == null) {
			   IsDelete = "N";
		   } else {
			   IsDelete = IsDeleteChk;
		   }
		   item_02.setInTime(InTime);
		   item_02.setInEndTime(InEndTime);
		   item_02.setIsDelete(IsDelete);
		   
		   vtcItemService.updateItem02(item_02);
		   
		   model.addAttribute("msg", "변경되었습니다.");
		   model.addAttribute("script", "reload");
			
		   return "common/msg";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "다시 사용하여주세요");
			model.addAttribute("script", "back");
			return "common/msg";
		}
   }
   
   @GetMapping(value="/updateItem03.do")
   public String updateItem03(@RequestParam("levelID") int levelID, ModelMap model, HttpServletRequest request, TblItem_03 item_03) throws Exception {
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
	       model.addAttribute("script", "back");
		   return "redirect:login.do";
	   }
	   System.out.println("levelID : " + levelID);

	   item_03.setSiteCode(users.getSiteCode());
	   item_03.setLevelID(levelID);
	   
	   item_03 = vtcItemService.getItem03(item_03);
	   
	   System.out.println("item_03  : " + item_03 );
	   
	   model.addAttribute("item03", item_03);
      return "item/itemcode/item03update";
   }
   
   @PostMapping(value="/updateItem03.do")
   public String updateItem03Ok(TblItem_03 item_03, ModelMap model, HttpServletRequest request) throws Exception {
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
	       model.addAttribute("script", "back");
		   return "redirect:login.do";
	   }
	   try {
		item_03.setSiteCode(users.getSiteCode());
		item_03.setUpdUserPKID(users.getUserPKID());
		
		String IsDeleteChk = request.getParameter("IsDeleteChk");
		String IsDelete = "";
		if(IsDeleteChk == null) {
			IsDelete = "N";
		} else {
			IsDelete = IsDeleteChk;
		}
		
		item_03.setIsDelete(IsDelete);
		
		System.out.println("upd-item_03 : " + item_03);
		
		vtcItemService.updateItem03(item_03);
		
		model.addAttribute("msg", "변경되었습니다.");
		model.addAttribute("script", "reload");
		
		return "common/msg";
		   
	} catch (Exception e) {
		e.printStackTrace();
		model.addAttribute("msg", "다시 사용하여주세요");
		model.addAttribute("script", "back");
		return "common/msg";
	}
   }
}