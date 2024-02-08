package egovframework.veterans.lib.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository
public class OfflinePayDAO extends EgovComAbstractDAO {

	public List<Map<String,Object>> getCreditCardMenu(String SiteCode){
		return selectList("offlinePay.getCreditCardMenu",SiteCode);
	}

	public void insertElecAssignData(Map<String, Object> sqlMap) {
		selectOne("offlinePay.insertElecAssignData",sqlMap);
	}

	public Map<String, Object> insertPaidFmsc_s01(Map<String, Object> sqlMap) {
		selectOne("offlinePay.insertPaidFmsc_s01",sqlMap);
		return sqlMap;
	}

	public Map<String, Object> insertPaidLocker(Map<String, Object> sqlMap) {
		selectOne("offlinePay.insertPaidLocker",sqlMap);
		return sqlMap;
	}

	public Map<String, Object> insertPaidRent(Map<String, Object> sqlMap) {
		selectOne("offlinePay.insertPaidRent",sqlMap);
		return sqlMap;
	}

	public void insertPaidCancelFmsc_s01(Map<String, Object> returnMap) {
		
	}

	public void insertPaidCancelLocker(Map<String, Object> returnMap) {
		
	}

	public void insertPaidCancelRent(Map<String, Object> returnMap) {
		
	}
}
