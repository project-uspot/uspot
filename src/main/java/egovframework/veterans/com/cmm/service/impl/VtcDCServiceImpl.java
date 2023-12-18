package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import egovframework.veterans.com.cmm.service.VtcDCService;
import egovframework.veterans.com.cmm.service.vo.DC;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VtcDCServiceImpl implements VtcDCService{
	
	private final VtcDCDAO vtcDCDAO;

	@Override
	public List<DC> dclist(DC dc) throws Exception {
		
		return vtcDCDAO.dclist(dc);
	}

	@Override
	public List<DC> dclistBypissId(String SiteCode) throws Exception {
		
		return vtcDCDAO.dclistBypissId(SiteCode);
	}
}
