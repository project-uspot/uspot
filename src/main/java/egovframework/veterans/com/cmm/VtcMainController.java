package egovframework.veterans.com.cmm;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.PGM;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.Users;
import egovframework.veterans.com.cmm.service.vo.tblCode;
import lombok.RequiredArgsConstructor;

@Controller
@SessionAttributes("loginuserinfo")
@RequiredArgsConstructor
public class VtcMainController {

	private final VtcService VtcService;
	private final HttpSession session;
	
	
	@RequestMapping(value="/main.do")
	public String Main(ModelMap model, String SiteCode,HttpSession session) throws Exception {
		if(session.getAttribute("loginuserinfo") == null) {
			model.addAttribute("script", "redirect");
			model.addAttribute("msg", "세션이 만료되었습니다 다시 로그인해주세요");
			model.addAttribute("url","login.do");

			return "common/msg";
		}
		return "/main";
	}
	
	@RequestMapping("/AdminTop.do")
	public String top(ModelMap model, String SiteCode) throws Exception {
		/*List<?> list = VtcService.selectPGMGroupList(SiteCode);
		model.addAttribute("PGMGroup", list);*/
		return "/include/AdminTop";
	}
	
	
	@RequestMapping("/AdminLeft.do")
	public String setLeftMenu(ModelMap model, HttpServletResponse response, HttpServletRequest request) throws Exception {
		/*String SiteCode = request.getParameter("SiteCode");
		String PGMGroupID = request.getParameter("PGMGroupID");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("SiteCode", SiteCode);
		map.put("PGMGroupID", PGMGroupID);
		
		Map<String, Object> PMGmap = VtcService.selectPGMList(map);
		model.addAttribute("PMGmap", PMGmap);*/
		return "/include/AdminLeft";
	}
	
	
	@RequestMapping("selecSitecode.do")
	public String selectArticleList(PGM pgm,@RequestParam(name = "siteCode",defaultValue="10001")String SiteCode, ModelMap model) throws Exception {
		
		pgm = VtcService.selectPGMInfo(pgm);
		
		Sitecode list = VtcService.selectSiteCode(SiteCode);
		
		model.addAttribute("list", list);
		model.addAttribute("pgm", pgm);
		return "basic/sitecode";
	}
	
	@RequestMapping(value="/siteDetail.do") 
	public String sitecodeDetail(ModelMap model) throws Exception{
		String SiteCode = "10001";
		model.addAttribute("sitecode", VtcService.selectSiteCode(SiteCode));
		return "basic/detail";
	}
	
	@RequestMapping(value="siteModify.do")
	public String sitecodeModify(ModelMap model, String SiteCode) throws Exception {
		model.addAttribute("sitecode", VtcService.selectSiteCode(SiteCode));
		return "basic/modify";
	}
	
	@RequestMapping(value="modifyOK.do")
	public String sitecodeModifyOK(Sitecode Sitecode) throws Exception {
		VtcService.updateSiteCode(Sitecode);
		return "redirect:siteDetail.do";
	}
	
	@RequestMapping("insertSite.do")
	public String insertSite(Sitecode sitecode) throws Exception {
		return "basic/site_insert";
	}
	
	@RequestMapping("insertSiteOK.do")
	public String insertSiteOK(Sitecode sitecode) throws Exception {
		String SiteCode = "10002";
		sitecode.setSiteCode(SiteCode);
		VtcService.insertSiteCode(sitecode);
		
		return "redirect:selecSitecode.do";
	}
	
	@RequestMapping(value="deleteSite.do")
	public String deleteSiteCode(ModelMap model, Sitecode sitecode) throws Exception {
		VtcService.deleteSiteCode(sitecode);
		return "redirect:selecSitecode.do";
	}
	
	@PostMapping("/tblcodelist")
	@ResponseBody
	public List<String> tblcodelist(tblCode tblCode)throws Exception{
		
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		tblCode.setSiteCode(users.getSiteCode());
		tblCode.setCodeGroupID("5");
		
		List<String> codenamelist = VtcService.listcodename(tblCode);
		
		return codenamelist;
	}
}
