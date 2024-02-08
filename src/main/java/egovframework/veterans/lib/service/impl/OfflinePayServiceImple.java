package egovframework.veterans.lib.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import egovframework.veterans.lib.service.OfflinePayService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OfflinePayServiceImple implements OfflinePayService {

	private final OfflinePayDAO offlinePayDAO;
	
	@Override
	public List<Map<String, Object>> getCreditCardMenu(String SiteCode) {
		return offlinePayDAO.getCreditCardMenu(SiteCode);
	}

	@Override
	public void insertElecAssignData(Map<String, Object> sqlMap) {
		offlinePayDAO.insertElecAssignData(sqlMap);
	}

	@Override
	public void insertPaidFmsc_s01(Map<String, Object> sqlMap) {
		offlinePayDAO.insertPaidFmsc_s01(sqlMap);
	}

	@Override
	public void insertPaidLocker(Map<String, Object> sqlMap) {
		offlinePayDAO.insertPaidLocker(sqlMap);
	}

	@Override
	public void insertPaidRent(Map<String, Object> sqlMap) {
		offlinePayDAO.insertPaidRent(sqlMap);
	}

}
