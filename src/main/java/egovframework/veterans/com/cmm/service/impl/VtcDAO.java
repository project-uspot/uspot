package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.PGM;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.tblCode;

@Repository("VtcDAO")
public class VtcDAO extends EgovComAbstractDAO{

	public List<Sitecode> selectSiteCode(String SiteCode) throws Exception {
		return selectList("frame.selectSiteCode", SiteCode);
	}

	public void updateSiteCode(Sitecode sitecode) throws Exception {
		update("frame.updateSiteCode", sitecode);
	}
	public void insertSiteCode(Sitecode sitecode) throws Exception {
		insert("frame.insertSiteCode", sitecode);
	}
	public void deleteSiteCode(Sitecode sitecode) throws Exception {
		update("frame.deleteSiteCode", sitecode);
	}

	public List<Sitecode> listSiteName() throws Exception {
		return selectList("frame.listSiteName");
	}

	public PGM selectPGMInfo(PGM pgm) throws Exception {
		return selectOne("frame.selectPGMInfo", pgm);
	}

	public List<tblCode> listTblCode(tblCode code) {
		return selectList("frame.listTblCode", code);
	}
	
	public List<String> listcodename(tblCode tblCode){
		return selectList("frame.listcodename",tblCode);
	}
	public void optionchange(tblCode tblCode)throws Exception {
		update("frame.optionchange",tblCode);
	}
	public String codenameByCodeValue(tblCode tblCode) {
		return selectOne("frame.codenameByCodeValue",tblCode);
	}
}
