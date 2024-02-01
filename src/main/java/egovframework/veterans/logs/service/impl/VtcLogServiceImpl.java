package egovframework.veterans.logs.service.impl;

import org.springframework.stereotype.Service;

import egovframework.veterans.logs.service.VtcLogService;
import egovframework.veterans.logs.service.vo.LogVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VtcLogServiceImpl implements VtcLogService {

	private final VtcLogDAO vtcLogDAO;

	@Override
	public void logInsert(LogVO logVO) {
		vtcLogDAO.logInsert(logVO);
	}
}
