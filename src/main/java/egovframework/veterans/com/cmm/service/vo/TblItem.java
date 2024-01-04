package egovframework.veterans.com.cmm.service.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TblItem {
	
	private int ItemID;


	private String SiteCode;


	private String ItemCode;


	private String Type;


	private int GroupID;


	private int SubGroupID;


	private int LevelID;


	private int DaeSangID;


	private String FromTime;


	private String ToTime;


	private int ClassCnt;


	private String WeekYN;


	private String MonIn;


	private String TuesIn;


	private String WednesIn;


	private String ThursIn;


	private String FriIn;


	private String SaturIn;


	private String SunIn;


	private String Holy;


	private String HolyIn;


	private int OffMax;


	private int OnMax;


	private int DamDangUserPKID;


	private String SalaryType;


	private int CompanyPer;


	private int SawonPer;


	private String Upjang;


	private String chkPeriod;


	private String FromDate;


	private String ToDate;


	private String YakChing;


	private String DefPrice;


	private String Price1;


	private String Price2;


	private String Price3;


	private String Price4;


	private String Price5;


	private String nvat;


	private int InCnt;


	private String IsUse;


	private String Intro;


	private String Detail;


	private String Note;


	private String Picture;


	private String WebYN;


	private int ItemMonth;


	private int Admission;


	private String DcNoChk;


	private String IfFlag;


	private String IfDateTime;


	private String ParkingTime;


	private int ageStart;


	private int ageEnd;


	private String WebEnd;


	private String ToEndDate;


	private String IsDelete;


	private String AddDate;


	private int AddUserPKID;


	private String UpdDate;


	private int UpdUserPKID;


	private String Mon;


	private String Tues;


	private String Wednes;


	private String Thurs;


	private String Fri;


	private String Satur;


	private String Sun;


	private String DCDS;


	private String UseLocker;


	private int RegMonth;


	private String AgeYearGbn;


	private String DcNo3MonthChk;


	private String RecommendGbn;


	private int RecommendGbnSort;


	private String OldAgeDCNoGbn;


	private String LotteryGbn;


	private String inliveRegster;
	
	private String Bigo;
	
	
	private String GroupName;
	
	private String SubGroupName;
	
	private String LevelName;
	
	// 첨부파일
	String FileName;
	MultipartFile uploadfile;
	

}
