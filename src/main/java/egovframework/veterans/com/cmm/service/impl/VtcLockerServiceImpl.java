package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.veterans.com.cmm.service.VtcLockerService;
import egovframework.veterans.com.cmm.service.vo.tblplockergroup;
import egovframework.veterans.com.cmm.service.vo.lockercodelist;
import egovframework.veterans.com.cmm.service.vo.tblplocker;
import egovframework.veterans.com.cmm.service.vo.memberuselocker;

@Service("VtcSamulhamService")
public class VtcLockerServiceImpl extends EgovAbstractServiceImpl implements VtcLockerService{
	
	@Resource(name="VtcSamulhamDAO")
	private VtcLockerDAO vtcSamulhamDAO;
	
	@Override
	public List<tblplockergroup> selectSamulhamInfoList(String SiteCode) throws Exception{
		
		return vtcSamulhamDAO.selectSamulhamInfoList(SiteCode);
	}

	@Override
	public tblplockergroup selectSamulhamInfodetail(int lockergroupIid) throws Exception {
	
		return vtcSamulhamDAO.selectSamulhamInfodetail(lockergroupIid);
	}

	@Override
	public List<lockercodelist> lockercodelist(tblplocker tblplocker) throws Exception {
		
		return vtcSamulhamDAO.lockercodelist(tblplocker);
	}

	@Override
	public int maxsortorder(String SiteCode) throws Exception {

		return vtcSamulhamDAO.maxsortorder(SiteCode);
	}

	@Override
	public int plockernovalue(tblplockergroup tblplockergroup) throws Exception {

		return vtcSamulhamDAO.plockernovalue(tblplockergroup);
	}

	@Override
	public void lockercodeinsert(tblplocker tblplocker) throws Exception {
		
		vtcSamulhamDAO.lockercodeinsert(tblplocker);
	}

	@Override
	public List<tblplocker> plockernolist(tblplocker tblplocker) throws Exception {

		return vtcSamulhamDAO.plockernolist(tblplocker);
	}

	@Override
	public tblplocker lockervobyplockerid(tblplocker tblplocker) throws Exception {

		return vtcSamulhamDAO.lockervobyplockerid(tblplocker);
	}

	@Override
	public void lockercodeupdate(tblplocker tblplocker) throws Exception {
		
		vtcSamulhamDAO.lockercodeupdate(tblplocker);
	}

	@Override
	public List<memberuselocker> memberuselocker(String MemberID)
			throws Exception {

		return vtcSamulhamDAO.memberuselocker(MemberID);
	}

	@Override
	public List<Map<String,Object>> plockerByGroupID(tblplockergroup tblplockergroup) throws Exception {
		return vtcSamulhamDAO.plockerByGroupID(tblplockergroup);
	}
	
}
