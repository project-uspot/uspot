package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class SLOrders implements Serializable {

	private int OrderID;
	
	private String SiteCode;
	
	private String OrderNo;
	
	private int RegisterID;
	
	private String SaleDate;
	
	private String RealSaleDate;
	
	private int TotalPrice;
	
	private int MoneyType;
	
	private int DCCode;
	
	private int DCPrice;
	
	private int RealPrice;
	
	private int Deposit;
	
	private int Change;
	
	private String FinishDate;
	
	private int IsJeungSan;
	
	private String ValidDate;
	
	private int isCancelData = 0;
	
	private int OriginOrderID;
	
	private String isCancel = "N";
	
	private int UserPKID;
	
	private String MemberID;
	
	private int KioskOrderID;
	
	private int AddUserPKID;
	
	private int UpdUserPKID;
	
	private List<SLOrderDetail> details;
}
