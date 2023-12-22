package egovframework.veterans.com.cmm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import egovframework.veterans.com.cmm.service.VtcItemService;
import egovframework.veterans.com.cmm.service.VtcSamulhamService;
import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.TblItem_01;
import egovframework.veterans.com.cmm.service.vo.TblItem_02;
import egovframework.veterans.com.cmm.service.vo.TblItem_03;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.lockercodelist;
import egovframework.veterans.com.cmm.service.vo.tblplocker;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ajaxcontroller {

private final HttpSession session;
	
	
	@Resource(name="VtcSamulhamService")
	protected VtcSamulhamService vtcSamulhamService;
	
	@Resource(name="VtcItemService")
	protected VtcItemService VtcItemService;
	
	@Resource(name="VtcService")
	protected VtcService VtcServise;
	
	
	
	@GetMapping(value="lockercodelistfind.do")
	public @ResponseBody Map<String,Object> lockercodelistfind(tblplocker tblplocker) throws Exception{
		
		Map<String,Object> lockerlist = new HashMap<>();
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		tblplocker.setSiteCode(users.getSiteCode());
		List<lockercodelist> lockercodelist = vtcSamulhamService.lockercodelist(tblplocker);
		

		lockerlist.put("size", lockercodelist.size());
		lockerlist.put("commentList", lockercodelist);
		return lockerlist;
	}
	
	@GetMapping(value="itemCodeList.do")
	public @ResponseBody Map<String, Object> itemListCode() throws Exception {
		
		Map<String, Object> itemList = new HashMap<>();
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		Map<String, Object> obMap = new HashMap<>();
		obMap.put("SiteCode", users.getSiteCode());
		obMap.put("IsDelete", "N");
		
		TblItem_01 item_01 = new TblItem_01();
		item_01.setSiteCode(users.getSiteCode());
		
		TblItem_02 item_02 = new TblItem_02();
		item_02.setSiteCode(users.getSiteCode());
		
		TblItem_03 item_03 = new TblItem_03();
		item_03.setSiteCode(users.getSiteCode());
				
		
		List<TblItem_01> listItem01 = VtcItemService.listItemCode(item_01);
		List<TblItem_02> listItem02 = VtcItemService.listItem02(item_02);
		List<TblItem_03> listItem03 = VtcItemService.liseItem03(item_03);
		
		itemList.put("item01", listItem01);
		itemList.put("item02", listItem02);
		itemList.put("item03", listItem03);
	
		return itemList;
	}
}
