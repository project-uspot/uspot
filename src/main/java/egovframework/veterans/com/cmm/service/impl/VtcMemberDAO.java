package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.TblItem_02;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01;
import egovframework.veterans.com.cmm.service.vo.tblmember;
import egovframework.veterans.com.cmm.service.vo.tblmembertalk;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01toselectitem;
import egovframework.veterans.com.cmm.service.vo.tblIssueMemberCard;

@Repository
public class VtcMemberDAO extends EgovComAbstractDAO{
	
	public List<tblmember> memberlist() throws Exception {
		return selectList("member.memberlist");
	}
	
	public List<tblmember> memberlistfind(tblmember tblmember) throws Exception{
		return selectList("member.memberlistfind",tblmember);
	}
	
	public tblmember maxidtblmember()throws Exception{
		return selectOne("member.maxidtblmember");
	}
	
	public List<fmsc_s01toselectitem> fmsc_s01toselectitem(fmsc_s01 fmsc_s01)throws Exception{
		return selectList("member.fmsc_s01toselectitem",fmsc_s01);
	}
	
	public List<tblmembertalk> membertblmembertalk(String MemberID)throws Exception{
		return selectList("member.membertblmembertalk",MemberID);
	}
	
	public List<fmsc_s01toselectitem> fmsc_s01toselectitemanothersite(fmsc_s01 fmsc_s01)throws Exception{
		return selectList("member.fmsc_s01toselectitemanothersite", fmsc_s01);
	}
	
	public void updatemember(tblmember tblmember) throws Exception{
		update("member.updatemember",tblmember);
	}
	
	public void deletemember(tblmember tblmember) throws Exception{
		update("member.deletemember",tblmember);
	}
	
	public List<tblmember> findmember(Map<String, Object> find)throws Exception{
		return selectList("member.findmember",find);
	}
	
	public tblmember tblmemberBymemberId(tblmember tblmember)throws Exception{
		return selectOne("member.tblmemberBymemberId",tblmember);
	}
	
	public String maxmemberid()throws Exception{
		return selectOne("member.maxmemberid");
	}
	
	public void insertmember(tblmember tblmember)throws Exception{
		insert("member.insertmember",tblmember);
	}
	
	public tblmember bigmovetblmember(String movetype)throws Exception{
		return selectOne("member.bigmovetblmember",movetype);
	}
	
	public tblmember movetblmember(String movetype)throws Exception{
		return selectOne("member.movetblmember",movetype);
	}
	
	public String endmemberid(String movetype)throws Exception{
		return selectOne("member.endmemberid",movetype);
	}
	
	public List<tblIssueMemberCard> selectmembercardbyid(String MemberID)throws Exception{
		return selectList("member.selectmembercardbyid",MemberID);
	}
	
	public tblIssueMemberCard membercardbypkid(String pkid)throws Exception{
		return selectOne("member.membercardbypkid",pkid);
	}
	
	public int barCodefind(String barcode)throws Exception{
		return selectOne("member.barCodefind",barcode);
	}
	
	public void updatecard(tblIssueMemberCard tblIssueMemberCard)throws Exception{
		update("member.updatecard",tblIssueMemberCard);
	}
	
	public void insertcard(tblIssueMemberCard issueMemberCard)throws Exception{
		insert("member.insertcard",issueMemberCard);
	}
	
	public void deletecard(tblIssueMemberCard tblIssueMemberCard)throws Exception{
		update("member.deletecard",tblIssueMemberCard);
	}
	
	public List<Map<String,Object>> selectItemsByFilter(TblItem_02 tblItem_02)throws Exception{
		return selectList("member.selectItemsByFilter",tblItem_02); 
	}
	
	public Map<String, Object> mitemfindbyid(TblItem_02 tblItem_02)throws Exception{
		return selectOne("member.selectItemsByFilter",tblItem_02);
	}
	
	public void fmsc_01insert(fmsc_s01 fmsc_s01)throws Exception{
		insert("member.fmsc_01insert",fmsc_s01);
	}
}