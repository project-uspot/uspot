package egovframework.veterans.lib.service;

import java.util.List;
import java.util.Map;

public interface ReceiptService {

	public List<Map<String, Object>> getReceipt(String pkid);

	public void insertReceipt(Map<String, Object> sqlMap);

	public Map<String, Object> getReReceipt(Map<String, Object> setSql);

}
