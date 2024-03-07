package egovframework.veterans.com.cmm.service;

import java.util.List;
import java.util.Map;

import egovframework.veterans.com.cmm.service.vo.tblplockergroup;
import egovframework.veterans.com.cmm.service.vo.tbluselocker;
import egovframework.veterans.com.cmm.service.vo.lockercodelist;
import egovframework.veterans.com.cmm.service.vo.memberuselocker;
import egovframework.veterans.com.cmm.service.vo.tbldeposite;
import egovframework.veterans.com.cmm.service.vo.tblplocker;

public interface VtcLockerService {

	List<tblplockergroup> LockerInfoList(tblplockergroup tblplockergroup) throws Exception;

	tblplockergroup selectSamulhamInfodetail(int lockergroupIid) throws Exception;

	List<lockercodelist> lockercodelist(tblplocker tblplocker) throws Exception;

	int maxsortorder(String SiteCode) throws Exception;

	int plockernovalue(tblplockergroup tblplockergroup) throws Exception;

	void lockercodeinsert(tblplocker tblplocker) throws Exception;

	List<tblplocker> plockernolist(tblplocker tblplocker) throws Exception;

	tblplocker lockervobyplockerid(tblplocker tblplocker) throws Exception;

	void lockercodeupdate(tblplocker tblplocker) throws Exception;

	List<memberuselocker> memberuselocker(tbluselocker tbluselocker) throws Exception;
	
	List<Map<String,Object>> plockerByGroupID(tblplockergroup tblplockergroup) throws Exception;
	
	void UpdClickTime(tblplocker tblplocker)throws Exception;
	
	Map<String,Object> PLockerJoinGroupByID(tblplocker tblplocker)throws Exception;
	
	String ClickTimeByID(tblplocker tblplocker)throws Exception;
	
	void useLockerInsert(tbluselocker tbluselocker)throws Exception;

	void UpdPLocker(tblplocker tblplocker)throws Exception;
	
	tbluselocker useLockerByPKID(tbluselocker tbluselocker)throws Exception;
	
	void DepositeInsert(tbldeposite tbldeposite)throws Exception;
	
	List<tbldeposite> DepositeByMemberID(tbldeposite tbldeposite)throws Exception;
	
	void useLockerPriceUpdate(tbluselocker tbluselocker)throws Exception;
	
	void UpduseLocker(tbluselocker tbluselocker)throws Exception;
	
	void UpdPLockerBySave(tblplocker tblplocker)throws Exception;
	
	void ReturnLocker(tblplocker tblplocker)throws Exception;
	
	void ChangeDeposite(Map<String,Object> tbldeposite)throws Exception;
	
	void ReturnuseLocker(tbluselocker tbluselocker)throws Exception;
	
	void DeleteuseLocker(tbluselocker tbluselocker)throws Exception;
	
	int DepositeOriginPKIDFind(tbldeposite tbldeposite)throws Exception;
	
	void CanceluseLocker(tbluselocker tbluselocker)throws Exception;
	
	void refundUseLocker(tbluselocker tbluselocker)throws Exception;
	
	List<tbldeposite> DepositeListByMember(tbldeposite tbldeposite)throws Exception;
	
	void InsertDepositeRefund(tbldeposite tbldeposite)throws Exception;
	
	List<Integer> DepositeBySiteCode(String SiteCode)throws Exception;
	
	void LockerInfoInsert(tblplockergroup tblplockergroup)throws Exception;
	
	void UpdLockerGroupImage(tblplockergroup tblplockergroup)throws Exception;
	
	void UpdLockerGroup(tblplockergroup tblplockergroup)throws Exception;
	
	void RemoveLockerGroup(tblplockergroup tblplockergroup)throws Exception;
}