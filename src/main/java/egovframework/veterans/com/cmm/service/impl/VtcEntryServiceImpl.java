package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import egovframework.veterans.com.cmm.service.VtcEntryService;
import egovframework.veterans.com.cmm.service.vo.tblmember;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VtcEntryServiceImpl implements VtcEntryService {

	private final VtcEntryDAO vtcEntryDAO;

	@Override
	@Transactional(isolation = Isolation.READ_UNCOMMITTED)
	public List<Map<String, Object>> selectEntryClassInfo(tblmember tblmember) {
		return vtcEntryDAO.selectEntryClassInfo(tblmember);
	}

	@Override
	@Transactional(isolation = Isolation.READ_UNCOMMITTED)
	public List<Map<String, Object>> selectEntryInfo(tblmember tblmember) {
		return vtcEntryDAO.selectEntryInfo(tblmember);
	}

	@Override
	public List<Map<String, Object>> selectTalkInfo(tblmember tblmember) {
		return vtcEntryDAO.selectTalkInfo(tblmember);
	}

	@Override
	@Transactional(isolation = Isolation.READ_UNCOMMITTED)
	public int outEntry(Map<String, Object> map) {
		return vtcEntryDAO.outEntry(map);
	}

	@Override
	public void insertEntry(Map<String, Object> map) {
		vtcEntryDAO.insertEntry(map);
	}

}
