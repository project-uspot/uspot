package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class SLOrderBarCode implements Serializable {

	private int pkid;
	
	private String SiteCode;
	
	private int OrderDetailID;
	
	private int OrderID;
	
	private String BarCode;
	
}
