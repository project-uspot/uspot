package egovframework.veterans.com.cmm.service;

import java.util.List;
import java.util.Map;

import egovframework.veterans.com.cmm.service.vo.PGM;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.tblCode;
import egovframework.veterans.com.cmm.service.vo.tblsite_id;

public interface VtcService {
	
	
	List<Sitecode> selectSiteCode(String SiteCode) throws Exception;
	void updateSiteCode(Sitecode sitecode) throws Exception;
	void insertSiteCode(Sitecode sitecode) throws Exception;
	void deleteSiteCode(Sitecode sitecode) throws Exception;
	
	List<Sitecode> listSiteName() throws Exception;
	
	PGM selectPGMInfo(PGM pgm) throws Exception;
	
	List<tblCode> listTblCode(tblCode code) throws Exception;
	
	List<String> listcodename(tblCode tblCode);
	
	void optionchange(tblCode tblCode)throws Exception;
	
	String codenameByCodeValue(tblCode tblCode);

	Map<String, Object> selectSiteIdSet(String siteCode);
	
	tblsite_id tblsite_idBySiteCode(String SiteCode)throws Exception;
}
