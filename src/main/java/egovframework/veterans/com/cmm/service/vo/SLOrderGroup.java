package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class SLOrderGroup implements Serializable{
	
	private int pkid;
	
	/* 사이트코드 */
	private String SiteCode;

	/* 그룹명 */
	private String GroupName;
	
	/* 키오스키여부 */
	private int KioskYN;
	
	/* 정원 */
	private int GroupJungWon;
	
	/* 평일주차시간 */
	private String ParkingTimeWeek;
	
	/* 주말주차시간 */
	private String ParkingTimeWeekend;
	
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
	
	private String svrTime;
	
}
