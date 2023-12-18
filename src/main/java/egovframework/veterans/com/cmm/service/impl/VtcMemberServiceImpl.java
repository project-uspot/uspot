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
}
