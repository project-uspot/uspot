package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class TblAuthuserGroup implements Serializable {
	
	private String SiteCode;
	
	private int pkid;
	
	private int UserGroupID;
	
	private int pgmPKID;
	
	private String Sel;
	
	private String Ins;
	
	private String Upd;
	
	private String Del;
	
	private String Excel;
	
	private String Prt;
	
	private String IsDelete;
	
	private String Adddate;
	
	private String AddUserPKID;
	
	private String UpdDate;
	
	private String UpdUserPKID;
	
	private String pgmID;
	
	private String pgmName;
	
	private int PGMGroupID;
}
