package egovframework.veterans.lib.service;

import java.util.List;
import java.util.Map;

public interface OfflinePayService {

	public List<Map<String,Object>> getCreditCardMenu(String SiteCode);
	
	public void insertElecAssignData(Map<String,Object> sqlMap);

	public Map<String, Object> insertPaidFmsc_s01(Map<String, Object> sqlMap);

	public Map<String, Object> insertPaidLocker(Map<String, Object> sqlMap);

	public Map<String, Object> insertPaidRent(Map<String, Object> sqlMap);

	public void insertPaidCancelFmsc_s01(Map<String, Object> returnMap);

	public void insertPaidCancelLocker(Map<String, Object> returnMap);

	public void insertPaidCancelRent(Map<String, Object> returnMap);
}
