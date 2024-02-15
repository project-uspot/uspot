package egovframework.veterans.com.cmm.service;

import java.util.List;
import java.util.Map;

import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.Expense;
import egovframework.veterans.com.cmm.service.vo.ExpenseGroup;
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
	
	List<ExpenseGroup> selectExpenseGroup(String SiteCode) throws Exception;
	ExpenseGroup getExpenseGroupDetail(ExpenseGroup group) throws Exception;
	void updateExpenseGroup(ExpenseGroup group) throws Exception;
	void insertExpenseGroup(ExpenseGroup group) throws Exception;
	void deleteExpenseGroup(ExpenseGroup group) throws Exception;
	int getExGpSortOrder(String SiteCode) throws Exception;
	
	List<Expense> selectExpense(String SiteCode) throws Exception;
	Expense getExpenseDetail(Expense expense) throws Exception;
	void updateExpense(Expense expense) throws Exception;
	void insertExpense(Expense expense) throws Exception;
	void deleteExpense(Expense expense) throws Exception;
	List<memberexpensesale> memberexpensesale(String MemberID)throws Exception;
	int getExSortOrder(String SiteCode) throws Exception;
	
	List<settlemnetlist> settlemnetlist(Map<String, Object> fmmap) throws Exception;
	int callSelectReceiptNo(Map<String, Object> map)throws Exception;
	void tblpaidinsert(tblpaid tblpaid)throws Exception;
	List<tblpaid> tblpaidbypaidgroupsaleno(tblpaid tblpaid)throws Exception;
	void paidchange(tblpaid tblpaid)throws Exception;
	void tblElecAssignDataInsert(tblpaid tblpaid);
}
