package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;


import lombok.Data;

@SuppressWarnings("serial")
@Data
public class Sitecode implements Serializable{

	
	/*사업장 코드*/
	private String SiteCode;
	
	/*사업장 아이디*/
	private String SiteID;
	
	/*사업장명*/
	private String SiteName;
	
	/*사업자번호*/
	private String SiteBNo;
	
	/*대표자*/
	private String Pname;
	
	/*업태*/
	private String UpTae;
	
	/*종목*/
	private String JongMok;
	
	/*우편번호*/
	private String ZipCode;
	
	/*주소*/
	private String Address;
	
	/*상세주소*/
	private String SubAddress;
	
	/*전화번호1*/
	private String Phone1;
	
	/*전화번호2*/
	private String Phone2;
	
	/*팩스*/
	private String Fax;
	
	/*이메일*/
	private String Email;
	
	/*담당자*/
	private String DamDangJa;
	
	/*담당자 연락처*/
	private String DamDangJaPhone;
	
	/*비고*/
	private String Note;
	
	private String AcceptNo;
	
	private int LogOutTime;
	
	private int NoUseLogOutItme;
	
	private String IsUseYN;
	
	private int VaccinePassCnt;
	
	private String IsDelete;
	
	private String AddDate;
	
	private int AddUserPKID;
	
	private String UpdDate;
	
	private int UpdUserPKID;

	private int pkid;
	
}
