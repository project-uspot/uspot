package egovframework.veterans.com.cmm.service.vo;

import lombok.Data;

@Data
public class tbldeposite {
	private int PKID;
	
	private String SiteCode;

	private String SaleDate;
	
	private String RealSaleDate;
	
	private int LockerID;

	private String MemberID;

	private int Deposite;

	private String IsDelete;

	private String AddDate;

	private int AddUserPKID;

	private String UpdDate;

	private int UpdUserPKID;
}
