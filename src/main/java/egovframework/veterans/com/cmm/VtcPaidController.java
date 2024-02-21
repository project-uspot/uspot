package egovframework.veterans.com.cmm;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.veterans.com.cmm.service.VtcPaidService;
import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.Expense;
import egovframework.veterans.com.cmm.service.vo.ExpenseGroup;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.tblpaid;
import egovframework.veterans.lib.OfflinePayController;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class VtcPaidController {
	
	private final HttpSession session;

	private final VtcPaidService VtcPaidService;
	
	@RequestMapping(value="DCType.do")
	public String selectDCType(String SiteCode, ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		List<DC> list = VtcPaidService.selectDCType(users.getSiteCode());
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
	public String dcTypeModifyOK(DC dc, ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		dc.setSiteCode(users.getSiteCode());
		dc.setUpdUserPKID(users.getUserPKID());
		VtcPaidService.updateDC(dc);
		return "redirect:DCType.do";
	}
	
	@RequestMapping(value="insertDcType.do")
	public String insertDcType(DC dc, ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		
		int DCID = VtcPaidService.getDcId(users.getSiteCode());
		int SortOrder = VtcPaidService.getDCSortOrder(users.getSiteCode());
		
		model.addAttribute("dcid", DCID + 1);
		model.addAttribute("SortOrder", SortOrder + 1);
		
		
		return "basic/paid/DCType_insert";
	}
	@RequestMapping(value="insertDcTypeOK.do")
	public String insertDcTypeOK(HttpServletRequest request, DC dc, ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		
		dc.setSiteCode(users.getSiteCode());
		dc.setAddUserPKID(users.getUserPKID());
		
		VtcPaidService.insertDC(dc);
		return "redirect:DCType.do";
	}
	
	@RequestMapping(value="deleteDC.do")
	public String deleteDC(ModelMap model, DC dc) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		dc.setUpdUserPKID(users.getUserPKID());
		VtcPaidService.deleteDC(dc);
		return "redirect:DCType.do";
	}
	
	@RequestMapping(value="ExpenseGroup.do")
	public String selectExpenseGroup(ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		List<ExpenseGroup> list = VtcPaidService.selectExpenseGroup(users.getSiteCode());
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
	public String expenseGroupModifyOK(ExpenseGroup group, HttpServletRequest request, ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		
		group.setSiteCode(users.getSiteCode());
		group.setUpdUserPKID(users.getUserPKID());
		
		VtcPaidService.updateExpenseGroup(group);
		return "redirect:ExpenseGroup.do";
	}
	
	@RequestMapping(value="ExpenseGpInsert.do")
	public String ExpenseGroupInsert(ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		
		int SortOrder = VtcPaidService.getExGpSortOrder(users.getSiteCode());
		
		model.addAttribute("SortOrder", SortOrder + 1);
		
		return "basic/paid/expenseGroup_insert";
	}
	
	@RequestMapping(value="ExpenseGpInsertOK.do")
	public String ExpenseGroupInsertOK(ExpenseGroup group, ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		
		group.setSiteCode(users.getSiteCode());
		group.setAddUserPKID(users.getUserPKID());
		
		VtcPaidService.insertExpenseGroup(group);
		return "redirect:ExpenseGroup.do";
	}
	@RequestMapping(value="deleteExpGp.do")
	public String deleteExpGp(ModelMap model, ExpenseGroup group) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		group.setUpdUserPKID(users.getUserPKID());
		VtcPaidService.deleteExpenseGroup(group);
		return "redirect:ExpenseGroup.do";
	}
	
	
	
	@RequestMapping(value="Expense.do")
	public String selectExpense(ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		List<Expense> list = VtcPaidService.selectExpense(users.getSiteCode());
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
	public String ExpenseInsert(Expense expense, HttpServletRequest request, ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		List<ExpenseGroup> list = VtcPaidService.selectExpenseGroup(users.getSiteCode());
		int SortOrder = VtcPaidService.getExSortOrder(users.getSiteCode());
		
		model.addAttribute("list", list);
		model.addAttribute("SortOrder", SortOrder + 1);
		return "basic/paid/expense_insert";
	}
	
	@RequestMapping(value="ExpenseInsertOK.do")
	public String ExpenseInsertOK(Expense expense, HttpServletRequest request, ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		
		expense.setSiteCode(users.getSiteCode());
		expense.setAddUserPKID(users.getUserPKID());
		
		VtcPaidService.insertExpense(expense);
		return "redirect:Expense.do";
	}
	@RequestMapping(value="deleteExp.do")
	public String deleteExpense(ModelMap model, Expense expense) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		expense.setSiteCode(users.getSiteCode());
		expense.setUpdUserPKID(users.getUserPKID());
		
		VtcPaidService.deleteExpense(expense);
		return "redirect:Expense.do";
	}	
	
	@ResponseBody
	@PostMapping("/tblpaidinsert")
	public String tblpaidinsert(tblpaid tblpaid) throws Exception {
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			users = new Users();
		}

		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("saleDate", tblpaid.getSaleDate());
	    map.put("outputOrderNo", 0);

	    tblpaid.setReceiptNo(String.valueOf(VtcPaidService.callSelectReceiptNo(map)));
	    //tblpaid.setSiteCode(users.getSiteCode());
	    tblpaid.setAddUserPKID(users.getUserPKID());
	    tblpaid.setUpdUserPKID(users.getUserPKID());
	    //log.debug(tblpaid.toString());
	    VtcPaidService.tblpaidinsert(tblpaid);
	    if(!tblpaid.getPayType().equals("현금")
	    &&!tblpaid.getPayType().equals("계좌이체")) {
	    	VtcPaidService.tblElecAssignDataInsert(tblpaid);	
	    }
	    //return "success";
	    return ""+tblpaid.getPKID();
	}
}