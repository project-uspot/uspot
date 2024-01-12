package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.PGM;
import egovframework.veterans.com.cmm.service.vo.PGMGroup;
import egovframework.veterans.com.cmm.service.vo.TblAuthuserGroup;
import egovframework.veterans.com.cmm.service.vo.UserGroup;
import egovframework.veterans.com.cmm.service.vo.Users;

@Repository("VtcUserDAO")
public class VtcUserDAO extends EgovComAbstractDAO {

	public List<UserGroup> selectUserGroup(String SiteCode) throws Exception {
		return selectList("user.selectUserGroup", SiteCode);
	}
	public UserGroup getUserGroupDetail(UserGroup group) throws Exception {
		return selectOne("user.getUserGroupDetail", group);
	}
	public void updateUserGroup(UserGroup group) throws Exception {
		update("user.updateUserGroup", group);
	}
	public void insertUserGroup(UserGroup group) throws Exception {
		insert("user.insertUserGroup", group);
	}public void deleteUserGroup(UserGroup group) throws Exception {
		update("user.deleteUserGroup", group);
	}
	public int getGroupSortOrder(String siteCode) {
		return selectOne("user.getGroupSortOrder", siteCode);
	}

	public List<PGMGroup> listPGMGroup(String siteCode) {
		return selectList("user.listPGMGroup", siteCode);
	}
	public List<PGM> listPGM(String siteCode) {
		return selectList("user.listPGM", siteCode);
	}
	public List<TblAuthuserGroup> listAuthUserGroup(String siteCode) {
		return selectList("user.listAuthUserGroup", siteCode);
	}
	
	

	public List<Users> listUsers(String SiteCode) throws Exception {
		return selectList("user.listUsers", SiteCode);
	}
	public Users getUserDetail(Users users) throws Exception {
		return selectOne("user.getUserDetail", users);
	}
	public void updateUser(Users users) throws Exception {
		update("user.updateUser", users);
	}
	public void insertUser(Users users) throws Exception {
		insert("user.insertUser", users);
	}
	public Users seleceUserID_Chk(Users users) throws Exception {
		return selectOne("user.seleceUserID_Chk", users);
	}
	public Users seleceSawonNo_Chk(Users users) throws Exception {
		return selectOne("user.seleceSawonNo_Chk", users);
	}
	public Object deleteUser(Users users) throws Exception {
		return update("user.deleteUser", users);
	}
	

	
	public List<Users> userAuthorityGroup(String SiteCode) throws Exception {
		return selectList("user.userAuthorityGroup", SiteCode);
	}
	public void updateUserAuth(Users users) throws Exception {
		update("user.updateUserAuth", users);
	}
	
	public Users userlogincheck(Users users) throws Exception {
		return selectOne("user.userlogincheck",users);
	}
	
	public void passwordchange(Users users)throws Exception {
		update("user.passwordchange",users);
	}
	
	public List<TblAuthuserGroup> tblauthgroupwheredelete(TblAuthuserGroup tblAuthuserGroup)throws Exception{
		return selectList("user.tblauthgroupwheredelete",tblAuthuserGroup);
	}
	
	public List<TblAuthuserGroup> listAuthUserGroupN(TblAuthuserGroup tblAuthuserGroup)throws Exception{
		return selectList("user.listAuthUserGroupN", tblAuthuserGroup);
	}
	
	public void changeYN(TblAuthuserGroup tblAuthuserGroup)throws Exception{
		update("user.changeYN",tblAuthuserGroup);
	}
	
	public List<TblAuthuserGroup> authusergrouplistN(TblAuthuserGroup tblAuthuserGroup)throws Exception{
		return selectList("user.authusergrouplistN",tblAuthuserGroup);
	}
	
	public void authorization(TblAuthuserGroup tblAuthuserGroup)throws Exception{
		update("user.authorization",tblAuthuserGroup);
	}
	
	public void revauthority(TblAuthuserGroup tblAuthuserGroup)throws Exception{
		update("user.revauthority",tblAuthuserGroup);
	}
	
	public void allchange(TblAuthuserGroup tblAuthuserGroup)throws Exception{
		update("user.allchange",tblAuthuserGroup);
	}
	
	public List<Users> userlistBytype(Users users)throws Exception{
		return selectList("user.userlistBytype",users);
	}
	
	public List<TblAuthuserGroup> tblauthusergroupbyusergroup(TblAuthuserGroup tblAuthuserGroup)throws Exception{
		return selectList("user.tblauthusergroupbyusergroup",tblAuthuserGroup);
	}
	
	
}
