package egovframework.veterans.lib.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import egovframework.veterans.lib.service.ReceiptService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReceiptServiceImpl implements ReceiptService {

	private final ReceiptDAO receiptDAO;
	
	@Override
	public List<Map<String, Object>> getReceipt(String pkid) {
		return receiptDAO.getReceipt(pkid);
	}

	@Override
	public List<Map<String, Object>> getReceiptLocker(String pkid) {
		return receiptDAO.getReceiptLocker(pkid);
	}
	
	@Override
	public void insertReceipt(Map<String, Object> sqlMap) {
		 receiptDAO.insertReceipt(sqlMap);
	}

	@Override
	public Map<String, Object> getReReceipt(Map<String, Object> setSql) {
		return receiptDAO.getReReceipt(setSql);
	}
}
