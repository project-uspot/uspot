package egovframework.veterans.com.cmm.service;

import java.util.List;
import java.util.Map;

import egovframework.veterans.com.cmm.service.vo.TblItem_02;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01toselectitem;
import egovframework.veterans.com.cmm.service.vo.tblIssueMemberCard;
import egovframework.veterans.com.cmm.service.vo.tblmember;
import egovframework.veterans.com.cmm.service.vo.tblmembertalk;

public interface VtcMemberService {
	List<tblmember> memberlist() throws Exception;
	
	List<tblmember> memberlistfind(tblmember tblmember) throws Exception;
	
	tblmember maxidtblmember()throws Exception;
	
	List<fmsc_s01toselectitem> fmsc_s01toselectitem(fmsc_s01 fmsc_s01)throws Exception;
	
	List<tblmembertalk> membertblmembertalk(String MemberID)throws Exception;
	
	List<fmsc_s01toselectitem> fmsc_s01toselectitemanothersite(fmsc_s01 fmsc_s01)throws Exception;
	
	void updatemember(tblmember tblmember) throws Exception;
	
	void deletemember(tblmember tblmember) throws Exception;
	
	List<tblmember> findmember(Map<String, Object> find)throws Exception;
	
	tblmember tblmemberBymemberId(tblmember tblmember)throws Exception;
	
	String maxmemberid()throws Exception;
	
	void insertmember(tblmember tblmember)throws Exception;
	
	tblmember bigmovetblmember(String movetype)throws Exception;
	
	tblmember movetblmember(String movetype)throws Exception;
	
	String endmemberid(String movetype)throws Exception;
	
	List<tblIssueMemberCard> selectmembercardbyid(String MemberID)throws Exception;
	
	tblIssueMemberCard membercardbypkid(String pkid)throws Exception;
	
	int barCodefind(String barcode)throws Exception;
	
	void updatecard(tblIssueMemberCard tblIssueMemberCard)throws Exception;
	
	void insertcard(tblIssueMemberCard issueMemberCard)throws Exception;
	
	void deletecard(tblIssueMemberCard tblIssueMemberCard)throws Exception;
	
	List<Map<String,Object>> selectItemsByFilter(TblItem_02 tblItem_02)throws Exception;
	
	Map<String, Object> mitemfindbyid(TblItem_02 tblItem_02)throws Exception;
	
	void fmsc_01insert(fmsc_s01 fmsc_s01)throws Exception;
}
