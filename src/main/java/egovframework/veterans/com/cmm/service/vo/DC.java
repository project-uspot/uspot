package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class DC implements Serializable{
	
	/* 사이트코드 */
	private String SiteCode;

	/* 할인코드 */
	private int dcid;
	
	/* 할인명 */
	private String dcName;
	
	/* 할인유형 */
	private String dcType;
	
	/* 할인금액 */
	private String Price;
	
	/* 할인율 */
	private int Rate;
	
	private String dcDaesangID;
	
	/*연관회원적용*/
	private String ApplyFamily;
	
	/*연관회원인원*/
	private int ApplyFamilyCnt;
	
	/* 정렬순서 */
	private int SortOrder;
	
	/* 생성일 */
	private String AddDate;
	
	/* 생성자 */
	private int AddUserPKID;
	
	/* 수정일 */
	private String UpdDate;
	
	/* 수정자 */
	private int UpdUserPKID;
	
	/* 추가할인 여부? */
	private String AddDCYN;
	
	/* 웹 사용여부 */
	private String WebYN;
	
	private String IsUse;
	
	/* 감면명 */
	private String PissCD;
	
	/* 재등록할인불가여부  */
	private String ReDCNoYN;
	
	private int ReDCNoChkDayCnt; 

	/* 즉시감면코드 */
	private String PiscCD;
}
