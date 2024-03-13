package egovframework.veterans.com.cmm.service;

import java.util.List;

import egovframework.veterans.com.cmm.service.vo.PGM;
import egovframework.veterans.com.cmm.service.vo.PGMGroup;
import egovframework.veterans.com.cmm.service.vo.TblAuthuserGroup;
import egovframework.veterans.com.cmm.service.vo.UserGroup;
import egovframework.veterans.com.cmm.service.vo.Users;

public interface VtcUserService {

	List<UserGroup> selectUserGroup(String SiteCode) throws Exception;
	UserGroup getUserGroupDetail(UserGroup group) throws Exception;
	void updateUserGroup(UserGroup group) throws Exception;
	void insertUserGroup(UserGroup group) throws Exception;
	void deleteUserGroup(UserGroup group) throws Exception;
	int getGroupSortOrder(String SiteCode) throws Exception;
	
	List<PGMGroup> listPGMGroup(String SiteCode) throws Exception;
	List<PGM> listPGM(String SiteCode) throws Exception;
	List<TblAuthuserGroup> listAuthUserGroup(String SiteCode) throws Exception;
	
	List<Users> listUsers(String SiteCode) throws Exception;
	Users getUserDetail(Users users) throws Exception;
	void updateUser(Users users) throws Exception;
	void insertUser(Users users) throws Exception;
	Users seleceUserID_Chk(Users users) throws Exception;
	Users seleceSawonNo_Chk(Users users) throws Exception;
	void deleteUser(Users users) throws Exception;
	
	List<Users> userAuthorityGroup(String SiteCode) throws Exception;
	void updateUserAuth(Users users) throws Exception;
	Users userlogincheck(Users users) throws Exception;
	void passwordchange(Users users)throws Exception;
	List<TblAuthuserGroup> tblauthgroupwheredelete(TblAuthuserGroup tblAuthuserGroup)throws Exception;
	List<TblAuthuserGroup> listAuthUserGroupN(TblAuthuserGroup tblAuthuserGroup)throws Exception;
	void changeYN(TblAuthuserGroup tblAuthuserGroup)throws Exception;
	List<TblAuthuserGroup> authusergrouplistN(TblAuthuserGroup tblAuthuserGroup)throws Exception;
	void authorization(TblAuthuserGroup tblAuthuserGroup)throws Exception;
	void revauthority(TblAuthuserGroup tblAuthuserGroup)throws Exception;
	void allchange(TblAuthuserGroup tblAuthuserGroup)throws Exception;
	List<Users> userlistBytype(Users users)throws Exception;
	List<TblAuthuserGroup> tblauthusergroupbyusergroup(TblAuthuserGroup tblAuthuserGroup)throws Exception;
	TblAuthuserGroup tblauthusergroupBypgmIDAndUserGroupID(TblAuthuserGroup tblAuthuserGroup)throws Exception;
}
