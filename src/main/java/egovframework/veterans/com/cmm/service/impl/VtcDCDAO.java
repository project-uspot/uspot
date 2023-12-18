package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.DC;

@Repository
public class VtcDCDAO extends EgovComAbstractDAO{

	public List<DC> dclist(DC dc)throws Exception{
		return selectList("dc.dclist",dc);
	}
	
	public List<DC> dclistBypissId(String SiteCode) throws Exception{
		return selectList("dc.dclistBypissId", SiteCode);
	}
}
