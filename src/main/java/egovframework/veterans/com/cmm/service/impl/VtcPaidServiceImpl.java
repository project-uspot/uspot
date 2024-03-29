package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.veterans.com.cmm.service.VtcPaidService;
import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.Expense;
import egovframework.veterans.com.cmm.service.vo.ExpenseGroup;
import egovframework.veterans.com.cmm.service.vo.memberexpensesale;

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
	public List<ExpenseGroup> selectExpenseGroup(String SiteCode) throws Exception {
		return paidDAO.selectExpenseGroup(SiteCode);
	}
	@Override
	public ExpenseGroup getExpenseGroupDetail(ExpenseGroup group) throws Exception {
		return paidDAO.getExpenseGroupDetail(group);
	}
	@Override
	public void updateExpenseGroup(ExpenseGroup group) throws Exception {
		paidDAO.updateExpenseGroup(group);
	}
	@Override
	public void insertExpenseGroup(ExpenseGroup group) throws Exception {
		paidDAO.insertExpenseGroup(group);
	}
	@Override
	public void deleteExpenseGroup(ExpenseGroup group) throws Exception {
		paidDAO.deleteExpenseGroup(group);
	}
	
	
	@Override
	public List<Expense> selectExpense(String SiteCode) throws Exception {
		return paidDAO.selectExpense(SiteCode);
	}
	@Override
	public Expense getExpenseDetail(Expense expense) throws Exception {
		return paidDAO.getExpenseDetail(expense);
	}
	@Override
	public void updateExpense(Expense expense) throws Exception {
		paidDAO.updateExpense(expense);
	}
	@Override
	public void insertExpense(Expense expense) throws Exception {
		paidDAO.insertExpense(expense);
	}
	@Override
	public void deleteExpense(Expense expense) throws Exception {
		paidDAO.deleteExpense(expense);
	}
	@Override
	public List<memberexpensesale> memberexpensesale(String MemberID)
			throws Exception {

		return paidDAO.memberexpensesale(MemberID);
	}
	
}
