package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.Expense;
import egovframework.veterans.com.cmm.service.vo.ExpenseGroup;
import egovframework.veterans.com.cmm.service.vo.memberexpensesale;
import egovframework.veterans.com.cmm.service.vo.settlemnetlist;
import egovframework.veterans.com.cmm.service.vo.tblpaid;

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
	public int getDcId(String SiteCode) {
		return selectOne("paid.getDcId", SiteCode);
	}
	public int getDCSortOrder(String siteCode) {
		return selectOne("paid.getDCSortOrder", siteCode);
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
	public int getExGpSortOrder(String siteCode) {
		return selectOne("paid.getExGpSortOrder", siteCode);
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
	public int getExSortOrder(String siteCode) {
		return selectOne("paid.getExSortOrder", siteCode);
	}
	
	public List<memberexpensesale> memberexpensesale(String MemberID)throws Exception {
		return selectList("paid.memberexpensesale",MemberID);
	}
	public List<settlemnetlist> settlemnetlist(Map<String, Object> tblpaid) {
		return selectList("paid.settlemnetlist", tblpaid);
	}
	public int callSelectReceiptNo(Map<String, Object> map)throws Exception{
		selectOne("paid.callSelectReceiptNo",map);
		return (Integer) map.get("outputOrderNo");
	}
	public void tblpaidinsert(tblpaid tblpaid)throws Exception{
		insert("paid.tblpaidinsert",tblpaid);
	}
	
	public List<tblpaid> tblpaidbypaidgroupsaleno(tblpaid tblpaid)throws Exception{
		return selectList("paid.tblpaidbypaidgroupsaleno",tblpaid);
	}
}
