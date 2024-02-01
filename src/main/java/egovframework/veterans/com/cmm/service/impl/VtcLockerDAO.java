package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.stringtemplate.v4.compiler.CodeGenerator.list_return;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.tblplockergroup;
import egovframework.veterans.com.cmm.service.vo.lockercodelist;
import egovframework.veterans.com.cmm.service.vo.memberuselocker;
import egovframework.veterans.com.cmm.service.vo.tblplocker;

@Repository("VtcSamulhamDAO")
public class VtcLockerDAO extends EgovComAbstractDAO{
	
	public List<tblplockergroup> selectSamulhamInfoList(String SiteCode) throws Exception{
		
		return selectList("locker.selectSamulhamInfoList",SiteCode);
	}
	
	public tblplockergroup selectSamulhamInfodetail(int lockergroupIid) throws Exception{
		
		return selectOne("locker.selectSamulhamInfodetail",lockergroupIid);
	}
	
	public List<lockercodelist> lockercodelist(tblplocker tblplocker) throws Exception{

		return selectList("locker.lockercodelist",tblplocker);
	}
	
	public int maxsortorder(String SiteCode) throws Exception{
		
		return selectOne("locker.maxsortorder",SiteCode);
	}
	
	public int plockernovalue(tblplockergroup tblplockergroup) throws Exception{
		
		return selectOne("locker.plockernovalue",tblplockergroup);
	}
	
	public void lockercodeinsert(tblplocker tblplocker) throws Exception {
		
		insert("locker.lockercodeinsert",tblplocker);
	}
	
	public List<tblplocker> plockernolist(tblplocker tblplocker) throws Exception{
		
		return selectList("locker.plockernolist", tblplocker);
	}
	
	public tblplocker lockervobyplockerid(tblplocker tblplocker) throws Exception{
		
		return selectOne("locker.lockervobyplockerid",tblplocker);
	}
	
	public void lockercodeupdate(tblplocker tblplocker) throws Exception{
		
		insert("locker.lockercodeupdate",tblplocker);
	}
	
	public List<memberuselocker> memberuselocker(String MemberID) throws Exception{
		
		return selectList("locker.memberuselocker", MemberID);
	}
	
	public List<tblplocker> plockerByGroupID(tblplockergroup tblplockergroup) throws Exception{
		return selectList("locker.plockerByGroupID",tblplockergroup);
	}
}
