package egovframework.veterans.logs.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.logs.service.vo.LogVO;

@Repository
public class VtcLogDAO extends EgovComAbstractDAO{

	public void logInsert(LogVO logVO) {
		insert("log.logInsert",logVO);
	}

}
