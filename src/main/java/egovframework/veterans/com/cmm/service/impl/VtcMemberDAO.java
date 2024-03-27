package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.TblItem_02;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01;
import egovframework.veterans.com.cmm.service.vo.tblmember;
import egovframework.veterans.com.cmm.service.vo.tblmemberphoto;
import egovframework.veterans.com.cmm.service.vo.tblmembertalk;
import egovframework.veterans.com.cmm.service.vo.fmsc_s01toselectitem;
import egovframework.veterans.com.cmm.service.vo.fmsc_s03;
import egovframework.veterans.com.cmm.service.vo.fmsc_s04;
import egovframework.veterans.com.cmm.service.vo.fmsc_s04_01;
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
		update("member.fmsc_01insert_update",fmsc_s01);
	}
	
	public void fmsc_01insert_save(fmsc_s01 fmsc_s01)throws Exception{
		insert("member.fmsc_01insert_save",fmsc_s01);
	}
	
	public List<fmsc_s01> fmsc_s01bysaleno(fmsc_s01 fmsc_s01)throws Exception{
		return selectList("member.fmsc_s01bysaleno",fmsc_s01);
	}
	
	public List<Map<String,Object>> selectRefund(Map<String, Object> setSql)throws Exception{
		return selectList("member.selectRefund",setSql);
	}
	
	public void fmsc_01update(fmsc_s01 fmsc_s01)throws Exception{
		update("member.fmsc_01update",fmsc_s01);
	}
	
	public void oldfmsc_s01update(fmsc_s01 fmsc_s01)throws Exception{
		update("member.oldfmsc_s01update",fmsc_s01);
	}
	public int finddues(String SiteCode)throws Exception{
		return selectOne("member.finddues", SiteCode);
	}
	
	public void dueschange(Map<String, Object> map)throws Exception{
		update("member.dueschange",map);
	}
	
	public void insertFmsc_s04(fmsc_s04 fmsc_s04)throws Exception{
		insert("member.insertFmsc_s04",fmsc_s04);
	}
	
	public void insertFmsc_s04_01(fmsc_s04_01 fmsc_s04_01)throws Exception{
		insert("member.insertFmsc_s04_01",fmsc_s04_01);
	}
	
	public void refundComplete(fmsc_s04_01 fmsc_s04_01)throws Exception{
		update("member.refundComplete",fmsc_s04_01);
	}
	
	public void reutrnFmsc_s01(fmsc_s01 fmsc_s01)throws Exception{
		update("member.reutrnFmsc_s01",fmsc_s01);
	}
	
	public void deleteFmsc_s04_01(fmsc_s04_01 fmsc_s04_01)throws Exception{
		update("member.deleteFmsc_s04_01",fmsc_s04_01);
	}
	
	public void deleteFmsc_s03(fmsc_s03 fmsc_s03)throws Exception{
		update("member.deleteFmsc_s03",fmsc_s03);
	}
	
	public void insertFmsc_s03(fmsc_s03 fmsc_s03)throws Exception{
		insert("member.insertFmsc_s03",fmsc_s03);
	}
	
	public List<fmsc_s03> fmsc_s03BySaleNo(fmsc_s03 fmsc_s03)throws Exception{
		return selectList("member.fmsc_s03BySaleNo",fmsc_s03);
	}
	
	public void cancelRestFmsc_s01(fmsc_s01 fmsc_s01)throws Exception{
		update("member.cancelRestFmsc_s01",fmsc_s01);
	}

	public void insertFmsc_s01_insert_temp(Map<String, Object> list) {
		insert("member.insertFmsc_s01_insert_temp",list);
		update("member.fmsc_01insertTemp_update",list);
	}

	public void fmsc_01insertTemp_delete(Map<String, Object> setSql) {
		update("member.fmsc_01insertTemp_delete",setSql);
	}
	
	public void MemberImageChange(tblmemberphoto tblmemberphoto)throws Exception{
		update("member.MemberImageChange",tblmemberphoto);
	}
	
	public tblmemberphoto MemebrPhotoByMemberID(String MemberID)throws Exception{
		return selectOne("member.MemebrPhotoByMemberID",MemberID);
	}
	public void MemberImageRemove(String MemberID)throws Exception{
		update("member.MemberImageRemove",MemberID);
	}
	public List<Map<String, Object>> selectFmsc_s04_01(Map<String, Object> setSql) {
		return selectList("member.selectFmsc_s04_01",setSql);
	}

	public List<Map<String, Object>> selectFmsc_s04(Map<String, Object> setSql) {
		return selectList("member.selectFmsc_s04",setSql);
	}
	
	public void ChangeState(fmsc_s01 fmsc_s01)throws Exception{
		update("member.ChangeState",fmsc_s01);
	}
}