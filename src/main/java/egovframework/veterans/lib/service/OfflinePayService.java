package egovframework.veterans.lib.service;

import java.util.List;
import java.util.Map;

public interface OfflinePayService {

	public List<Map<String,Object>> getCreditCardMenu(String SiteCode);
	
	public void insertElecAssignData(Map<String,Object> sqlMap);

	public void insertPaidFmsc_s01(Map<String, Object> sqlMap);

	public void insertPaidLocker(Map<String, Object> sqlMap);

	public void insertPaidRent(Map<String, Object> sqlMap);
}
