package egovframework.veterans.com.cmm.service.vo;

import lombok.Data;

@Data
public class tblmembertalk {
	
	private int PKID;


	private String SiteCode;


	private String MemberID;


	private String UserID;


	private String UserName;


	private String TalkDate;


	private String TalkText;


	private String IsFollowUp;


	private String FollowUpText;


	private String IsDelete;


	private String AddDate;


	private int AddUserPKID;


	private String UpdDate;


	private int UpdUserPKID;

}
