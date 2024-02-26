package egovframework.veterans.com.cmm.service.vo;

import lombok.Data;

@Data
public class memberuselocker {
	private String PKID;
	private String PLockerGroupName;
	private String PLockerLocation;
	private int PLockerNo;
	private String RegDate;
	private String FromDate;
	private String ToDate;
	private int RegMonth;
	private String RealPrice;
	private int PaidPrice;
	private int Misu;
	private String IsFlagText;
	private int IsFlag;
	private String ReturnDate;
}
