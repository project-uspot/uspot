package egovframework.veterans.logs.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.logs.service.vo.LogVO;

@Repository("VtcLogDAO")
public class VtcLogDAO extends EgovComAbstractDAO{

	public void logInsert(LogVO logVO) {
		insert("log.logInsert",logVO);
	}

}
