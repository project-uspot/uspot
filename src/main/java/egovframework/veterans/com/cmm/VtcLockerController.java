package egovframework.veterans.com.cmm;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.veterans.com.cmm.service.VtcLockerService;
import egovframework.veterans.com.cmm.service.vo.tblplockergroup;
import egovframework.veterans.com.cmm.service.vo.tbluselocker;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.lockercodelist;
import egovframework.veterans.com.cmm.service.vo.tbldeposite;
import egovframework.veterans.com.cmm.service.vo.tblplocker;

@Slf4j
@Controller
@RequiredArgsConstructor
public class VtcLockerController{
	
	private final HttpSession session;
	private final VtcLockerService vtcLockerService;
	
	public static Marker locker = MarkerFactory.getMarker("locker");
	
	@GetMapping("/lockerinfo.do")
	public String samulhaminfo(Model model) throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
			model.addAttribute("url", "login.do");
			model.addAttribute("script", "redirect");

			return "common/msg";
		}
		
		tblplockergroup tblplockergroup = new tblplockergroup();
		
		tblplockergroup.setSiteCode(users.getSiteCode());
		tblplockergroup.setIsDelete("N");
		
		List<tblplockergroup> SamulhamList=vtcLockerService.LockerInfoList(tblplockergroup);

		model.addAttribute("list",SamulhamList);
		
		return "locker/information/lockerinfoList";
	}
	
	@GetMapping("/LockerInfoInsertF.do")
	public String LockerInfoInsertF() throws Exception {return "locker/information/lockerinfoInsert";}
	
	@GetMapping("/lockerdetail.do")
	public String samulhamdetail(@RequestParam(name = "lockergroupid")int lockergroupid,Model model) throws Exception {
		
		tblplockergroup samulhamdetail = vtcLockerService.selectSamulhamInfodetail(lockergroupid);
		
		model.addAttribute("vo",samulhamdetail);
		
		return "locker/information/lockerinfoDetail";
	}
	
	@ResponseBody
	@PostMapping("/LockerInfoInsert")
	public String LockerInfoInsert(tblplockergroup tblplockergroup,@RequestParam(value = "imageInput",required = false)MultipartFile LockerImage)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if (users == null) {
			return "0";
		}
		
		if(LockerImage != null && !LockerImage.isEmpty()) {
			
			String LockerImagefilename = LockerImage.getOriginalFilename();
			
			tblplockergroup.setLockerImage(LockerImagefilename);
	
			String image_path = session.getServletContext().getRealPath("images/egovframework/com/cmm/main/");
			
			
			try {
				LockerImage.transferTo(new File(image_path + LockerImagefilename));
			} catch (Exception e) {
				return "0";
			}
		}
		tblplockergroup.setSiteCode(users.getSiteCode());
		tblplockergroup.setAddUserPKID(users.getUserPKID());		
		
		vtcLockerService.LockerInfoInsert(tblplockergroup);
		
		if(LockerImage != null && !LockerImage.isEmpty()) {
			
			String LockerImagefilename = LockerImage.getOriginalFilename();
			
			String ImgName = "PLG"+tblplockergroup.getPLockerGroupID()+"Img"+LockerImagefilename; 
			
			tblplockergroup.setLockerImage(ImgName);
	
			String image_path = session.getServletContext().getRealPath("images/egovframework/com/cmm/main/");
			
			
			try {
				LockerImage.transferTo(new File(image_path + ImgName));
			} catch (Exception e) {
				return "0";
			}
			
			vtcLockerService.UpdLockerGroupImage(tblplockergroup);
		}
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/UpdLockerGroup")
	public String UpdLockerGroup(tblplockergroup tblplockergroup,@RequestParam(value = "imageInput",required = false)MultipartFile LockerImage)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if (users == null) {
			return "0";
		}
		
		if(LockerImage != null && !LockerImage.isEmpty()) {
			
			String LockerImagefilename = LockerImage.getOriginalFilename();
			
			String ImgName = "PLG"+tblplockergroup.getPLockerGroupID()+"Img"+LockerImagefilename; 
			
			tblplockergroup.setLockerImage(ImgName);
			
			String image_path = session.getServletContext().getRealPath("images/egovframework/com/cmm/main/");
			
			try {
				LockerImage.transferTo(new File(image_path + ImgName));
			} catch (Exception e) {
				return "0";
			}
		}
		
		tblplockergroup.setSiteCode(users.getSiteCode());
		tblplockergroup.setUpdUserPKID(users.getUserPKID());		
		
		vtcLockerService.UpdLockerGroup(tblplockergroup);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/RemoveLockerGroup")
	public String RemoveLockerGroup(tblplockergroup tblplockergroup)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if (users == null) {
			return "0";
		}
		
		tblplockergroup.setSiteCode(users.getSiteCode());
		tblplockergroup.setUpdUserPKID(users.getUserPKID());
		
		vtcLockerService.RemoveLockerGroup(tblplockergroup);
		
		return "success";
	}
	
	@GetMapping("/lockerDeleteinfo.do")
	public String lockerDeleteinfo(Model model) throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			model.addAttribute("msg", "세션이 만료되었습니다. 다시로그인해주세요.");
			model.addAttribute("url", "login.do");
			model.addAttribute("script", "redirect");

			return "common/msg";
		}
		
		tblplockergroup tblplockergroup = new tblplockergroup();
		
		tblplockergroup.setSiteCode(users.getSiteCode());
		tblplockergroup.setIsDelete("Y");
		
		List<tblplockergroup> SamulhamList=vtcLockerService.LockerInfoList(tblplockergroup);

		model.addAttribute("list",SamulhamList);
		
		return "locker/information/lockerinfoList";
	}
	
	@GetMapping("/lockercodelist.do")
	public String lockercodelist(tblplockergroup parametergroup,Model model) throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			model.addAttribute("msg", "세션이 만료되었습니다. 다시로그인해주세요.");
			model.addAttribute("url", "login.do");
			model.addAttribute("script", "redirect");

			return "common/msg";
		}
		
		parametergroup.setSiteCode(users.getSiteCode());
		parametergroup.setIsDelete("N");
		
		List<tblplockergroup> tblplockergroup = vtcLockerService.LockerInfoList(parametergroup);
		tblplocker tblplocker = new tblplocker();
		tblplocker.setSiteCode(users.getSiteCode());
		tblplocker.setIsDelete("N");
		List<lockercodelist> lockercodelist = vtcLockerService.lockercodelist(tblplocker);
		model.addAttribute("grouplist",tblplockergroup);
		model.addAttribute("list",lockercodelist);
		
		return "locker/lockercode/lockercodelist";
	}
	
	@GetMapping("/lockercodeinsert.do")
	public String lockercodeinsertF(tblplockergroup tblplockergroup,Model model) throws Exception{
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		tblplockergroup.setSiteCode(users.getSiteCode());
		tblplockergroup.setIsDelete("N");
		
		List<tblplockergroup> PlockergroupName=vtcLockerService.LockerInfoList(tblplockergroup);
		int maxsortorder = vtcLockerService.maxsortorder(users.getSiteCode());
		model.addAttribute("list",PlockergroupName);
		model.addAttribute("sortorder",maxsortorder+1);
		return "locker/lockercode/lockercodeinsertF";
	}
	
	@ResponseBody
	@PostMapping("/plockernovalue")
	public String plockernovalue(tblplockergroup tblplockergroup) throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		tblplockergroup.setSiteCode(users.getSiteCode());
		
		int plockernovalue = vtcLockerService.plockernovalue(tblplockergroup);
	
		
		return Integer.toString(plockernovalue);
		
	}
	
	@PostMapping("/lockercodeinsert.do")
	public String lockercodeinsertP(tblplocker tblplocker,Model model)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		tblplocker.setSiteCode(users.getSiteCode());
		tblplocker.setAddUserPKID(users.getUserPKID());
		
		List<tblplocker> plockernolist = vtcLockerService.plockernolist(tblplocker);
		int success = 0;
		for(tblplocker plockerno : plockernolist) {
			if (plockerno.getPLockerNO() == tblplocker.getPLockerNO()) {

				success = 1;
				
			}
			
		}
		if(success != 1) {
			
			vtcLockerService.lockercodeinsert(tblplocker);
			
			model.addAttribute("msg", "등록되었습니다.");
			model.addAttribute("script", "reload");
			
			return "common/msg";
		}else {
			model.addAttribute("msg", "이미 있는 사물함번호입니다.");
			model.addAttribute("script", "back");
			return "common/msg";
		}
	}
	
	@GetMapping("/lockercodeupdate.do")
	public String lockercodeupdateF(@RequestParam("PLockerID")int PLockerID,Model model,tblplockergroup tblplockergroup) throws Exception{
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		tblplocker tblplocker = new tblplocker();
		
		tblplocker.setPLockerID(PLockerID);
		tblplocker.setSiteCode(users.getSiteCode());
		tblplocker lockercodedetail = vtcLockerService.lockervobyplockerid(tblplocker);
		
		tblplockergroup.setSiteCode(users.getSiteCode());
		tblplockergroup.setIsDelete("N");
		List<tblplockergroup> PlockergroupName=vtcLockerService.LockerInfoList(tblplockergroup);
		int maxsortorder = vtcLockerService.maxsortorder(users.getSiteCode());
		model.addAttribute("list",PlockergroupName);
		model.addAttribute("sortorder",maxsortorder+1);
		model.addAttribute("detail",lockercodedetail);
		return "locker/lockercode/lockercodeupdateF";
	}
	
	@PostMapping("/lockercodeupdate.do")
	public String lockercodeupdateP(tblplocker tblplocker,Model model) throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		tblplocker.setSiteCode(users.getSiteCode());
		tblplocker lockercodedetail = vtcLockerService.lockervobyplockerid(tblplocker);
		List<tblplocker> plockernolist = vtcLockerService.plockernolist(tblplocker);
		
		int success = 0;
		if(lockercodedetail.getPLockerNO() != tblplocker.getPLockerNO()) {
			for(tblplocker plockerno : plockernolist) {
				if (plockerno.getPLockerNO() == tblplocker.getPLockerNO()) {
					success = 1;	
				}	
			}
		}
		if(success != 1) {
			tblplocker.setLSaleNo(lockercodedetail.getLSaleNo());
			tblplocker.setFromDate(lockercodedetail.getFromDate());
			tblplocker.setToDate(lockercodedetail.getToDate());
			tblplocker.setRegMonth(lockercodedetail.getRegMonth());
			tblplocker.setMemberID(lockercodedetail.getMemberID());
			tblplocker.setAddDate(lockercodedetail.getAddDate());
			tblplocker.setAddUserPKID(lockercodedetail.getAddUserPKID());
			tblplocker.setUpdUserPKID(users.getUserPKID());
			
			vtcLockerService.lockercodeupdate(tblplocker);
			
			model.addAttribute("msg", "변경되었습니다.");
			model.addAttribute("script", "reload");
			
			return "common/msg";
		}else {
			model.addAttribute("msg", "이미 있는 사물함번호입니다.");
			model.addAttribute("script", "back");
			return "common/msg";
		}
	}
	
	@ResponseBody
	@GetMapping(value="lockercodelistfind.do")
	public Map<String,Object> lockercodelistfind(tblplocker tblplocker) throws Exception{
		
		Map<String,Object> lockerlist = new HashMap<>();
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		tblplocker.setSiteCode(users.getSiteCode());
		List<lockercodelist> lockercodelist = vtcLockerService.lockercodelist(tblplocker);
		

		lockerlist.put("size", lockercodelist.size());
		lockerlist.put("commentList", lockercodelist);
		return lockerlist;
	}
	
	@ResponseBody
	@PostMapping("plockerByGroupID")
	public List<Map<String,Object>> plockerByGroupID(tblplockergroup tblplockergroup)throws Exception{
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		tblplockergroup.setSiteCode(users.getSiteCode());
		
		List<Map<String,Object>> plockerlist = vtcLockerService.plockerByGroupID(tblplockergroup);
		
		return plockerlist;
	}
	
	@ResponseBody
	@PostMapping("StartBooking")
	public Map<String,Object> StartBooking(tblplocker tblplocker,Model model,
				@RequestParam(value = "PrevPLockerID")int PrevPLockerID){
		
		try {
			Users users =  (Users) session.getAttribute("loginuserinfo");
			if (users == null) {
				Map<String,Object> map = new HashMap<String, Object>();
	        	
	        	map.put("fail","fail");
	        	
				return map;
			}
			tblplocker.setSiteCode(users.getSiteCode());
			tblplocker.setClickUserPKID(users.getUserPKID());
			tblplocker.setUpdUserPKID(users.getUserPKID());
			
			tblplocker Oldtblplocker = new tblplocker();
			
			Oldtblplocker.setSiteCode(users.getSiteCode());
			Oldtblplocker.setClickUserPKID(users.getUserPKID());
			Oldtblplocker.setUpdUserPKID(users.getUserPKID());
			Oldtblplocker.setPLockerID(PrevPLockerID);
        	Oldtblplocker.setClickUserPKID(0);
			
			String ClickTimeByID = vtcLockerService.ClickTimeByID(tblplocker);
			
			//등록하고 있지 않을경우
			if(ClickTimeByID == null) {
				
				vtcLockerService.UpdClickTime(Oldtblplocker);
				
				vtcLockerService.UpdClickTime(tblplocker);
				
				Map<String,Object> PLockerJoinGroupByID = vtcLockerService.PLockerJoinGroupByID(tblplocker);
				
				log.info(locker,"관리자 pkid : "+users.getUserPKID()+", 사물함 pkid : "+tblplocker.getPLockerID()+"의 대한 등록 시작");
				return PLockerJoinGroupByID;
			}else {
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		        LocalDateTime clickTime = LocalDateTime.parse(ClickTimeByID, formatter);

		        LocalDateTime currentTime = LocalDateTime.now();

		        long minutesDifference = ChronoUnit.MINUTES.between(clickTime, currentTime);
		        //System.out.println("지난시간은 : "+minutesDifference);
		        //10분이 지났을 경우
		        if(minutesDifference>10) {
		        	
					vtcLockerService.UpdClickTime(Oldtblplocker);
		        	
		        	vtcLockerService.UpdClickTime(tblplocker);
					
					Map<String,Object> PLockerJoinGroupByID = vtcLockerService.PLockerJoinGroupByID(tblplocker);
					
					log.info(locker,"관리자 pkid : "+users.getUserPKID()+", 사물함 pkid : "+tblplocker.getPLockerID()+"의 대한 등록 시작");
					
					return PLockerJoinGroupByID;
		        }else {
		        	Map<String,Object> map = new HashMap<String, Object>();
		        	
		        	map.put("already","already");
		        	
					return map;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@ResponseBody
	@PostMapping("/useLockerInsert")
	public int useLockerInsert(tbluselocker tbluselocker,tblplocker tblplocker)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if (users == null) {
			return 0;
		}
		
		tbluselocker.setSiteCode(users.getSiteCode());
		tbluselocker.setAddUserPKID(users.getUserPKID());
		tbluselocker.setUpdUserPKID(users.getUserPKID());
		
		tblplocker.setPLockerID(tbluselocker.getLockerID());
		tblplocker.setSiteCode(users.getSiteCode());
		tblplocker.setState(2);
		tblplocker.setUpdUserPKID(users.getUserPKID());
		
		//등록중이거나 등록된 사물함인지 판단하는 로직
		tblplocker result = vtcLockerService.lockervobyplockerid(tblplocker);
		
		if(result.getState() == 2) {
			return -1;
		}
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime clickTime = LocalDateTime.parse(result.getClickTime(), formatter);

        LocalDateTime currentTime = LocalDateTime.now();

        long minutesDifference = ChronoUnit.MINUTES.between(clickTime, currentTime);
		
		if(result.getClickUserPKID() != users.getUserPKID() && minutesDifference < 11) {
			return -2;
		}
		
		vtcLockerService.useLockerInsert(tbluselocker);
		
		tblplocker.setLSaleNo(tbluselocker.getPKID());
		
		vtcLockerService.UpdPLocker(tblplocker);
		
		return tbluselocker.getPKID();
	}
	
	@ResponseBody
	@PostMapping("/tbldepositeinsert")
	public int tbldepositeinsert(tbldeposite tbldeposite)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		tbldeposite.setSiteCode(users.getSiteCode());
		tbldeposite.setAddUserPKID(users.getUserPKID());
		tbldeposite.setUpdUserPKID(users.getUserPKID());
		
		vtcLockerService.DepositeInsert(tbldeposite);
		
		return tbldeposite.getPKID();
	}
	
	@ResponseBody
	@PostMapping("/useLockerPriceUpdate")
	public String useLockerPriceUpdate(tbluselocker tbluselocker)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if(users == null) {
			return "0";
		}
		
		tbluselocker.setSiteCode(users.getSiteCode());
		tbluselocker.setAddUserPKID(users.getUserPKID());
		tbluselocker.setUpdUserPKID(users.getUserPKID());
		
		vtcLockerService.useLockerPriceUpdate(tbluselocker);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/UpduseLocker")
	public String UpduseLocker(tbluselocker tbluselocker,tblplocker tblplocker)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if(users == null) {
			return "0";
		}
		
		tbluselocker.setSiteCode(users.getSiteCode());
		tbluselocker.setUpdUserPKID(users.getUserPKID());
		
		tblplocker.setPLockerID(tbluselocker.getLockerID());
		tblplocker.setSiteCode(tbluselocker.getSiteCode());
		tblplocker.setState(2);
		tblplocker.setLSaleNo(tbluselocker.getPKID());
		tblplocker.setUpdUserPKID(users.getUserPKID());

		vtcLockerService.UpduseLocker(tbluselocker);
		
		vtcLockerService.UpdPLockerBySave(tblplocker);
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/lockerChange")
	public String lockerChange(tbluselocker tbluselocker,tblplocker tblplocker,
								@RequestParam(name = "PrevPLockerID")int PrevPLockerID)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if(users == null) {
			return "0";
		}
		
		tbluselocker.setSiteCode(users.getSiteCode());
		tbluselocker.setUpdUserPKID(users.getUserPKID());
		
		tblplocker.setPLockerID(tbluselocker.getLockerID());
		tblplocker.setSiteCode(tbluselocker.getSiteCode());
		tblplocker.setState(2);
		tblplocker.setLSaleNo(tbluselocker.getPKID());
		tblplocker.setUpdUserPKID(users.getUserPKID());
		
		//등록중이거나 등록된 사물함인지 판단하는 로직
		tblplocker result = vtcLockerService.lockervobyplockerid(tblplocker);
		if(result.getState() == 2) {
			return "-1";
		}
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime clickTime = LocalDateTime.parse(result.getClickTime(), formatter);

        LocalDateTime currentTime = LocalDateTime.now();

        long minutesDifference = ChronoUnit.MINUTES.between(clickTime, currentTime);
		
		if(result.getClickUserPKID() != users.getUserPKID() && minutesDifference < 11) {
			return "-2";
		}
		
		vtcLockerService.UpduseLocker(tbluselocker);
		
		vtcLockerService.UpdPLocker(tblplocker);
		
		tblplocker.setPLockerID(PrevPLockerID);
		
		vtcLockerService.ReturnLocker(tblplocker);
		
		Map<String,Object> tbldeposite = new HashMap<String, Object>();
		
		tbldeposite.put("SiteCode",users.getSiteCode());
		tbldeposite.put("LockerID",tbluselocker.getLockerID());
		tbldeposite.put("MemberID",tbluselocker.getMemberID());
		tbldeposite.put("UpdUserPKID",users.getUserPKID());
		tbldeposite.put("PrevPLockerID",PrevPLockerID);
		
		vtcLockerService.ChangeDeposite(tbldeposite);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/lockerReturn")
	public String lockerReturn(tbluselocker tbluselocker)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if(users == null) {
			return "0";
		}
		
		tbluselocker.setSiteCode(users.getSiteCode());
		tbluselocker.setUpdUserPKID(users.getUserPKID());
		
		vtcLockerService.ReturnuseLocker(tbluselocker);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/lockerDelete")
	public String lockerDelete(tbluselocker tbluselocker)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if(users == null) {
			return "0";
		}
		
		tbluselocker.setSiteCode(users.getSiteCode());
		tbluselocker.setUpdUserPKID(users.getUserPKID());
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/DepositeOriginPKIDFind")
	public String DepositeOriginPKIDFind(tbldeposite tbldeposite)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if(users == null) {
			return "0";
		}
		
		tbldeposite.setSiteCode(users.getSiteCode());
		
		int result = vtcLockerService.DepositeOriginPKIDFind(tbldeposite);
		
		if(result>0) {
			return "-1";
		}else {
			
			tbldeposite.setPKID(tbldeposite.getOriginPKID());
			
			try {
				int result2 = vtcLockerService.DepositeOriginPKIDFind(tbldeposite);
				
				if(result2 == 0) {
					return "1";
				}
				
				return "-1";
			} catch (NullPointerException e) {
				return "1";
			}
		}
	}
	
	@ResponseBody
	@PostMapping("/useLockerCancel")
	public String useLockerCancel(tbluselocker tbluselocker)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if(users == null) {
			return "0";
		}
		
		tbluselocker.setSiteCode(users.getSiteCode());
		tbluselocker.setUpdUserPKID(users.getUserPKID());
		
		vtcLockerService.CanceluseLocker(tbluselocker);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/refundUseLocker")
	public String refundUseLocker(tbluselocker tbluselocker)throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if(users == null) {
			return "0";
		}
		
		tbluselocker.setSiteCode(users.getSiteCode());
		tbluselocker.setUpdUserPKID(users.getUserPKID());
		
		vtcLockerService.refundUseLocker(tbluselocker);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/useLockerReInsert")
	public int useLockerReInsert(tbluselocker tbluselocker,tblplocker tblplocker)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if (users == null) {
			return 0;
		}
		
		tbluselocker.setSiteCode(users.getSiteCode());
		tbluselocker.setAddUserPKID(users.getUserPKID());
		tbluselocker.setUpdUserPKID(users.getUserPKID());
		
		tblplocker.setPLockerID(tbluselocker.getLockerID());
		tblplocker.setSiteCode(users.getSiteCode());
		tblplocker.setState(2);
		tblplocker.setUpdUserPKID(users.getUserPKID());
		
		vtcLockerService.useLockerInsert(tbluselocker);
		
		tblplocker.setLSaleNo(tbluselocker.getPKID());
		
		vtcLockerService.UpdPLocker(tblplocker);
		
		return tbluselocker.getPKID();
	}
	
	@ResponseBody
	@PostMapping("/depositeInsertAndgetList")
	public List<tbldeposite> depositeInsertAndgetList(tbldeposite tbldeposite) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if (users == null) {
			
			List<tbldeposite> Tbldeposites = new ArrayList<tbldeposite>();
			
			Tbldeposites = null;
			return Tbldeposites;
		}
		
		tbldeposite.setSiteCode(users.getSiteCode());
		tbldeposite.setAddUserPKID(users.getUserPKID());
	
		vtcLockerService.DepositeInsert(tbldeposite);
		
		List<tbldeposite> depositeList = vtcLockerService.DepositeListByMember(tbldeposite);
		
		return depositeList;
	}
	
	@ResponseBody
	@PostMapping("/InsertDepositeRefund")
	public List<tbldeposite> InsertDepositeRefund(tbldeposite tbldeposite)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if (users == null) {
			
			List<tbldeposite> Tbldeposites = new ArrayList<tbldeposite>();
			
			Tbldeposites = null;
			return Tbldeposites;
		}
		
		tbldeposite.setAddUserPKID(users.getUserPKID());
		tbldeposite.setSiteCode(users.getSiteCode());
		
		vtcLockerService.InsertDepositeRefund(tbldeposite);
		
		List<tbldeposite> depositeList = vtcLockerService.DepositeListByMember(tbldeposite);
		
		return depositeList;
	}
	
	@ResponseBody
	@PostMapping("/refundcashcheck")
	public String refundcashcheck(tbluselocker tbluselocker)throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		tbluselocker.setSiteCode(users.getSiteCode());
		
		vtcLockerService.refundcashcheck(tbluselocker);
		
		return "success";
	}
}