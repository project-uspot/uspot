package egovframework.veterans.com.cmm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.veterans.com.cmm.service.VtcItemService;
import egovframework.veterans.com.cmm.service.VtcSLOrderService;
import egovframework.veterans.com.cmm.service.vo.SLOrderGroup;
import egovframework.veterans.com.cmm.service.vo.SLOrderItem;
import egovframework.veterans.com.cmm.service.vo.Users;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class VtcEntryController{
   
   private final HttpSession session;
 
   private final VtcItemService vtcItemService;
   
   private final VtcSLOrderService orderService;
   
   // TODO 출입관리-일일입장관리
   @GetMapping("OneDayOrder.do")
   public String OneDayOrder(ModelMap model) throws Exception {
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
	       model.addAttribute("script", "back");
		   return "redirect:login.do";
	   }
	   
	   List<SLOrderGroup> group = orderService.selectSLOrderGroup(users.getSiteCode());
	   List<SLOrderItem> item = orderService.listSLOderItem(users.getSiteCode());
	   
	   System.out.println("item : " + item);
	   
	   model.addAttribute("group", group);
	   model.addAttribute("item", item);
	   
	   return "entry/oneday/oneDayOrder";
   }
   
   @PostMapping("/GroupValue")
   @ResponseBody
   public Map<String, Object> groupValue(ModelMap model,
		   @RequestParam(name = "value") int value
		   ) throws Exception{
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   
	   
	   Map<String, Object> pkid = new HashMap<>();
	   
	   pkid.put("SiteCode", users.getSiteCode());
	   pkid.put("value", value);
	   
	   
	   List<SLOrderItem> groups = orderService.listGroupItem(pkid);
	   
	   
	   
	   Map<String, Object> map = new HashMap<>();
	   
	   map.put("size", groups.size());
	   map.put("list", groups);
	   
	   return map;
   }
   
   // TODO 출입관리- 출입관리
   @GetMapping("entryManage.do")
   public String memEntryManage(ModelMap model) throws Exception {
	   Users users = (Users) session.getAttribute("loginuserinfo");
	   if(users == null){
		   model.addAttribute("msg", "로그인을 다시 해주세요.");
	       model.addAttribute("script", "back");
		   return "redirect:login.do";
	   }
	   
	   return "entry/entryManage";
   }
}