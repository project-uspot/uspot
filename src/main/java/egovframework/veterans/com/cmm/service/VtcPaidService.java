package egovframework.veterans.com.cmm.service;

import java.util.List;
import java.util.Map;

import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.Expense;
import egovframework.veterans.com.cmm.service.vo.ExpenseGroup;
import egovframework.veterans.com.cmm.service.vo.memberexpensesale;
import egovframework.veterans.com.cmm.service.vo.settlemnetlist;

public interface VtcPaidService {

	List<DC> selectDCType(String SiteCode) throws Exception;
	DC getDCDetail(DC dc) throws Exception;
	void updateDC(DC dc) throws Exception;
	void insertDC(DC dc) throws Exception;
	void deleteDC(DC dc) throws Exception;
	
	List<ExpenseGroup> selectExpenseGroup(String SiteCode) throws Exception;
	ExpenseGroup getExpenseGroupDetail(ExpenseGroup group) throws Exception;
	void updateExpenseGroup(ExpenseGroup group) throws Exception;
	void insertExpenseGroup(ExpenseGroup group) throws Exception;
	void deleteExpenseGroup(ExpenseGroup group) throws Exception;
	
	List<Expense> selectExpense(String SiteCode) throws Exception;
	Expense getExpenseDetail(Expense expense) throws Exception;
	void updateExpense(Expense expense) throws Exception;
	void insertExpense(Expense expense) throws Exception;
	void deleteExpense(Expense expense) throws Exception;
	List<memberexpensesale> memberexpensesale(String MemberID)throws Exception;
	
	List<settlemnetlist> settlemnetlist(Map<String, Object> fmmap) throws Exception;
}
