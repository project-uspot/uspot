package egovframework.veterans.lib;

import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.veterans.com.cmm.lib.Functions;
import egovframework.veterans.com.cmm.service.VtcMemberService;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.tblmember;
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
	private final VtcMemberService vtcMemberService;
	
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
	
	@PostMapping(value = "/{uparam}/paidReg")
	public String selectPaidReg(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			throw new Exception();
		}
		String BarCode = request.getParameter("BarCode");

		String Halbu = request.getParameter("Halbu");
		// Halbu가 비어 있거나 null일 경우 0을 기본값으로 사용
		if (Halbu == null || Halbu.isEmpty()) {
		    Halbu = "0";
		}

		try {
		    // 문자열을 정수로 변환
		    int halbuNumber = Integer.parseInt(Halbu);

		    // 정수를 2자리 숫자 형식으로 포맷
		    String formattedHalbu = String.format("%02d", halbuNumber);

		    // 포맷된 문자열을 다시 Halbu에 할당
		    Halbu = formattedHalbu;
		} catch (NumberFormatException e) {
		    // Halbu가 정수로 변환될 수 없는 경우, 예외 처리
		    log.error("Halbu 값을 정수로 변환하는데 실패했습니다: " + e.getMessage());
		    // 오류 발생 시 Halbu를 "00"으로 설정하거나 다른 적절한 오류 처리를 수행
		    Halbu = "00";
		}

		String Price = request.getParameter("Price");
		String MemberID = request.getParameter("MemberID");
		tblmember tblMemberVO = new tblmember();
		tblMemberVO.setMemberID(MemberID);
		tblMemberVO = vtcMemberService.tblmemberBymemberId(tblMemberVO);
		String addField = "";
		addField = "POS" + f.formatDate(new Date(), "yMdHmsR")+tblMemberVO.getMemberID()+tblMemberVO.getName()+tblMemberVO.getCellPhone();

		//String optPay = request.getParameter("optPay");
		//String optType = request.getParameter("optType");
		String url = "http://127.0.0.1:8090/?"+"callback=";
		String msg = "";
		switch(uparam) {
		case "card":
			msg = msg + "D1";// 1. 전문 구분 신용승인 D1 / 신용취소 D4
			msg = msg + "^";// 2. 현금영수증 거래용도
			msg = msg + "^"+Price;// 3. 금액
			msg = msg + "^"+Halbu;// 4. 할부
			msg = msg + "^";// 5. 취소 원승인일자
			msg = msg + "^";// 6. 취소 원승인번호
			msg = msg + "^";// 7. 상품코드
			msg = msg + "^";// 8. 임시판매번호
			msg = msg + "^";// 9. 웹전송메세지
			msg = msg + "^"+"NNNNNNNN";// 10. 이지카드옵션 1.KeyIn 옵션 Card입력구분자 / 2.0원 거래 옵션 / 3.Transaction DB 저장 옵션 / 4.‘무서명 버튼’ 사용 유무 옵션 / 5.취소 거래 시 무서명 옵션 / 6.승인 거래 시 무서명 옵션 / 7.포인트 거래 시 비밀번호 사용안함 옵션 / 8.간편결제 자동 2TR 처리 옵션
			msg = msg + "^";// 11. 단만기번호(TID)
			msg = msg + "^"+"30";// 12. 타임아웃
			msg = msg + "^"+"A";// 13. 부가세 A:자동계산 / M+'부가세금액': 수동입력 / F: 면세
			msg = msg + "^"+addField;// 14. 추가필드
			msg = msg + "^";// 15. 수신 핸들값
			msg = msg + "^";// 16. 단말기 구분 '40':일반거래
			msg = msg + "^";// 17. 할인/적립구분
			msg = msg + "^";// 18. 비밀번호
			msg = msg + "^";// 19. 거래확장옵션  간편결제 : FRNM=SICL#
			msg = msg + "^";// 20. 취소 거래고유번호 [카드 없이 취소 할 경우]: 승인 응답 전문의 DSC용 거래고유번호 (응답전문의 RS08필드) / [PG 거래취소]: “G” + PG거래주문번호
			msg = msg + "^";// 21. 동글 FLAG
			msg = msg + "^";// 22. EzGW 바코드번호 간편결제 바코드 : “B” + 간편결제 바코드
			msg = msg + "^";// 23. 봉사료
			msg = msg + "^";// 24. 문자셋
			msg = msg + "^";// 25. BMP String
			msg = msg + "^";// 26. VAN
			msg = msg + "^";// 27. 카드번호
			msg = msg + "^";// 28. 유효기간
			msg = msg + "^";// 29. 승인방법 구분
			msg = msg + "^";// 30. 화면표시
			msg = msg + "^";// 31. 보너스 승인번호
			msg = msg + "^";// 32. 정유구분자
			msg = msg + "^";// 33. 토큰
			msg = msg + "^";// 34. 화면문구
			msg = msg + "^";// 35. 보너스카드 WCC
			msg = msg + "^";// 36. 보너스 카드번호
			break;
		case "cash":
			break;
		case "simple":
			break;
		case "zero":
			break;
		}
		url = url + URLEncoder.encode(msg,"UTF-8");

		return null;
	}
}
