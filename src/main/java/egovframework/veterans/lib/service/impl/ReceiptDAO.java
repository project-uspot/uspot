package egovframework.veterans.lib.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository
public class ReceiptDAO extends EgovComAbstractDAO {

	public List<Map<String, Object>> getReceipt(String pkid) {
		return selectList("receipt.getReceipt",pkid);
	}

	public void insertReceipt(Map<String, Object> sqlMap) {
		insert("receipt.insertReceipt",sqlMap);
	}

	public Map<String, Object> getReReceipt(Map<String, Object> setSql) {
		return selectOne("receipt.getReReceipt",setSql);
	}

}
