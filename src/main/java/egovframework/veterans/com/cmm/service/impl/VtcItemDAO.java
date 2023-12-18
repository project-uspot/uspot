package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.TblItem;
import egovframework.veterans.com.cmm.service.vo.TblItem_01;
import egovframework.veterans.com.cmm.service.vo.TblItem_02;
import egovframework.veterans.com.cmm.service.vo.TblItem_03;
import egovframework.veterans.com.cmm.service.vo.applicationlist;
import egovframework.veterans.com.cmm.service.vo.maturitylist;
import egovframework.veterans.com.cmm.service.vo.selectitem;
import egovframework.veterans.com.cmm.service.vo.selectitembyitemcode;

@Repository("VtcItemDAO")
public class VtcItemDAO extends EgovComAbstractDAO{
	

	public List<TblItem_01> listItemCode(TblItem_01 item_01) {
		return selectList("item.listItemCode", item_01);
	}
	public void item01Insert(TblItem_01 item_01) {
		insert("item.item01Insert", item_01);
	}
	public int getSortOrder(String siteCode) {
		return selectOne("item.getSortOrder", siteCode);
	}
	public int getGroupID(String siteCode) {
		return selectOne("item.getGroupID", siteCode);
	}
	public TblItem_01 getItem01(TblItem_01 item_01) {
		return selectOne("item.getItem01", item_01);
	}
	public void updateItem01(TblItem_01 item_01) {
		update("item.updateItem01", item_01);
	}

	
	public List<TblItem_02> listItem02(String siteCode) {
		return selectList("item.listItem02", siteCode);
	}
	public void item02Insert(TblItem_02 item_02) {
		insert("item.item02Insert", item_02);
	}
	public int getitem02SortOrder(String siteCode) {
		return selectOne("item.getitem02SortOrder", siteCode);
	}

	public List<TblItem_03> liseItem03(String siteCode) {
		return selectList("item.liseItem03", siteCode);
	}
	public void item03Insert(TblItem_03 item_03) {
		insert("item.item03Insert", item_03);
	}
	
	public int getitem03DefCode(String siteCode) {
		return selectOne("item.getitem03DefCode", siteCode);
	}
	public int getitem03SortOrder(String siteCode) {
		return selectOne("item.getitem03SortOrder", siteCode);
	}
	public List<selectitem> listSelectItemY(selectitem selectitem) {
		return selectList("item.listSelectItemY", selectitem);
	}
	public List<selectitem>listSelectItemN(selectitem selectitem) {
		return selectList("item.listSelectItemN", selectitem);
	}
	public List<selectitem> listSelectItemIsDelte(selectitem selectitem) {
		return selectList("item.listSelectItemIsDelte", selectitem);
	}
	public TblItem itemCode_Chk(TblItem tblItem) {
		return selectOne("item.itemCode_Chk", tblItem);
	}
	public void itemInsert(TblItem tblItem) {
		insert("item.itemInsert", tblItem);
	}
	public void itemUpdate(TblItem tblItem) {
		update("item.itemUpdate", tblItem);
	}
	public int getItemCode(String siteCode) {
		return selectOne("item.getItemCode", siteCode);
	}
	public TblItem getTblItem(TblItem tblItem) {
		return selectOne("item.getTblItem", tblItem);
	}
	public List<TblItem_01> item01list(String SiteCode)throws Exception{
		return selectList("item.item01list",SiteCode);
	}
	public List<TblItem_02> item02list(TblItem_02 tblItem_02)throws Exception{
		return selectList("item.item02list",tblItem_02);
	}
	public List<TblItem_03> item03list(String SiteCode)throws Exception{
		return selectList("item.item03list",SiteCode);
	}
	
	public List<applicationlist> applicationlist(Map<String, Object> fmsc_s01)throws Exception{
		return selectList("item.applicationlist",fmsc_s01);
	}
	
	public List<selectitembyitemcode> daylist(String SiteCode)throws Exception{
		return selectList("item.daylist",SiteCode);
	}
	public List<maturitylist> maturitylist(Map<String, Object> map)throws Exception{
		return selectList("item.maturitylist",map);
	}
	public List<selectitem> findItem(Map<String, Object> find) {
		return selectList("item.findItem", find);
	}
}
