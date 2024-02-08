package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import egovframework.veterans.com.cmm.service.VtcMemberService;
import egovframework.veterans.com.cmm.service.vo.TblItem_02;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01;
import egovframework.veterans.com.cmm.service.vo.tblmember;
import egovframework.veterans.com.cmm.service.vo.tblmembertalk;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01toselectitem;
import egovframework.veterans.com.cmm.service.vo.fmsc_s03;
import egovframework.veterans.com.cmm.service.vo.fmsc_s04;
import egovframework.veterans.com.cmm.service.vo.fmsc_s04_01;
import egovframework.veterans.com.cmm.service.vo.tblIssueMemberCard;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VtcMemberServiceImpl implements VtcMemberService{

	private final VtcMemberDAO vtcMemberDAO; 
	
	@Override
	public List<tblmember> memberlist() throws Exception {
		return vtcMemberDAO.memberlist();
	}

	@Override
	public List<tblmember> memberlistfind(tblmember tblmember) throws Exception {
		return vtcMemberDAO.memberlistfind(tblmember);
	}

	@Override
	public tblmember maxidtblmember() throws Exception {

		return vtcMemberDAO.maxidtblmember();
	}

	@Override
	public List<fmsc_s01toselectitem> fmsc_s01toselectitem(fmsc_s01 fmsc_s01)
			throws Exception {
		return vtcMemberDAO.fmsc_s01toselectitem(fmsc_s01);
	}

	@Override
	public List<tblmembertalk> membertblmembertalk(String MemberID) throws Exception {

		return vtcMemberDAO.membertblmembertalk(MemberID);
	}

	@Override
	public List<fmsc_s01toselectitem> fmsc_s01toselectitemanothersite(
			fmsc_s01 fmsc_s01) throws Exception {

		return vtcMemberDAO.fmsc_s01toselectitemanothersite(fmsc_s01);
	}

	@Override
	public void updatemember(tblmember tblmember) throws Exception {
		vtcMemberDAO.updatemember(tblmember);
	}

	@Override
	public void deletemember(tblmember tblmember) throws Exception {
		vtcMemberDAO.deletemember(tblmember);
	}

	@Override
	public List<tblmember> findmember(Map<String, Object> find) throws Exception {

		return vtcMemberDAO.findmember(find);
	}

	@Override
	public tblmember tblmemberBymemberId(tblmember tblmember) throws Exception {

		return vtcMemberDAO.tblmemberBymemberId(tblmember);
	}

	@Override
	public String maxmemberid() throws Exception {

		return vtcMemberDAO.maxmemberid();
	}

	@Override
	public void insertmember(tblmember tblmember) throws Exception {

		vtcMemberDAO.insertmember(tblmember);
	}

	@Override
	public tblmember bigmovetblmember(String movetype) throws Exception {
		// TODO Auto-generated method stub
		return vtcMemberDAO.bigmovetblmember(movetype);
	}

	@Override
	public tblmember movetblmember(String movetype) throws Exception {
		// TODO Auto-generated method stub
		return vtcMemberDAO.movetblmember(movetype);
	}

	@Override
	public String endmemberid(String movetype) throws Exception {
		// TODO Auto-generated method stub
		return vtcMemberDAO.endmemberid(movetype);
	}

	@Override
	public List<tblIssueMemberCard> selectmembercardbyid(String MemberID) throws Exception {
		return vtcMemberDAO.selectmembercardbyid(MemberID);
	}

	@Override
	public tblIssueMemberCard membercardbypkid(String pkid) throws Exception {
		return vtcMemberDAO.membercardbypkid(pkid);
	}

	@Override
	public int barCodefind(String barcode) throws Exception {

		return vtcMemberDAO.barCodefind(barcode);
	}

	@Override
	public void updatecard(tblIssueMemberCard tblIssueMemberCard) throws Exception {
		vtcMemberDAO.updatecard(tblIssueMemberCard);
	}

	@Override
	public void insertcard(tblIssueMemberCard issueMemberCard) throws Exception {
		vtcMemberDAO.insertcard(issueMemberCard);
	}

	@Override
	public void deletecard(tblIssueMemberCard tblIssueMemberCard) throws Exception {
		vtcMemberDAO.deletecard(tblIssueMemberCard);
	}

	@Override
	public List<Map<String, Object>> selectItemsByFilter(TblItem_02 tblItem_02) throws Exception {
		return vtcMemberDAO.selectItemsByFilter(tblItem_02);
	}

	@Override
	public Map<String, Object> mitemfindbyid(TblItem_02 tblItem_02) throws Exception {
		return vtcMemberDAO.mitemfindbyid(tblItem_02);
	}

	@Override
	public void fmsc_01insert(fmsc_s01 fmsc_s01) throws Exception {
		vtcMemberDAO.fmsc_01insert(fmsc_s01);
	}

	@Override
	public fmsc_s01 fmsc_s01bysaleno(fmsc_s01 fmsc_s01) throws Exception {
		return vtcMemberDAO.fmsc_s01bysaleno(fmsc_s01);
	}

	@Override
	public void fmsc_01update(fmsc_s01 fmsc_s01) throws Exception {
		vtcMemberDAO.fmsc_01update(fmsc_s01);
	}

	@Override
	public void oldfmsc_s01update(fmsc_s01 fmsc_s01) throws Exception {
		vtcMemberDAO.oldfmsc_s01update(fmsc_s01);
	}

	@Override
	public int finddues(String SiteCode) throws Exception {
		return vtcMemberDAO.finddues(SiteCode);
	}

	@Override
	public void dueschange(Map<String, Object> map) throws Exception {
		vtcMemberDAO.dueschange(map);
	}

	@Override
	public void insertFmsc_s04(fmsc_s04 fmsc_s04) throws Exception {
		vtcMemberDAO.insertFmsc_s04(fmsc_s04);
	}

	@Override
	public void insertFmsc_s04_01(fmsc_s04_01 fmsc_s04_01) throws Exception {
		vtcMemberDAO.insertFmsc_s04_01(fmsc_s04_01);
	}

	@Override
	public void refundComplete(fmsc_s04_01 fmsc_s04_01) throws Exception {
		vtcMemberDAO.refundComplete(fmsc_s04_01);
	}

	@Override
	public void reutrnFmsc_s01(fmsc_s01 fmsc_s01) throws Exception {
		vtcMemberDAO.reutrnFmsc_s01(fmsc_s01);
	}

	@Override
	public void deleteFmsc_s04_01(fmsc_s04_01 fmsc_s04_01) throws Exception {
		vtcMemberDAO.deleteFmsc_s04_01(fmsc_s04_01);
	}

	@Override
	public void deleteFmsc_s03(fmsc_s03 fmsc_s03) throws Exception {
		vtcMemberDAO.deleteFmsc_s03(fmsc_s03);
	}

	@Override
	public void insertFmsc_s03(fmsc_s03 fmsc_s03) throws Exception {
		vtcMemberDAO.insertFmsc_s03(fmsc_s03);
	}

	@Override
	public List<fmsc_s03> fmsc_s03BySaleNo(fmsc_s03 fmsc_s03) throws Exception {
		return vtcMemberDAO.fmsc_s03BySaleNo(fmsc_s03);
	}

	@Override
	public void cancelRestFmsc_s01(fmsc_s01 fmsc_s01) throws Exception {
		vtcMemberDAO.cancelRestFmsc_s01(fmsc_s01);
	}

	@Override
	public void insertFmsc_s01_insert_temp(Map<String, Object> list) throws Exception {
		vtcMemberDAO.insertFmsc_s01_insert_temp(list);
	}

	@Override
	public void fmsc_01insertTemp_delete(Map<String, Object> setSql) {
		vtcMemberDAO.fmsc_01insertTemp_delete(setSql);		
	}
}
