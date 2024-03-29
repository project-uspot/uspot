package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.Expense;
import egovframework.veterans.com.cmm.service.vo.ExpenseGroup;
import egovframework.veterans.com.cmm.service.vo.memberexpensesale;

@Repository("VtcPaidDAO")
public class VtcPaidDAO extends EgovComAbstractDAO {

	public List<DC> selectDCType(String SiteCode) throws Exception {
		return selectList("paid.selectDCType", SiteCode);
	}
	public DC getDCDetail(DC dc) throws Exception {
		return selectOne("paid.getDCDetail", dc);
	}
	public void updateDC(DC dc) throws Exception {
		update("paid.updateDC", dc);
	}
	public void insertDC(DC dc) throws Exception {
		insert("paid.insertDC", dc);
	}
	public void deleteDC(DC dc) throws Exception {
		update("paid.deleteDC", dc);
	}
	
	
	public List<ExpenseGroup> selectExpenseGroup(String SiteCode) throws Exception {
		return selectList("paid.selectExpenseGroup", SiteCode);
	}
	public ExpenseGroup getExpenseGroupDetail(ExpenseGroup group) throws Exception {
		return selectOne("paid.getExpenseGroupDetail", group);
	}
	public void updateExpenseGroup(ExpenseGroup group) throws Exception {
		update("paid.updateExpenseGroup", group);
	}
	public void insertExpenseGroup(ExpenseGroup group) throws Exception {
		insert("paid.insertExpenseGroup", group);
	}
	public void deleteExpenseGroup(ExpenseGroup group) throws Exception {
		update("paid.deleteExpenseGroup", group);
	}

	
	public List<Expense> selectExpense(String SiteCode) throws Exception {
		return selectList("paid.selectExpense", SiteCode);
	}
	public Expense getExpenseDetail(Expense expense) throws Exception {
		return selectOne("paid.getExpenseDetail", expense);
	}
	public void updateExpense(Expense expense) throws Exception {
		update("paid.updateExpense", expense);
	}
	public void insertExpense(Expense expense) throws Exception {
		insert("paid.insertExpense", expense);
	}
	public void deleteExpense(Expense expense) {
		update("paid.deleteExpense", expense);
	}
	public List<memberexpensesale> memberexpensesale(String MemberID)throws Exception {
		return selectList("paid.memberexpensesale",MemberID);
	}

}
