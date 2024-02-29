package egovframework.veterans.lib.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository
public class OfflinePayDAO extends EgovComAbstractDAO {
	
	public List<Map<String,Object>> getAccountMenu(String SiteCode){
		return selectList("offlinePay.getAccountMenu",SiteCode);
	}

	public List<Map<String,Object>> getCreditCardMenu(String SiteCode){
		return selectList("offlinePay.getCreditCardMenu",SiteCode);
	}

	public void insertElecAssignData(Map<String, Object> sqlMap) {
		selectOne("offlinePay.insertElecAssignData",sqlMap);
	}

	public Map<String, Object> insertPaid(Map<String, Object> sqlMap) {
		selectOne("offlinePay.insertPaid",sqlMap);
		return sqlMap;
	}

	public Map<String, Object> insertPaidFmsc_s01(Map<String, Object> sqlMap) {
		selectOne("offlinePay.insertPaidFmsc_s01",sqlMap);
		return sqlMap;
	}

	public Map<String, Object> insertPaidLocker(Map<String, Object> sqlMap) {
		Map<String,Object> result = selectOne("offlinePay.insertPaidLocker",sqlMap);
		sqlMap.putAll(result);
		return sqlMap;
	}

	public Map<String, Object> insertPaidRent(Map<String, Object> sqlMap) {
		selectOne("offlinePay.insertPaidRent",sqlMap);
		return sqlMap;
	}

	public void insertPaidCancelFmsc_s01(Map<String, Object> returnMap) {
		
	}

	public void insertPaidCancelLocker(Map<String, Object> returnMap) {
		update("offlinePay.insertPaidCancelLocker",returnMap);
	}

	public void insertPaidCancelRent(Map<String, Object> returnMap) {
		
	}

	public Map<String, Object> insertFMSC_S01(Map<String, Object> returnMap) {
		Map<String,Object> result = selectOne("offlinePay.insertFMSC_S01",returnMap);
		returnMap.putAll(result);
		return returnMap;
	}

	public Map<String, Object> insertExpensesale(Map<String, Object> sqlMap) {
		Map<String,Object> result = selectOne("offlinePay.insertExpensesale",sqlMap);
		sqlMap.putAll(result);
		return sqlMap;
	}
}
