package egovframework.veterans.com.cmm;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.veterans.com.cmm.service.VtcSLOrderService;
import egovframework.veterans.com.cmm.service.vo.SLOrderGroup;
import egovframework.veterans.com.cmm.service.vo.SLOrderItem;

@Controller
public class VtcSLOrderController {

	private ApplicationContext applicationContext;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(VtcSLOrderController.class);
	
	public void afterPropertiesSet() throws Exception{}
	
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
		
		LOGGER.info("VtcPaidController setApplicationContext method has called!");
	}
	
	@Resource(name="VtcSLOrderService")
	protected VtcSLOrderService VtcSLService;
	
	
	@RequestMapping(value="SLOrderGroup.do")
	public String selectSLOrder(String SiteCode, ModelMap model) throws Exception {
		SiteCode = "10001";
		List<SLOrderGroup> list = VtcSLService.selectSLOrderGroup(SiteCode);
		model.addAttribute("list", list);
		return "basic/orders/orderGroup";
	}
	
	@RequestMapping(value="OrderGroupUpd.do")
	public String orderGroupModify(SLOrderGroup group, ModelMap model) throws Exception {
		group = VtcSLService.getOrderGroupDetail(group);
		
		System.out.println("group : " + group);
		
		model.addAttribute("group", group);
		return "basic/orders/orderGroup_modity";
	}
	@RequestMapping(value="OrderGroupUpdOK.do")
	public String orderGroupModifyOK(HttpServletRequest request, SLOrderGroup group) throws Exception {
		String SiteCode = request.getParameter("SiteCode");
		int pkid = Integer.parseInt(request.getParameter("pkid"));
		String GroupName = request.getParameter("GroupName");
		int GroupJungWon = Integer.parseInt(request.getParameter("GroupJungWon"));
		int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
		String ParkingTimeWeek = request.getParameter("ParkingTimeWeek");
		String ParkingTimeWeekend = request.getParameter("ParkingTimeWeekend");
		String UpdDate = request.getParameter("UpdDate");
		
		group = new SLOrderGroup();
		group.setSiteCode(SiteCode);
		group.setPkid(pkid);
		group.setGroupName(GroupName);
		group.setGroupJungWon(GroupJungWon);
		group.setSortOrder(SortOrder);
		group.setParkingTimeWeek(ParkingTimeWeek);
		group.setParkingTimeWeekend(ParkingTimeWeekend);
		group.setUpdDate(UpdDate);
		VtcSLService.updateOrderGroup(group);
		return "redirect:SLOrderGroup.do";
	}
	
	@RequestMapping(value="OrderGpInsert.do")
	public String orderGroupInsert(HttpServletRequest request, SLOrderGroup group) throws Exception {
		return "basic/orders/orderGroup_insert";
	}
	@RequestMapping(value="OrderGpInsertOK.do")
	public String orderGroupInsertOK(HttpServletRequest request, SLOrderGroup group) throws Exception {
		String SiteCode = "10001";
		String GroupName = request.getParameter("GroupName");
		int GroupJungWon = Integer.parseInt(request.getParameter("GroupJungWon"));
		String ParkingTimeWeek = request.getParameter("ParkingTimeWeek");
		String ParkingTimeWeekend = request.getParameter("ParkingTimeWeekend");
		int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
		
		group = new SLOrderGroup();
		group.setSiteCode(SiteCode);
		group.setGroupName(GroupName);
		group.setGroupJungWon(GroupJungWon);
		group.setParkingTimeWeek(ParkingTimeWeek);
		group.setParkingTimeWeekend(ParkingTimeWeekend);
		group.setSortOrder(SortOrder);
		VtcSLService.insertOrderGroup(group);
		return "redirect:SLOrderGroup.do";
	}
	@RequestMapping(value="deleteSlGp.do")
	public String deleteOrderGroup(ModelMap model, SLOrderGroup group) throws Exception {
		VtcSLService.deleteOrderGroup(group);
		return "redirect:SLOrderGroup.do";
	}
	
	
	
	@RequestMapping(value="SLOrderItem.do")
	public String selectSLOrderItem(String SiteCode, ModelMap model) throws Exception {
		SiteCode = "10001";
		List<SLOrderItem> list = VtcSLService.listSLOderItem(SiteCode);
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
	public String orderItemModifyOK(HttpServletRequest request, SLOrderItem item) throws Exception {
		String SiteCode = request.getParameter("SiteCode");
		int pkid = Integer.parseInt(request.getParameter("pkid"));
		String ItemName = request.getParameter("ItemName");
		String ShortName = request.getParameter("ShortName");
		int GroupCode = Integer.parseInt(request.getParameter("GroupCode"));
		String FromTime = request.getParameter("FromTime");
		String ToTime = request.getParameter("ToTime");
		String AdultGBN = request.getParameter("AdultGBN");
		String Gender = request.getParameter("Gender");
		String dcType = request.getParameter("dcType");
		String Price = request.getParameter("Price");
		String vat = request.getParameter("vat");
		String Nvat = request.getParameter("Nvat");
		int Jungwon = Integer.parseInt(request.getParameter("Jungwon"));
		String Mon = request.getParameter("Mon");
		String Tue = request.getParameter("Tue");
		String Wed = request.getParameter("Wed");
		String Thu = request.getParameter("Thu");
		String Fri = request.getParameter("Fri");
		String Sat = request.getParameter("Sat");
		String Sun = request.getParameter("Sun");
		String UpJang = request.getParameter("UpJang");
		String KioskYN = request.getParameter("KioskYN");
		int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
		String UpdDate = request.getParameter("UpdDate");
		
		item = new SLOrderItem();
		item.setSiteCode(SiteCode);
		item.setPkid(pkid);
		item.setItemName(ItemName);
		item.setShortName(ShortName);
		item.setGroupCode(GroupCode);
		item.setFromTime(FromTime);
		item.setToTime(ToTime);
		item.setAdultGBN(AdultGBN);
		item.setGender(Gender);
		item.setDcType(dcType);
		item.setPrice(Price);
		item.setVat(vat);
		item.setNvat(Nvat);
		item.setJungwon(Jungwon);
		item.setMon(Mon);
		item.setTue(Tue);
		item.setWed(Wed);
		item.setThu(Thu);
		item.setFri(Fri);
		item.setSat(Sat);
		item.setSun(Sun);
		item.setUpJang(UpJang);
		item.setKioskYN(KioskYN);
		item.setSortOrder(SortOrder);
		item.setUpdDate(UpdDate);
		VtcSLService.updateOrderItem(item);
		
		return "redirect:SLOrderItem.do";
	}
	
	@RequestMapping(value="OrderItemInsert.do")
	public String OrderItemInsert(HttpServletRequest request, ModelMap model, String SiteCode) throws Exception {
		SiteCode = "10001";
		List<SLOrderGroup> list = VtcSLService.selectSLOrderGroup(SiteCode);
		model.addAttribute("list", list);
		return "basic/orders/orderItem_insert";
	}
	
	@RequestMapping(value="OrderItemInsertOk.do")
	public String OrderItemInsertOK(HttpServletRequest request, SLOrderItem item) throws Exception {
		String SiteCode = "10001";
		String ItemName = request.getParameter("ItemName");
		String ShortName = request.getParameter("ShortName");
		int GroupCode = Integer.parseInt(request.getParameter("GroupCode"));
		String FromTime = request.getParameter("FromTime");
		String ToTime = request.getParameter("ToTime");
		String AdultGBN = request.getParameter("AdultGBN");
		String Gender = request.getParameter("Gender");
		String dcType = request.getParameter("dcType");
		String Price = request.getParameter("Price");
		String vat = request.getParameter("vat");
		String Nvat = request.getParameter("Nvat");
		int Jungwon = Integer.parseInt(request.getParameter("Jungwon"));
		String Mon = request.getParameter("Mon");
		String Tue = request.getParameter("Tue");
		String Wed = request.getParameter("Wed");
		String Thu = request.getParameter("Thu");
		String Fri = request.getParameter("Fri");
		String Sat = request.getParameter("Sat");
		String Sun = request.getParameter("Sun");
		String UpJang = request.getParameter("UpJang");
		String KioskYN = request.getParameter("KioskYN");
		int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
		String UpdDate = request.getParameter("UpdDate");
		
		item = new SLOrderItem();
		item.setSiteCode(SiteCode);
		item.setItemName(ItemName);
		item.setShortName(ShortName);
		item.setGroupCode(GroupCode);
		item.setFromTime(FromTime);
		item.setToTime(ToTime);
		item.setAdultGBN(AdultGBN);
		item.setGender(Gender);
		item.setDcType(dcType);
		item.setPrice(Price);
		item.setVat(vat);
		item.setNvat(Nvat);
		item.setJungwon(Jungwon);
		item.setMon(Mon);
		item.setTue(Tue);
		item.setWed(Wed);
		item.setThu(Thu);
		item.setFri(Fri);
		item.setSat(Sat);
		item.setSun(Sun);
		item.setUpJang(UpJang);
		item.setKioskYN(KioskYN);
		item.setSortOrder(SortOrder);
		item.setUpdDate(UpdDate);
		VtcSLService.insertOrderItem(item);
		return "redirect:SLOrderItem.do";
	}
	@RequestMapping(value="deleteDsItem.do")
	public String deleteOrderItem(ModelMap model, SLOrderItem item) throws Exception {
		VtcSLService.deleteOrderItem(item);
		return "redirect:SLOrderItem.do";
	}
}
