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

}
