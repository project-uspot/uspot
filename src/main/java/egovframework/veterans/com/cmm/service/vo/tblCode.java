package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class tblCode implements Serializable{

	private int pkid;


	private String SiteCode;


	private String CodeGroupID;


	private String CodeName;


	private String CodeValue;


	private int SortOrder;


	private String LockerCondition;


	private int LockerManAddNum;


	private int LockerWomanAddNum;


	private String IsDelete;


	private String AddDate;


	private int AddUserPKID;


	private String UpdDate;


	private int UpdUserPKID;


}
