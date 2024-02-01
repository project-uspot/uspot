package egovframework.veterans.lib;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import egovframework.veterans.com.cmm.lib.Functions;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.lib.service.OfflinePayService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class OfflinePayController {

	Functions f = Functions.getInstance();
	
	private final HttpSession session;
	private final OfflinePayService OfflinePayService;
	
	@GetMapping(value = "/{uparam}/CreditCard.do")
	public String selectCreditCard(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃되었습니다.");
			return "common/msg";
		}

		return "/offlinePay/offlinePay";
	}
	
	@GetMapping(value = "/{uparam}/manualReg.do")
	public String selectManualReg(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃되었습니다.");
			return "common/msg";
		}

		switch(uparam) {
			case "card":
				List<Map<String,Object>> arrCreditCardList = OfflinePayService.getCreditCardMenu(users.getSiteCode());
				model.addAttribute("arrCreditCardList", arrCreditCardList);
				return "/offlinePay/CardManualReg";
			case "cash":
				return "/offlinePay/CardManualReg";
			case "simple":
				return "/offlinePay/CardManualReg";
			case "zero":
				return "/offlinePay/CardManualReg";
		}
		return "/offlinePay/CardManualReg";
	}
}
