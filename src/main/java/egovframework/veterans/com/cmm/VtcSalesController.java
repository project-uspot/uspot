package egovframework.veterans.com.cmm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.veterans.com.cmm.service.VtcPaidService;
import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.settlemnetlist;
import egovframework.veterans.com.cmm.service.vo.tblpaid;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class VtcSalesController {

	private final HttpSession session;
	private final VtcService vtcService;
	private final VtcPaidService paidService;
	
	@GetMapping("settlemnetlist.do")
	public String settlemnetlist(Model model, tblpaid tblpaid) throws Exception {
		
		Users users=(Users) session.getAttribute("loginuserinfo");
		if(users == null){
			
			return "redirect:login.do";
		}
		Sitecode sitecode = vtcService.selectSiteCode(users.getSiteCode());
		
		model.addAttribute("sitename",sitecode.getSiteName());
		
		return "sales/settlement/settlemnetlist";
	}
	
	
	@PostMapping("/settlemnetlist")
	@ResponseBody
	public Map<String, Object> settlemnetlist(tblpaid tblpaid,
			@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate
			) throws Exception {
		Users users=(Users) session.getAttribute("loginuserinfo");
		
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate);
		tblpaid.setSiteCode(users.getSiteCode());
		
		
		System.out.println(tblpaid);
		Map<String, Object> fmmap = new HashMap<>();
		fmmap.put("tblpaid", tblpaid);
		fmmap.put("startDate", startDate);
		fmmap.put("endDate", endDate);
		
		System.out.println("fmmap : " + fmmap);
		
		List<settlemnetlist> settlemnetlists = paidService.settlemnetlist(fmmap);
		System.out.println("settlemnetlists : " + settlemnetlists);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", settlemnetlists);
		return map;
	}
	
}
