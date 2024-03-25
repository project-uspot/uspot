package egovframework.veterans.com.cmm.service;

import java.util.List;

import egovframework.veterans.com.cmm.service.vo.tblrent_part;
import egovframework.veterans.com.cmm.service.vo.tblrent_place;

public interface VtcRentService {
	List<tblrent_part> rent_partBySiteCode(String SiteCode)throws Exception;
	List<tblrent_place> rent_placeByPartCD(tblrent_place tblrent_place)throws Exception;
}