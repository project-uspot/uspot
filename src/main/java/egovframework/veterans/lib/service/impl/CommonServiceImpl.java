package egovframework.veterans.lib.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import egovframework.veterans.lib.service.CommonService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommonServiceImpl implements CommonService {

	private final CommonDAO commonDAO;

	@Override
	public List<Map<String, Object>> selectCodeList(Map<String, Object> map) {
		return commonDAO.selectCodeList(map);
	}
	
}
