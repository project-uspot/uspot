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
import egovframework.veterans.com.cmm.service.vo.tblitem_file;
import egovframework.veterans.com.cmm.service.vo.tblitem_img;

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

	
	public List<TblItem_02> listItem02(TblItem_02 item_02) {
		return selectList("item.listItem02", item_02);
	}
	public void item02Insert(TblItem_02 item_02) {
		insert("item.item02Insert", item_02);
	}
	public int getitem02SortOrder(String siteCode) {
		return selectOne("item.getitem02SortOrder", siteCode);
	}
	public TblItem_02 getItem02(TblItem_02 item_02) {
		return selectOne("item.getItem02", item_02);
	}
	public void updateItem02(TblItem_02 item_02) {
		update("item.updateItem02", item_02);
	}

	public List<TblItem_03> liseItem03(TblItem_03 item_03) {
		return selectList("item.liseItem03", item_03);
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
	public TblItem_03 getItem03(TblItem_03 item_03) {
		return selectOne("item.getItem03", item_03);
	}
	public void updateItem03(TblItem_03 item_03) {
		update("item.updateItem03", item_03);
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
	public int itemmonthbyitemid(int itemid)throws Exception{
		return selectOne("item.itemmonthbyitemid",itemid);
	}
	
	public void ItemImageChange(tblitem_img tblitem_img)throws Exception{
		update("item.ItemImageChange",tblitem_img);
	}
	
	public void ItemImageRemove(tblitem_img tblitem_img)throws Exception{
		update("item.ItemImageRemove",tblitem_img);
	}
	
	public void itemfileChange(tblitem_file tblitem_file)throws Exception{
		update("item.itemfileChange",tblitem_file);
	}
	
	public tblitem_file item_fileByItemID(tblitem_file tblitem_file)throws Exception{
		return selectOne("item.item_fileByItemID",tblitem_file);
	}
	
	public void itemfileRemove(tblitem_file tblitem_file)throws Exception {
		update("item.itemfileRemove",tblitem_file);
	}
	
	public TblItem tblItemByItemID(TblItem tblItem)throws Exception{
		return selectOne("item.tblItemByItemID",tblItem);
	}
	
	public tblitem_img item_imgByItemID(tblitem_img tblitem_img)throws Exception{
		return selectOne("item.item_imgByItemID",tblitem_img);
	}
	
	public tblitem_img item_imgBySubGroupID(tblitem_img tblitem_img)throws Exception{
		return selectOne("item.item_imgBySubGroupID",tblitem_img);
	}
	
	public tblitem_img item_imgByGroupID(tblitem_img tblitem_img)throws Exception{
		return selectOne("item.item_imgByGroupID",tblitem_img);
	}
}