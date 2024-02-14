package egovframework.veterans.com.cmm.service;

import java.util.List;

import egovframework.veterans.com.cmm.service.vo.PGM;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.tblCode;

public interface VtcService {
	
	
	Sitecode selectSiteCode(String SiteCode) throws Exception;
	void updateSiteCode(Sitecode sitecode) throws Exception;
	void insertSiteCode(Sitecode sitecode) throws Exception;
	void deleteSiteCode(Sitecode sitecode) throws Exception;
	
	List<Sitecode> listSiteName() throws Exception;
	
	PGM selectPGMInfo(PGM pgm) throws Exception;
	
	List<tblCode> listTblCode(tblCode code) throws Exception;
	
	List<String> listcodename(tblCode tblCode);
	
	void optionchange(tblCode tblCode)throws Exception;
	
	String codenameByCodeValue(tblCode tblCode);
}
