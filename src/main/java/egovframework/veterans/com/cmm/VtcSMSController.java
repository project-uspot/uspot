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

import egovframework.veterans.com.cmm.service.VtcSMSService;
import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.sms_mungu;
import egovframework.veterans.com.cmm.service.vo.tblsite_id;
import egovframework.veterans.lib.HttpPostMultipart;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class VtcSMSController {

	private final HttpSession session;
	private final VtcSMSService vtcSMSService;
	private final VtcService vtcService;
	
	@GetMapping("/SendSMSF.do")
	public String SendSMSF(Model model)throws Exception{
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
			model.addAttribute("url", "login.do");
			model.addAttribute("script", "redirect");

			return "common/msg";
		}
		
		List<sms_mungu> munguList = vtcSMSService.munguBySitecode(users.getSiteCode());
		List<Sitecode> sitecode = vtcService.selectSiteCode(users.getSiteCode());
		
		model.addAttribute("mungulist",munguList);
		model.addAttribute("sitecode",sitecode.get(0));
		
		return "SMS/send/SendSMSF";
	}
	
	@ResponseBody
	@PostMapping("/sms_munguInsert")
	public int sms_munguInsert(sms_mungu sms_mungu)throws Exception{
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			
			return 0;
		}
		
		sms_mungu.setSiteCode(users.getSiteCode());
		
		vtcSMSService.sms_munguInsert(sms_mungu);
		
		return sms_mungu.getCode();
	}
	
	@ResponseBody
	@PostMapping("/sms_munguUpdate")
	public String sms_munguUpdate(sms_mungu sms_mungu)throws Exception{
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			
			return "0";
		}
		
		sms_mungu.setSiteCode(users.getSiteCode());
		
		vtcSMSService.sms_munguUpdate(sms_mungu);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/sms_munguRemove")
	public String sms_munguRemove(sms_mungu sms_mungu)throws Exception{
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			
			return "0";
		}
		
		sms_mungu.setSiteCode(users.getSiteCode());
		
		vtcSMSService.sms_munguRemove(sms_mungu);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/sms_munguList")
	public List<sms_mungu> sms_munguList()throws Exception{
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		List<sms_mungu>sms_mungulist = vtcSMSService.munguBySitecode(users.getSiteCode());
		
		return sms_mungulist;
	}
	
	@ResponseBody
	@PostMapping("/smsBalsong")
	public String smsBalsong(@RequestParam Map<String,Object> map)throws Exception{
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			
			return "0";
		}
		
		tblsite_id tblsite_id = vtcService.tblsite_idBySiteCode(users.getSiteCode());
		
		Map<String, String> headers = new HashMap<String, String>();
		HttpPostMultipart multipart = new HttpPostMultipart("https://balsong.com/Linkage/API/", "utf-8", headers);
		
		multipart.addFormField("UserID",tblsite_id.getBalsongID());                           // 사용자 계정
        multipart.addFormField("UserPW",tblsite_id.getBalsongPW());                           // 사용자 암호
		
		
		return "success";
	}
}
