package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.veterans.com.cmm.service.VtcPaidService;
import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.tblexpense;
import egovframework.veterans.com.cmm.service.vo.tblexpensegroup;
import egovframework.veterans.com.cmm.service.vo.tblexpensesale;
import egovframework.veterans.com.cmm.service.vo.settlemnetlist;
import egovframework.veterans.com.cmm.service.vo.tblpaid;

@Service("VtcPaidService")
public class VtcPaidServiceImpl extends EgovAbstractServiceImpl implements VtcPaidService {
	
	@Resource(name="VtcPaidDAO")
	private VtcPaidDAO paidDAO;

	
	@Override
	public List<DC> selectDCType(String SiteCode) throws Exception {
		return paidDAO.selectDCType(SiteCode);
	}
	@Override
	public DC getDCDetail(DC dc) throws Exception {
		return paidDAO.getDCDetail(dc);
	}
	@Override
	public void updateDC(DC dc) throws Exception {
		paidDAO.updateDC(dc);
	}
	@Override
	public void insertDC(DC dc) throws Exception {
		paidDAO.insertDC(dc);
	}
	@Override
	public void deleteDC(DC dc) throws Exception {
		paidDAO.deleteDC(dc);
	}
	@Override
	public int getDcId(String SiteCode) throws Exception {
		return paidDAO.getDcId(SiteCode);
	}
	@Override
	public int getDCSortOrder(String SiteCode) throws Exception {
		return paidDAO.getDCSortOrder(SiteCode);
	}
	
	
	@Override
	public List<tblexpensegroup> selectExpenseGroup(String SiteCode) throws Exception {
		return paidDAO.selectExpenseGroup(SiteCode);
	}
	@Override
	public tblexpensegroup getExpenseGroupDetail(tblexpensegroup group) throws Exception {
		return paidDAO.getExpenseGroupDetail(group);
	}
	@Override
	public void updateExpenseGroup(tblexpensegroup group) throws Exception {
		paidDAO.updateExpenseGroup(group);
	}
	@Override
	public void insertExpenseGroup(tblexpensegroup group) throws Exception {
		paidDAO.insertExpenseGroup(group);
	}
	@Override
	public void deleteExpenseGroup(tblexpensegroup group) throws Exception {
		paidDAO.deleteExpenseGroup(group);
	}
	@Override
	public int getExGpSortOrder(String SiteCode) throws Exception {
		return paidDAO.getExGpSortOrder(SiteCode);
	}
	
	
	@Override
	public List<tblexpense> selectExpense(String SiteCode) throws Exception {
		return paidDAO.selectExpense(SiteCode);
	}
	@Override
	public tblexpense getExpenseDetail(tblexpense expense) throws Exception {
		return paidDAO.getExpenseDetail(expense);
	}
	@Override
	public void updateExpense(tblexpense expense) throws Exception {
		paidDAO.updateExpense(expense);
	}
	@Override
	public void insertExpense(tblexpense expense) throws Exception {
		paidDAO.insertExpense(expense);
	}
	@Override
	public void deleteExpense(tblexpense expense) throws Exception {
		paidDAO.deleteExpense(expense);
	}
	@Override
	public int getExSortOrder(String SiteCode) throws Exception {
		return paidDAO.getExSortOrder(SiteCode);
	}
	
	
	@Override
	public List<Map<String,Object>> memberexpensesale(tblexpensesale tblexpensesale)
			throws Exception {

		return paidDAO.memberexpensesale(tblexpensesale);
	}
	@Override
	public List<settlemnetlist> settlemnetlist(Map<String, Object> tblpaid)
			throws Exception {
		return paidDAO.settlemnetlist(tblpaid);
	}
	@Override
	public int callSelectReceiptNo(Map<String, Object> map) throws Exception {
		return paidDAO.callSelectReceiptNo(map);
	}
	@Override
	public void tblpaidinsert(tblpaid tblpaid) throws Exception {
		paidDAO.tblpaidinsert(tblpaid);
	}
	@Override
	public List<tblpaid> tblpaidbypaidgroupsaleno(tblpaid tblpaid) throws Exception {
		return paidDAO.tblpaidbypaidgroupsaleno(tblpaid);
	}
	@Override
	public void paidchange(tblpaid tblpaid) throws Exception {
		paidDAO.paidchange(tblpaid);
	}
	@Override
	public void tblElecAssignDataInsert(tblpaid tblpaid) {
		paidDAO.tblElecAssignDataInsert(tblpaid);
	}
	public int OriginPKIDFind(tblpaid tblpaid) throws Exception {
		return paidDAO.OriginPKIDFind(tblpaid);
	}
	@Override
	public void ReceiptInsert(tblpaid tblpaid) throws Exception {
		paidDAO.ReceiptInsert(tblpaid);
	}
	@Override
	public List<tblexpense> ExpenseByGroupID(tblexpense tblexpense) throws Exception {
		return paidDAO.ExpenseByGroupID(tblexpense);
	}
	@Override
	public void ExpenseSaleInsert(tblexpensesale tblexpensesale) throws Exception {
		paidDAO.ExpenseSaleInsert(tblexpensesale);
	}
	@Override
	public Map<String, Object> ExpenseSaleJoinGroupJojnExpense(tblexpensesale tblexpensesale) throws Exception {
		return paidDAO.ExpenseSaleJoinGroupJojnExpense(tblexpensesale);
	}
	@Override
	public List<tblpaid> PaidBySaleNoAndSaleType(tblpaid tblpaid) throws Exception {
		return paidDAO.PaidBySaleNoAndSaleType(tblpaid);
	}
	@Override
	public void UpdExpenseSale(tblexpensesale tblexpensesale) throws Exception {
		paidDAO.UpdExpenseSale(tblexpensesale);
	}
}
