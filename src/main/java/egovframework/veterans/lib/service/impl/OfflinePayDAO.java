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
		insert("offlinePay.insertElecAssignData",sqlMap);
	}
}
