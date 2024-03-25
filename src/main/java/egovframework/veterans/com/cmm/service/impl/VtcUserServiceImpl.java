package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.veterans.com.cmm.service.VtcUserService;
import egovframework.veterans.com.cmm.service.vo.PGM;
import egovframework.veterans.com.cmm.service.vo.PGMGroup;
import egovframework.veterans.com.cmm.service.vo.TblAuthuserGroup;
import egovframework.veterans.com.cmm.service.vo.UserGroup;
import egovframework.veterans.com.cmm.service.vo.Users;

@Service("VtcUserService")
public class VtcUserServiceImpl extends EgovAbstractServiceImpl implements VtcUserService {
	
	@Resource(name="VtcUserDAO")
	private VtcUserDAO userDAO;

	@Override
	public List<UserGroup> selectUserGroup(String SiteCode) throws Exception {
		return userDAO.selectUserGroup(SiteCode);
	}
	@Override
	public UserGroup getUserGroupDetail(UserGroup group) throws Exception {
		return userDAO.getUserGroupDetail(group);
	}
	@Override
	public void updateUserGroup(UserGroup group) throws Exception {
		userDAO.updateUserGroup(group);
	}
	@Override
	public void insertUserGroup(UserGroup group) throws Exception {
		userDAO.insertUserGroup(group);
	}
	@Override
	public void deleteUserGroup(UserGroup group) throws Exception {
		userDAO.deleteUserGroup(group);
	}
	@Override
	public int getGroupSortOrder(String SiteCode) throws Exception {
		return userDAO.getGroupSortOrder(SiteCode);
	}
	
	@Override
	public List<PGMGroup> listPGMGroup(String SiteCode) throws Exception {
		return userDAO.listPGMGroup(SiteCode);
	}
	@Override
	public List<PGM> listPGM(String SiteCode) throws Exception {
		return userDAO.listPGM(SiteCode);
	}
	@Override
	public List<TblAuthuserGroup> listAuthUserGroup(String SiteCode) throws Exception {
		return userDAO.listAuthUserGroup(SiteCode);
	}
	
	
	@Override
	public List<Users> listUsers(String SiteCode) throws Exception {
		return userDAO.listUsers(SiteCode);
	}
	@Override
	public Users getUserDetail(Users users) throws Exception {
		return userDAO.getUserDetail(users);
	}
	
	@Override
	public void updateUser(Users users) throws Exception {
		userDAO.updateUser(users);
	}
	@Override
	public void insertUser(Users users) throws Exception {
		userDAO.insertUser(users);
	}
	@Override
	public Users seleceUserID_Chk(Users users) throws Exception {
		return userDAO.seleceUserID_Chk(users);
	}
	@Override
	public Users seleceSawonNo_Chk(Users users) throws Exception {
		return userDAO.seleceSawonNo_Chk(users);
	}
	@Override
	public void deleteUser(Users users) throws Exception {
		userDAO.deleteUser(users);
	}
	
	
	@Override
	public List<Users> userAuthorityGroup(String SiteCode) throws Exception {
		return userDAO.userAuthorityGroup(SiteCode);
	}
	
	@Override
	public void updateUserAuth(Users users) throws Exception {
		userDAO.updateUserAuth(users);
	}
	@Override
	public Users userlogincheck(Users users) throws Exception {

		return userDAO.userlogincheck(users);
	}
	@Override
	public void passwordchange(Users users) throws Exception {
		userDAO.passwordchange(users);
	}
	@Override
	public List<TblAuthuserGroup> tblauthgroupwheredelete(TblAuthuserGroup tblAuthuserGroup) throws Exception {

		return userDAO.tblauthgroupwheredelete(tblAuthuserGroup);
	}
	@Override
	public List<TblAuthuserGroup> listAuthUserGroupN(TblAuthuserGroup tblAuthuserGroup) throws Exception {

		return userDAO.listAuthUserGroupN(tblAuthuserGroup);
	}
	@Override
	public void changeYN(TblAuthuserGroup tblAuthuserGroup) throws Exception {
		userDAO.changeYN(tblAuthuserGroup);
	}
	@Override
	public List<TblAuthuserGroup> authusergrouplistN(TblAuthuserGroup tblAuthuserGroup) throws Exception {
		return userDAO.authusergrouplistN(tblAuthuserGroup);
	}
	@Override
	public void authorization(TblAuthuserGroup tblAuthuserGroup) throws Exception {
		userDAO.authorization(tblAuthuserGroup);
	}
	@Override
	public void revauthority(TblAuthuserGroup tblAuthuserGroup) throws Exception {
		userDAO.revauthority(tblAuthuserGroup);
	}
	@Override
	public void allchange(TblAuthuserGroup tblAuthuserGroup) throws Exception {
		userDAO.allchange(tblAuthuserGroup);
	}
	@Override
	public List<Users> userlistBytype(Users users) throws Exception {

		return userDAO.userlistBytype(users);
	}
	@Override
	public List<TblAuthuserGroup> tblauthusergroupbyusergroup(TblAuthuserGroup tblAuthuserGroup) throws Exception {
		return userDAO.tblauthusergroupbyusergroup(tblAuthuserGroup);
	}
	@Override
	public TblAuthuserGroup tblauthusergroupBypgmIDAndUserGroupID(TblAuthuserGroup tblAuthuserGroup) throws Exception {
		return userDAO.tblauthusergroupBypgmIDAndUserGroupID(tblAuthuserGroup);
	}
}
