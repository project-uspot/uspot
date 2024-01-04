package egovframework.veterans.com.cmm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.VtcUserService;
import egovframework.veterans.com.cmm.service.vo.PGMGroup;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.TblAuthuserGroup;
import egovframework.veterans.com.cmm.service.vo.UserGroup;
import egovframework.veterans.com.cmm.service.vo.Users;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class VtcUserController{
	
	private final HttpSession session;

	private final VtcUserService VtcUserService;

	private final VtcService VtcServise;

	@RequestMapping(value = "UserGroup.do")
	public String selectUserGroup(String SiteCode, ModelMap model) throws Exception {
		Users users = (Users) session.getAttribute("loginuserinfo");
		
		if(users ==null) {
			model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
			model.addAttribute("script", "back");

			return "common/msg";
		}
		
		
		List<UserGroup> list = VtcUserService.selectUserGroup(users.getSiteCode());
		model.addAttribute("list", list);
		return "basic/user/usergroup";
	}

	@RequestMapping(value = "UserGroupUpd.do")
	public String userGroupModify(ModelMap model, UserGroup group) throws Exception {
		group = VtcUserService.getUserGroupDetail(group);

		model.addAttribute("list", group);

		return "basic/user/userGroup_modify";
	}

	@RequestMapping(value = "UserGroupUpdOK.do")
	public String userGroupModifyOK(UserGroup group, HttpServletRequest request) throws Exception {
		String SiteCode = request.getParameter("SiteCode");
		int UserGroupID = Integer.parseInt(request.getParameter("UserGroupID"));
		String UserGroupName = request.getParameter("UserGroupName");
		int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
		String dbid = request.getParameter("dbid");
		String UseDBAccess = request.getParameter("UseDBAccess");
		String dbPassword = request.getParameter("dbPassword");

		group = new UserGroup();

		group.setSiteCode(SiteCode);
		group.setUserGroupID(UserGroupID);
		group.setUserGroupName(UserGroupName);
		group.setSortOrder(SortOrder);
		group.setDbid(dbid);
		group.setUseDBAccess(UseDBAccess);
		group.setDbPassword(dbPassword);
		VtcUserService.updateUserGroup(group);
		return "redirect:UserGroup.do";
	}

	@RequestMapping(value = "insertUserGroup.do")
	public String insertUserGroup(UserGroup group, HttpServletRequest request) throws Exception {
		String SiteCode = request.getParameter("SiteCode");
		System.out.println("SiteCode : " + SiteCode);
		return "basic/user/userGroup_insert";
	}

	@RequestMapping(value = "insertUserGroupOK.do")
	public String insertUserGroupOK(UserGroup group, HttpServletRequest request) throws Exception {
		String SiteCode = "10001";
		/* int UserGroupID = Integer.parseInt(request.getParameter("UserGroupID")); */
		String UserGroupName = request.getParameter("UserGroupName");
		int SortOrder = Integer.parseInt(request.getParameter("SortOrder"));
		String UseDBAccess = request.getParameter("UseDBAccess");
		String dbid = request.getParameter("dbid");
		String dbPassword = request.getParameter("dbPassword");

		group = new UserGroup();
		group.setSiteCode(SiteCode);
		/* group.setUserGroupID(UserGroupID); */
		group.setUserGroupName(UserGroupName);
		group.setSortOrder(SortOrder);
		group.setUseDBAccess(UseDBAccess);
		group.setDbid(dbid);
		group.setDbPassword(dbPassword);

		VtcUserService.insertUserGroup(group);
		return "redirect:UserGroup.do";
	}

	@RequestMapping(value = "deleteUserGroup.do")
	public String deleteUserGroup(ModelMap model, UserGroup group) throws Exception {
		VtcUserService.deleteUserGroup(group);
		return "redirect:UserGroup.do";
	}

	@GetMapping(value = "groupAuthority.do")
	public String groupAuthority(Model model) throws Exception {
		
		Users users =  (Users) session.getAttribute("loginuserinfo");

		List<UserGroup> arr_item1 = VtcUserService.selectUserGroup(users.getSiteCode());
		List<PGMGroup> arr_item2 = VtcUserService.listPGMGroup(users.getSiteCode());
		TblAuthuserGroup tblAuthuserGroup = new TblAuthuserGroup();
		tblAuthuserGroup.setSiteCode(users.getSiteCode());
		List<TblAuthuserGroup> arr_item3= VtcUserService.tblauthgroupwheredelete(tblAuthuserGroup);
		List<TblAuthuserGroup> arr_item4 = VtcUserService.listAuthUserGroup(users.getSiteCode());

		model.addAttribute("arr_item1", arr_item1);
		model.addAttribute("arr_item2", arr_item2);
		model.addAttribute("arr_item3",arr_item3);
		model.addAttribute("arr_item4", arr_item4);

		return "basic/user/userGroupAuthority";
	}

	@RequestMapping(value = "Users.do")
	public String selectUsers(String SiteCode, ModelMap model) throws Exception {
		SiteCode = "10001";
		List<Users> list = VtcUserService.listUsers(SiteCode);
		model.addAttribute("list", list);
		return "basic/user/users";
	}

	@RequestMapping(value = "UsersUpd.do")
	public String usersModify(Model model, Users users) throws Exception {
		users = VtcUserService.getUserDetail(users);

		model.addAttribute("user", users);
		return "basic/user/users_modify";
	}

	@RequestMapping(value = "UsersUpdOK.do")
	public String userModifyOK(HttpServletRequest request, Users users) throws Exception {

		VtcUserService.updateUser(users);

		return "redirect:Users.do";
	}

	@RequestMapping(value = "userInsert.do")
	public String userInsert(Users users, HttpServletRequest request, ModelMap model, String sitecode)
			throws Exception {
		List<Sitecode> list = VtcServise.listSiteName();
		model.addAttribute("list", list);
		return "basic/user/users_insert";
	}

	@RequestMapping(value = "SawonNo_check.do", method = RequestMethod.GET)
	public @ResponseBody String SawonNoCheck(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Users users = new Users();
		users.setSawonNo(request.getParameter("Sawon_No"));

		users = VtcUserService.seleceSawonNo_Chk(users);
		System.out.println("users : " + users);
		if (users != null && !users.getSawonNo().equals("")) {
			return "false";
		} else {
			return "true";
		}
	}

	@RequestMapping(value = "userID_check.do", method = RequestMethod.GET)
	public @ResponseBody String userIDCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Users users = new Users();
		users.setUserID(request.getParameter("user_id"));

		users = VtcUserService.seleceUserID_Chk(users);
		if (users != null && !users.getUserID().equals("")) {
			return "false";
		} else {
			return "true";
		}
	}

	@RequestMapping(value = "userInsertOK.do")
	public String userInsertOK(Users users) throws Exception {
		VtcUserService.insertUser(users);
		return "redirect:Users.do";
	}

	@RequestMapping(value = "delete.do")
	public String deleteUser(ModelMap model, Users users) throws Exception {
		VtcUserService.deleteUser(users);
		return "redirect:Users.do";
	}

	@RequestMapping(value = "userAuthorityGroup.do")
	public String userAuthorityGroup(String SiteCode, ModelMap model) throws Exception {
		SiteCode = "10001";
		List<Users> list = VtcUserService.userAuthorityGroup(SiteCode);
		model.addAttribute("list", list);
		return "basic/user/userAuthorityGroup";
	}

	@RequestMapping(value = "userAuthUpd.do")
	public String userAuthModify(Users users, ModelMap model, HttpServletRequest request) throws Exception {
		String SiteCode = request.getParameter("SiteCode");

		List<UserGroup> list = VtcUserService.selectUserGroup(SiteCode);

		users = VtcUserService.getUserDetail(users);

		model.addAttribute("list", list);
		model.addAttribute("user", users);
		return "basic/user/userAuthority_modify";
	}

	@RequestMapping(value = "userAuthUpdOK.do")
	public String userAuthModifyOK(Users users, HttpServletRequest request) throws Exception {
		String SiteCode = request.getParameter("SiteCode");
		String SawonNo = request.getParameter("SawonNo");
		System.out.println("SiteCode : " + SiteCode);
		int UserGroupID = Integer.parseInt(request.getParameter("UserGroupID"));

		users = new Users();
		users.setSiteCode(SiteCode);
		users.setSawonNo(SawonNo);
		users.setUserGroupID(UserGroupID);
		VtcUserService.updateUserAuth(users);
		return "redirect:userAuthorityGroup.do";
	}

	@GetMapping(value = "/login.do")
	public String MainLogin(Model model,SessionStatus status) throws Exception {
		status.setComplete();
		List<Sitecode> sitecodesname = VtcServise.listSiteName();
		model.addAttribute("list", sitecodesname);

		return "/login";
	}

	@PostMapping("/login.do")
	public String MainLoginP(Users users, Model model,HttpSession session,TblAuthuserGroup tblAuthuserGroup) {

		try {

			Users logincheck = VtcUserService.userlogincheck(users);

			if (users.getUserID().equals(logincheck.getUserID())) {
				if (users.getSiteCode().equals(logincheck.getSiteCode())) {
					if (users.getUserPWD().equals(logincheck.getUserPWD())) {
						session.setAttribute("loginuserinfo", logincheck);
						tblAuthuserGroup.setUserGroupID(logincheck.getUserGroupID());
						
						List<TblAuthuserGroup> tblAuthuserGroups = VtcUserService.tblauthusergroupbyusergroup(tblAuthuserGroup);
						System.out.println(tblAuthuserGroups);
						session.setAttribute("sessiontblAuthuserGroups", tblAuthuserGroups);
						
						return "redirect:membership.do";
					} else {

						model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
						model.addAttribute("script", "back");

						return "common/msg";
					}
				} else {
					model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
					model.addAttribute("script", "back");

					return "common/msg";
				}
			} else {
				model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
				model.addAttribute("script", "back");

				return "common/msg";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "입력하신 아이디로 검색된 사용자가 존재하지 않습니다.");
			model.addAttribute("script", "back");

			return "common/msg";
		}
	}
	
	@GetMapping("/logout.do")
	public String logout(SessionStatus status,Model model) {
		status.setComplete();
		
		model.addAttribute("msg", "로그아웃 되었습니다.");
		model.addAttribute("script", "redirect");
		model.addAttribute("url", "login.do");
		return "common/msg";
	}

	@GetMapping("/passwordchange.do")
	public String passwordchangeF() {

		return "/passwordchange";
	}

	@PostMapping("/passwordchange.do")
	public String passwordchangeP(Users users, Model model, @RequestParam("newPWD") String newPWD,
			@RequestParam("checkPWD") String checkPWD) {

		try {
			Users idcheck = VtcUserService.userlogincheck(users);

			if (users.getUserID().equals(idcheck.getUserID())) {
				if (users.getUserPWD().equals(idcheck.getUserPWD())) {
					if (newPWD.equals(checkPWD)) {
						
						users.setUserPWD(newPWD);
						VtcUserService.passwordchange(users);
						
						model.addAttribute("msg", "비밀번호가 변경되었습니다");
						model.addAttribute("script", "shutdown");

						return "common/msg";
					} else {
						model.addAttribute("msg", "새로운 패스워드와 확인 패스워드가 일치하지 않습니다");
						model.addAttribute("script", "back");

						return "common/msg";
					}
				} else {
					model.addAttribute("msg", "기존 비밀번호가 틀렸습니다.");
					model.addAttribute("script", "back");

					return "common/msg";
				}
			} else {
				model.addAttribute("msg", "입력하신 아이디로 조회된 사용자가 없습니다.");
				model.addAttribute("script", "back");

				return "common/msg";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "변경 오류 다시 입력해주세요");
			model.addAttribute("script", "back");

			return "common/msg";
		}
	}
	
	@ResponseBody
	@PostMapping("authusergrouplistY")
	public Map<String,Object> lockercodelistfind(TblAuthuserGroup tblAuthuserGroup) throws Exception{
		
		Map<String,Object> listtomap = new HashMap<>();
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		tblAuthuserGroup.setSiteCode(users.getSiteCode());
		
		List<TblAuthuserGroup> list = VtcUserService.listAuthUserGroupN(tblAuthuserGroup);
		
		listtomap.put("size", list.size());
		listtomap.put("commentList", list);
		
		return listtomap;
	}
	
	@ResponseBody
	@PostMapping("changeYN")
	public void changeYN(
			@RequestParam(required = false,value = "Sel")String Sel,
			@RequestParam(required = false,value = "Ins")String Ins,
			@RequestParam(required = false,value = "Upd")String Upd,
			@RequestParam(required = false,value = "Del")String Del,
			@RequestParam(required = false,value = "Excel")String Excel,
			@RequestParam(required = false,value = "Prt")String Prt,
			@RequestParam(required = false,value = "pkid")int pkid
			)throws Exception{
		TblAuthuserGroup tblAuthuserGroup = new TblAuthuserGroup();
		tblAuthuserGroup.setSel(Sel);
		tblAuthuserGroup.setIns(Ins);
		tblAuthuserGroup.setUpd(Upd);
		tblAuthuserGroup.setDel(Del);
		tblAuthuserGroup.setExcel(Excel);
		tblAuthuserGroup.setPrt(Prt);
		tblAuthuserGroup.setPkid(pkid);
		System.out.println(tblAuthuserGroup);
		VtcUserService.changeYN(tblAuthuserGroup);
	}
	
	@ResponseBody
	@PostMapping("authusergrouplistN")
	public Map<String, Object> authusergrouplistN(TblAuthuserGroup tblAuthuserGroup) throws Exception{
		
		Map<String, Object> listtomap = new HashMap<>();
		
		Users users =  (Users) session.getAttribute("loginuserinfo");
		
		tblAuthuserGroup.setSiteCode(users.getSiteCode());
		
		List<TblAuthuserGroup> list = VtcUserService.authusergrouplistN(tblAuthuserGroup);
		
		listtomap.put("size", list.size());
		listtomap.put("commentList", list);
		
		return listtomap;
	}
	
	@ResponseBody
	@PostMapping("authorization")
	public Map<String, Object> authorization(@RequestParam("pkidlist[]") String[] pkidlist,
			TblAuthuserGroup tblAuthuserGroup)throws Exception{
		Map<String, Object> listtomap = new HashMap<>();
		Users users =  (Users) session.getAttribute("loginuserinfo");
		tblAuthuserGroup.setSiteCode(users.getSiteCode());
		
		for(String pkid : pkidlist) {
			tblAuthuserGroup.setPkid(Integer.parseInt(pkid));
			VtcUserService.authorization(tblAuthuserGroup);
		}
		
		List<TblAuthuserGroup> list = VtcUserService.authusergrouplistN(tblAuthuserGroup);
		
		listtomap.put("size", list.size());
		listtomap.put("commentList", list);
		
		return listtomap;
	}
	
	@ResponseBody
	@PostMapping("revauthority")
	public Map<String, Object> revauthority(@RequestParam("pkidlist[]") String[] pkidlist,
			TblAuthuserGroup tblAuthuserGroup)throws Exception{
		
		Map<String, Object> listtomap = new HashMap<>();
		Users users =  (Users) session.getAttribute("loginuserinfo");
		tblAuthuserGroup.setSiteCode(users.getSiteCode());
		
		for(String pkid : pkidlist) {
			tblAuthuserGroup.setPkid(Integer.parseInt(pkid));
			VtcUserService.revauthority(tblAuthuserGroup);
		}
		
		List<TblAuthuserGroup> list = VtcUserService.listAuthUserGroupN(tblAuthuserGroup);
		
		listtomap.put("size", list.size());
		listtomap.put("commentList", list);
		
		return listtomap;
	}
	
	@ResponseBody
	@PostMapping("allchange")
	public void allchangeY(TblAuthuserGroup tblAuthuserGroup)throws Exception{
		System.out.println(tblAuthuserGroup);
		Users users =  (Users) session.getAttribute("loginuserinfo");
		tblAuthuserGroup.setSiteCode(users.getSiteCode());
			VtcUserService.allchange(tblAuthuserGroup);
	}
}