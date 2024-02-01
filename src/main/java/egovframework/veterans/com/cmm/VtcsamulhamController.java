package egovframework.veterans.com.cmm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import egovframework.veterans.com.cmm.service.VtcSamulhamService;
import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.tblplockergroup;
import lombok.RequiredArgsConstructor;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.lockercodelist;
import egovframework.veterans.com.cmm.service.vo.tblplocker;

@Controller
@RequiredArgsConstructor
public class VtcsamulhamController{
	
	private final HttpSession session;
	private final VtcSamulhamService vtcSamulhamService;
	
	@GetMapping("/samulhaminfo.do")
	public String samulhaminfo(Model model) throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
			model.addAttribute("script", "back");

			return "common/msg";
		}
		List<tblplockergroup> SamulhamList=vtcSamulhamService.selectSamulhamInfoList(users.getSiteCode());

		model.addAttribute("list",SamulhamList);
		
		return "samulham/information/samulhaminfoList";
	}
	
	@GetMapping("/samulhaminfodetail")
	public String samulhamdetail(@RequestParam(name = "lockergroupid")int lockergroupid,Model model) throws Exception {
		
		tblplockergroup samulhamdetail = vtcSamulhamService.selectSamulhamInfodetail(lockergroupid);
		
		model.addAttribute("vo",samulhamdetail);
		
		return "samulham/information/samulhaminfoDetail";
	}
	
	@GetMapping("/lockercodelist.do")
	public String lockercodelist(Model model) throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		List<tblplockergroup> tblplockergroup = vtcSamulhamService.selectSamulhamInfoList(users.getSiteCode());
		tblplocker tblplocker = new tblplocker();
		tblplocker.setSiteCode(users.getSiteCode());
		tblplocker.setIsDelete("N");
		List<lockercodelist> lockercodelist = vtcSamulhamService.lockercodelist(tblplocker);
		model.addAttribute("grouplist",tblplockergroup);
		model.addAttribute("list",lockercodelist);
		
		return "samulham/lockercode/lockercodelist";
	}
	
	@GetMapping("/lockercodeinsert.do")
	public String lockercodeinsertF(Model model) throws Exception{
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		List<tblplockergroup> PlockergroupName=vtcSamulhamService.selectSamulhamInfoList(users.getSiteCode());
		int maxsortorder = vtcSamulhamService.maxsortorder(users.getSiteCode());
		model.addAttribute("list",PlockergroupName);
		model.addAttribute("sortorder",maxsortorder+1);
		return "samulham/lockercode/lockercodeinsertF";
	}
	
	@ResponseBody
	@PostMapping("/plockernovalue")
	public String plockernovalue(tblplockergroup tblplockergroup) throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		tblplockergroup.setSiteCode(users.getSiteCode());
		
		int plockernovalue = vtcSamulhamService.plockernovalue(tblplockergroup);
		return Integer.toString(plockernovalue);
		
	}
	
	@PostMapping("/lockercodeinsert.do")
	public String lockercodeinsertP(tblplocker tblplocker,Model model)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		tblplocker.setSiteCode(users.getSiteCode());
		tblplocker.setAddUserPKID(users.getUserPKID());
		
		List<tblplocker> plockernolist = vtcSamulhamService.plockernolist(tblplocker);
		int success = 0;
		for(tblplocker plockerno : plockernolist) {
			if (plockerno.getPLockerNO() == tblplocker.getPLockerNO()) {

				success = 1;
				
			}
			
		}
		if(success != 1) {
			
			vtcSamulhamService.lockercodeinsert(tblplocker);
			
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
		tblplocker lockercodedetail = vtcSamulhamService.lockervobyplockerid(tblplocker);
		List<tblplockergroup> PlockergroupName=vtcSamulhamService.selectSamulhamInfoList(users.getSiteCode());
		int maxsortorder = vtcSamulhamService.maxsortorder(users.getSiteCode());
		model.addAttribute("list",PlockergroupName);
		model.addAttribute("sortorder",maxsortorder+1);
		model.addAttribute("detail",lockercodedetail);
		return "samulham/lockercode/lockercodeupdateF";
	}
	
	@PostMapping("/lockercodeupdate.do")
	public String lockercodeupdateP(tblplocker tblplocker,Model model) throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		tblplocker.setSiteCode(users.getSiteCode());
		tblplocker lockercodedetail = vtcSamulhamService.lockervobyplockerid(tblplocker);
		List<tblplocker> plockernolist = vtcSamulhamService.plockernolist(tblplocker);
		
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
			
			vtcSamulhamService.lockercodeupdate(tblplocker);
			
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
		List<lockercodelist> lockercodelist = vtcSamulhamService.lockercodelist(tblplocker);
		

		lockerlist.put("size", lockercodelist.size());
		lockerlist.put("commentList", lockercodelist);
		return lockerlist;
	}
	
	@ResponseBody
	@PostMapping("plockerByGroupID")
	public List<tblplocker> plockerByGroupID(tblplockergroup tblplockergroup)throws Exception{
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		tblplockergroup.setSiteCode(users.getSiteCode());
		
		List<tblplocker> plockerlist = vtcSamulhamService.plockerByGroupID(tblplockergroup);
		
		return plockerlist;
	}
}
