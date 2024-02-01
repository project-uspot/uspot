package egovframework.veterans.lib;

import lombok.Data;

@Data
public class CreditCardVO {

	//1. 전문구분 D1:신용승인 / D4:신용취소 / 현금 [B1: 개인, 사업자 / B3:자진발급 ]/ 현금 취소 [B2: 개인, 사업자 / B4:자진발급] / 제로페이[Z1:제로페이 승인 / Z2:제로페이 취소]
	private String Gubun = "";
	
	//2. 현금영수증 거래용도 00:개인, 자진발급 / 01:사업자
	private String CashReceipt = "";
	
	//3. 금액
	private Long Price = (long) 0;
	
	//4. 할부 00:일시불 / 03: 할부 3개월
	private String Halbu = "00";
	
	//5. 취소 원승인일자(YYMMDD)
	private String OriginSaleDate = "";
	
	//6. 취소 원승인번호
	private String OriginAssignNo = "";
	
	//7. 상품코드
	private String ItemCode = "";
	
	//8. 임시판매번호
	private String OrderNo = "";
	
	//9. 웹전송메세지
	
	//10. 이지카드 옵션 1.KeyIn 옵션 Card입력구분자 / 2.0원 거래 옵션 / 3.Transaction DB 저장 옵션 / 4.‘무서명 버튼’ 사용 유무 옵션 / 5.취소 거래 시 무서명 옵션 / 6.승인 거래 시 무서명 옵션 / 7.포인트 거래 시 비밀번호 사용안함 옵션 / 8.간편결제 자동 2TR 처리 옵션
	private String KiccOption = "NNNNNNNN";
	
	//11. 단말기번호(TID)
	private String TID = "";
	
	//12. 타임아웃
	private int TimeOut = 30;
	
	//13. 부가세 A:자동계산 / M+'부가세금액': 수동입력 / F: 면세
	private String Bugase = "A";
	
	//14. 추가필드
	private String AddField = "";
	
	//15. 수신 핸들값
	
	//16. 단말기 구분 '40':일반거래
	
	//17. 할인/적립구분
	
	//18. 비밀번호
	
	//19. 거래확장옵션  간편결제 : FRNM=SICL#
	private String ExpansionOption = "";
	
	//20. 취소 거래고유번호 [카드 없이 취소 할 경우]: 승인 응답 전문의 DSC용 거래고유번호 (응답전문의 RS08필드) / [PG 거래취소]: “G” + PG거래주문번호
	private String CancelUniqueNum = "";

	//21. 동글 FLAG
	
	//22. EzGW 바코드번호 간편결제 바코드 : “B” + 간편결제 바코드
	private String BarCode = "";
	
	//23. 봉사료
	
	//24. 문자셋
	
	//25. BMP String
	
	//26. VAN
	
	//27. 카드번호
	
	//28. 유효기간
	
	//29. 승인방법 구분
	
	//30. 화면표시
	
	//31. 보너스 승인번호
	
	//32. 정유구분자
	
	//33. 토큰
	
	//34. 화면문구
	
	//35. 보너스카드 WCC
	
	//36. 보너스 카드번호
	
}
