package egovframework.veterans.com.cmm.service.vo;

import lombok.Data;

@Data
public class tblitem_img {
	
	private int PKID;

	private String SiteCode;

	private int GroupID;

	private int SubGroupID;

	private int ItemID;

	private String picture;

	private String IsDelete;

	private String AddDate;

	private int AddUserPKID;

	private String UpdDate;

	private int UpdUserPKID;
}