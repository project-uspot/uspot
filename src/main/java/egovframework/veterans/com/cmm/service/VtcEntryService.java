package egovframework.veterans.com.cmm.service;

import java.util.List;
import java.util.Map;

import egovframework.veterans.com.cmm.service.vo.tblmember;

public interface VtcEntryService {

	List<Map<String,Object>> selectEntryClassInfo(tblmember tblmember);

	List<Map<String, Object>> selectEntryInfo(tblmember tblmember);

	List<Map<String, Object>> selectTalkInfo(tblmember tblmember);

	int outEntry(Map<String, Object> map);

	void insertEntry(Map<String, Object> setSql);
}
