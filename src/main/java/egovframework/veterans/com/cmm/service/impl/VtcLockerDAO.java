package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.tblplockergroup;
import egovframework.veterans.com.cmm.service.vo.tbluselocker;
import egovframework.veterans.com.cmm.service.vo.lockercodelist;
import egovframework.veterans.com.cmm.service.vo.memberuselocker;
import egovframework.veterans.com.cmm.service.vo.tbldeposite;
import egovframework.veterans.com.cmm.service.vo.tblplocker;

@Repository
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
	
	public List<Map<String,Object>> plockerByGroupID(tblplockergroup tblplockergroup) throws Exception{
		return selectList("locker.plockerByGroupID",tblplockergroup);
	}
	
	public void UpdClickTime(tblplocker tblplocker)throws Exception{
		update("locker.UpdClickTime",tblplocker);
	}
	
	public Map<String,Object> PLockerJoinGroupByID(tblplocker tblplocker)throws Exception{
		return selectOne("locker.PLockerJoinGroupByID",tblplocker);
	}
	
	public String ClickTimeByID(tblplocker tblplocker)throws Exception{
		return selectOne("locker.ClickTimeByID",tblplocker);
	}
	
	public void useLockerInsert(tbluselocker tbluselocker)throws Exception{
		insert("locker.useLockerInsert",tbluselocker);
	}
	
	public void UpdPLocker(tblplocker tblplocker)throws Exception{
		update("locker.UpdPLocker",tblplocker);
	}
	
	public tbluselocker useLockerByPKID(tbluselocker tbluselocker)throws Exception{
		return selectOne("locker.useLockerByPKID",tbluselocker);
	}
	
	public void DepositeInsert(tbldeposite tbldeposite)throws Exception{
		insert("locker.DepositeInsert",tbldeposite);
	}
	
	public List<tbldeposite> DepositeByMemberID(tbldeposite tbldeposite)throws Exception{
		return selectList("locker.DepositeByMemberID",tbldeposite);
	}
	public void useLockerPriceUpdate(tbluselocker tbluselocker)throws Exception{
		update("locker.useLockerPriceUpdate",tbluselocker);
	}
	
	public void UpduseLocker(tbluselocker tbluselocker)throws Exception{
		update("locker.UpduseLocker",tbluselocker);
	}
	
	public void UpdPLockerBySave(tblplocker tblplocker)throws Exception{
		update("locker.UpdPLockerBySave",tblplocker);
	}
	
	public void ReturnLocker(tblplocker tblplocker)throws Exception{
		update("locker.ReturnLocker",tblplocker);
	}
	
	public void ChangeDeposite(Map<String,Object> tbldeposite)throws Exception{
		update("locker.ChangeDeposite",tbldeposite);
	}
	
	public void ReturnuseLocker(tbluselocker tbluselocker)throws Exception{
		update("locker.ReturnuseLocker",tbluselocker);
	}
	
	public void DeleteuseLocker(tbluselocker tbluselocker)throws Exception{
		update("locker.DeleteuseLocker",tbluselocker);
	}
	
	public int DepositeOriginPKIDFind(tbldeposite tbldeposite)throws Exception{
		return selectOne("locker.DepositeOriginPKIDFind",tbldeposite);
	}
	
	public void CanceluseLocker(tbluselocker tbluselocker)throws Exception{
		update("locker.CanceluseLocker",tbluselocker);
	}
	
	public void refundUseLocker(tbluselocker tbluselocker)throws Exception{
		update("locker.refundUseLocker",tbluselocker);
	}
}