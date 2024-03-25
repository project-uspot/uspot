package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.tblmember;

@Repository
public class VtcEntryDAO extends EgovComAbstractDAO {

	public List<Map<String, Object>> selectEntryClassInfo(tblmember tblmember) {
		return selectList("entry.selectEntryClassInfo",tblmember);
	}

	public List<Map<String, Object>> selectEntryInfo(tblmember tblmember) {
		return selectList("entry.selectEntryInfo",tblmember);
	}

	public List<Map<String, Object>> selectTalkInfo(tblmember tblmember) {
		return selectList("entry.selectTalkInfo",tblmember);
	}

	public int outEntry(Map<String,Object> map) {
		return update("entry.outEntry",map);
	}

	public void insertEntry(Map<String, Object> map) {
		insert("entry.insertEntry",map);
	}
}
