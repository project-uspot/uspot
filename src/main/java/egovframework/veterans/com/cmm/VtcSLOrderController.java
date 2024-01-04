package egovframework.veterans.com.cmm;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.veterans.com.cmm.service.VtcSLOrderService;
import egovframework.veterans.com.cmm.service.vo.SLOrderGroup;
import egovframework.veterans.com.cmm.service.vo.SLOrderItem;
import egovframework.veterans.com.cmm.service.vo.Users;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class VtcSLOrderController {
	
	private final HttpSession session;
	private final VtcSLOrderService VtcSLService;

	@RequestMapping(value="SLOrderGroup.do")
	public String selectSLOrder(ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		List<SLOrderGroup> list = VtcSLService.selectSLOrderGroup(users.getSiteCode());
		model.addAttribute("list", list);
		return "basic/orders/orderGroup";
	}
	
	@RequestMapping(value="OrderGroupUpd.do")
	public String orderGroupModify(SLOrderGroup group, ModelMap model) throws Exception {
		group = VtcSLService.getOrderGroupDetail(group);
		
		
		model.addAttribute("group", group);
		return "basic/orders/orderGroup_modity";
	}
	@RequestMapping(value="OrderGroupUpdOK.do")
	public String orderGroupModifyOK(SLOrderGroup group) throws Exception {
		VtcSLService.updateOrderGroup(group);
		return "redirect:SLOrderGroup.do";
	}
	
	@RequestMapping(value="OrderGpInsert.do")
	public String orderGroupInsert(ModelMap model) throws Exception {
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		int SortOrder = VtcSLService.getGroupSortOrder(users.getSiteCode());
		model.addAttribute("sortorder", SortOrder + 1);
		return "basic/orders/orderGroup_insert";
	}
	
	@RequestMapping(value="OrderGpInsertOK.do")
	public String orderGroupInsertOK(SLOrderGroup group, ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		group.setSiteCode(users.getSiteCode());
		group.setAddUserPKID(users.getUserPKID());
		
		VtcSLService.insertOrderGroup(group);
		return "redirect:SLOrderGroup.do";
	}
	@RequestMapping(value="deleteSlGp.do")
	public String deleteOrderGroup(ModelMap model, SLOrderGroup group) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		group.setUpdDatePKID(users.getUserPKID());
		
		VtcSLService.deleteOrderGroup(group);
		return "redirect:SLOrderGroup.do";
	}
	
	
	
	@RequestMapping(value="SLOrderItem.do")
	public String selectSLOrderItem(ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		
		List<SLOrderItem> list = VtcSLService.listSLOderItem(users.getSiteCode());
		model.addAttribute("list", list);
		return "basic/orders/orderItem";
	}
	@RequestMapping(value="OrderItemUpd.do")
	public String orderItemModify(SLOrderItem item, ModelMap model, HttpServletRequest request) throws Exception {
		
		String SiteCode = request.getParameter("SiteCode");
		List<SLOrderGroup> list = VtcSLService.selectSLOrderGroup(SiteCode);
		
		item = VtcSLService.getOrderItemDetail(item);
		
		model.addAttribute("list", list);
		model.addAttribute("item", item);
		return "basic/orders/orderItem_modity";
	}
	
	@RequestMapping(value="OrderItemUpdOK.do")
	public String orderItemModifyOK( SLOrderItem item, ModelMap model) throws Exception {
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		item.setSiteCode(users.getSiteCode());
		item.setUpdUserPKID(users.getUserPKID());
		
		VtcSLService.updateOrderItem(item);
		
		return "redirect:SLOrderItem.do";
	}
	
	@RequestMapping(value="OrderItemInsert.do")
	public String OrderItemInsert(ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}
		
		int SortOrder = VtcSLService.getItemSortOrder(users.getSiteCode());
		
		List<SLOrderGroup> list = VtcSLService.selectSLOrderGroup(users.getSiteCode());
		
		model.addAttribute("sortorder", SortOrder + 1);
		model.addAttribute("list", list);
		return "basic/orders/orderItem_insert";
	}
	
	@RequestMapping(value="OrderItemInsertOk.do")
	public String OrderItemInsertOK(ModelMap model, SLOrderItem item) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		if(users == null){
			model.addAttribute("msg", "로그인을 다시 해주세요.");
			model.addAttribute("script", "back");
			return "redirect:login.do";
		}

		item.setSiteCode(users.getSiteCode());
		item.setAddUserPKID(users.getUserPKID());
		
		VtcSLService.insertOrderItem(item);
		return "redirect:SLOrderItem.do";
	}
	@RequestMapping(value="deleteDsItem.do")
	public String deleteOrderItem(ModelMap model, SLOrderItem item) throws Exception {
		VtcSLService.deleteOrderItem(item);
		return "redirect:SLOrderItem.do";
	}
}
