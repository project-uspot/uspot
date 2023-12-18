package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class tblplockergroup implements Serializable{

	private int PLockergroupid;
	
	private String SiteCode;
	
	private String PLockergroupname;
	
	private String PLockerlocation;
	
	private int PLockertype;
	
	private double PLockerdeposit;
	
	private double PLockerprice;
	
	private int PLockermonth;
	
	private int Sortorder;
	
	private String NVAT;
	
	private String LockerImage;
	
	private String JStype;
	
	private String Jungsinewdate;
	
	private String Jungsiredate;
	
	private String Jungsifromtodate;
	
	private String Jungsinew_etime;
	
	private String Jungsire_stime;
	
	private String Isdelete;
	
	private String AddDate;
	
	private int AdduserPKID;
	
	private String Upddate;
	
	private int UpdUserPKID;
	
	private int Dancnt;
}
