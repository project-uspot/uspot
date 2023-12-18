package egovframework.veterans.com.cmm;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.Users;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class VtcSalesController {

	private final HttpSession session;
	private final VtcService vtcService;
	
	@GetMapping("settlemnetlist.do")
	public String settlemnetlist(Model model) throws Exception {
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		if(users == null){
			
			return "redirect:login.do";
		}
		Sitecode sitecode = vtcService.selectSiteCode(users.getSiteCode());
		
		System.out.println("sitecode : " + sitecode);
		
		model.addAttribute("sitename",sitecode.getSiteName());
		
		return "sales/settlement/settlemnetlist";
	}
}
