package egovframework.veterans.com.cmm;

import static org.hamcrest.CoreMatchers.nullValue;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.veterans.com.cmm.service.VtcLockerService;
import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.tblplockergroup;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.lockercodelist;
import egovframework.veterans.com.cmm.service.vo.tblplocker;

@Slf4j
@Controller
@RequiredArgsConstructor
public class VtcLockerController{
	
	private final HttpSession session;
	private final VtcLockerService vtcLockerService;
	
	public static Marker locker = MarkerFactory.getMarker("locker");
	
	@GetMapping("/samulhaminfo.do")
	public String samulhaminfo(Model model) throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
			model.addAttribute("script", "back");

			return "common/msg";
		}
		List<tblplockergroup> SamulhamList=vtcLockerService.selectSamulhamInfoList(users.getSiteCode());

		model.addAttribute("list",SamulhamList);
		
		return "samulham/information/samulhaminfoList";
	}
	
	@GetMapping("/samulhaminfodetail")
	public String samulhamdetail(@RequestParam(name = "lockergroupid")int lockergroupid,Model model) throws Exception {
		
		tblplockergroup samulhamdetail = vtcLockerService.selectSamulhamInfodetail(lockergroupid);
		
		model.addAttribute("vo",samulhamdetail);
		
		return "samulham/information/samulhaminfoDetail";
	}
	
	@GetMapping("/lockercodelist.do")
	public String lockercodelist(Model model) throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		List<tblplockergroup> tblplockergroup = vtcLockerService.selectSamulhamInfoList(users.getSiteCode());
		tblplocker tblplocker = new tblplocker();
		tblplocker.setSiteCode(users.getSiteCode());
		tblplocker.setIsDelete("N");
		List<lockercodelist> lockercodelist = vtcLockerService.lockercodelist(tblplocker);
		model.addAttribute("grouplist",tblplockergroup);
		model.addAttribute("list",lockercodelist);
		
		return "samulham/lockercode/lockercodelist";
	}
	
	@GetMapping("/lockercodeinsert.do")
	public String lockercodeinsertF(Model model) throws Exception{
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		List<tblplockergroup> PlockergroupName=vtcLockerService.selectSamulhamInfoList(users.getSiteCode());
		int maxsortorder = vtcLockerService.maxsortorder(users.getSiteCode());
		model.addAttribute("list",PlockergroupName);
		model.addAttribute("sortorder",maxsortorder+1);
		return "samulham/lockercode/lockercodeinsertF";
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
	public String lockercodeupdateF(@RequestParam("PLockerID")int PLockerID,Model model) throws Exception{
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		tblplocker tblplocker = new tblplocker();
		
		tblplocker.setPLockerID(PLockerID);
		tblplocker.setSiteCode(users.getSiteCode());
		tblplocker lockercodedetail = vtcLockerService.lockervobyplockerid(tblplocker);
		List<tblplockergroup> PlockergroupName=vtcLockerService.selectSamulhamInfoList(users.getSiteCode());
		int maxsortorder = vtcLockerService.maxsortorder(users.getSiteCode());
		model.addAttribute("list",PlockergroupName);
		model.addAttribute("sortorder",maxsortorder+1);
		model.addAttribute("detail",lockercodedetail);
		return "samulham/lockercode/lockercodeupdateF";
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
				return null;
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
}