package egovframework.veterans.com.cmm.service.vo;

import lombok.Data;

@Data
public class tblexpensesale {
	
	private int PKID;

	private String SiteCode;

	private int ExpenseID;

	private String InOut;

	private String SaleDate;

	private double Price;

	private String MemberID;

	private String IsMemMode;

	private int ExpCnt;
	
	private double TotalPrice;
	
	private double Misu;
	
	private double PaidPrice;

	private String Note;

	private String IsDelete;

	private String AddDate;

	private int AddUserPKID;

	private String UpdDate;

	private int UpdUserPKID;
}
