package egovframework.veterans.com.cmm.service.vo;

import lombok.Data;

@Data
public class tblrent_place {
	
	private String SiteCode;


	private String PlaceCD;


	private String PlaceNM;


	private String PartCD;


	private int RentHour;


	private int RentMinute;


	private int PKID1;


	private double RentPrice1;


	private double WeekendPrice1;


	private int PKID2;


	private double RentPrice2;


	private double WeekendPrice2;


	private int PKID3;


	private double RentPrice3;


	private double WeekendPrice3;


	private int PKID4;


	private double RentPrice4;


	private double WeekendPrice4;


	private String VatGubun;


	private String TableYN;


	private double ObjectRentPrice;


	private double ObjectWeekendPrice;


	private String SpecialUse;


	private String SpecialStart;


	private String SpecialEnd;


	private double SpecialPrice;


	private double SpwcialWeekendPrice;


	private double ObjectSpecialPrice;


	private double ObjectSpecialWeekendPrice;


	private String SpecialUseChuga;


	private String SpecialStartChuga;


	private String SpecialEndChuga;


	private double SpecialPriceChuga;


	private double SpwcialWeekendPriceChuga;


	private double ObjectSpecialPriceChuga;


	private double ObjectSpecialWeekendPriceChuga;


	private String LotteryGubun;


	private String LotteryPeriodGubun;


	private int LotteryPeriodDay;


	private String UseLimit;


	private int LimitMonth;


	private int LimitCnt;


	private String SMSReceive;


	private String SMSConsider;


	private int SortOrder;


	private String IsDelete;


	private String AddDate;


	private int AddUserPKID;


	private String UpdDate;


	private int UpdUserPKID;
}
