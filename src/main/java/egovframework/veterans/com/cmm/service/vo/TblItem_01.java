package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class TblItem_01 implements Serializable{
	
	private String SiteCode;
	
	private int GroupID;
	
	/*강습종목*/
	private String GroupName;
	
	private String GroupCategoryCD;
	
	/*접수구분*/
	private String jsType;
	
	private String JungSiType;
	
	
	private String JungSi;
	
	/*신규접수*/
	private String JungSi1;
	
	/*재등록*/
	private String JungSi2;
	
	/*강습기간*/
	private String JungSi3;
	
	/*기간지정 시작*/
	private String FromDate;
	
	/*기간지정 종료*/
	private String ToDate;
	
	private int SortOrder;
	
	private String IsDelete;
	
	private String AddDate;
	
	private int AddUserPKID;
	
	private String UpdDate;
	
	private int UpdUserPKID;
	
	private String rFromDate;
	
	private String rToDate;
	
	private String Season;

	/*웹 사용여부*/
	private String WebYN;
	
	/*신규접수 시작시간*/
	private String JungSi1STime;
	
	/*신규접수 종료시간*/
	private String JungSi1ETime;
	
	/*재접수 시작시간*/
	private String JungSi2STime;

	/*재접수 종료시간*/
	private String JungSi2ETime;
	
	/*수시접수 시 강습기간 당월처리*/
	private String JungSi3MonthGbn;
	
	/*수시접수 정지*/
	private String JungSiType1Stop;
	
	/*구민신규*/
	private String JungSi1Inlive;
	
	/*재등록 제한 개월*/
	private int AgainMonth;
	
	private String JungSiAddType;
	
	private String JungSiAddFromDate;
	
	private String JungSiAddToDate;
	
	private String PayDelayDay;
	
	private String PayDelayTime;
	
	private String JungSi1PayFromDate;
	
	private String JungSi1PayToDate;
	
	private String JungSi1PaySTime;
	
	private String JungSi1PayETime;
	
	private String JungSiAddSTime;
	
	private String JungSiAddETime;
	
	private int ParkTime;
	
	/*추첨일*/
	private String JungSiLotteryDate;
	
	/*추첨접수 시작날짜*/
	private String JungSiLotteryFromDate;
	
	/*추첨접수 종료날짜*/
	private String JungSiLotteryToDate;
	
	/*추첨결제 시작날짜*/
	private String JungSiLotteryPayFromDate;
	
	/*추첨결제 종료날짜*/
	private String JungSiLotteryPayToDate;
	
	/*추첨 강좌(선착순) 시작날짜*/
	private String JungSiLotteryAddFromDate;
	
	/*추첨 강좌(선착순) 종료날짜*/
	private String JungSiLotteryAddToDate;
	
	/*등록제한건수*/
	private String ItemRejectCnt;
	
	/*다개월 불가*/
	private String MonthSelNo;

	
	
}
