package egovframework.veterans.com.cmm.service.vo;

import lombok.Data;

@Data
public class tblexpensegroup{
	
	/* 사이트코드 */
	private String SiteCode;

	/* 기타그룹ID */
	private int ExpenseGroupID;
	
	/* 기타그룹명 */
	private String ExpenseGroupName;
	
	/* 삭제여부 */
	private String IsDelete;
	
	/* 정렬순서 */
	private int SortOrder;
	
	/* 생성일 */
	private String AddDate;
	
	/* 생성자 */
	private int AddUserPKID;
	
	/* 수정일 */
	private String UpdDate;
	
	/* 수정자 */
	private int UpdUserPKID;
	
}
