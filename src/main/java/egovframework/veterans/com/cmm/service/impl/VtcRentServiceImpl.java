package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.veterans.com.cmm.service.VtcRentService;
import egovframework.veterans.com.cmm.service.vo.tblrent_part;
import egovframework.veterans.com.cmm.service.vo.tblrent_place;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VtcRentServiceImpl extends EgovAbstractServiceImpl implements VtcRentService {
	
	private final VtcRentDAO vtcRentDAO;

	@Override
	public List<tblrent_part> rent_partBySiteCode(String SiteCode) throws Exception {
		return vtcRentDAO.rent_partBySiteCode(SiteCode);
	}

	@Override
	public List<tblrent_place> rent_placeByPartCD(tblrent_place tblrent_place) throws Exception {
		return vtcRentDAO.rent_placeByPartCD(tblrent_place);
	}
	
}
