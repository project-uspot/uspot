package egovframework.veterans.com.cmm;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Marker;
import org.slf4j.MarkerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.veterans.com.cmm.service.VtcRentService;
import egovframework.veterans.com.cmm.service.VtcUserService;
import egovframework.veterans.com.cmm.service.vo.TblAuthuserGroup;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.tblrent_part;
import egovframework.veterans.com.cmm.service.vo.tblrent_place;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.s;

@Slf4j
@Controller
@RequiredArgsConstructor
public class VtcRentController {
	
	private final HttpSession session;
	private final VtcUserService vtcUserService;
	private final VtcRentService vtcRentService;
	
	public static Marker rent = MarkerFactory.getMarker("rent");
	
	@GetMapping("/rentF.do")
	public String rentF(Model model)throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			model.addAttribute("msg", "세션이 만료되었습니다.다시 로그인해 주세요.");
			model.addAttribute("url", "login.do");
			model.addAttribute("script", "redirect");

			return "common/msg";
		}
		
		TblAuthuserGroup tblAuthuserGroup = new TblAuthuserGroup();
		
		tblAuthuserGroup.setSiteCode(users.getSiteCode());
		tblAuthuserGroup.setUserGroupID(users.getUserGroupID());
		tblAuthuserGroup.setPgmPKID(95);
		
		tblAuthuserGroup = vtcUserService.tblauthusergroupBypgmIDAndUserGroupID(tblAuthuserGroup);
		
		if(tblAuthuserGroup.getIsDelete().equals("Y")) {
			model.addAttribute("msg", "권한이 없습니다.");
			model.addAttribute("script", "back");

			return "common/msg";
		}
		
		List<tblrent_part> partlist = vtcRentService.rent_partBySiteCode(users.getSiteCode());
		
		model.addAttribute("partlist",partlist);
		
		return "rent/rent/rentF";
	}
	
	@ResponseBody
	@PostMapping("/placeCDChange")
	public List<tblrent_place> placeCDChange(tblrent_place tblrent_place)throws Exception{
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			
			List<tblrent_place> placelist = new ArrayList<tblrent_place>();
			
			tblrent_place sessionx = new tblrent_place();
			
			sessionx.setIsDelete("Y");
			
			placelist.add(sessionx);
			
			return placelist;
		}
		
		tblrent_place.setSiteCode(users.getSiteCode());
		
		List<tblrent_place> placelist = vtcRentService.rent_placeByPartCD(tblrent_place);
		
		return placelist;
	}
}
