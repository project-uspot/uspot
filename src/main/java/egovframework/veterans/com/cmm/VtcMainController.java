package egovframework.veterans.com.cmm;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.PGM;
import egovframework.veterans.com.cmm.service.vo.Sitecode;

@Controller
@SessionAttributes("loginuserinfo")
public class VtcMainController implements ApplicationContextAware, InitializingBean {
	private ApplicationContext applicationContext;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(VtcMainController.class);
	
	public void afterPropertiesSet() throws Exception {}
	
	
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
		
		LOGGER.info("VtcMainController setApplicationContext method has called!");
	}
	
	@Resource(name="VtcService")
	protected VtcService VtcService;
	
	
	@RequestMapping(value="/main.do")
	public String Main(ModelMap model, String SiteCode,HttpSession session) throws Exception {
		LOGGER.info("메인페이지");
		/*SiteCode = "10001";
		Sitecode list = VtcService.selectSiteCode(SiteCode);
		model.addAttribute("list", list);*/
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
	public String selectArticleList(PGM pgm,@RequestParam(name = "siteCode",defaultValue="10001")String SiteCode, ModelMap model, HttpServletRequest request) throws Exception {
		
		pgm = VtcService.selectPGMInfo(pgm);
		
		Sitecode list = VtcService.selectSiteCode(SiteCode);
		
		model.addAttribute("list", list);
		model.addAttribute("pgm", pgm);
		return "basic/sitecode";
	}
	
	@RequestMapping(value="/siteDetail.do") 
	public String sitecodeDetail( ModelMap model, HttpServletRequest request) throws Exception{
		String SiteCode = "10001";
		model.addAttribute("sitecode", VtcService.selectSiteCode(SiteCode));
		return "basic/detail";
	}
	
	@RequestMapping(value="siteModify.do")
	public String sitecodeModify(ModelMap model, String SiteCode, HttpServletRequest request) throws Exception {
		model.addAttribute("sitecode", VtcService.selectSiteCode(SiteCode));
		return "basic/modify";
	}
	
	@RequestMapping(value="modifyOK.do")
	public String sitecodeModifyOK(String Sitecode, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String SiteCode = request.getParameter("SiteCode");
		String SiteID 	= request.getParameter("SiteID");
		String SiteName = request.getParameter("SiteName");
		String SiteBNo  = request.getParameter("SiteBNo");
		String Pname 	= request.getParameter("Pname");
		String UpTae	= request.getParameter("UpTae");
		String JongMok  = request.getParameter("JongMok");
		String Phone2  	= request.getParameter("Phone2");
		String ZipCode = request.getParameter("ZipCode");
		String SubAddress = request.getParameter("SubAddress");
		String Address = request.getParameter("Address");
		String Phone1 = request.getParameter("Phone1");
		String Fax = request.getParameter("Fax");
		String Email = request.getParameter("Email");
		String DamDangJa = request.getParameter("DamDangJa");
		String DamDangJaPhone = request.getParameter("DamDangJaPhone");
		String Note = request.getParameter("Note");
		
		System.out.println(UpTae);
		System.out.println(Phone2);
		
		Sitecode sitecode = VtcService.selectSiteCode(Sitecode);
		
		sitecode = new Sitecode();
		sitecode.setSiteCode(SiteCode);
		sitecode.setSiteID(SiteID);
		sitecode.setSiteName(SiteName);
		sitecode.setSiteBNo(SiteBNo);
		sitecode.setPname(Pname);
		sitecode.setUpTae(UpTae);
		sitecode.setJongMok(JongMok);
		sitecode.setZipCode(ZipCode);
		sitecode.setSubAddress(SubAddress);
		sitecode.setAddress(Address);
		sitecode.setPhone1(Phone1);
		sitecode.setPhone2(Phone2);
		sitecode.setFax(Fax);
		sitecode.setEmail(Email);
		sitecode.setDamDangJa(DamDangJa);
		sitecode.setDamDangJaPhone(DamDangJaPhone);
		sitecode.setNote(Note);
		
		VtcService.updateSiteCode(sitecode);
		return "redirect:siteDetail.do";
	}
	
	@RequestMapping("insertSite.do")
	public String insertSite(Sitecode sitecode, HttpServletRequest request) throws Exception {
		return "basic/site_insert";
	}
	
	@RequestMapping("insertSiteOK.do")
	public String insertSiteOK(Sitecode sitecode, HttpServletRequest request) throws Exception {
		String SiteCode = "10002";
		String SiteID = request.getParameter("SiteID");
		String SiteName = request.getParameter("SiteName");
		String SiteBNo = request.getParameter("SiteBNo");
		String Pname = request.getParameter("Pname");
		String UpTae = request.getParameter("UpTae");
		String JongMok = request.getParameter("JongMok");
		String ZipCode = request.getParameter("ZipCode");
		String SubAddress = request.getParameter("SubAddress");
		String Address = request.getParameter("Address");
		String Phone1 = request.getParameter("Phone1");
		String Phone2 = request.getParameter("Phone2");
		String Fax = request.getParameter("Fax");
		String Email = request.getParameter("Email");
		String DamDangJa = request.getParameter("DamDangJa");
		String DamDangJaPhone = request.getParameter("DamDangJaPhone");
		String Note = request.getParameter("Note"); 
		
		sitecode = new Sitecode();
		sitecode.setSiteCode(SiteCode);
		sitecode.setSiteID(SiteID);
		sitecode.setSiteName(SiteName);
		sitecode.setSiteBNo(SiteBNo);
		sitecode.setPname(Pname);
		sitecode.setUpTae(UpTae);
		sitecode.setJongMok(JongMok);
		sitecode.setZipCode(ZipCode);
		sitecode.setSubAddress(SubAddress);
		sitecode.setAddress(Address);
		sitecode.setPhone1(Phone1);
		sitecode.setPhone2(Phone2);
		sitecode.setFax(Fax);
		sitecode.setEmail(Email);
		sitecode.setDamDangJa(DamDangJa);
		sitecode.setDamDangJaPhone(DamDangJaPhone);
		sitecode.setNote(Note);
		VtcService.insertSiteCode(sitecode);
		
		return "redirect:selecSitecode.do";
	}
	
	@RequestMapping(value="deleteSite.do")
	public String deleteSiteCode(ModelMap model, Sitecode sitecode) throws Exception {
		VtcService.deleteSiteCode(sitecode);
		return "redirect:selecSitecode.do";
	}
	
}
