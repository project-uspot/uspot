package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class UserGroup implements Serializable {

	private int UserGroupID;
	
	private String SiteCode;
	
	private String UserGroupName;
	
	private int SortOrder;
	
	private String UseDBAccess;
	
	private String dbid;
	
	private String dbPassword;
	
	private String IsDelete;
	
	private String AddDate;
	
	private int AddUserPKID;
	
	private String UpdDate;
	
	private int UpdUserPKID;
}
