package egovframework.veterans.com.cmm;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.veterans.com.cmm.service.VtcItemService;
import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.VtcUserService;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.TblItem_01;
import egovframework.veterans.com.cmm.service.vo.TblItem_02;
import egovframework.veterans.com.cmm.service.vo.TblItem_03;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.applicationlist;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01;
import egovframework.veterans.com.cmm.service.vo.selectitembyitemcode;
import egovframework.veterans.com.cmm.service.vo.maturitylist;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class VtcPersonnelContoller {

	private final HttpSession session;
	private final VtcService vtcService;
	private final VtcItemService vtcItemService;
	private final VtcUserService vtcUserService;
	
	@GetMapping("applicationlist.do")
	public String settlemnetlist(Model model,fmsc_s01 fmsc_s01) throws Exception {
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		if(users == null){
			
			return "redirect:login.do";
		}
		
		Sitecode sitecode = vtcService.selectSiteCode(users.getSiteCode());
	
		model.addAttribute("sitename",sitecode.getSiteName());
		
		return "Personnel/application/applicationlist";
	}
	
	@PostMapping("/applicationlist")
	@ResponseBody
	public Map<String, Object> applicationlistfind(fmsc_s01 fmsc_s01,
			@RequestParam(name="jubsuday")String jubsuday,
			@RequestParam(name="learnstartday")String learnstartday,
			@RequestParam(name="pgmgroup")String pgmgroup,
			@RequestParam(name="day")String day,
			@RequestParam(name="pgm")String pgm,
			@RequestParam(name="level")String level,
			@RequestParam(name="time")String time,
			@RequestParam(name="user")String user,
			@RequestParam(name="membercategory")String membercategory,
			@RequestParam(name="membertext")String membertext) throws Exception{
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		System.out.println("fmsc_s01 : " + fmsc_s01);

		fmsc_s01.setSiteCode(users.getSiteCode());
		
		List<String> GroupIDs = Arrays.asList(pgmgroup.split(","));
		if (pgmgroup.equals("전체")) {
			GroupIDs = null;
		}
		List<String> SubGroupIDs = Arrays.asList(pgm.split(","));
		if (pgm.equals("전체")) {
			SubGroupIDs = null;
		}
		List<String> DayNames = Arrays.asList(day.split(","));
		if (day.equals("전체")) {
			DayNames = null;
		}
		List<String> FromTimes = Arrays.asList(time.split(","));
		if (time.equals("전체")) {
			FromTimes = null;
		}
		
		List<String> LevelIDs = Arrays.asList(level.split(","));
		if (level.equals("전체")) {
			LevelIDs = null;
		}
		
		List<String> UserPKIDs = Arrays.asList(user.split(","));
		if (user.equals("전체")) {
			UserPKIDs = null;
		}
		
		Map<String,Object> fmmap = new HashMap<String, Object>();
		fmmap.put("fmsc_s01", fmsc_s01);
		fmmap.put("jubsuday", jubsuday);
		fmmap.put("learnstartday", learnstartday);
		fmmap.put("GroupIDs",GroupIDs);
		fmmap.put("SubGroupIDs",SubGroupIDs);
		fmmap.put("DayNames",DayNames);
		fmmap.put("FromTimes",FromTimes);
		fmmap.put("LevelIDs",LevelIDs);
		fmmap.put("UserPKIDs",UserPKIDs);
		fmmap.put("membercategory",membercategory);
		fmmap.put("membertext",membertext);
		
		System.out.println(fmmap);
		
		List<applicationlist> applicationlists = vtcItemService.applicationlist(fmmap);
		System.out.println(applicationlists);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("size", applicationlists.size());
		map.put("list", applicationlists);
		
		return map;
	}
	
	
	@GetMapping("item01list.do")
	public String item01list(Model model) throws Exception {
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		
		List<TblItem_01> list01 = vtcItemService.item01list(users.getSiteCode());
		
		model.addAttribute("list",list01);
		
		return "Personnel/application/itemlist";
	}
	
	@GetMapping("item02list.do")
	public String item02list(Model model,TblItem_02 tblItem_02,
				@RequestParam(name="pgmgroup")String pgmgroup) throws Exception {

		String[] array = pgmgroup.split(",");
		int[] intarr = new int[array.length];
		
		for(int i = 0;i<array.length; i++) {
			intarr[i] = Integer.parseInt(array[i]);
		}
		List<TblItem_02> list = new ArrayList<>();
		
		for(int i : intarr) {
			tblItem_02.setGroupID(i);
			List<TblItem_02> list02 = vtcItemService.item02list(tblItem_02);
			list.addAll(list02);
		}
		System.out.println(list);
		model.addAttribute("list",list);
		
		return "Personnel/application/item02list";
	}
	
	@GetMapping("item03list.do")
	public String item03list(Model model) throws Exception {
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		
		List<TblItem_03> list03 = vtcItemService.item03list(users.getSiteCode());
		
		model.addAttribute("list",list03);
		
		return "Personnel/application/item03list";
	}
	
	@GetMapping("daylist.do")
	public String daylist(Model model) throws Exception {
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		
		List<selectitembyitemcode> daylist = vtcItemService.daylist(users.getSiteCode());
		
		model.addAttribute("list",daylist);
		
		return "Personnel/application/daylist";
	}
	
	@GetMapping("timelist.do")
	public String timelist() {return "Personnel/application/timelist";}
	
	@GetMapping("/userlist.do")
	public String userlist(Model model) throws Exception {
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		
		Users user = new Users();
		
		user.setSiteCode(users.getSiteCode());
		user.setType("2");
		
		List<Users> userlist = vtcUserService.userlistBytype(user);
		
		model.addAttribute("list",userlist);
		
		return "Personnel/application/userlist";
	}
	
	@GetMapping("/maturitylist.do")
	public String maturitylist(Model model) throws Exception {
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		if(users == null){
			
			return "redirect:login.do";
		}
		
		Sitecode sitecode = vtcService.selectSiteCode(users.getSiteCode());
				
		model.addAttribute("sitename",sitecode.getSiteName());
		
		return "Personnel/maturity/maturitylist";
	}
	
	@PostMapping("/maturitylist")
	@ResponseBody
	public Map<String,Object> maturitylist(fmsc_s01 fmsc_s01) throws Exception {
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		
		fmsc_s01.setSiteCode(users.getSiteCode());
		
		Map<String,Object> fmmap = new HashMap<String, Object>();
		fmmap.put("fmsc_s01",fmsc_s01);
		
		List<maturitylist> maturitylists = vtcItemService.maturitylist(fmmap);
		
		System.out.println(maturitylists);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("size",maturitylists.size());
		map.put("list", maturitylists);
		
		return map;
	}
	
	@GetMapping("/refundpersonlist.do")
	public String refundpersonlist(Model model) throws Exception {
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		if(users == null){
			
			return "redirect:login.do";
		}
		
		Sitecode sitecode = vtcService.selectSiteCode(users.getSiteCode());
				
		model.addAttribute("sitename",sitecode.getSiteName());
		
		return "Personnel/refund/refundpersonlist";
	}
	
	@GetMapping("/learningcurrentlist.do")
	public String learningcurrentlist(Model model) throws Exception {
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		if(users == null){
			
			return "redirect:login.do";
		}
		
		Sitecode sitecode = vtcService.selectSiteCode(users.getSiteCode());
				
		model.addAttribute("sitename",sitecode.getSiteName());
		
		return "Personnel/learningcurrent/learningcurrentlist";
	}
	

	@GetMapping("/attendancelist.do")
	public String attendancelist(Model model) throws Exception {
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		if(users == null){
			
			return "redirect:login.do";
		}
		
		Sitecode sitecode = vtcService.selectSiteCode(users.getSiteCode());
		
		model.addAttribute("sitename",sitecode.getSiteName());
		
		return "Personnel/attendance/attendancelist";
	}
}
