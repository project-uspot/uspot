package egovframework.veterans.com.cmm;

import java.time.LocalDate;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.veterans.com.cmm.service.VtcDCService;
import egovframework.veterans.com.cmm.service.VtcItemService;
import egovframework.veterans.com.cmm.service.VtcMemberService;
import egovframework.veterans.com.cmm.service.VtcPaidService;
import egovframework.veterans.com.cmm.service.VtcLockerService;
import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.TblItem_02;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01toselectitem;
import egovframework.veterans.com.cmm.service.vo.fmsc_s03;
import egovframework.veterans.com.cmm.service.vo.fmsc_s04;
import egovframework.veterans.com.cmm.service.vo.fmsc_s04_01;
import egovframework.veterans.com.cmm.service.vo.memberexpensesale;
import egovframework.veterans.com.cmm.service.vo.memberuselocker;
import egovframework.veterans.com.cmm.service.vo.tblCode;
import egovframework.veterans.com.cmm.service.vo.tblIssueMemberCard;
import egovframework.veterans.com.cmm.service.vo.tbldeposite;
import egovframework.veterans.com.cmm.service.vo.tblmember;
import egovframework.veterans.com.cmm.service.vo.tblmembertalk;
import egovframework.veterans.com.cmm.service.vo.tblpaid;
import egovframework.veterans.com.cmm.service.vo.tblplocker;
import egovframework.veterans.com.cmm.service.vo.tblplockergroup;
import egovframework.veterans.com.cmm.service.vo.tbluselocker;
import egovframework.veterans.lib.Functions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@SessionAttributes("loginuserinfo")
public class VtcMemberController {
	
	private final HttpSession session;
	private final VtcMemberService vtcMemberService;
	private final VtcDCService vtcDCService;
	private final VtcLockerService vtcLockerService;
	private final VtcService vtcService;
	private final VtcPaidService vtcPaidService;
	private final VtcItemService vtcItemService;
	
	public static Functions f = Functions.getInstance();

	public static Marker member = MarkerFactory.getMarker("member");
	
	
	@GetMapping("/memberlist.do")
	private String membershipF(Model model, tblmember tblmember) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {

			return "redirect:login.do";
		}

		List<tblmember> memberlist = vtcMemberService.memberlist();
		List<Sitecode> sitecodesname = vtcService.listSiteName();
		model.addAttribute("list", memberlist);
		model.addAttribute("sitecodelist", sitecodesname);

		return "member/memberlist/memberlistF";
	}

	@ResponseBody
	@PostMapping("memberlistfind")
	public Map<String, Object> memberlistfind(tblmember tblmember) throws Exception {

		List<tblmember> memberlist = vtcMemberService.memberlistfind(tblmember);

		Map<String, Object> listtomap = new HashMap<>();
		listtomap.put("size", memberlist.size());
		listtomap.put("commentlist", memberlist);

		return listtomap;
	}

	@GetMapping("/membership.do")
	private String memberregiF(Model model, DC dc) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			return "redirect:login.do";
		}

		tblmember tblmember = vtcMemberService.maxidtblmember();

		fmsc_s01 fmsc_s01 = new fmsc_s01();
		fmsc_s01.setCustCode(tblmember.getMemberID());
		fmsc_s01.setSiteCode(tblmember.getSiteCode());
		tblCode tblCode = new tblCode();
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		dc.setSiteCode(users.getSiteCode());
		tbldeposite tbldeposite = new tbldeposite();
		tbldeposite.setSiteCode(users.getSiteCode());
		tbldeposite.setMemberID(tblmember.getMemberID());
		List<fmsc_s01toselectitem> fmsc_s01toselectitem = vtcMemberService.fmsc_s01toselectitem(fmsc_s01);
		List<memberuselocker> memberuselocker = vtcLockerService.memberuselocker(tblmember.getMemberID());
		List<memberexpensesale> memberexpensesale = vtcPaidService.memberexpensesale(tblmember.getMemberID());
		List<tblmembertalk> tblmembertalks = vtcMemberService.membertblmembertalk(tblmember.getMemberID());
		List<fmsc_s01toselectitem> fmsc_s01toselectitemanother = vtcMemberService.fmsc_s01toselectitemanothersite(fmsc_s01);
		List<tblCode> codelist = vtcService.listTblCode(tblCode);
		List<DC> dcList = vtcDCService.dclist(dc);
		List<DC> pissdclist = vtcDCService.dclistBypissId(users.getSiteCode());
		List<Sitecode> SiteList = vtcService.listSiteName();
		List<tbldeposite> depositeList = vtcLockerService.DepositeListByMember(tbldeposite);

		model.addAttribute("dclist", dcList);
		model.addAttribute("tblmember", tblmember);
		model.addAttribute("codelist", codelist);
		model.addAttribute("fmsc_s01", fmsc_s01toselectitem);
		model.addAttribute("lockerlist", memberuselocker);
		model.addAttribute("paidlist", memberexpensesale);
		model.addAttribute("talklist", tblmembertalks);
		model.addAttribute("anotherlist", fmsc_s01toselectitemanother);
		model.addAttribute("pissdclist", pissdclist);
		model.addAttribute("sitelist", SiteList);
		model.addAttribute("depositeList",depositeList);

		return "member/registration/memberregiF";
	}
	
	@GetMapping("memberfindone")
	public String memberfindone(Model model, DC dc, tblmember tblmember,
			@RequestParam(name = "findvalue") String findvalue, @RequestParam(name = "findcategory") int findcategory)
			throws Exception {

		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {

			return "redirect:login.do";
		}

		Map<String, Object> find = new HashMap<>();

		find.put("findvalue", findvalue);
		find.put("findcategory", findcategory);

		List<tblmember> findlist = vtcMemberService.findmember(find);

		tblmember = findlist.get(0);

		fmsc_s01 fmsc_s01 = new fmsc_s01();
		fmsc_s01.setCustCode(tblmember.getMemberID());
		fmsc_s01.setSiteCode(tblmember.getSiteCode());
		tblCode tblCode = new tblCode();
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		dc.setSiteCode(users.getSiteCode());
		tbldeposite tbldeposite = new tbldeposite();
		tbldeposite.setSiteCode(users.getSiteCode());
		tbldeposite.setMemberID(tblmember.getMemberID());
		List<fmsc_s01toselectitem> fmsc_s01toselectitem = vtcMemberService.fmsc_s01toselectitem(fmsc_s01);
		List<memberuselocker> memberuselocker = vtcLockerService.memberuselocker(tblmember.getMemberID());
		List<memberexpensesale> memberexpensesale = vtcPaidService.memberexpensesale(tblmember.getMemberID());
		List<tblmembertalk> tblmembertalks = vtcMemberService.membertblmembertalk(tblmember.getMemberID());
		List<fmsc_s01toselectitem> fmsc_s01toselectitemanother = vtcMemberService
				.fmsc_s01toselectitemanothersite(fmsc_s01);
		List<tblCode> codelist = vtcService.listTblCode(tblCode);
		List<DC> dcList = vtcDCService.dclist(dc);
		List<DC> pissdclist = vtcDCService.dclistBypissId(users.getSiteCode());
		List<Sitecode> SiteList = vtcService.listSiteName();
		List<tbldeposite> depositeList = vtcLockerService.DepositeListByMember(tbldeposite);

		model.addAttribute("dclist", dcList);
		model.addAttribute("tblmember", tblmember);
		model.addAttribute("codelist", codelist);
		model.addAttribute("fmsc_s01", fmsc_s01toselectitem);
		model.addAttribute("lockerlist", memberuselocker);
		model.addAttribute("paidlist", memberexpensesale);
		model.addAttribute("talklist", tblmembertalks);
		model.addAttribute("anotherlist", fmsc_s01toselectitemanother);
		model.addAttribute("pissdclist", pissdclist);
		model.addAttribute("sitelist", SiteList);
		model.addAttribute("depositeList",depositeList);

		return "member/registration/memberregiF";

	}
	
	// TODO 회원등록관리 회원조회 프로세스
	@GetMapping("/memberfind")
	public String memberfindF(Model model, DC dc, tblmember memberid) throws Exception {

		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {

			return "redirect:login.do";
		}

		tblmember tblmember = vtcMemberService.tblmemberBymemberId(memberid);

		fmsc_s01 fmsc_s01 = new fmsc_s01();
		fmsc_s01.setCustCode(tblmember.getMemberID());
		fmsc_s01.setSiteCode(tblmember.getSiteCode());
		tblCode tblCode = new tblCode();
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		dc.setSiteCode(users.getSiteCode());
		tbldeposite tbldeposite = new tbldeposite();
		tbldeposite.setSiteCode(users.getSiteCode());
		tbldeposite.setMemberID(tblmember.getMemberID());
		List<fmsc_s01toselectitem> fmsc_s01toselectitem = vtcMemberService.fmsc_s01toselectitem(fmsc_s01);
		List<memberuselocker> memberuselocker = vtcLockerService.memberuselocker(tblmember.getMemberID());
		List<memberexpensesale> memberexpensesale = vtcPaidService.memberexpensesale(tblmember.getMemberID());
		List<tblmembertalk> tblmembertalks = vtcMemberService.membertblmembertalk(tblmember.getMemberID());
		List<fmsc_s01toselectitem> fmsc_s01toselectitemanother = vtcMemberService.fmsc_s01toselectitemanothersite(fmsc_s01);
		List<tblCode> codelist = vtcService.listTblCode(tblCode);
		List<DC> dcList = vtcDCService.dclist(dc);
		List<DC> pissdclist = vtcDCService.dclistBypissId(users.getSiteCode());
		List<Sitecode> SiteList = vtcService.listSiteName();
		List<tbldeposite> depositeList = vtcLockerService.DepositeListByMember(tbldeposite);
	
		model.addAttribute("dclist", dcList);
		model.addAttribute("tblmember", tblmember);
		model.addAttribute("codelist", codelist);
		model.addAttribute("fmsc_s01", fmsc_s01toselectitem);
		model.addAttribute("lockerlist", memberuselocker);
		model.addAttribute("paidlist", memberexpensesale);
		model.addAttribute("talklist", tblmembertalks);
		model.addAttribute("anotherlist", fmsc_s01toselectitemanother);
		model.addAttribute("pissdclist", pissdclist);
		model.addAttribute("sitelist", SiteList);
		model.addAttribute("depositeList",depositeList);

		return "member/registration/memberregiF";
	}

	// TODO 회원등록관리 회원수정 프로세스
	@GetMapping(value = "membershipUpdate")
	public String membershipUpdate(Model model, tblmember updatetblmember, DC dc,
			@RequestParam(name = "emgPhonecheck", required = false) String emgPhonecheck,
			@RequestParam(name = "inliveCheck", required = false) String inliveCheck,
			@RequestParam(name = "DCIDcheck", required = false) String DCIDcheck) {

		try {
			Users users = (Users) session.getAttribute("loginuserinfo");
			
			if (emgPhonecheck == null) {
				updatetblmember.setEmgPhone(null);
			}
			if (inliveCheck == null) {
				updatetblmember.setInlive(null);
			}
			if (DCIDcheck == null) {
				updatetblmember.setDCID(-1);
			}

			updatetblmember.setUpdUserPKID(users.getUserPKID());
			//updatetblmember.setName(f.fixEncoding(updatetblmember.getName()));

			vtcMemberService.updatemember(updatetblmember);

			return "redirect:memberfind?MemberID="+updatetblmember.getMemberID();

		} catch (Exception e) {
			e.printStackTrace();

			model.addAttribute("msg", "형식에 올바르게 수정해 주세요.");
			model.addAttribute("script", "back");

			return "common/msg";
		}
	}

	@PostMapping("/membershipDelete")
	public String membershipDelete(tblmember tblmember) throws Exception {

		Users users = (Users) session.getAttribute("loginuserinfo");

		tblmember.setUpdUserPKID(users.getUserPKID());
		System.out.println(tblmember);
		vtcMemberService.deletemember(tblmember);

		return "redirect:membership.do";
	}
	
	@PostMapping("memberfind")
	@ResponseBody
	public String memberfind(@RequestParam(name = "findvalue") String findvalue,
			@RequestParam(name = "findcategory") int findcategory) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {

			return "redirect:login.do";
		}

		if (findvalue.trim().isEmpty() || findvalue == null) {

			return "0";
		}

		if (findcategory == 3) {

			return "-1";
		}

		Map<String, Object> find = new HashMap<>();

		find.put("findvalue", findvalue);
		find.put("findcategory", findcategory);

		List<tblmember> findlist = vtcMemberService.findmember(find);
		if (findlist.size() == 0) {
			return "1";
		} else if (findlist.size() == 1) {
			return "2";
		} else {
			return "3";
		}

	}

	// TODO 회원등록관리 회원조회 페이지
	@GetMapping("findlist")
	public String findlist(Model model, @RequestParam(name = "findvalue") String findvalue,
			@RequestParam(name = "findcategory") String findcategory) throws Exception {

		Map<String, Object> find = new HashMap<>();

		find.put("findvalue", findvalue);
		find.put("findcategory", findcategory);

		List<tblmember> findlist = vtcMemberService.findmember(find);
		List<Sitecode> sitelist = vtcService.listSiteName();
		model.addAttribute("findlist", findlist);
		model.addAttribute("sitelist", sitelist);

		return "member/registration/memberfindlist";
	}

	@GetMapping("memberinsert")
	public String memebrinsert(Model model, DC dc) throws Exception {

		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {

			return "redirect:login.do";
		}

		dc.setSiteCode(users.getSiteCode());

		tblCode tblCode = new tblCode();
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");

		String memberID = vtcMemberService.maxmemberid();
		List<DC> dcList = vtcDCService.dclist(dc);
		List<DC> pissdclist = vtcDCService.dclistBypissId(users.getSiteCode());
		List<Sitecode> SiteList = vtcService.listSiteName();
		List<tblCode> codelist = vtcService.listTblCode(tblCode);

		model.addAttribute("memberid", memberID);
		model.addAttribute("dclist", dcList);
		model.addAttribute("pissdclist", pissdclist);
		model.addAttribute("sitelist", SiteList);
		model.addAttribute("codelist", codelist);

		return "member/registration/memberinsertF";
	}
	
	//포스트 매핑시 한글깨짐 해결하면 개천재
	// TODO 회원등록관리 회원등록 프로세스
	@PostMapping(value = "memberinsertP", produces = "text/plain;charset=UTF-8")
	public String memebrinsert(tblmember tblmember, Model model,
			@RequestParam(name = "emgPhonecheck", required = false) String emgPhonecheck,
			@RequestParam(name = "inliveCheck", required = false) String inliveCheck,
			@RequestParam(name = "DCIDcheck", required = false) String DCIDcheck,
			@RequestParam(name = "rejectgbncheck", required = false) String rejectgbncheck,
			@RequestParam(name = "remailcheck", required = false) String remailcheck,
			@RequestParam(name = "rsmscheck", required = false) String rsmscheck,
			@RequestParam(name = "rdmcheck", required = false) String rdmcheck) throws Exception {
        
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {

			return "redirect:login.do";
		}

		if (tblmember.getName().length() < 2) {

			model.addAttribute("script", "back");
			model.addAttribute("msg", "이름을 2글자 이상 입력해주세요.");

			return "common/msg";
		}

		if (tblmember.getBirthDay() == "") {

			model.addAttribute("script", "back");
			model.addAttribute("msg", "생년월일을 입력해 주세요");

			return "common/msg";
		}

		if (tblmember.getCellPhone() == "" && tblmember.getHomePhone() == "") {

			model.addAttribute("script", "back");
			model.addAttribute("msg", "휴대전화번호 또는 일반전화번호를 입력해주세요.");

			return "common/msg";
		}

		if ((tblmember.getCellPhone().equals(tblmember.getEmgPhone()) && tblmember.getCellPhone() != "")
				|| (tblmember.getHomePhone().equals(tblmember.getEmgPhone()) && tblmember.getHomePhone() != "")) {

			model.addAttribute("script", "back");
			model.addAttribute("msg", "비상연락처는 휴대전화 번호(일반전화 번호) 와 동일하지 않아야 합니다.");

			return "common/msg";
		}

		if (emgPhonecheck == null) {
			tblmember.setEmgPhone(null);
		}
		if (inliveCheck == null) {
			tblmember.setInlive(null);
		}
		if (DCIDcheck == null) {
			tblmember.setDCID(-1);
		}
		if (rejectgbncheck != null) {
			tblmember.setRejectGbn("Y");
		}
		if (remailcheck != null) {
			tblmember.setREmail("Y");
		}
		if (rsmscheck != null) {
			tblmember.setRSMS("Y");
		}
		if (rdmcheck != null) {
			tblmember.setRDM("Y");
		}
		
		tblmember.setAddUserPKID(users.getAddUserPKID());
		log.info(member,"관리자 pkid : "+users.getUserPKID()+", 회원 번호 : "+tblmember.getMemberID()+", 회원 성함 : "+tblmember.getName()+"의 대한 회원등록 처리");
		vtcMemberService.insertmember(tblmember);

		model.addAttribute("script", "redirect");
		model.addAttribute("msg", "등록 되었습니다.");
		model.addAttribute("url", "membership.do");

		return "common/msg";
	}

	@GetMapping("/membermove")
	public String membermove(tblmember memberID, Model model, DC dc, @RequestParam(name = "movetype") String movetype,
			@RequestParam(name = "move", required = false) String move) throws Exception {

		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {

			return "redirect:login.do";
		}
		int a = 1;
		tblmember tblmember = new tblmember();

		if (move != null) {

			tblmember = vtcMemberService.bigmovetblmember(movetype);

		} else {

			boolean run = true;
			String maxid = vtcMemberService.endmemberid(movetype);

			while (run) {

				if (movetype.equals("plus")) {
					memberID.setMemberID(String.valueOf(Integer.parseInt(memberID.getMemberID()) + 1));

					if (Integer.parseInt(maxid) < Integer.parseInt(memberID.getMemberID())) {

						a = 2;
						run = false;
					}

				} else {
					memberID.setMemberID(String.valueOf(Integer.parseInt(memberID.getMemberID()) - 1));

					if (Integer.parseInt(maxid) > Integer.parseInt(memberID.getMemberID())) {

						a = 2;
						run = false;
					}
				}

				tblmember = vtcMemberService.tblmemberBymemberId(memberID);

				if (tblmember != null) {
					run = false;
				}

			}

		}

		if (a == 2) {
			model.addAttribute("script", "back");
			model.addAttribute("msg", "끝번호 입니다");
			return "common/msg";
		}

		fmsc_s01 fmsc_s01 = new fmsc_s01();
		fmsc_s01.setCustCode(tblmember.getMemberID());
		fmsc_s01.setSiteCode(tblmember.getSiteCode());
		tblCode tblCode = new tblCode();
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		dc.setSiteCode(users.getSiteCode());
		List<fmsc_s01toselectitem> fmsc_s01toselectitem = vtcMemberService.fmsc_s01toselectitem(fmsc_s01);
		List<memberuselocker> memberuselocker = vtcLockerService.memberuselocker(tblmember.getMemberID());
		List<memberexpensesale> memberexpensesale = vtcPaidService.memberexpensesale(tblmember.getMemberID());
		List<tblmembertalk> tblmembertalks = vtcMemberService.membertblmembertalk(tblmember.getMemberID());
		List<fmsc_s01toselectitem> fmsc_s01toselectitemanother = vtcMemberService
				.fmsc_s01toselectitemanothersite(fmsc_s01);
		List<tblCode> codelist = vtcService.listTblCode(tblCode);
		List<DC> dcList = vtcDCService.dclist(dc);
		List<DC> pissdclist = vtcDCService.dclistBypissId(users.getSiteCode());
		List<Sitecode> SiteList = vtcService.listSiteName();

		model.addAttribute("dclist", dcList);
		model.addAttribute("tblmember", tblmember);
		model.addAttribute("codelist", codelist);
		model.addAttribute("fmsc_s01", fmsc_s01toselectitem);
		model.addAttribute("lockerlist", memberuselocker);
		model.addAttribute("paidlist", memberexpensesale);
		model.addAttribute("talklist", tblmembertalks);
		model.addAttribute("anotherlist", fmsc_s01toselectitemanother);
		model.addAttribute("pissdclist", pissdclist);
		model.addAttribute("sitelist", SiteList);

		return "member/registration/memberregiF";
	}

	@GetMapping("/membercard.do")
	public String membercardF(@RequestParam(name = "memberID") String memberID, Model model) throws Exception {

		List<tblIssueMemberCard> list = vtcMemberService.selectmembercardbyid(memberID);

		model.addAttribute("list", list);
		model.addAttribute("memberID", memberID);

		return "member/registration/membercard";
	}

	@GetMapping("/membercardupdateF.do")
	public String membercardupdateF(@RequestParam(name = "pkid") String pkid, Model model) throws Exception {

		tblIssueMemberCard card = vtcMemberService.membercardbypkid(pkid);

		model.addAttribute("card", card);

		return "member/registration/membercardupdateF";
	}

	@PostMapping("barCodefind")
	@ResponseBody
	public int barCodefind(@RequestParam("barCode") String barCode) throws Exception {

		int barcodecount = vtcMemberService.barCodefind(barCode);

		return barcodecount;
	}

	@PostMapping("/membercardupdateP.do")
	@ResponseBody
	public void membercardupdateP(tblIssueMemberCard tblIssueMemberCard) throws Exception {

		Users users = (Users) session.getAttribute("loginuserinfo");

		tblIssueMemberCard.setUpdUserPKID(users.getUserPKID());

		vtcMemberService.updatecard(tblIssueMemberCard);
	}

	@GetMapping("/membercardinsertF.do")
	public String membercardinsertF(@RequestParam(name = "memberID") String memberID, Model model,tblmember tblmember) throws Exception {

		tblmember.setMemberID(memberID);
		
		tblmember member = vtcMemberService.tblmemberBymemberId(tblmember);
		
		model.addAttribute("member",member);

		return "member/registration/membercardinsertF";
	}

	@PostMapping("/membercardinsertP.do")
	@ResponseBody
	public void membercardinsertP(tblIssueMemberCard tblIssueMemberCard) throws Exception {

		Users users = (Users) session.getAttribute("loginuserinfo");

		tblIssueMemberCard.setAddUserPKID(users.getUserPKID());

		vtcMemberService.insertcard(tblIssueMemberCard);
	}

	@PostMapping(value = "/carddelete.do", produces = "text/json; charset=utf-8")
	@ResponseBody
	public void carddeleteP(tblIssueMemberCard tblIssueMemberCard) throws Exception {

		Users users = (Users) session.getAttribute("loginuserinfo");
		
		tblIssueMemberCard.setUpdUserPKID(users.getUserPKID());
		 
		vtcMemberService.deletecard(tblIssueMemberCard);
	}
	
	// TODO 회원등록관리 강습 신규 등록 페이지
	@GetMapping("/miteminsertF.do")
	public String miteminsertF(tblmember tblmember,DC dc,Model model,tblCode tblCode) throws Exception {
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃 되었습니다.");
			model.addAttribute("script", "reload");
			return "common/msg";
		}
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		dc.setSiteCode(users.getSiteCode());
		
		tblmember member = vtcMemberService.tblmemberBymemberId(tblmember);
		List<tblCode> codelist = vtcService.listTblCode(tblCode);
		List<DC> dcList = vtcDCService.dclist(dc);
		
		String mleveltext = "";
		String dcname = "";
		int dcid = 0;
		
		for(tblCode tblCode2 : codelist) {
			if(tblCode2.getPkid() == member.getMLevel()) {
				mleveltext = tblCode2.getCodeName();
			}
		}
		
		for(DC dc2 : dcList) {
			/*
			 * if(String.valueOf(dc2.getDcid()).equals(member.getDCDS()) ) { dcname =
			 * dc2.getDcName(); }
			 */
			if(String.valueOf(dc2.getPissCD()).equals(member.getPiscCd()) ) {
				 dcname = dc2.getDcName();
				 dcid = dc2.getDcid();
			}
		}
		
		LocalDate currentDate = LocalDate.now();
        
		int yearage = (currentDate.getYear() - Integer.parseInt(member.getBirthDay().substring(0,4)))+2;
		
		model.addAttribute("member",member);
		model.addAttribute("yearage",yearage);
		model.addAttribute("mleveltext",mleveltext);
		model.addAttribute("dcname",dcname);
		model.addAttribute("dcid",dcid);
		model.addAttribute("dclist",dcList);
		
		return "member/registration/miteminsertF";
	}
	
	// TODO 회원등록관리 강좌조회 페이지
	@GetMapping("/mitemfindlist")
	public String mitemfindlist(TblItem_02 tblItem_02,Model model,
				@RequestParam(name = "findstring")String findstring,
				@RequestParam(name = "finddate",required = false)String finddate) throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		tblItem_02.setSiteCode(users.getSiteCode());
		
		try {
			int itemid = Integer.parseInt(findstring);
			
			tblItem_02.setGroupName(String.valueOf(itemid));
			
		} catch (NumberFormatException e) {
			
			tblItem_02.setSubGroupName(findstring);
		}
		
		LocalDate currentDate = LocalDate.now();

        LocalDate nextMonthFirstDay = currentDate.getDayOfMonth() == 1 ? currentDate : currentDate.plusMonths(1).withDayOfMonth(1);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = nextMonthFirstDay.format(formatter);
		
		if(finddate == null || finddate == "") {
			tblItem_02.setFindDate(formattedDate);
		}else {
			tblItem_02.setFindDate(finddate);
			formattedDate = finddate;
		}

		List<Map<String,Object>> selectItemsByFilter = vtcMemberService.selectItemsByFilter(tblItem_02);
		
		model.addAttribute("lists",selectItemsByFilter);
		model.addAttribute("formattedDate",formattedDate);
		model.addAttribute("findvalue",findstring);
		
		return "member/registration/mitemfindlist";
	}
	
	@PostMapping("/mitemfindbyid")
	@ResponseBody
	public Map<String, Object>mitemfindbyid(TblItem_02 tblItem_02, String MemberID, String GroupSaleNo)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
        
		tblItem_02.setSiteCode(users.getSiteCode());
		
		Map<String, Object>list = vtcMemberService.mitemfindbyid(tblItem_02);
		if(!Objects.isNull(MemberID)) {
			list.put("SiteCode",users.getSiteCode());
			list.put("MemberID",MemberID);
			list.put("UserPKID",users.getUserPKID());
			list.put("GroupSaleNo", GroupSaleNo);
			vtcMemberService.insertFmsc_s01_insert_temp(list);
		}
		return list;
	}
	
	@PostMapping("/tempSaleDel")
	@ResponseBody
	public void tempSaleDel(String GroupSaleNo)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
        
		Map<String, Object> setSql = new HashMap<String,Object>();
		setSql.put("UserPKID",users.getUserPKID());
		setSql.put("tempSaleNo",GroupSaleNo);
		vtcMemberService.fmsc_01insertTemp_delete(setSql);
		
		//return list;
	}
	
	@PostMapping("/mitemlistChange")
	@ResponseBody
	public List<Map<String, Object>> mitemlistChange(TblItem_02 tblItem_02)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		tblItem_02.setSiteCode(users.getSiteCode());
		
		if(tblItem_02.getUpdDate() == null || tblItem_02.getUpdDate() == "") {
			LocalDate currentDate = LocalDate.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        String currentDay = currentDate.format(formatter);
	        tblItem_02.setFindDate(currentDay);
		}
		
		List<Map<String,Object>> selectItemsByFilter = vtcMemberService.selectItemsByFilter(tblItem_02);
		
		return selectItemsByFilter;
	}
	
	@ResponseBody
	@PostMapping("/fmsc_01insert")
	public int  fmsc_01insert(fmsc_s01 fmsc_s01) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			users = new Users();
		}

		//fmsc_s01.setSiteCode(users.getSiteCode());
		fmsc_s01.setUserPKID(users.getUserPKID());
		fmsc_s01.setAddUserPKID(users.getAddUserPKID());
		fmsc_s01.setUpdUserPKID(users.getAddUserPKID());
		
		vtcMemberService.fmsc_01insert(fmsc_s01);
		
		return fmsc_s01.getSaleNo();
	}
	
	@ResponseBody
	@PostMapping("/fmsc_01insert_save")
	public int  fmsc_01insert_save(fmsc_s01 fmsc_s01) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			users = new Users();
		}

		//fmsc_s01.setSiteCode(users.getSiteCode());
		fmsc_s01.setUserPKID(users.getUserPKID());
		fmsc_s01.setAddUserPKID(users.getAddUserPKID());
		fmsc_s01.setUpdUserPKID(users.getAddUserPKID());
		
		vtcMemberService.fmsc_01insert_save(fmsc_s01);
		
		return fmsc_s01.getSaleNo();
	}
	
	// TODO 회원등록관리 강좌 수정 페이지
	@GetMapping("/mitemselectF.do")
	public String mitemselectF(fmsc_s01 fmsc_s01,TblItem_02 tblItem_02,tblpaid tblpaid,Model model,tblCode tblCode,DC dc,tblmember tblmember) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		List<fmsc_s01> result = vtcMemberService.fmsc_s01bysaleno(fmsc_s01);
		
		tblItem_02.setSiteCode(result.get(0).getSiteCode());
		tblItem_02.setFindDate(result.get(0).getFromDate());
		
		
		tblpaid.setPaidGroupSaleNo(fmsc_s01.getGroupSaleNo());
		
		tblmember.setMemberID(result.get(0).getCustCode());
		
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		
		dc.setSiteCode(users.getSiteCode());
		
		List<Map<String,Object>> itemList = new ArrayList<Map<String,Object>>();
		for(fmsc_s01 fmsc : result) {
			tblItem_02.setItemID(fmsc.getItemPKID()+"");
			Map<String, Object>item = vtcMemberService.mitemfindbyid(tblItem_02);
			itemList.add(item);
		}
		
		List<tblpaid> paidlist = vtcPaidService.tblpaidbypaidgroupsaleno(tblpaid);
		tblmember member = vtcMemberService.tblmemberBymemberId(tblmember);
		List<tblCode> codelist = vtcService.listTblCode(tblCode);
		List<DC> dcList = vtcDCService.dclist(dc);
		
		String mleveltext = "";
		String dcname = "";
		
		for(tblCode tblCode2 : codelist) {
			if(tblCode2.getPkid() == member.getMLevel()) {
				mleveltext = tblCode2.getCodeName();
			}
		}
		
		for(DC dc2 : dcList) {
			if(String.valueOf(dc2.getDcid()).equals(member.getDCDS()) ) {
				dcname = dc2.getDcName();
			}
		}
		
		LocalDate currentDate = LocalDate.now();
        
		int yearage = (currentDate.getYear() - Integer.parseInt(member.getBirthDay().substring(0,4)))+2;
		
		model.addAttribute("member",member);
		model.addAttribute("yearage",yearage);
		model.addAttribute("mleveltext",mleveltext);
		model.addAttribute("dcname",dcname);
		model.addAttribute("dclist",dcList);
		
		model.addAttribute("itemList",itemList);
		model.addAttribute("fmsc_s01List",result);
		model.addAttribute("paidlist",paidlist);
		
		return "member/registration/mitemselectF";
	}
	
	@PostMapping("/fmsc_01update")
	@ResponseBody
	public void fmsc_01update(fmsc_s01 fmsc_s01)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		fmsc_s01.setUpdUserPKID(users.getUserPKID());
		
		vtcMemberService.fmsc_01update(fmsc_s01);
	}
	
	// TODO 회원등록관리 강좌 재등록 페이지
	@GetMapping("/mitemreinsertF.do")
	public String mitemreinsertF(fmsc_s01 fmsc_s01,tblmember tblmember,DC dc,Model model,tblCode tblCode,TblItem_02 tblItem_02)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃 되었습니다.");
			model.addAttribute("script", "reload");
			return "common/msg";
		}

		List<fmsc_s01> result = vtcMemberService.fmsc_s01bysaleno(fmsc_s01);
		
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		dc.setSiteCode(users.getSiteCode());
		
		String date = fmsc_s01.getRToDate();;

        LocalDate parsedDate = LocalDate.parse(date);

        LocalDate datePlusOneDay = parsedDate.plusDays(1);
        LocalDate datePlusOneMonth = parsedDate.plusMonths(1);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String selectedDate = datePlusOneDay.format(formatter);
        String nextDate = datePlusOneMonth.format(formatter);
        
		tblmember.setMemberID(result.get(0).getCustCode());
		
		tblmember member = vtcMemberService.tblmemberBymemberId(tblmember);
		List<tblCode> codelist = vtcService.listTblCode(tblCode);
		List<DC> dcList = vtcDCService.dclist(dc);
		
		String mleveltext = "";
		String dcname = "";
		int dcid = 0;
		
		for(tblCode tblCode2 : codelist) {
			if(tblCode2.getPkid() == member.getMLevel()) {
				mleveltext = tblCode2.getCodeName();
			}
		}
		
		for(DC dc2 : dcList) {
			if(String.valueOf(dc2.getPiscCD()).equals(member.getPiscCd()) ) {
				dcname = dc2.getDcName();
				dcid = dc2.getDcid();
			}
		}
		
		LocalDate currentDate = LocalDate.now();
        
		int yearage = (currentDate.getYear() - Integer.parseInt(member.getBirthDay().substring(0,4)))+2;
		
		model.addAttribute("fmsc_s01List",result);
		model.addAttribute("member",member);
		model.addAttribute("yearage",yearage);
		model.addAttribute("mleveltext",mleveltext);
		model.addAttribute("dcname",dcname);
		model.addAttribute("dcid",dcid);
		model.addAttribute("dclist",dcList);
		model.addAttribute("selectedDate",selectedDate);
		model.addAttribute("nextDate",nextDate);
		
		return "member/registration/mitemreinsertF";
	}
	
	// TODO 회원등록관리 강좌 반변경 페이지
	@GetMapping("/mitemchangeF.do")
	public String mitemchangeF(fmsc_s01 fmsc_s01,TblItem_02 tblItem_02,tblmember tblmember,tblCode tblCode,DC dc,tblpaid tblpaid,Model model)throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃 되었습니다.");
			model.addAttribute("script", "reload");
			return "common/msg";
		}
		
		List<fmsc_s01> result = vtcMemberService.fmsc_s01bysaleno(fmsc_s01);

		tblItem_02.setSiteCode(result.get(0).getSiteCode());
		tblItem_02.setFindDate(result.get(0).getFromDate());

		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		dc.setSiteCode(users.getSiteCode());
		tblmember.setMemberID(result.get(0).getCustCode());
		tblpaid.setPaidGroupSaleNo(result.get(0).getGroupSaleNo());
		/*
		 * int cntFmsc = 0; for(fmsc_s01 fmsc: result) { if(fmsc_s01.getSaleNo() ==
		 * fmsc.getSaleNo()) { tblmember.setMemberID(fmsc.getCustCode());
		 * tblpaid.setPaidGroupSaleNo(fmsc.getGroupSaleNo());
		 * model.addAttribute("fmsc_s01", fmsc); } cntFmsc++; }
		 * model.addAttribute("cntFmsc", cntFmsc);
		 */
		List<Map<String,Object>> itemList = new ArrayList<Map<String,Object>>();
		for(fmsc_s01 fmsc : result) {
			tblItem_02.setItemID(fmsc.getItemPKID()+"");
			Map<String, Object>item = vtcMemberService.mitemfindbyid(tblItem_02);
			itemList.add(item);
		}

		tblmember member = vtcMemberService.tblmemberBymemberId(tblmember);
		List<tblCode> codelist = vtcService.listTblCode(tblCode);
		List<DC> dcList = vtcDCService.dclist(dc);
		List<tblpaid> paidlist = vtcPaidService.tblpaidbypaidgroupsaleno(tblpaid);
		
		String mleveltext = "";
		String dcname = "";
		int dcid = 0;
		
		for(tblCode tblCode2 : codelist) {
			if(tblCode2.getPkid() == member.getMLevel()) {
				mleveltext = tblCode2.getCodeName();
			}
		}

		for(DC dc2 : dcList) {
			if(String.valueOf(dc2.getPiscCD()).equals(member.getPiscCd()) ) {
				dcname = dc2.getDcName();
				dcid = dc2.getDcid();
			}
		}

		LocalDate currentDate = LocalDate.now();

		int yearage = (currentDate.getYear() - Integer.parseInt(member.getBirthDay().substring(0,4)))+1;

		model.addAttribute("member",member);
		model.addAttribute("mleveltext",mleveltext);
		model.addAttribute("dcname",dcname);
		model.addAttribute("dcid",dcid);
		model.addAttribute("dclist",dcList);
		//model.addAttribute("itemname",URLDecoder.decode(itemname, "UTF-8"));
		
		model.addAttribute("itemList",itemList);
		model.addAttribute("fmsc_s01List", result);
		model.addAttribute("paidlist",paidlist);
		model.addAttribute("yearage",yearage);
		
		return "member/registration/mitemchangeF";
		
	}
	
	@PostMapping("/classchange")
	@ResponseBody
	public int classchange(fmsc_s01 fmsc_s01,tblpaid tblpaid)throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		fmsc_s01 oldfmS01 = new fmsc_s01();
		
        LocalDate fromDate = LocalDate.parse(fmsc_s01.getFromDate(), DateTimeFormatter.ISO_LOCAL_DATE);

        LocalDate currentDate = LocalDate.now();

        if (fromDate.isBefore(currentDate)) {
            LocalDate resultDate = currentDate.minusDays(1);
            oldfmS01.setRToDate(resultDate.format(DateTimeFormatter.ISO_LOCAL_DATE));
        } else {
            LocalDate resultDate = fromDate.minusDays(1);
            oldfmS01.setRToDate(resultDate.format(DateTimeFormatter.ISO_LOCAL_DATE));
        }
		
		oldfmS01.setSaleNo(fmsc_s01.getSaleNo());
		oldfmS01.setState("H-");
		oldfmS01.setInType("반변경");
		oldfmS01.setUpdUserPKID(users.getUserPKID());
		
		vtcMemberService.oldfmsc_s01update(oldfmS01);
		
		fmsc_s01.setSiteCode(users.getSiteCode());
		fmsc_s01.setUserPKID(users.getUserPKID());
		fmsc_s01.setAddUserPKID(users.getUserPKID());
		fmsc_s01.setUpdUserPKID(users.getUserPKID());
		fmsc_s01.setPrevInType("반변경");

		int oldsaleno = fmsc_s01.getSaleNo();
		
		tblpaid.setFPKID(oldsaleno);
		
		vtcMemberService.fmsc_01insert(fmsc_s01);
		
		tblpaid.setPaidGroupSaleNo(fmsc_s01.getSaleNo());
		
		vtcPaidService.paidchange(tblpaid);
		
		return fmsc_s01.getSaleNo();
	}
	
	// TODO 회원등록관리 강습 환불페이지
	@GetMapping("/mitemrefundF.do")
	public String mitemrefundF(fmsc_s01 fmsc_s01,TblItem_02 tblItem_02,tblmember tblmember,tblCode tblCode,DC dc,tblpaid tblpaid,Model model)throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃 되었습니다.");
			model.addAttribute("script", "reload");
			return "common/msg";
		}
		
		List<fmsc_s01> result = vtcMemberService.fmsc_s01bysaleno(fmsc_s01);

		tblpaid.setPaidGroupSaleNo(result.get(0).getGroupSaleNo());
		List<tblpaid> paidList = vtcPaidService.tblpaidbypaidgroupsaleno(tblpaid);

		tblItem_02.setSiteCode(result.get(0).getSiteCode());
		tblItem_02.setFindDate(result.get(0).getFromDate());
		List<Map<String,Object>> itemList = new ArrayList<Map<String,Object>>();
		for(fmsc_s01 fmsc : result) {
			tblItem_02.setItemID(fmsc.getItemPKID()+"");
			Map<String, Object>item = vtcMemberService.mitemfindbyid(tblItem_02);
			itemList.add(item);
		}

		tblmember.setMemberID(result.get(0).getCustCode());
		tblmember member = vtcMemberService.tblmemberBymemberId(tblmember);

		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		List<tblCode> codelist = vtcService.listTblCode(tblCode);

		dc.setSiteCode(users.getSiteCode());
		List<DC> dcList = vtcDCService.dclist(dc);
		
		Map<String,Object> setSql = new HashMap<String,Object>();
		setSql.put("SiteCode",result.get(0).getSiteCode());
		setSql.put("GroupSaleNo",result.get(0).getGroupSaleNo());
		setSql.put("ReFundDate",f.formatDate(new Date(), "yMd"));
		List<Map<String,Object>> refundList = vtcMemberService.selectRefund(setSql);
		//String mleveltext = "";
		//String dcname = "";
		//int dcid = 0;
		
		/*
		 * for(tblCode tblCode2 : codelist) { if(tblCode2.getPkid() ==
		 * member.getMLevel()) { mleveltext = tblCode2.getCodeName(); } }
		 */

		tblCode.setCodeGroupID("22");
		List<tblCode> gongjelist = vtcService.listTblCode(tblCode);
		
		tblCode.setCodeGroupID("23");
		List<tblCode> wiyaklist = vtcService.listTblCode(tblCode);
		
		tblCode.setCodeGroupID("21");
		List<tblCode> julsaklist = vtcService.listTblCode(tblCode);
        
		model.addAttribute("member",member);
		//model.addAttribute("mleveltext",mleveltext);
		//model.addAttribute("dcname",dcname);
		//model.addAttribute("dcid",dcid);
		model.addAttribute("dclist",dcList);
		/* model.addAttribute("itemname",itemname); */
		model.addAttribute("itemList",itemList);
		model.addAttribute("fmsc_s01List", result);
		model.addAttribute("refundList", refundList);
		
		model.addAttribute("paidlist",paidList);
		//model.addAttribute("itemmonth",vtcItemService.itemmonthbyitemid(result.get(0).getItemPKID()));
		model.addAttribute("duescheck",vtcMemberService.finddues(users.getSiteCode()));// 환불옵션
		model.addAttribute("gongjelist",gongjelist);
		model.addAttribute("wiyaklist",wiyaklist);
		model.addAttribute("julsaklist",julsaklist);
		return "member/registration/mitemrefundF";
		
	}
	
	@PostMapping("/optionchange")
	public void dueschange(@RequestParam(value = "dues",defaultValue = "2")int dues,
							@RequestParam(value = "gongje",required = false)String gongje,
							@RequestParam(value = "wiyak",required = false)String wiyak,
							@RequestParam(value = "julsak",required = false)String julsak,tblCode tblCode)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");

		if(dues != 2) {
			Map<String, Object> duescheck = new HashMap<String, Object>();
			
			duescheck.put("dues",dues);
			duescheck.put("SiteCode",users.getSiteCode());
			duescheck.put("UpdUserPKID",users.getUserPKID());
			
			vtcMemberService.dueschange(duescheck);
		}
		else if(gongje != null) {
			
			tblCode.setCodeName(gongje);
			tblCode.setCodeGroupID("22");
			tblCode.setSiteCode(users.getSiteCode());
			tblCode.setUpdUserPKID(users.getUpdUserPKID());
			
			vtcService.optionchange(tblCode);
		}
		else if(wiyak != null) {
			
			tblCode.setCodeName(wiyak);
			tblCode.setCodeGroupID("23");
			tblCode.setSiteCode(users.getSiteCode());
			tblCode.setUpdUserPKID(users.getUpdUserPKID());
			
			vtcService.optionchange(tblCode);
		}
		else if(julsak != null) {
			
			tblCode.setCodeName(julsak);
			tblCode.setCodeGroupID("21");
			tblCode.setSiteCode(users.getSiteCode());
			tblCode.setUpdUserPKID(users.getUpdUserPKID());
			
			vtcService.optionchange(tblCode);
		}
	}
	
	@PostMapping("/itemrefund")
	@ResponseBody
	public int itemrefund(fmsc_s04 fmsc_s04,fmsc_s01 fmsc_s01,fmsc_s04_01 fmsc_s04_01) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		fmsc_s04.setSiteCode(users.getSiteCode());
		fmsc_s04.setAddUserPKID(users.getUserPKID());
		fmsc_s04.setUpdUserPKID(users.getUserPKID());
		
		fmsc_s01.setRToDate(fmsc_s04.getRegDate());
		fmsc_s01.setState("F0");
		fmsc_s01.setInType("환불");
		fmsc_s01.setUpdUserPKID(users.getUserPKID());
		
		fmsc_s04_01.setUpdUserPKID(users.getUserPKID());

		vtcMemberService.oldfmsc_s01update(fmsc_s01);

		vtcMemberService.insertFmsc_s04(fmsc_s04);
		
		vtcMemberService.refundComplete(fmsc_s04_01);
		
		return fmsc_s04.getSaleNo();
	}
	
	@PostMapping("/itemrefund_wait")
	@ResponseBody
	public String itemrefund_wait(fmsc_s04_01 fmsc_s04_01,fmsc_s01 fmsc_s01) throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		fmsc_s04_01.setSiteCode(users.getSiteCode());
		fmsc_s04_01.setAddUserPKID(users.getUserPKID());
		fmsc_s04_01.setUpdUserPKID(users.getUserPKID());
		
		fmsc_s01.setRToDate(fmsc_s04_01.getORToDate());
		fmsc_s01.setState("E");
		fmsc_s01.setInType("환불대기");
		fmsc_s01.setUpdUserPKID(users.getUserPKID());
		
		vtcMemberService.oldfmsc_s01update(fmsc_s01);
		
		vtcMemberService.insertFmsc_s04_01(fmsc_s04_01);
		return "success";
	}
	
	@PostMapping("/itemrefund_wait_cancel")
	@ResponseBody
	public String itemrefund_wait_cancel(fmsc_s01 fmsc_s01,fmsc_s04_01 fmsc_s04_01)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		fmsc_s01.setUpdUserPKID(users.getUserPKID());
		
		fmsc_s04_01.setUpdUserPKID(users.getUpdUserPKID());
		
		vtcMemberService.reutrnFmsc_s01(fmsc_s01);
		vtcMemberService.deleteFmsc_s04_01(fmsc_s04_01);
		return "success";
	}
	
	@GetMapping("/mitemrestF.do")
	public String mitemrestF(fmsc_s01 fmsc_s01,fmsc_s03 fmsc_s03,Model model) throws Exception {
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		log.info(member,"관리자 pkid : "+users.getUserPKID()+"강좌 번호 : "+fmsc_s01.getSaleNo()+"의 대한 휴회창");
		
		List<fmsc_s01> fmsc_s01_1 = vtcMemberService.fmsc_s01bysaleno(fmsc_s01);
		
		fmsc_s03.setSiteCode(users.getSiteCode());
		
		List<fmsc_s03> fmsc_s03_list = vtcMemberService.fmsc_s03BySaleNo(fmsc_s03);
		
		model.addAttribute("fmsc_s01",fmsc_s01_1);
		model.addAttribute("restlist",fmsc_s03_list);
		
		return "member/registration/mitemrestF";
	}
	
	@PostMapping("/itemrest")
	@ResponseBody
	public String itemrest(fmsc_s03 fmsc_s03,fmsc_s01 fmsc_s01)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		fmsc_s01.setRFromDate(fmsc_s03.getReFromDate());
		fmsc_s01.setRToDate(fmsc_s03.getReToDate());
		fmsc_s01.setState("D");
		fmsc_s01.setUpdUserPKID(users.getUserPKID());
		
		fmsc_s03.setSiteCode(users.getSiteCode());
		fmsc_s03.setAddUserPKID(users.getUserPKID());
		fmsc_s03.setUpdUserPKID(users.getUserPKID());
		
		vtcMemberService.oldfmsc_s01update(fmsc_s01);
		vtcMemberService.deleteFmsc_s03(fmsc_s03);
		vtcMemberService.insertFmsc_s03(fmsc_s03);
		return "success";
	}
	
	@PostMapping("/cancelrest")
	@ResponseBody
	public String cancelrest(fmsc_s03 fmsc_s03,fmsc_s01 fmsc_s01)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		fmsc_s03.setUpdUserPKID(users.getUserPKID());
		
		fmsc_s01.setUpdUserPKID(users.getUserPKID());
		
		vtcMemberService.deleteFmsc_s03(fmsc_s03);
		
		vtcMemberService.cancelRestFmsc_s01(fmsc_s01);
		
		return "success";
	}
	
	@GetMapping("/mLockerF.do")
	public String mLockerF(tblmember tblmember,tblCode tblCode,Model model) throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃 되었습니다.");
			model.addAttribute("script", "reload");
			return "common/msg";
		}
		
		tblmember member = vtcMemberService.tblmemberBymemberId(tblmember);
		List<tblplockergroup> lockergrouplist = vtcLockerService.selectSamulhamInfoList(users.getSiteCode());
		
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		
		List<tblCode> codelist = vtcService.listTblCode(tblCode);
		
		String mleveltext = "";
		
		for(tblCode tblCode2 : codelist) {
			if(tblCode2.getPkid() == member.getMLevel()) {
				mleveltext = tblCode2.getCodeName();
			}
		}
		
		model.addAttribute("lockergrouplist",lockergrouplist);
		model.addAttribute("member",member);
		model.addAttribute("mleveltext",mleveltext);
		
		return "member/registration/mLockerF";
	}
	
	@GetMapping("/mLockerDetailF.do")
	public String mLockerSelectF(tblmember tblmember,tbluselocker tbluselocker,tblCode tblCode,tblpaid tblpaid,tblplocker tblplocker,tbldeposite tbldeposite,Model model)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃 되었습니다.");
			model.addAttribute("script", "reload");
			return "common/msg";
		}
		
		tbluselocker.setSiteCode(users.getSiteCode());
		
		tbluselocker uselocker = vtcLockerService.useLockerByPKID(tbluselocker);
		
		tblmember.setMemberID(uselocker.getMemberID());
		
		tblmember member = vtcMemberService.tblmemberBymemberId(tblmember);
		
		tblplocker.setPLockerID(uselocker.getLockerID());
		
		tblplocker.setSiteCode(users.getSiteCode());
		
		Map<String, Object>lockerInfo = vtcLockerService.PLockerJoinGroupByID(tblplocker);
		
		tblpaid.setPaidGroupSaleNo(uselocker.getPKID());
		
		List<tblpaid> paidList = vtcPaidService.tblpaidbypaidgroupsaleno(tblpaid);
		
		List<tblplockergroup> lockergrouplist = vtcLockerService.selectSamulhamInfoList(users.getSiteCode());
		
		tbldeposite.setSiteCode(users.getSiteCode());
		
		tbldeposite.setMemberID(member.getMemberID());
		
		tbldeposite.setLockerID(uselocker.getLockerID());
		
		List<tbldeposite> deposite = vtcLockerService.DepositeByMemberID(tbldeposite);
		
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		
		List<tblCode> codelist = vtcService.listTblCode(tblCode);
		
		tblCode.setCodeGroupID("24");
		
		String wiyakString = vtcService.codenameByCodeValue(tblCode);
		
		tblCode.setCodeGroupID("25");
		
		String julsak = vtcService.codenameByCodeValue(tblCode);
		
		String mleveltext = "";
		
		for(tblCode tblCode2 : codelist) {
			if(tblCode2.getPkid() == member.getMLevel()) {
				mleveltext = tblCode2.getCodeName();
			}
		}	
		
		Pattern pattern = Pattern.compile("\\d+");
        Matcher matcher = pattern.matcher(wiyakString);

        int wiyak = 0;
        while (matcher.find()) {
            wiyak = Integer.parseInt(matcher.group());
        }
		
		model.addAttribute("uselocker",uselocker);
		model.addAttribute("lockerinfo",lockerInfo);
		model.addAttribute("paidlist",paidList);
		model.addAttribute("member",member);
		model.addAttribute("lockergrouplist",lockergrouplist);
		model.addAttribute("mleveltext",mleveltext);
		model.addAttribute("tbldeposite",deposite);
		model.addAttribute("wiyak",wiyak);
		model.addAttribute("julsak",julsak);
		
		return "member/registration/mLockerDetailF";
	}
	
	@GetMapping("/mLockerReInsertF.do")
	public String mLockerReInsertF(tblmember tblmember,tblCode tblCode,tblplocker tblplocker,tbldeposite tbldeposite,Model model) throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃 되었습니다.");
			model.addAttribute("script", "reload");
			return "common/msg";
		}
		
		tblmember member = vtcMemberService.tblmemberBymemberId(tblmember);
		List<tblplockergroup> lockergrouplist = vtcLockerService.selectSamulhamInfoList(users.getSiteCode());
		
		tblplocker.setSiteCode(users.getSiteCode());
		
		Map<String, Object>lockerInfo = vtcLockerService.PLockerJoinGroupByID(tblplocker);
		
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		
		List<tblCode> codelist = vtcService.listTblCode(tblCode);
		
		String mleveltext = "";
		
		for(tblCode tblCode2 : codelist) {
			if(tblCode2.getPkid() == member.getMLevel()) {
				mleveltext = tblCode2.getCodeName();
			}
		}
		
		tbldeposite.setSiteCode(users.getSiteCode());
		
		tbldeposite.setMemberID(member.getMemberID());
		
		tbldeposite.setLockerID(tblplocker.getPLockerID());
		
		List<tbldeposite> deposite = vtcLockerService.DepositeByMemberID(tbldeposite);
		
		model.addAttribute("lockergrouplist",lockergrouplist);
		model.addAttribute("lockerinfo",lockerInfo);
		model.addAttribute("tbldeposite",deposite);
		model.addAttribute("member",member);
		model.addAttribute("mleveltext",mleveltext);
		
		return "member/registration/mLockerReInsertF";
	}
}