package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class SLOrderItem implements Serializable{
	
	private int pkid;
	
	/* 사이트코드 */
	private String SiteCode;
	
	/* 그룹코드 */
	private int GroupCode;
	
	/* 기타매출명 */
	private String ItemName;
	
	/* 약칭 */
	private String ShortName;
	
	/* 시작 시간 */
	private String FromTime;
	
	/* 종료시간 */
	private String ToTime;
	
	/* 이용구분 */
	private String AdultGBN;
	
	/* 성별 */
	private String Gender;
	
	/* 이용금액 */
	private String Price;
	
	/* 부가세 */
	private String vat;
	
	/* 부가세여부 */
	private String Nvat;
	
	/* 정원 */
	private int Jungwon;
	
	private String Mon;
	
	private String Tue;
	
	private String Wed;
	
	private String Thu;
	
	private String Fri;
	
	private String Sat;
	
	private String Sun;
	
	/* 출입업장 */
	private String UpJang;
	
	
	private String dcType; 
	
	private String IsAutoAssignLocker;
	
	/* 키오스키여부ID */
	private String KioskYN;
	
	/* 삭제여부 */
	private String IsDelete;
	
	/* 정렬순서 */
	private int SortOrder;
	
	/* 생성일 */
	private String AddDate;
	
	/* 생성자 */
	private int AddUserPKID;
	
	/* 수정일 */
	private String UpdDate;
	
	/* 수정자 */
	private int UpdDatePKID;
	
	private String GroupName;
	
	
}
