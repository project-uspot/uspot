package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import egovframework.veterans.com.cmm.service.VtcDCService;
import egovframework.veterans.com.cmm.service.VtcSMSService;
import egovframework.veterans.com.cmm.service.vo.DC;
import egovframework.veterans.com.cmm.service.vo.sms_mungu;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VtcSMSServiceImpl implements VtcSMSService{
	
	private final VtcSMSDAO vtcSMSDAO;

	@Override
	public List<sms_mungu> munguBySitecode(String SiteCode) throws Exception {
		return vtcSMSDAO.munguBySitecode(SiteCode);
	}

	@Override
	public void sms_munguInsert(sms_mungu sms_mungu) throws Exception {
		vtcSMSDAO.sms_munguInsert(sms_mungu);
	}

	@Override
	public void sms_munguUpdate(sms_mungu sms_mungu) throws Exception {
		vtcSMSDAO.sms_munguUpdate(sms_mungu);
	}

	@Override
	public void sms_munguRemove(sms_mungu sms_mungu) throws Exception {
		vtcSMSDAO.sms_munguRemove(sms_mungu);
	}

	@Override
	public List<sms_mungu> sms_munguSearch(sms_mungu sms_mungu) throws Exception {
		return vtcSMSDAO.sms_munguSearch(sms_mungu);
	}

}
