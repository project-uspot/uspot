package egovframework.veterans.com.cmm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.veterans.com.cmm.service.VtcDCService;
import egovframework.veterans.com.cmm.service.VtcMemberService;
import egovframework.veterans.com.cmm.service.VtcPaidService;
import egovframework.veterans.com.cmm.service.VtcSamulhamService;
import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.TblItem_02;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01toselectitem;
import egovframework.veterans.com.cmm.service.vo.memberexpensesale;
import egovframework.veterans.com.cmm.service.vo.memberuselocker;
import egovframework.veterans.com.cmm.service.vo.tblCode;
import egovframework.veterans.com.cmm.service.vo.tblIssueMemberCard;
import egovframework.veterans.com.cmm.service.vo.tblmember;
import egovframework.veterans.com.cmm.service.vo.tblmembertalk;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class VtcMemberController {

	private final HttpSession session;
	private final VtcMemberService vtcMemberService;
	private final VtcDCService vtcDCService;
	private final VtcSamulhamService vtcSamulhamService;
	private final VtcService vtcService;
	private final VtcPaidService vtcPaidService;

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
		List<fmsc_s01toselectitem> fmsc_s01toselectitem = vtcMemberService.fmsc_s01toselectitem(fmsc_s01);
		List<memberuselocker> memberuselocker = vtcSamulhamService.memberuselocker(tblmember.getMemberID());
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

	@GetMapping(value = "membershipUpdate")
	public String membershipUpdate(Model model, tblmember updatetblmember, DC dc,
			@RequestParam(name = "emgPhonecheck", required = false) String emgPhonecheck,
			@RequestParam(name = "IFFlagcheck", required = false) String IFFlagcheck,
			@RequestParam(name = "DCIDcheck", required = false) String DCIDcheck) {

		try {
			Users users = (Users) session.getAttribute("loginuserinfo");
			
			if (emgPhonecheck == null) {
				updatetblmember.setEmgPhone(null);
			}
			if (IFFlagcheck == null) {
				updatetblmember.setIFFlag(null);
			}
			if (DCIDcheck == null) {
				updatetblmember.setDCID(-1);
			}

			updatetblmember.setUpdUserPKID(users.getUserPKID());

			vtcMemberService.updatemember(updatetblmember);

			tblmember tblmember = vtcMemberService.tblmemberBymemberId(updatetblmember);

			fmsc_s01 fmsc_s01 = new fmsc_s01();
			fmsc_s01.setCustCode(tblmember.getMemberID());
			fmsc_s01.setSiteCode(tblmember.getSiteCode());
			tblCode tblCode = new tblCode();
			tblCode.setSiteCode(users.getSiteCode());
			tblCode.setCodeGroupID("6");
			dc.setSiteCode(users.getSiteCode());
			List<fmsc_s01toselectitem> fmsc_s01toselectitem = vtcMemberService.fmsc_s01toselectitem(fmsc_s01);
			List<memberuselocker> memberuselocker = vtcSamulhamService.memberuselocker(tblmember.getMemberID());
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

		vtcMemberService.deletemember(tblmember);

		return "redirect:membership.do";
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
		List<fmsc_s01toselectitem> fmsc_s01toselectitem = vtcMemberService.fmsc_s01toselectitem(fmsc_s01);
		List<memberuselocker> memberuselocker = vtcSamulhamService.memberuselocker(tblmember.getMemberID());
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
		List<fmsc_s01toselectitem> fmsc_s01toselectitem = vtcMemberService.fmsc_s01toselectitem(fmsc_s01);
		List<memberuselocker> memberuselocker = vtcSamulhamService.memberuselocker(tblmember.getMemberID());
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

	@GetMapping("memberinsertP")
	public String memebrinsert(tblmember tblmember, Model model,
			@RequestParam(name = "emgPhonecheck", required = false) String emgPhonecheck,
			@RequestParam(name = "IFFlagcheck", required = false) String IFFlagcheck,
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
		if (IFFlagcheck == null) {
			tblmember.setIFFlag(null);
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
		List<memberuselocker> memberuselocker = vtcSamulhamService.memberuselocker(tblmember.getMemberID());
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
	
	@GetMapping("/miteminsertF.do")
	public String miteminsertF(tblmember tblmember,DC dc,Model model,tblCode tblCode) throws Exception {
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("6");
		dc.setSiteCode(users.getSiteCode());
		
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

		TblItem_02 tblItem_02 = new TblItem_02();
		
		tblItem_02.setSiteCode(users.getSiteCode());
		tblItem_02.setSubGroupName("수영");
		
		List<Map<String,Object>> selectItemsByFilter = vtcMemberService.selectItemsByFilter(tblItem_02);
		
		System.out.println(selectItemsByFilter);
		
		model.addAttribute("member",member);
		model.addAttribute("mleveltext",mleveltext);
		model.addAttribute("dcname",dcname);
		
		return "member/registration/miteminsertF";
	}
	
	
}