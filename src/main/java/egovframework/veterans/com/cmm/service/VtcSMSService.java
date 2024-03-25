package egovframework.veterans.com.cmm.service;

import java.util.List;

import egovframework.veterans.com.cmm.service.vo.sms_mungu;

public interface VtcSMSService {
	List<sms_mungu> munguBySitecode(String SiteCode)throws Exception;
	void sms_munguInsert(sms_mungu sms_mungu)throws Exception;
	void sms_munguUpdate(sms_mungu sms_mungu)throws Exception;
	void sms_munguRemove(sms_mungu sms_mungu)throws Exception;
}
