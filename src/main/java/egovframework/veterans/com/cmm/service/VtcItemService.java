package egovframework.veterans.com.cmm.service;

import java.util.List;
import java.util.Map;

import egovframework.veterans.com.cmm.service.vo.TblItem;
import egovframework.veterans.com.cmm.service.vo.TblItem_01;
import egovframework.veterans.com.cmm.service.vo.TblItem_02;
import egovframework.veterans.com.cmm.service.vo.TblItem_03;
import egovframework.veterans.com.cmm.service.vo.applicationlist;
import egovframework.veterans.com.cmm.service.vo.maturitylist;
import egovframework.veterans.com.cmm.service.vo.selectitem;
import egovframework.veterans.com.cmm.service.vo.selectitembyitemcode;

public interface VtcItemService {
	
	List<TblItem_01> listItemCode(TblItem_01 item_01) throws Exception;
	void item01Insert(TblItem_01 item_01) throws Exception;
	int getSortOrder(String SiteCode) throws Exception;
	int getGroupID(String SiteCode) throws Exception;
	TblItem_01 getItem01(TblItem_01 item_01) throws Exception;
	void updateItem01(TblItem_01 item_01) throws Exception;
	
	List<TblItem_02> listItem02(String SiteCode) throws Exception;
	void item02Insert(TblItem_02 item_02) throws Exception;
	int getitem02SortOrder(String SiteCode) throws Exception;
	
	List<TblItem_03> liseItem03(String SiteCode) throws Exception;
	void item03Insert(TblItem_03 item_03) throws Exception;
	int getitem03SortOrder(String SiteCode) throws Exception;
	int getitem03DefCode(String SiteCode) throws Exception;
	
	List<selectitem>listSelectItemY(selectitem selectitem) throws Exception;
	List<selectitem>listSelectItemN(selectitem selectitem) throws Exception;
	List<selectitem>listSelectItemIsDelte(selectitem selectitem) throws Exception;
	TblItem itemCode_Chk(TblItem tblItem) throws Exception;
	void itemInsert(TblItem tblItem) throws Exception;
	void itemUpdate(TblItem tblItem) throws Exception;
	int getItemCode(String SiteCode) throws Exception;
	TblItem getTblItem(TblItem tblItem) throws Exception;
	List<TblItem_01> item01list(String SiteCode) throws Exception;
	List<TblItem_02> item02list(TblItem_02 tblItem_02)throws Exception;
	List<TblItem_03> item03list(String SiteCode)throws Exception;
	List<applicationlist> applicationlist(Map<String, Object> fmmap)throws Exception;
	List<selectitembyitemcode> daylist(String SiteCode)throws Exception;
	List<maturitylist> maturitylist(Map<String, Object> map)throws Exception;
	List<selectitem> findItem(Map<String, Object> find) throws Exception;
}
