package egovframework.veterans.com.cmm.service;

import java.util.List;

import egovframework.veterans.com.cmm.service.vo.sms_mungu;

public interface VtcSMSService {
	List<sms_mungu> munguBySitecode(String SiteCode)throws Exception;
}
