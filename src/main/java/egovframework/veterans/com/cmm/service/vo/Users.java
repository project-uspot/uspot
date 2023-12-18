package egovframework.veterans.com.cmm.service.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class Users implements Serializable{
	
	/* 사업장이름 */
	private String SiteName;
	
	private int UserPKID;
	
	/* 사업장코드 */
	private String SiteCode;
	
	/* 사원번호 */
	private String SawonNo;
	
	/* 사원명 */
	private String SawonName;
	
	/* 아이디 */
	private String UserID;
	
	/* 비밀번호 */
	private String UserPWD;
	
	/* 성별 */
	private String Gender;
	
	/* 구분 */
	private String Type;
	
	/* 생년월일 */
	private String ssn;
	
	/* 생일 */
	private String BirthDay;
	
	/* 음력,양력 */
	private String BirthType;
	
	/* 계약상태 */
	private String JikMooID;
	
	/* 부서 */
	private String BuseoID;
	
	/* 직위 */
	private String JikwiID;
	
	/* 담당강습코드 */
	private int ItemGroupID;
	
	/* 이메일 */
	private String Email;
	
	/* 일반전화 */
	private String HomePhone;
	
	/* 휴대전화 */
	private String CellPhone;
	
	/* 입사일자 */
	private String InDate;
	
	/* 재직상태 */
	private String State;
	
	/* 퇴직일자 */
	private String OutDate;
	
	/* 우편번호 */
	private String ZipCode;
	
	/* 주소 */
	private String Address;
	
	/* 세부주소 */
	private String SubAddress;
	
	/* 비고 */
	private String Note;
	
	/* 강사이력 */
	private String Chistory;
	
	/* 수상이력 */
	private String Phistory;
	
	/* 업장 */
	private String Upjang;
	
	private int UserGroupID;
	
	private String StartLogonIP;
	
	private String EndLogonIP;
	
	private String WebStartLogonIP;
	
	private String WebEntLogonIP;
	
	/* 비밀번호 오류 횟수 */
	private int PasswordErrorCNT;
	
	private String EncryptChk;
	
	private int Grade;
	
	/* 로그인IP */
	private String LoginIP;
	
	/* 로그인날짜 */
	private String LoginDate;
	
	/* 로그아웃날짜 */
	private String LogoutDate;
	
	/* 삭제여부 */
	private String IsDelete;
	
	private String AddDate;

	private int AddUserPKID;
	
	private String UpdDate;
	
	private int UpdUserPKID;
	
	/* 운영일자 */
	private String JobStart;
	
	/* 그룹명 */
	private String UserGroupName;
	
	/* 담당강습명 */
	private String GroupName;
	
	
	
}
