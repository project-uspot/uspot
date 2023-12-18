package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;


import lombok.Data;

@SuppressWarnings("serial")
@Data
public class PGMGroup implements Serializable{

	/*사이트코드*/
	private String SiteCode;
	
	private String pgmGroupID;
	
	/*메뉴그룹명*/
	private String pgmGroupName;
	
	/*삭제구분*/
	private String IsDelete;
	
	/*정렬순서*/
	private int SortOrder;
	
	private String AddDate;
	
	private String AddUserPKID;
	
	private String updDate;
	
	private String UpdUserPKID;
	
	private String pgmGroupURL;
	
}
