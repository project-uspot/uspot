package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;


import lombok.Data;

@SuppressWarnings("serial")
@Data
public class PGM implements Serializable {
	
	private int pkid;
	
	/*메뉴아이디*/
	private String pgmID;
	
	/*사이트코드*/
	private String SiteCode;
	
	/*그룹아이디*/
	private int pgmGroupID;
	
	/*메뉴명*/
	private String pgmName;
	
	private String IsDelete;

	private int SortOrder;
	
	private String AddDate;
	
	private String AddUserPKID;
	
	private String UpdDate;
	
	private String UpdUserPKID;
	

}
