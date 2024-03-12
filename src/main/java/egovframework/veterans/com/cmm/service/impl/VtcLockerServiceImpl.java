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
	public List<tblplockergroup> LockerInfoList(tblplockergroup tblplockergroup) throws Exception{
		
		return vtcLockerDAO.LockerInfoList(tblplockergroup);
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
	public List<memberuselocker> memberuselocker(tbluselocker tbluselocker)
			throws Exception {

		return vtcLockerDAO.memberuselocker(tbluselocker);
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
	public List<tbldeposite> DepositeByMemberID(tbldeposite tbldeposite) throws Exception {
		return vtcLockerDAO.DepositeByMemberID(tbldeposite);
	}

	@Override
	public void useLockerPriceUpdate(tbluselocker tbluselocker) throws Exception {
		vtcLockerDAO.useLockerPriceUpdate(tbluselocker);
	}

	@Override
	public void UpduseLocker(tbluselocker tbluselocker) throws Exception {
		vtcLockerDAO.UpduseLocker(tbluselocker);
	}

	@Override
	public void UpdPLockerBySave(tblplocker tblplocker) throws Exception {
		vtcLockerDAO.UpdPLockerBySave(tblplocker);
	}

	@Override
	public void ReturnLocker(tblplocker tblplocker) throws Exception {
		vtcLockerDAO.ReturnLocker(tblplocker);
	}

	@Override
	public void ChangeDeposite(Map<String, Object> tbldeposite) throws Exception {
		vtcLockerDAO.ChangeDeposite(tbldeposite);
	}

	@Override
	public void ReturnuseLocker(tbluselocker tbluselocker) throws Exception {
		vtcLockerDAO.ReturnuseLocker(tbluselocker);
	}

	@Override
	public void DeleteuseLocker(tbluselocker tbluselocker) throws Exception {
		vtcLockerDAO.DeleteuseLocker(tbluselocker);
	}

	@Override
	public int DepositeOriginPKIDFind(tbldeposite tbldeposite) throws Exception {
		return vtcLockerDAO.DepositeOriginPKIDFind(tbldeposite);
	}

	@Override
	public void CanceluseLocker(tbluselocker tbluselocker) throws Exception {
		vtcLockerDAO.CanceluseLocker(tbluselocker);
	}

	@Override
	public void refundUseLocker(tbluselocker tbluselocker) throws Exception {
		vtcLockerDAO.refundUseLocker(tbluselocker);
	}

	@Override
	public List<tbldeposite> DepositeListByMember(tbldeposite tbldeposite) throws Exception {
		return vtcLockerDAO.DepositeListByMember(tbldeposite);
	}

	@Override
	public void InsertDepositeRefund(tbldeposite tbldeposite) throws Exception {
		vtcLockerDAO.InsertDepositeRefund(tbldeposite);
	}

	@Override
	public List<Integer> DepositeBySiteCode(String SiteCode) throws Exception {
		return vtcLockerDAO.DepositeBySiteCode(SiteCode);
	}

	@Override
	public void LockerInfoInsert(tblplockergroup tblplockergroup) throws Exception {
		vtcLockerDAO.LockerInfoInsert(tblplockergroup);
	}

	@Override
	public void UpdLockerGroupImage(tblplockergroup tblplockergroup) throws Exception {
		vtcLockerDAO.UpdLockerGroupImage(tblplockergroup);
	}

	@Override
	public void UpdLockerGroup(tblplockergroup tblplockergroup) throws Exception {
		vtcLockerDAO.UpdLockerGroup(tblplockergroup);
	}

	@Override
	public void RemoveLockerGroup(tblplockergroup tblplockergroup) throws Exception {
		vtcLockerDAO.RemoveLockerGroup(tblplockergroup);
	}

	@Override
	public void refundcashcheck(tbluselocker tbluselocker) throws Exception {
		vtcLockerDAO.refundcashcheck(tbluselocker);
	}
}
