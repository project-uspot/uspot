package egovframework.veterans.lib.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository
public class CommonDAO extends EgovComAbstractDAO {

	public List<Map<String,Object>> selectCodeList(Map<String,Object> map){
		return selectList("common.selectCodeList",map);
	}
}
