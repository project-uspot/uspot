package egovframework.veterans.com.cmm;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.veterans.com.cmm.service.VtcPaidService;
import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.Expense;
import egovframework.veterans.com.cmm.service.vo.ExpenseGroup;
import egovframework.veterans.com.cmm.service.vo.tblpaid;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class VtcPaidController {

	private final VtcPaidService VtcPaidService;
	
	@RequestMapping(value="DCType.do")
	public String selectDCType(String SiteCode, ModelMap model) throws Exception {
		SiteCode = "10001";
		List<DC> list = VtcPaidService.selectDCType(SiteCode);
		model.addAttribute("list", list);
		return "basic/paid/DCType";
	}
	
	@RequestMapping(value="DCTypeUpd.do")
	public String dcTypeModify(ModelMap model, DC dc, HttpServletRequest request) throws Exception {
		String SiteCode = request.getParameter("SiteCode");
		
		List<DC> list = VtcPaidService.selectDCType(SiteCode);
		
		dc = VtcPaidService.getDCDetail(dc);
		
		
		model.addAttribute("list", list);
		model.addAttribute("dc", dc);
		return "basic/paid/DCType_modify";
	}
	@RequestMapping(value="DCTypeUpdOK.do")
	public String dcTypeModifyOK(HttpServletRequest request, DC dc) throws Exception {
		String SiteCode = request.getParameter("SiteCode");
		int dcid = Integer.parseInt(request.getParameter("dcid"));
		String dcName = request.getParameter("dcName");
		String dcType = request.getParameter("dcType");
		String Price = request.getParameter("Price");
		int Rate = Integer.parseInt(request.getParameter("Rate"));
		String ApplyFamily = request.getParameter("ApplyFamily");
		int ApplyFamilyCnt = Integer.parseInt(request.getParameter("ApplyFamilyCnt"));
		int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
		String PissCD = request.getParameter("PissCD");
		String ReDCNoYN = request.getParameter("ReDCNoYN");
		int ReDCNoChkDayCnt = Integer.parseInt(request.getParameter("ReDCNoChkDayCnt"));
		String UpdDate = request.getParameter("UpdDate");
		
		dc = new DC();
		dc.setSiteCode(SiteCode);
		dc.setDcid(dcid);
		dc.setDcName(dcName);
		dc.setDcType(dcType);
		dc.setPrice(Price);
		dc.setRate(Rate);
		dc.setApplyFamily(ApplyFamily);
		dc.setApplyFamilyCnt(ApplyFamilyCnt);
		dc.setSortOrder(SortOrder);
		dc.setPissCD(PissCD);
		dc.setReDCNoYN(ReDCNoYN);
		dc.setReDCNoChkDayCnt(ReDCNoChkDayCnt);
		dc.setUpdDate(UpdDate);
		VtcPaidService.updateDC(dc);
		
		return "redirect:DCType.do";
	}
	
	@RequestMapping(value="insertDcType.do")
	public String insertDcType(HttpServletRequest request, DC dc) throws Exception {
		return "basic/paid/DCType_insert";
	}
	@RequestMapping(value="insertDcTypeOK.do")
	public String insertDcTypeOK(HttpServletRequest request, DC dc) throws Exception {
		String SiteCode = "10001";
		int dcid = Integer.parseInt(request.getParameter("dcid"));
		String dcName = request.getParameter("dcName");
		String dcType = request.getParameter("dcType");
		String Price = request.getParameter("Price");
		int Rate = Integer.parseInt(request.getParameter("Rate"));
		String dcDaesangID = request.getParameter("dcDaesangID");
		String ApplyFamily = request.getParameter("ApplyFamily");
		int ApplyFamilyCnt = Integer.parseInt(request.getParameter("ApplyFamilyCnt"));
		int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
		String PissCD = request.getParameter("PissCD");
		String ReDCNoYN = request.getParameter("ReDCNoYN");
		int ReDCNoChkDayCnt = Integer.parseInt(request.getParameter("ReDCNoChkDayCnt"));
		
		dc = new DC();
		dc.setSiteCode(SiteCode);
		dc.setDcid(dcid);
		dc.setDcName(dcName);
		dc.setDcType(dcType);
		dc.setPrice(Price);
		dc.setRate(Rate);
		dc.setDcDaesangID(dcDaesangID);
		dc.setApplyFamily(ApplyFamily);
		dc.setApplyFamilyCnt(ApplyFamilyCnt);
		dc.setSortOrder(SortOrder);
		dc.setPissCD(PissCD);
		dc.setReDCNoYN(ReDCNoYN);
		dc.setReDCNoChkDayCnt(ReDCNoChkDayCnt);
		VtcPaidService.insertDC(dc);
		return "redirect:DCType.do";
	}
	
	@RequestMapping(value="deleteDC.do")
	public String deleteDC(ModelMap model, DC dc) throws Exception {
		VtcPaidService.deleteDC(dc);
		return "redirect:DCType.do";
	}
	
	@RequestMapping(value="ExpenseGroup.do")
	public String selectExpenseGroup(String SiteCode, ModelMap model) throws Exception {
		SiteCode = "10001";
		List<ExpenseGroup> list = VtcPaidService.selectExpenseGroup(SiteCode);
		model.addAttribute("list", list);
		return "basic/paid/expenseGroup";
	}
	
	@RequestMapping(value="ExpenseGroupUdp.do")
	public String expenseGroupModify(ModelMap model, ExpenseGroup group)  throws Exception{
		group = VtcPaidService.getExpenseGroupDetail(group);
		model.addAttribute("list", group);
		return "basic/paid/expenseGroup_modify";
	}
	
	@RequestMapping(value="ExpenseGroupUdpOK.do")
	public String expenseGroupModifyOK(ExpenseGroup group, HttpServletRequest request) throws Exception {
		String SiteCode = request.getParameter("SiteCode");
		int ExpenseGroupID = Integer.parseInt(request.getParameter("ExpenseGroupID"));
		String ExpenseGroupName = request.getParameter("ExpenseGroupName");
		int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
		
		group = new ExpenseGroup();
		group.setSiteCode(SiteCode);
		group.setExpenseGroupID(ExpenseGroupID);
		group.setExpenseGroupName(ExpenseGroupName);
		group.setSortOrder(SortOrder);
		VtcPaidService.updateExpenseGroup(group);
		return "redirect:ExpenseGroup.do";
	}
	
	@RequestMapping(value="ExpenseGpInsert.do")
	public String ExpenseGroupInsert(ExpenseGroup group, HttpServletRequest request) throws Exception {
		return "basic/paid/expenseGroup_insert";
	}
	
	@RequestMapping(value="ExpenseGpInsertOK.do")
	public String ExpenseGroupInsertOK(ExpenseGroup group, HttpServletRequest request) throws Exception {
		String SiteCode = "10001";
		String ExpenseGroupName = request.getParameter("ExpenseGroupName");
		int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
		
		group = new ExpenseGroup();
		group.setSiteCode(SiteCode);
		group.setExpenseGroupName(ExpenseGroupName);
		group.setSortOrder(SortOrder);
		VtcPaidService.insertExpenseGroup(group);
		return "redirect:ExpenseGroup.do";
	}
	@RequestMapping(value="deleteExpGp.do")
	public String deleteExpGp(ModelMap model, ExpenseGroup group) throws Exception {
		VtcPaidService.deleteExpenseGroup(group);
		return "redirect:ExpenseGroup.do";
	}
	
	
	
	@RequestMapping(value="Expense.do")
	public String selectExpense(String SiteCode, ModelMap model) throws Exception {
		SiteCode = "10001";
		List<Expense> list = VtcPaidService.selectExpense(SiteCode);
		model.addAttribute("list", list);
		return "basic/paid/expense";
	}
	
	@RequestMapping(value="ExpenseUpd.do")
	public String expenseModify(ModelMap model, Expense expense, HttpServletRequest request) throws Exception {
		String SiteCode = request.getParameter("SiteCode");
		List<ExpenseGroup> list = VtcPaidService.selectExpenseGroup(SiteCode);

		expense = VtcPaidService.getExpenseDetail(expense);
		
		
		model.addAttribute("list", list);
		model.addAttribute("expense", expense);
		return "basic/paid/expense_modify";
	}
	@RequestMapping(value="ExpenseUpdOK.do")
	public String expenseModifyOK(Expense expense) throws Exception {
		VtcPaidService.updateExpense(expense);
		return "redirect:Expense.do";
	}
	
	@RequestMapping(value="ExpenseInsert.do")
	public String ExpenseInsert(Expense expense, HttpServletRequest request, ModelMap model, String SiteCode) throws Exception {
		SiteCode = "10001";
		List<ExpenseGroup> list = VtcPaidService.selectExpenseGroup(SiteCode);
		model.addAttribute("list", list);
		return "basic/paid/expense_insert";
	}
	
	@RequestMapping(value="ExpenseInsertOK.do")
	public String ExpenseInsertOK(Expense expense, HttpServletRequest request) throws Exception {
		String SiteCode = "10001";
		int ExpenseGroupID = Integer.parseInt(request.getParameter("ExpenseGroupID"));
		String ExpenseName = request.getParameter("ExpenseName");
		String ExpenseType = request.getParameter("ExpenseType");
		String DefPrice = request.getParameter("DefPrice");
		String Nvat = request.getParameter("Nvat");
		int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
		
		expense = new Expense();
		expense.setSiteCode(SiteCode);
		expense.setExpenseGroupID(ExpenseGroupID);
		expense.setExpenseName(ExpenseName);
		expense.setExpenseType(ExpenseType);
		expense.setDefPrice(DefPrice);
		expense.setNvat(Nvat);
		expense.setSortOrder(SortOrder);
		VtcPaidService.insertExpense(expense);
		return "redirect:Expense.do";
	}
	@RequestMapping(value="deleteExp.do")
	public String deleteExpense(ModelMap model, Expense expense) throws Exception {
		VtcPaidService.deleteExpense(expense);
		return "redirect:Expense.do";
	}	
	
	@ResponseBody
	@PostMapping("/tblpaidinsert")
	public void tblpaidinsert(tblpaid tblpaid) throws Exception {
		int ReceiptNo = VtcPaidService.callSelectReceiptNo(tblpaid.getSaleDate());
		System.out.println(ReceiptNo);
	}
}
