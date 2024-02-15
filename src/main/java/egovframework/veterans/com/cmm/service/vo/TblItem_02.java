package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class TblItem_02 implements Serializable {

	private String SiteCode;
	
	private int SubGroupID;
	
	private String SubGroupName;
	
	private int InTime;
	
	private int InEndTime;
	
	private int SortOrder;
	
	private String IsDelete;
	
	private String AddDate;
	
	private int AddUserPKID;
	
	private String UpdDate;
	
	private int UpdUserPKID;
	
	private int GroupID;
	
	private String GroupName;

	private String ItemID;
	
	private String FindDate;
	
}
