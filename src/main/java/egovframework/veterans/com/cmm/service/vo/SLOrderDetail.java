package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class SLOrderDetail implements Serializable {

	private int OrderDetailID;
	
	private String SiteCode;
	
	private int OrderID;
	
	private String ItemName;
	
	private String FromTime;
	
	private String ToTime;
	
	private int AdultGbn;
	
	private int Gender;
	
	private int UnitPrice;
	
	private int Amount;
	
	private int TotalPrice;
	
	private int DCCode;
	
	private int DCPrice;
	
	private int RealPrice;
	
	private int ItemPKID;
	
	private String BarCode;
	
	private String SaleGubun;
	
	private int kioskOrderID;
	
	private List<SLOrderBarCode> barCodes;
}
