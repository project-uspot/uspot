package egovframework.veterans.com.cmm;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import egovframework.veterans.com.cmm.service.vo.Users;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class VtcSMSController {

	private final HttpSession session;
	
	@GetMapping("/SendSMSF.do")
	public String SendSMSF(Model model)throws Exception{
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
			model.addAttribute("url", "login.do");
			model.addAttribute("script", "redirect");

			return "common/msg";
		}
		
		return "SMS/send/SendSMSF";
	}
}
