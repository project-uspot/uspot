package egovframework.veterans.com.cmm.service.vo;

import lombok.Data;

@Data
public class tblpaid {

	private int PKID;

	private String SiteCode;

	private int FPKID = 0;

	private String ReceiptNo;

	private String SaleDate;

	private String RealSaleDate;

	private String SaleType;

	private String PayType;

	private double Price;

	private String AssignType;

	private String Maeipsa;

	private String CardName;

	private String AssignNo;

	private String Pos;

	private String SignPad = "N";

	private String Halbu;

	private String ValidDate;

	private String SaleTime;

	private String FCardNo;

	private String Msg;

	private int PaidGroupSaleNo;

	private String OID;

	private String TID;

	private String DelDate;

	private int DelUsePKID;

	private String DelMsg;

	private String PayID;

	private String IsDelete = "N";

	private String AddDate;

	private int AddUserPKID = 0;

	private String UpdDate;

	private int UpdUserPKID = 0;

	private String CardNo;
	
	private int OriginPKID;
}
