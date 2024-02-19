package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.veterans.com.cmm.service.VtcLockerService;
import egovframework.veterans.com.cmm.service.vo.tblplockergroup;
import egovframework.veterans.com.cmm.service.vo.tbluselocker;
import lombok.RequiredArgsConstructor;
import egovframework.veterans.com.cmm.service.vo.lockercodelist;
import egovframework.veterans.com.cmm.service.vo.tblplocker;
import egovframework.veterans.com.cmm.service.vo.memberuselocker;
import egovframework.veterans.com.cmm.service.vo.tbldeposite;

@Service
@RequiredArgsConstructor
public class VtcLockerServiceImpl extends EgovAbstractServiceImpl implements VtcLockerService{
	
	
	private final VtcLockerDAO vtcLockerDAO;
	
	@Override
	public List<tblplockergroup> selectSamulhamInfoList(String SiteCode) throws Exception{
		
		return vtcLockerDAO.selectSamulhamInfoList(SiteCode);
	}

	@Override
	public tblplockergroup selectSamulhamInfodetail(int lockergroupIid) throws Exception {
	
		return vtcLockerDAO.selectSamulhamInfodetail(lockergroupIid);
	}

	@Override
	public List<lockercodelist> lockercodelist(tblplocker tblplocker) throws Exception {
		
		return vtcLockerDAO.lockercodelist(tblplocker);
	}

	@Override
	public int maxsortorder(String SiteCode) throws Exception {

		return vtcLockerDAO.maxsortorder(SiteCode);
	}

	@Override
	public int plockernovalue(tblplockergroup tblplockergroup) throws Exception {

		return vtcLockerDAO.plockernovalue(tblplockergroup);
	}

	@Override
	public void lockercodeinsert(tblplocker tblplocker) throws Exception {
		
		vtcLockerDAO.lockercodeinsert(tblplocker);
	}

	@Override
	public List<tblplocker> plockernolist(tblplocker tblplocker) throws Exception {

		return vtcLockerDAO.plockernolist(tblplocker);
	}

	@Override
	public tblplocker lockervobyplockerid(tblplocker tblplocker) throws Exception {

		return vtcLockerDAO.lockervobyplockerid(tblplocker);
	}

	@Override
	public void lockercodeupdate(tblplocker tblplocker) throws Exception {
		
		vtcLockerDAO.lockercodeupdate(tblplocker);
	}

	@Override
	public List<memberuselocker> memberuselocker(String MemberID)
			throws Exception {

		return vtcLockerDAO.memberuselocker(MemberID);
	}

	@Override
	public List<Map<String,Object>> plockerByGroupID(tblplockergroup tblplockergroup) throws Exception {
		return vtcLockerDAO.plockerByGroupID(tblplockergroup);
	}

	@Override
	public void UpdClickTime(tblplocker tblplocker) throws Exception {
		vtcLockerDAO.UpdClickTime(tblplocker);
	}

	@Override
	public Map<String, Object> PLockerJoinGroupByID(tblplocker tblplocker) throws Exception {
		return vtcLockerDAO.PLockerJoinGroupByID(tblplocker);
	}

	@Override
	public String ClickTimeByID(tblplocker tblplocker) throws Exception {
		return vtcLockerDAO.ClickTimeByID(tblplocker);
	}

	@Override
	public void useLockerInsert(tbluselocker tbluselocker) throws Exception {
		vtcLockerDAO.useLockerInsert(tbluselocker);
	}

	@Override
	public void UpdPLocker(tblplocker tblplocker) throws Exception {
		vtcLockerDAO.UpdPLocker(tblplocker);
	}

	@Override
	public tbluselocker useLockerByPKID(tbluselocker tbluselocker) throws Exception {
		return vtcLockerDAO.useLockerByPKID(tbluselocker);
	}

	@Override
	public void DepositeInsert(tbldeposite tbldeposite) throws Exception {
		vtcLockerDAO.DepositeInsert(tbldeposite);
	}

	@Override
	public tbldeposite DepositeByMemberID(tbldeposite tbldeposite) throws Exception {
		return vtcLockerDAO.DepositeByMemberID(tbldeposite);
	}
}
