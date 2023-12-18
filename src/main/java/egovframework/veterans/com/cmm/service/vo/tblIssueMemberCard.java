package egovframework.veterans.com.cmm.service.vo;

import lombok.Data;

@Data
public class tblIssueMemberCard {
	
	private String SiteCode;


	private int PKID;


	private String MemberID;


	private String BarCode;


	private String issueDate;


	private String IsReissue;


	private String Price;


	private int AddUserPKID;


	private String AddDate;


	private int UpdUserPKID;


	private String UpdDate;


	private String IsDelete;


	private String SuryungJa;


	private String Relation;


	private String SuryungJaPhone;


	private String Note;

	private String IsReissueT;
}
