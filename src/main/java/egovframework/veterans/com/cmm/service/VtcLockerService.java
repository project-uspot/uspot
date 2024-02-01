package egovframework.veterans.com.cmm.service;

import java.util.List;

import egovframework.veterans.com.cmm.service.vo.tblplockergroup;
import egovframework.veterans.com.cmm.service.vo.lockercodelist;
import egovframework.veterans.com.cmm.service.vo.memberuselocker;
import egovframework.veterans.com.cmm.service.vo.tblplocker;

public interface VtcLockerService {

	List<tblplockergroup> selectSamulhamInfoList(String SiteCode) throws Exception;

	tblplockergroup selectSamulhamInfodetail(int lockergroupIid) throws Exception;

	List<lockercodelist> lockercodelist(tblplocker tblplocker) throws Exception;

	int maxsortorder(String SiteCode) throws Exception;

	int plockernovalue(tblplockergroup tblplockergroup) throws Exception;

	void lockercodeinsert(tblplocker tblplocker) throws Exception;

	List<tblplocker> plockernolist(tblplocker tblplocker) throws Exception;

	tblplocker lockervobyplockerid(tblplocker tblplocker) throws Exception;

	void lockercodeupdate(tblplocker tblplocker) throws Exception;

	List<memberuselocker> memberuselocker(String MemberID) throws Exception;
	
	List<tblplocker> plockerByGroupID(tblplockergroup tblplockergroup) throws Exception;
}
