package egovframework.veterans.logs.service.vo;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class LogVO implements Serializable{

	/* 사이트코드 */
	private String SiteCode;
	
	/* 로그 생성일 */
	private String LogDate;
	
	/* 관리자 코드 */
	private int UserPKID = 0;
	
	/* 주소 코드 */
	private int Frm_Code = 0;
	
	/* 이벤트 코드 */
	private int Event_CD = 0;
	
	/* 업무 코드 */
	private int Part_CD = 0;
	
	/* 상세업무 코드 */
	private int Detail_CD = 0;
	
	/* 결과 코드 */
	private int Result_CD = 0;
	
	
	private int Code1 = 0;
	
	private int Code2 = 0;
	
	private int Code3 = 0;
	
	private int Code4 = 0;
	
	private int Code5 = 0;
	
	private String Note;
	
	/* 첨부파일명 */
	private String File_Name;
	
	/* 회원번호 */
	private String MemberID;
	
	/* 강습 코드 */
	private int SaleNo;
	
	/* 일일권 코드 */
	private int OrderID;
	
	/* IP */
	private String IP;
	
	
	private String RegType;
	
	
	private String URL;
}
