package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.tblrent_part;
import egovframework.veterans.com.cmm.service.vo.tblrent_place;

@Repository
public class VtcRentDAO extends EgovComAbstractDAO{
	
	public List<tblrent_part> rent_partBySiteCode(String SiteCode)throws Exception{
		return selectList("rent.rent_partBySiteCode",SiteCode);
	}
	
	public List<tblrent_place> rent_placeByPartCD(tblrent_place tblrent_place)throws Exception{
		return selectList("rent.rent_placeByPartCD",tblrent_place);
	}
}