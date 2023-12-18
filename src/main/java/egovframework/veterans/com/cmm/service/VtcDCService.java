package egovframework.veterans.com.cmm.service;

import java.util.List;

import egovframework.veterans.com.cmm.service.vo.DC;

public interface VtcDCService {

	List<DC> dclist(DC dc) throws Exception;
	
	List<DC> dclistBypissId(String SiteCode) throws Exception;

}