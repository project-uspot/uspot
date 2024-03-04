package egovframework.veterans.lib;

import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.veterans.com.cmm.service.VtcMemberService;
import egovframework.veterans.com.cmm.service.VtcPaidService;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.tblmember;
import egovframework.veterans.lib.service.OfflinePayService;
import egovframework.veterans.lib.service.ReceiptService;
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
	private final HttpRequester httpRequester;
	private final VtcPaidService VtcPaidService;
	private final ReceiptService receiptService;

	public static Marker OfflinePay = MarkerFactory.getMarker("OfflinePay");

	/**
	 * 계좌이체
	 * */
	//TODO 계좌이체
	@GetMapping(value = "/{uparam}/Account.do")
	public String selectAccount(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃되었습니다.");
			return "common/msg";
		}

		List<Map<String,Object>> accountList = OfflinePayService.getAccountMenu(users.getSiteCode());
		
		model.addAttribute("accountList", accountList);
		model.addAttribute("uparam", uparam);
		return "/offlinePay/AccountManualReg";
	}
	
	/**
	 * 계좌이체 취소
	 * */
	//TODO 계좌이체 취소
	@GetMapping(value = "/{uparam}/AccountCancel.do")
	public String selectAccountCancel(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃되었습니다.");
			return "common/msg";
		}

		List<Map<String,Object>> accountList = OfflinePayService.getAccountMenu(users.getSiteCode());
		
		model.addAttribute("accountList", accountList);
		model.addAttribute("uparam", uparam);
		return "/offlinePay/AccountManualRegCancel";
	}

	/**
	 * 결제
	 * */
	//TODO 결제페이지
	@GetMapping(value = "/{uparam}/CreditCard.do")
	public String selectCreditCard(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃되었습니다.");
			return "common/msg";
		}

		model.addAttribute("uparam", uparam);
		return "/offlinePay/offlinePay";
	}
	
	/**
	 * 임의결제
	 * */
	//TODO 임의결제
	@GetMapping(value = "/{uparam}/manualReg.do")
	public String selectManualReg(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃되었습니다.");
			return "common/msg";
		}

		switch(uparam) {
			case "card":
			case "simple":
			case "zero":
				List<Map<String,Object>> arrCreditCardList = OfflinePayService.getCreditCardMenu(users.getSiteCode());
				model.addAttribute("arrCreditCardList", arrCreditCardList);
				return "/offlinePay/CardManualReg";
			case "cash":
				return "/offlinePay/CashManualReg";
		}
		return "/offlinePay/CardManualReg";
	}
	
	/**
	 * 실결제
	 * */
	//TODO 실결제
	@PostMapping(value = "/{uparam}/paidReg", produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public Map<String,Object> selectPaidReg(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			throw new Exception();
		}
		
		String returnStr = "";
		
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

		String InType = request.getParameter("InType");
		String insertYN = request.getParameter("insert");
		String tempSaleNo = request.getParameter("tempSaleNo");
		String Price = request.getParameter("Price");
		String MemberID = request.getParameter("MemberID");
		String saleType = request.getParameter("saleType");
		tblmember tblMemberVO = new tblmember();
		tblMemberVO.setMemberID(MemberID);
		tblMemberVO = vtcMemberService.tblmemberBymemberId(tblMemberVO);
		String dateTime = f.formatDate(new Date(), "yMdHmsR");
		String addField = "";
		addField = "POS" + dateTime + tblMemberVO.getMemberID() + tblMemberVO.getName() + tblMemberVO.getCellPhone();

		String OID = "";
		OID = "POS_"+dateTime.substring(0,8)+uparam+"_"+saleType+"_"+tblMemberVO.getMemberID();
		
		switch (saleType) {
		case "lecture":
			saleType = "강습";
			break;
		case "locker":
			saleType = "사물함";
			break;
		case "rent":
			saleType = "대관";
			break;
		case "etc":
			saleType = "기타비용";
			break;
		default:
			break;
		}
		
		String optPay = request.getParameter("optPay");
		String optType = request.getParameter("optType");
		String callbackkey = "kicc"+dateTime.substring(5);
		
		String url = "http://127.0.0.1:8090/?callback="+callbackkey+"&REQ=";
		String msg = "";
		String payType = "";
		String acType = "";
		
		switch(uparam) {
		case "card":
			payType = "신용카드";
			acType = "신용승인";
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
			msg = msg + "^";// 11. 단말기번호(TID)
			msg = msg + "^"+"30";// 12. 타임아웃
			msg = msg + "^"+"A";// 13. 부가세 A:자동계산 / M+'부가세금액': 수동입력 / F: 면세
			msg = msg + "^"+addField;// 14. 추가필드
			msg = msg + "^";// 15. 수신 핸들값
			msg = msg + "^";// 16. 단말기 구분 '40':일반거래
			msg = msg + "^";// 17. 할인/적립구분
			msg = msg + "^";// 18. 비밀번호
			msg = msg + "^";// 19. 거래확장옵션  간편결제 : FRNM=SICL#
			msg = msg + "^"+OID;// 20. 취소 거래고유번호 [카드 없이 취소 할 경우]: 승인 응답 전문의 DSC용 거래고유번호 (응답전문의 RS08필드) / [PG 거래취소]: “G” + PG거래주문번호
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
			payType = "현금영수증";
			acType = "현금승인";

			msg = msg + "B1";// 1. 전문 구분 현금승인(공제) B1 / 현금취소(공제) B2
			if(optType.equals("0")) {
				msg = msg + "^"+"00";// 2. 현금영수증 거래용도 00:개인, 01: 사업자
			}else {
				msg = msg + "^"+"01";// 2. 현금영수증 거래용도 00:개인, 01: 사업자
			}
			msg = msg + "^"+Price;// 3. 금액
			msg = msg + "^";// 4. 할부
			msg = msg + "^";// 5. 취소 원승인일자
			msg = msg + "^";// 6. 취소 원승인번호
			msg = msg + "^";// 7. 상품코드
			msg = msg + "^";// 8. 임시판매번호
			msg = msg + "^";// 9. 웹전송메세지
			msg = msg + "^"+"NNNNNNNN";// 10. 이지카드옵션 1.KeyIn 옵션 Card입력구분자 / 2.0원 거래 옵션 / 3.Transaction DB 저장 옵션 / 4.‘무서명 버튼’ 사용 유무 옵션 / 5.취소 거래 시 무서명 옵션 / 6.승인 거래 시 무서명 옵션 / 7.포인트 거래 시 비밀번호 사용안함 옵션 / 8.간편결제 자동 2TR 처리 옵션
			msg = msg + "^";// 11. 단말기번호(TID)
			msg = msg + "^"+"30";// 12. 타임아웃
			msg = msg + "^"+"A";// 13. 부가세 A:자동계산 / M+'부가세금액': 수동입력 / F: 면세
			msg = msg + "^"+addField;// 14. 추가필드
			msg = msg + "^";// 15. 수신 핸들값
			msg = msg + "^";// 16. 단말기 구분 '40':일반거래
			msg = msg + "^";// 17. 할인/적립구분
			msg = msg + "^";// 18. 비밀번호
			msg = msg + "^";// 19. 거래확장옵션  간편결제 : FRNM=SICL#
			msg = msg + "^"+OID;// 20. 취소 거래고유번호 [카드 없이 취소 할 경우]: 승인 응답 전문의 DSC용 거래고유번호 (응답전문의 RS08필드) / [PG 거래취소]: “G” + PG거래주문번호
			msg = msg + "^";// 21. 동글 FLAG
			msg = msg + "^";// 22. EzGW 바코드번호 간편결제 바코드 : “B” + 간편결제 바코드
			msg = msg + "^";// 23. 봉사료
			msg = msg + "^";// 24. 문자셋
			msg = msg + "^";// 25. BMP String
			msg = msg + "^";// 26. VAN
			msg = msg + "^"+BarCode;// 27. 카드번호
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
		case "simple":
			payType = "간편결제";
			acType = "신용승인";

			msg = msg + "D1";// 1. 전문 구분 간편결제 승인(바코드리딩 + 승인) D1 / 간편결제 취소(거래고유번호 취소) D4
			msg = msg + "^";// 2. 현금영수증 거래용도 00:개인, 01: 사업자
			msg = msg + "^"+Price;// 3. 금액
			msg = msg + "^"+Halbu;// 4. 할부
			msg = msg + "^";// 5. 취소 원승인일자
			msg = msg + "^";// 6. 취소 원승인번호
			msg = msg + "^";// 7. 상품코드
			msg = msg + "^";// 8. 임시판매번호
			msg = msg + "^";// 9. 웹전송메세지
			msg = msg + "^"+"NNNNNNNN";// 10. 이지카드옵션 1.KeyIn 옵션 Card입력구분자 / 2.0원 거래 옵션 / 3.Transaction DB 저장 옵션 / 4.‘무서명 버튼’ 사용 유무 옵션 / 5.취소 거래 시 무서명 옵션 / 6.승인 거래 시 무서명 옵션 / 7.포인트 거래 시 비밀번호 사용안함 옵션 / 8.간편결제 자동 2TR 처리 옵션
			msg = msg + "^";// 11. 단말기번호(TID)
			msg = msg + "^"+"30";// 12. 타임아웃
			msg = msg + "^"+"A";// 13. 부가세 A:자동계산 / M+'부가세금액': 수동입력 / F: 면세
			msg = msg + "^"+addField;// 14. 추가필드
			msg = msg + "^";// 15. 수신 핸들값
			msg = msg + "^";// 16. 단말기 구분 '40':일반거래
			msg = msg + "^";// 17. 할인/적립구분
			msg = msg + "^";// 18. 비밀번호
			msg = msg + "^"+"FRNM=SICL#";// 19. 거래확장옵션  간편결제 : FRNM=SICL#
			msg = msg + "^"+OID;// 20. 취소 거래고유번호 [카드 없이 취소 할 경우]: 승인 응답 전문의 DSC용 거래고유번호 (응답전문의 RS08필드) / [PG 거래취소]: “G” + PG거래주문번호
			msg = msg + "^";// 21. 동글 FLAG
			msg = msg + "^"+"B"+BarCode;// 22. EzGW 바코드번호 간편결제 바코드 : “B” + 간편결제 바코드
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
		case "zero":
			payType = "제로페이";
			acType = "신용승인";

			msg = msg + "Z1";// 1. 전문 구분 제로페이 Z1 / 제로페이 취소 Z2
			msg = msg + "^";// 2. 현금영수증 거래용도 00:개인, 01: 사업자
			msg = msg + "^"+Price;// 3. 금액
			msg = msg + "^"+Halbu;// 4. 할부
			msg = msg + "^";// 5. 취소 원승인일자
			msg = msg + "^";// 6. 취소 원승인번호
			msg = msg + "^";// 7. 상품코드
			msg = msg + "^";// 8. 임시판매번호
			msg = msg + "^";// 9. 웹전송메세지
			msg = msg + "^"+"NNNNNNNN";// 10. 이지카드옵션 1.KeyIn 옵션 Card입력구분자 / 2.0원 거래 옵션 / 3.Transaction DB 저장 옵션 / 4.‘무서명 버튼’ 사용 유무 옵션 / 5.취소 거래 시 무서명 옵션 / 6.승인 거래 시 무서명 옵션 / 7.포인트 거래 시 비밀번호 사용안함 옵션 / 8.간편결제 자동 2TR 처리 옵션
			msg = msg + "^";// 11. 단말기번호(TID)
			msg = msg + "^"+"30";// 12. 타임아웃
			msg = msg + "^"+"A";// 13. 부가세 A:자동계산 / M+'부가세금액': 수동입력 / F: 면세
			msg = msg + "^"+addField;// 14. 추가필드
			msg = msg + "^";// 15. 수신 핸들값
			msg = msg + "^";// 16. 단말기 구분 '40':일반거래
			msg = msg + "^";// 17. 할인/적립구분
			msg = msg + "^";// 18. 비밀번호
			msg = msg + "^"+"FRNM=SICL#";// 19. 거래확장옵션  간편결제 : FRNM=SICL#
			msg = msg + "^"+OID;// 20. 취소 거래고유번호 [카드 없이 취소 할 경우]: 승인 응답 전문의 DSC용 거래고유번호 (응답전문의 RS08필드) / [PG 거래취소]: “G” + PG거래주문번호
			msg = msg + "^";// 21. 동글 FLAG
			msg = msg + "^"+"B"+BarCode;// 22. EzGW 바코드번호 간편결제 바코드 : “B” + 간편결제 바코드
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
		}
		log.debug(OfflinePay,msg);
		url = url + URLEncoder.encode(msg,"UTF-8");
		//log.debug(OfflinePay,url);
		String result = httpRequester.executeRequest("get", url, null);
		//log.debug(OfflinePay,result);
		Map<String, String> resultMap = f.JsonpToMap(result);
		log.debug(OfflinePay,resultMap.toString());

		if(resultMap.get("SUC").equals("00")) { // SUC '00':성공 / '01': 실패
			String RQ01 = resultMap.get("RQ01");// 전문구분 //요청전문과 동일
			String RQ02 = resultMap.get("RQ02");// 단말기 번호 TID
			String RQ03 = resultMap.get("RQ03");// 카드입력구분 
			String RQ04 = resultMap.get("RQ04");// 카드번호
			String RQ05 = resultMap.get("RQ05");// 유효기간
			String RQ06 = resultMap.get("RQ06");// 할부개월
			String RQ07 = resultMap.get("RQ07");// 금액
			String RQ08 = resultMap.get("RQ08");// 현금영수증 거래용도 // '00':개인현금 / '01':사업자현금
			String RQ09 = resultMap.get("RQ09");// 상품코드
			String RQ10 = resultMap.get("RQ10");// 원승인번호
			String RQ11 = resultMap.get("RQ11");// 원승인일자
			String RQ12 = resultMap.get("RQ12");// 봉사료
			String RQ13 = resultMap.get("RQ13");// 부가세
			String RQ14 = resultMap.get("RQ14");// 임시판매전호
			String RQ15 = resultMap.get("RQ15");// 웹전송메세지
			String RQ16 = resultMap.get("RQ16");// 단말구분코드
			String RQ17 = resultMap.get("RQ17");// VAN
			
			String RS01 = resultMap.get("RS01");// 거래제어코드
			String RS02 = resultMap.get("RS02");// 정산 INDEX
			String RS03 = resultMap.get("RS03");// 거래일련번호
			String RS04 = resultMap.get("RS04");// 응답코드
			String RS05 = resultMap.get("RS05");// 매입사코드
			String RS06 = resultMap.get("RS06");// 매입 일련번호
			String RS07 = resultMap.get("RS07");// 승인일시
			String RS08 = resultMap.get("RS08");// 겨래 고유번호
			String RS09 = resultMap.get("RS09");// 승인번호
			String RS10 = resultMap.get("RS10");// 체크카드 유무 or 밴코드
			String RS11 = resultMap.get("RS11");// 발급사코드
			String RS12 = resultMap.get("RS12");// 발급사명
			String RS13 = resultMap.get("RS13");// 가맹점 번호
			String RS14 = resultMap.get("RS14");// 매입사명
			String RS15 = resultMap.get("RS15");// 화면제어코드
			String RS16 = resultMap.get("RS16");// 화면표시
			String RS17 = resultMap.get("RS17");// Notice
			String RS18 = resultMap.get("RS18");// 전자서명 유무
			String RS19 = resultMap.get("RS19");// 사업자번호
			String RS20 = resultMap.get("RS20");// 서명BMP 키
			String RS21 = resultMap.get("RS21");// DCC 카드처리구분
			String RS22 = resultMap.get("RS22");// 알림 1-1
			String RS23 = resultMap.get("RS23");// 알림 1-2
			String RS24 = resultMap.get("RS24");// 알림 1-3
			String RS25 = resultMap.get("RS25");// 알림 2-1
			String RS26 = resultMap.get("RS26");// 알림 2-2
			String RS27 = resultMap.get("RS27");// 알림 2-3
			String RS28 = resultMap.get("RS28");// 알림 2-4
			String RS29 = resultMap.get("RS29");// 현금지급금액
			String RS30 = resultMap.get("RS30");// ARS 경품번호
			String RS31 = resultMap.get("RS31");// 동글 FLAG
			String RS32 = resultMap.get("RS32");// 거래구분 FLAG
			String RS33 = resultMap.get("RS33");// 동글 SKT 제휴사 정보
			String RS34 = resultMap.get("RS34");// 보너스 승인번호
			
			Map<String,Object> returnMap = new HashMap<String,Object>();
			returnMap.put("SiteCode",users.getSiteCode());
			returnMap.put("PayType",payType);
			returnMap.put("AssignType",acType);
			returnMap.put("responseCode",RS04);
			returnMap.put("Price",RQ07);
			returnMap.put("CardNo",RQ04);
			returnMap.put("ValidDate",RQ05);
			returnMap.put("Halbu",RQ06);
			returnMap.put("AssignNo",RS09);
			returnMap.put("CardName",RS14);
			returnMap.put("CompanyName",RS12);
			returnMap.put("msg1",RS17);
			returnMap.put("msg2",RS16);
			returnMap.put("msg3","");
			returnMap.put("SignGubun","N");
			returnMap.put("SaleDate","20"+RS07);
			returnMap.put("IsPos","Y");
			returnMap.put("Isconfirm","N");
			returnMap.put("MemberID",tblMemberVO.getMemberID());
			returnMap.put("MemberName",tblMemberVO.getName());
			returnMap.put("SaleType",saleType);
			returnMap.put("userPKID",users.getUserPKID());
			returnMap.put("OID",RS08);
			returnMap.put("TID",RQ02);
			returnMap.put("tempSaleNo",tempSaleNo);
			returnMap.put("SaleNo",0);
			returnMap.put("paidPKID",0);
			returnMap.put("InsertYN",insertYN);
			
			try {
				OfflinePayService.insertElecAssignData(returnMap);
				
				if(RS04.equals("0000")) {
					Map<String, Object> map = new HashMap<String, Object>();
				    map.put("saleDate", f.formatDate(new Date(),"yMd"));
				    map.put("outputOrderNo", 0);

				    returnMap.put("ReceiptNo",String.valueOf(VtcPaidService.callSelectReceiptNo(map)));
					switch (saleType) {
					case "강습":
						//returnMap = OfflinePayService.insertPaidFmsc_s01(returnMap);
						if(insertYN.equals("Y")) {
							returnMap.put("tempSaleNo",tempSaleNo);
						}else {
							returnMap.put("SaleType",InType);
							returnMap = OfflinePayService.insertFMSC_S01(returnMap);
						}
						returnMap.put("tempSaleNo",returnMap.get("Group_SaleNo"));
						returnMap.put("SaleNo",returnMap.get("Group_SaleNo"));
						break;
					case "사물함":
						int recheck = Integer.parseInt(request.getParameter("recheck"));
						returnMap.put("recheck",recheck);
						returnMap = OfflinePayService.insertPaidLocker(returnMap);
						returnMap.put("tempSaleNo",returnMap.get("Group_SaleNo"));
						returnMap.put("SaleNo",returnMap.get("Group_SaleNo"));
						break;
					case "기타비용":
						int pkid = Integer.parseInt(request.getParameter("pkid"));
						returnMap.put("pkid",pkid);
						returnMap = OfflinePayService.insertExpensesale(returnMap);
						returnMap.put("tempSaleNo",returnMap.get("Group_SaleNo"));
						returnMap.put("SaleNo",returnMap.get("Group_SaleNo"));
						break;
					case "대관":
						returnMap = OfflinePayService.insertPaidRent(returnMap);
						break;
					default:
						break;
					}

					returnMap = OfflinePayService.insertPaid(returnMap);
					//영수증 저장
					switch (saleType) {
					case "강습":
						ReceiptController.insertReceiptItem(f.getNullToSpaceStrValue(returnMap.get("paidPKID")),receiptService);
						break;
					case "사물함":
						break;
					case "기타비용":
						break;
					case "대관":
						break;
					}
				}
			}catch (Exception e) {
				log.error(OfflinePay,"ElecAssignData 저장오류:"+e.getMessage());
			}

			returnStr = f.MapToJson(returnMap);
			return returnMap;
		}else {
			String rMsg = resultMap.get("MSG"); // 실패 사유 메시지
			log.info(OfflinePay,rMsg);
			throw new Exception();
		}

	}
	
	/**
	 * 결제취소
	 * */
	//TODO 결제취소 페이지
	@GetMapping(value = "/{uparam}/CancelPaid.do")
	public String selectCancelPaid(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃되었습니다.");
			return "common/msg";
		}

		model.addAttribute("uparam", uparam);

		return "/offlinePay/offlinePayCancel";
	}
	

	/**
	 * 임의결제 취소
	 * */
	//TODO 임의결제 취소
	@GetMapping(value = "/{uparam}/manualRegCancel.do")
	public String selectManualRegCancel(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃되었습니다.");
			return "common/msg";
		}

		switch(uparam) {
			case "card":
			case "simple":
			case "zero":
				List<Map<String,Object>> arrCreditCardList = OfflinePayService.getCreditCardMenu(users.getSiteCode());
				model.addAttribute("arrCreditCardList", arrCreditCardList);
				return "/offlinePay/CardManualRegCancel";
			case "cash":
				return "/offlinePay/CashManualRegCancel";
		}
		return "/offlinePay/CardManualReg";
	}
	
	/**
	 * 실결제 취소
	 * */
	//TODO 실결제 취소
	@PostMapping(value = "/{uparam}/paidRegCancel", produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public Map<String,Object> selectPaidRegCancel(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			throw new Exception();
		}
		
		String returnStr = "";
		
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

		String tempSaleNo = request.getParameter("tempSaleNo");
		String Price = request.getParameter("Price");
		String MemberID = request.getParameter("MemberID");
		String saleType = request.getParameter("saleType");
		String OID = request.getParameter("OID");
		String SaleTime = request.getParameter("SaleTime");
		String AssignNo = request.getParameter("AssignNo");
		
		SaleTime = SaleTime.substring(2,8);

		tblmember tblMemberVO = new tblmember();
		tblMemberVO.setMemberID(MemberID);
		tblMemberVO = vtcMemberService.tblmemberBymemberId(tblMemberVO);
		String dateTime = f.formatDate(new Date(), "yMdHmsR");
		String addField = "";
		addField = "POS" + dateTime + tblMemberVO.getMemberID() + tblMemberVO.getName() + tblMemberVO.getCellPhone();

		switch (saleType) {
		case "lecture":
			saleType = "강습";
			break;
		case "locker":
			saleType = "사물함";
			break;
		case "rent":
			saleType = "대관";
			break;
		default:
			break;
		}
		
		String optPay = request.getParameter("optPay");
		String optType = request.getParameter("optType");
		String callbackkey = "kicc"+dateTime.substring(5);
		
		String url = "http://127.0.0.1:8090/?callback="+callbackkey+"&REQ=";
		String msg = "";
		String payType = "";
		String acType = "";
		
		switch(uparam) {
		case "card":
			payType = "신용카드";
			acType = "신용취소";
			msg = msg + "D4";// 1. 전문 구분 신용승인 D1 / 신용취소 D4
			msg = msg + "^";// 2. 현금영수증 거래용도
			msg = msg + "^"+Price;// 3. 금액
			msg = msg + "^";// 4. 할부
			msg = msg + "^"+SaleTime;// 5. 취소 원승인일자
			msg = msg + "^"+AssignNo;// 6. 취소 원승인번호
			msg = msg + "^";// 7. 상품코드
			msg = msg + "^";// 8. 임시판매번호
			msg = msg + "^";// 9. 웹전송메세지
			msg = msg + "^";// 10. 이지카드옵션 1.KeyIn 옵션 Card입력구분자 / 2.0원 거래 옵션 / 3.Transaction DB 저장 옵션 / 4.‘무서명 버튼’ 사용 유무 옵션 / 5.취소 거래 시 무서명 옵션 / 6.승인 거래 시 무서명 옵션 / 7.포인트 거래 시 비밀번호 사용안함 옵션 / 8.간편결제 자동 2TR 처리 옵션
			msg = msg + "^";// 11. 단말기번호(TID)
			msg = msg + "^"+"30";// 12. 타임아웃
			msg = msg + "^"+"A";// 13. 부가세 A:자동계산 / M+'부가세금액': 수동입력 / F: 면세
			msg = msg + "^"+addField;// 14. 추가필드
			msg = msg + "^";// 15. 수신 핸들값
			msg = msg + "^";// 16. 단말기 구분 '40':일반거래
			msg = msg + "^";// 17. 할인/적립구분
			msg = msg + "^";// 18. 비밀번호
			msg = msg + "^";// 19. 거래확장옵션  간편결제 : FRNM=SICL#
			msg = msg + "^"+OID;// 20. 취소 거래고유번호 [카드 없이 취소 할 경우]: 승인 응답 전문의 DSC용 거래고유번호 (응답전문의 RS08필드) / [PG 거래취소]: “G” + PG거래주문번호
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
			payType = "현금영수증";
			acType = "현금취소";

			msg = msg + "B2";// 1. 전문 구분 현금승인(공제) B1 / 현금취소(공제) B2
			if(optType.equals("0")) {
				msg = msg + "^"+"00";// 2. 현금영수증 거래용도 00:개인, 01: 사업자
			}else {
				msg = msg + "^"+"01";// 2. 현금영수증 거래용도 00:개인, 01: 사업자
			}
			msg = msg + "^"+Price;// 3. 금액
			msg = msg + "^";// 4. 할부
			msg = msg + "^"+SaleTime;// 5. 취소 원승인일자
			msg = msg + "^"+AssignNo;// 6. 취소 원승인번호
			msg = msg + "^";// 7. 상품코드
			msg = msg + "^";// 8. 임시판매번호
			msg = msg + "^";// 9. 웹전송메세지
			msg = msg + "^";// 10. 이지카드옵션 1.KeyIn 옵션 Card입력구분자 / 2.0원 거래 옵션 / 3.Transaction DB 저장 옵션 / 4.‘무서명 버튼’ 사용 유무 옵션 / 5.취소 거래 시 무서명 옵션 / 6.승인 거래 시 무서명 옵션 / 7.포인트 거래 시 비밀번호 사용안함 옵션 / 8.간편결제 자동 2TR 처리 옵션
			msg = msg + "^";// 11. 단말기번호(TID)
			msg = msg + "^"+"30";// 12. 타임아웃
			msg = msg + "^"+"A";// 13. 부가세 A:자동계산 / M+'부가세금액': 수동입력 / F: 면세
			msg = msg + "^"+addField;// 14. 추가필드
			msg = msg + "^";// 15. 수신 핸들값
			msg = msg + "^";// 16. 단말기 구분 '40':일반거래
			msg = msg + "^";// 17. 할인/적립구분
			msg = msg + "^";// 18. 비밀번호
			msg = msg + "^";// 19. 거래확장옵션  간편결제 : FRNM=SICL#
			msg = msg + "^"+OID;// 20. 취소 거래고유번호 [카드 없이 취소 할 경우]: 승인 응답 전문의 DSC용 거래고유번호 (응답전문의 RS08필드) / [PG 거래취소]: “G” + PG거래주문번호
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
		case "simple":
			payType = "간편결제";
			acType = "신용취소";

			msg = msg + "D4";// 1. 전문 구분 간편결제 승인(바코드리딩 + 승인) D1 / 간편결제 취소(거래고유번호 취소) D4
			msg = msg + "^";// 2. 현금영수증 거래용도 00:개인, 01: 사업자
			msg = msg + "^"+Price;// 3. 금액
			msg = msg + "^"+Halbu;// 4. 할부
			msg = msg + "^"+SaleTime;// 5. 취소 원승인일자
			msg = msg + "^"+AssignNo;// 6. 취소 원승인번호
			msg = msg + "^";// 7. 상품코드
			msg = msg + "^";// 8. 임시판매번호
			msg = msg + "^";// 9. 웹전송메세지
			msg = msg + "^"+"";// 10. 이지카드옵션 1.KeyIn 옵션 Card입력구분자 / 2.0원 거래 옵션 / 3.Transaction DB 저장 옵션 / 4.‘무서명 버튼’ 사용 유무 옵션 / 5.취소 거래 시 무서명 옵션 / 6.승인 거래 시 무서명 옵션 / 7.포인트 거래 시 비밀번호 사용안함 옵션 / 8.간편결제 자동 2TR 처리 옵션
			msg = msg + "^";// 11. 단말기번호(TID)
			msg = msg + "^"+"30";// 12. 타임아웃
			msg = msg + "^"+"A";// 13. 부가세 A:자동계산 / M+'부가세금액': 수동입력 / F: 면세
			msg = msg + "^"+addField;// 14. 추가필드
			msg = msg + "^";// 15. 수신 핸들값
			msg = msg + "^";// 16. 단말기 구분 '40':일반거래
			msg = msg + "^";// 17. 할인/적립구분
			msg = msg + "^";// 18. 비밀번호
			msg = msg + "^"+"FRNM=SICL#";// 19. 거래확장옵션  간편결제 : FRNM=SICL#
			msg = msg + "^"+OID;// 20. 취소 거래고유번호 [카드 없이 취소 할 경우]: 승인 응답 전문의 DSC용 거래고유번호 (응답전문의 RS08필드) / [PG 거래취소]: “G” + PG거래주문번호
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
		case "zero":
			payType = "제로페이";
			acType = "신용취소";

			msg = msg + "Z2";// 1. 전문 구분 제로페이 Z1 / 제로페이 취소 Z2
			msg = msg + "^";// 2. 현금영수증 거래용도 00:개인, 01: 사업자
			msg = msg + "^"+Price;// 3. 금액
			msg = msg + "^"+Halbu;// 4. 할부
			msg = msg + "^"+SaleTime;// 5. 취소 원승인일자
			msg = msg + "^"+AssignNo;// 6. 취소 원승인번호
			msg = msg + "^";// 7. 상품코드
			msg = msg + "^";// 8. 임시판매번호
			msg = msg + "^";// 9. 웹전송메세지
			msg = msg + "^"+"";// 10. 이지카드옵션 1.KeyIn 옵션 Card입력구분자 / 2.0원 거래 옵션 / 3.Transaction DB 저장 옵션 / 4.‘무서명 버튼’ 사용 유무 옵션 / 5.취소 거래 시 무서명 옵션 / 6.승인 거래 시 무서명 옵션 / 7.포인트 거래 시 비밀번호 사용안함 옵션 / 8.간편결제 자동 2TR 처리 옵션
			msg = msg + "^";// 11. 단말기번호(TID)
			msg = msg + "^"+"30";// 12. 타임아웃
			msg = msg + "^"+"A";// 13. 부가세 A:자동계산 / M+'부가세금액': 수동입력 / F: 면세
			msg = msg + "^"+addField;// 14. 추가필드
			msg = msg + "^";// 15. 수신 핸들값
			msg = msg + "^";// 16. 단말기 구분 '40':일반거래
			msg = msg + "^";// 17. 할인/적립구분
			msg = msg + "^";// 18. 비밀번호
			msg = msg + "^"+"FRNM=SICL#";// 19. 거래확장옵션  간편결제 : FRNM=SICL#
			msg = msg + "^"+OID;// 20. 취소 거래고유번호 [카드 없이 취소 할 경우]: 승인 응답 전문의 DSC용 거래고유번호 (응답전문의 RS08필드) / [PG 거래취소]: “G” + PG거래주문번호
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
		}
		log.debug(OfflinePay,msg);
		url = url + URLEncoder.encode(msg,"UTF-8");
		//log.debug(OfflinePay,url);
		String result = httpRequester.executeRequest("get", url, null);
		//log.debug(OfflinePay,result);
		Map<String, String> resultMap = f.JsonpToMap(result);
		log.debug(OfflinePay,resultMap.toString());

		if(resultMap.get("SUC").equals("00")) { // SUC '00':성공 / '01': 실패
			String RQ01 = resultMap.get("RQ01");// 전문구분 //요청전문과 동일
			String RQ02 = resultMap.get("RQ02");// 단말기 번호 TID
			String RQ03 = resultMap.get("RQ03");// 카드입력구분 
			String RQ04 = resultMap.get("RQ04");// 카드번호
			String RQ05 = resultMap.get("RQ05");// 유효기간
			String RQ06 = resultMap.get("RQ06");// 할부개월
			String RQ07 = resultMap.get("RQ07");// 금액
			String RQ08 = resultMap.get("RQ08");// 현금영수증 거래용도 // '00':개인현금 / '01':사업자현금
			String RQ09 = resultMap.get("RQ09");// 상품코드
			String RQ10 = resultMap.get("RQ10");// 원승인번호
			String RQ11 = resultMap.get("RQ11");// 원승인일자
			String RQ12 = resultMap.get("RQ12");// 봉사료
			String RQ13 = resultMap.get("RQ13");// 부가세
			String RQ14 = resultMap.get("RQ14");// 임시판매전호
			String RQ15 = resultMap.get("RQ15");// 웹전송메세지
			String RQ16 = resultMap.get("RQ16");// 단말구분코드
			String RQ17 = resultMap.get("RQ17");// VAN
			
			String RS01 = resultMap.get("RS01");// 거래제어코드
			String RS02 = resultMap.get("RS02");// 정산 INDEX
			String RS03 = resultMap.get("RS03");// 거래일련번호
			String RS04 = resultMap.get("RS04");// 응답코드
			String RS05 = resultMap.get("RS05");// 매입사코드
			String RS06 = resultMap.get("RS06");// 매입 일련번호
			String RS07 = resultMap.get("RS07");// 승인일시
			String RS08 = resultMap.get("RS08");// 겨래 고유번호
			String RS09 = resultMap.get("RS09");// 승인번호
			String RS10 = resultMap.get("RS10");// 체크카드 유무 or 밴코드
			String RS11 = resultMap.get("RS11");// 발급사코드
			String RS12 = resultMap.get("RS12");// 발급사명
			String RS13 = resultMap.get("RS13");// 가맹점 번호
			String RS14 = resultMap.get("RS14");// 매입사명
			String RS15 = resultMap.get("RS15");// 화면제어코드
			String RS16 = resultMap.get("RS16");// 화면표시
			String RS17 = resultMap.get("RS17");// Notice
			String RS18 = resultMap.get("RS18");// 전자서명 유무
			String RS19 = resultMap.get("RS19");// 사업자번호
			String RS20 = resultMap.get("RS20");// 서명BMP 키
			String RS21 = resultMap.get("RS21");// DCC 카드처리구분
			String RS22 = resultMap.get("RS22");// 알림 1-1
			String RS23 = resultMap.get("RS23");// 알림 1-2
			String RS24 = resultMap.get("RS24");// 알림 1-3
			String RS25 = resultMap.get("RS25");// 알림 2-1
			String RS26 = resultMap.get("RS26");// 알림 2-2
			String RS27 = resultMap.get("RS27");// 알림 2-3
			String RS28 = resultMap.get("RS28");// 알림 2-4
			String RS29 = resultMap.get("RS29");// 현금지급금액
			String RS30 = resultMap.get("RS30");// ARS 경품번호
			String RS31 = resultMap.get("RS31");// 동글 FLAG
			String RS32 = resultMap.get("RS32");// 거래구분 FLAG
			String RS33 = resultMap.get("RS33");// 동글 SKT 제휴사 정보
			String RS34 = resultMap.get("RS34");// 보너스 승인번호
			
			Map<String,Object> returnMap = new HashMap<String,Object>();
			returnMap.put("SiteCode",users.getSiteCode());
			returnMap.put("PayType",payType);
			returnMap.put("AssignType",acType);
			returnMap.put("responseCode",RS04);
			returnMap.put("Price","-"+RQ07);
			returnMap.put("CardNo",RQ04);
			returnMap.put("ValidDate",RQ05);
			returnMap.put("Halbu",RQ06);
			returnMap.put("AssignNo",RS09);
			returnMap.put("CardName",RS14);
			returnMap.put("CompanyName",RS12);
			returnMap.put("msg1",RS17);
			returnMap.put("msg2",RS16);
			returnMap.put("msg3","");
			returnMap.put("SignGubun","N");
			returnMap.put("SaleDate","20"+RS07);
			returnMap.put("IsPos","Y");
			returnMap.put("Isconfirm","N");
			returnMap.put("MemberID",tblMemberVO.getMemberID());
			returnMap.put("MemberName",tblMemberVO.getName());
			returnMap.put("SaleType",saleType);
			returnMap.put("userPKID",users.getUserPKID());
			returnMap.put("OID",RS08);
			returnMap.put("TID",RQ02);
			returnMap.put("tempSaleNo",tempSaleNo);
			try {
				OfflinePayService.insertElecAssignData(returnMap);

				if(RS04.equals("0000")) {
					switch (saleType) {
					case "강습":
						OfflinePayService.insertPaidCancelFmsc_s01(returnMap);
						break;
					case "사물함":
						/*
						 * returnMap.put("pkid",request.getParameter("pkid"));
						 * OfflinePayService.insertPaidCancelLocker(returnMap);
						 */
						break;
					case "대관":
						OfflinePayService.insertPaidCancelRent(returnMap);
						break;
					default:
						break;
					}
				}
			}catch (Exception e) {
				log.error(OfflinePay,"ElecAssignData 저장오류:"+e.getMessage());
			}

			returnStr = f.MapToJson(returnMap);
			System.out.println(resultMap);
			return returnMap;
		}else {
			String rMsg = resultMap.get("MSG"); // 실패 사유 메시지
			log.info(OfflinePay,rMsg);
			throw new Exception();
		}
	}
	
	/**
	 * 현금-> 현금영수증변경페이지
	 * */
	//TODO 현금 -> 현금영수증 변경페이지
	@GetMapping(value = "/{uparam}/ChangeReceipt.do")
	public String ChangeReceipt(@PathVariable String uparam, HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception{
		Users users = (Users) session.getAttribute("loginuserinfo");
		if (users == null) {
			model.addAttribute("msg", "로그아웃되었습니다.");
			return "common/msg";
		}

		model.addAttribute("uparam", uparam);
		return "/offlinePay/OldCashNewReceipt";
	}
}
