package egovframework.veterans.com.cmm.service;

import java.util.List;
import java.util.Map;

import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.tblexpense;
import egovframework.veterans.com.cmm.service.vo.tblexpensegroup;
import egovframework.veterans.com.cmm.service.vo.tblexpensesale;
import egovframework.veterans.com.cmm.service.vo.memberexpensesale;
import egovframework.veterans.com.cmm.service.vo.settlemnetlist;
import egovframework.veterans.com.cmm.service.vo.tblpaid;

public interface VtcPaidService {

	List<DC> selectDCType(String SiteCode) throws Exception;
	DC getDCDetail(DC dc) throws Exception;
	void updateDC(DC dc) throws Exception;
	void insertDC(DC dc) throws Exception;
	void deleteDC(DC dc) throws Exception;
	int getDcId(String SiteCode) throws Exception;
	int getDCSortOrder(String SiteCode) throws Exception;
	
	List<tblexpensegroup> selectExpenseGroup(String SiteCode) throws Exception;
	tblexpensegroup getExpenseGroupDetail(tblexpensegroup group) throws Exception;
	void updateExpenseGroup(tblexpensegroup group) throws Exception;
	void insertExpenseGroup(tblexpensegroup group) throws Exception;
	void deleteExpenseGroup(tblexpensegroup group) throws Exception;
	int getExGpSortOrder(String SiteCode) throws Exception;
	
	List<tblexpense> selectExpense(String SiteCode) throws Exception;
	tblexpense getExpenseDetail(tblexpense expense) throws Exception;
	void updateExpense(tblexpense expense) throws Exception;
	void insertExpense(tblexpense expense) throws Exception;
	void deleteExpense(tblexpense expense) throws Exception;
	List<memberexpensesale> memberexpensesale(String MemberID)throws Exception;
	int getExSortOrder(String SiteCode) throws Exception;
	
	List<settlemnetlist> settlemnetlist(Map<String, Object> fmmap) throws Exception;
	int callSelectReceiptNo(Map<String, Object> map)throws Exception;
	void tblpaidinsert(tblpaid tblpaid)throws Exception;
	List<tblpaid> tblpaidbypaidgroupsaleno(tblpaid tblpaid)throws Exception;
	void paidchange(tblpaid tblpaid)throws Exception;
	void tblElecAssignDataInsert(tblpaid tblpaid);
	int OriginPKIDFind(tblpaid tblpaid)throws Exception;
	void ReceiptInsert(tblpaid tblpaid)throws Exception;
	List<tblexpense> ExpenseByGroupID(tblexpense tblexpense)throws Exception;
	void ExpenseSaleInsert(tblexpensesale tblexpensesale)throws Exception;
}
