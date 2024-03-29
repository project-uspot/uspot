package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.veterans.com.cmm.service.VtcService;
import egovframework.veterans.com.cmm.service.vo.PGM;
import egovframework.veterans.com.cmm.service.vo.Sitecode;
import egovframework.veterans.com.cmm.service.vo.tblCode;

@Service("VtcService")
public class VtcServiceImpl extends EgovAbstractServiceImpl implements VtcService{
	
	@Resource(name="VtcDAO")
	private VtcDAO VtcDAO;


	
	@Override
	public Sitecode selectSiteCode(String SiteCode) throws Exception {
		return VtcDAO.selectSiteCode(SiteCode);
	}

	@Override
	public void updateSiteCode(Sitecode sitecode) throws Exception {
		VtcDAO.updateSiteCode(sitecode);
	}
	@Override
	public void insertSiteCode(Sitecode sitecode) throws Exception {
		VtcDAO.insertSiteCode(sitecode);
	}
	
	@Override
	public void deleteSiteCode(Sitecode sitecode) throws Exception {
		VtcDAO.deleteSiteCode(sitecode);
	}
	

	@Override
	public List<Sitecode> listSiteName() throws Exception {
		return VtcDAO.listSiteName();
	}

	@Override
	public PGM selectPGMInfo(PGM pgm) throws Exception {
		return VtcDAO.selectPGMInfo(pgm);
	}

	@Override
	public List<tblCode> listTblCode(tblCode code) throws Exception {
		return VtcDAO.listTblCode(code);
	}




	
	



	
	

	
	
}
