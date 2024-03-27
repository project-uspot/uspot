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
	public List<Map<String, Object>> getAccountMenu(String SiteCode) {
		return offlinePayDAO.getAccountMenu(SiteCode);
	}
	
	@Override
	public List<Map<String, Object>> getCreditCardMenu(String SiteCode) {
		return offlinePayDAO.getCreditCardMenu(SiteCode);
	}

	@Override
	public void insertElecAssignData(Map<String, Object> sqlMap) {
		offlinePayDAO.insertElecAssignData(sqlMap);
	}

	@Override
	public Map<String, Object> insertPaid(Map<String, Object> sqlMap) {
		return offlinePayDAO.insertPaid(sqlMap);
	}

	@Override
	public Map<String, Object> insertPaidFmsc_s01(Map<String, Object> sqlMap) {
		return offlinePayDAO.insertPaidFmsc_s01(sqlMap);
	}

	@Override
	public Map<String, Object> insertPaidLocker(Map<String, Object> sqlMap) {
		return offlinePayDAO.insertPaidLocker(sqlMap);
	}

	@Override
	public Map<String, Object> insertPaidRent(Map<String, Object> sqlMap) {
		return offlinePayDAO.insertPaidRent(sqlMap);
	}

	@Override
	public void insertPaidCancelFmsc_s01(Map<String, Object> returnMap) {
		offlinePayDAO.insertPaidCancelFmsc_s01(returnMap);
	}

	@Override
	public void insertPaidCancelLocker(Map<String, Object> returnMap) {
		offlinePayDAO.insertPaidCancelLocker(returnMap);
	}

	@Override
	public void insertPaidCancelRent(Map<String, Object> returnMap) {
		offlinePayDAO.insertPaidCancelRent(returnMap);
	}

	@Override
	public Map<String, Object> insertFMSC_S01(Map<String, Object> returnMap) {
		return offlinePayDAO.insertFMSC_S01(returnMap);
	}

	@Override
	public Map<String, Object> insertExpensesale(Map<String, Object> sqlMap) {
		return offlinePayDAO.insertExpensesale(sqlMap);
	}

	@Override
	public Map<String, Object> insertSLOrders(Map<String, Object> returnMap) {
		return offlinePayDAO.insertSLOrders(returnMap);
	}

}
