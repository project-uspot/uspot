package egovframework.veterans.logs.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.veterans.logs.service.VtcLogService;
import egovframework.veterans.logs.service.vo.LogVO;

@Service("VtcLogServiceImpl")
public class VtcLogServiceImpl extends EgovAbstractServiceImpl implements VtcLogService {

	@Resource(name="VtcLogDAO")
	private VtcLogDAO VtcLogDAO;

	@Override
	public void logInsert(LogVO logVO) {
		VtcLogDAO.logInsert(logVO);
	}
}
