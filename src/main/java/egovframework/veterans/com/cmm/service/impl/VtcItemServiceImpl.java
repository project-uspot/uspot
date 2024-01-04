package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.veterans.com.cmm.service.VtcItemService;
import egovframework.veterans.com.cmm.service.vo.TblItem;
import egovframework.veterans.com.cmm.service.vo.TblItem_01;
import egovframework.veterans.com.cmm.service.vo.TblItem_02;
import egovframework.veterans.com.cmm.service.vo.TblItem_03;
import egovframework.veterans.com.cmm.service.vo.applicationlist;
import egovframework.veterans.com.cmm.service.vo.selectitem;
import egovframework.veterans.com.cmm.service.vo.selectitembyitemcode;
import lombok.RequiredArgsConstructor;
import egovframework.veterans.com.cmm.service.vo.maturitylist;

@Service("VtcItemService")
@RequiredArgsConstructor
public class VtcItemServiceImpl extends EgovAbstractServiceImpl implements VtcItemService{
	
	private final VtcItemDAO itemDAO;
	
	@Override
	public List<TblItem_01> listItemCode(TblItem_01 item_01) throws Exception {
		return itemDAO.listItemCode(item_01);
	}
	@Override
	public void item01Insert(TblItem_01 item_01) throws Exception {
		itemDAO.item01Insert(item_01);
	}
	@Override
	public int getSortOrder(String SiteCode) throws Exception {
		return itemDAO.getSortOrder(SiteCode);
	}
	@Override
	public int getGroupID(String SiteCode) throws Exception {
		return itemDAO.getGroupID(SiteCode);
	}
	@Override
	public TblItem_01 getItem01(TblItem_01 item_01) throws Exception {
		return itemDAO.getItem01(item_01);
	}
	@Override
	public void updateItem01(TblItem_01 item_01) throws Exception {
		itemDAO.updateItem01(item_01);
	}
	
	@Override
	public List<TblItem_02> listItem02(TblItem_02 item_02) throws Exception {
		return itemDAO.listItem02(item_02);
	}
	@Override
	public void item02Insert(TblItem_02 item_02) throws Exception {
		itemDAO.item02Insert(item_02);
	}
	@Override
	public int getitem02SortOrder(String SiteCode) throws Exception {
		return itemDAO.getitem02SortOrder(SiteCode);
	}
	@Override
	public TblItem_02 getItem02(TblItem_02 item_02) throws Exception {
		return itemDAO.getItem02(item_02);
	}
	@Override
	public void updateItem02(TblItem_02 item_02) throws Exception {
		itemDAO.updateItem02(item_02);
	}
	
	@Override
	public List<TblItem_03> liseItem03(TblItem_03 item_03) throws Exception {
		return itemDAO.liseItem03(item_03);
	}
	@Override
	public void item03Insert(TblItem_03 item_03) throws Exception {
		itemDAO.item03Insert(item_03);
	}
	@Override
	public int getitem03DefCode(String SiteCode) throws Exception {
		return itemDAO.getitem03DefCode(SiteCode);
	}
	@Override
	public int getitem03SortOrder(String SiteCode) throws Exception {
		return itemDAO.getitem03SortOrder(SiteCode);
	}
	@Override
	public TblItem_03 getItem03(TblItem_03 item_03) throws Exception {
		return itemDAO.getItem03(item_03);
	}
	@Override
	public void updateItem03(TblItem_03 item_03) throws Exception {
		itemDAO.updateItem03(item_03);
	}
	
	@Override
	public List<selectitem> listSelectItemY(selectitem selectitem) throws Exception {
		return itemDAO.listSelectItemY(selectitem);
	}
	@Override
	public List<selectitem>listSelectItemN(selectitem selectitem) throws Exception {
		return itemDAO.listSelectItemN(selectitem);
	}
	@Override
	public List<selectitem> listSelectItemIsDelte(selectitem selectitem) throws Exception {
		return itemDAO.listSelectItemIsDelte(selectitem);
	}
	@Override
	public TblItem itemCode_Chk(TblItem tblItem) throws Exception {
		return itemDAO.itemCode_Chk(tblItem);
	}
	@Override
	public void itemInsert(TblItem tblItem) throws Exception {
		itemDAO.itemInsert(tblItem);
	}
	@Override
	public void itemUpdate(TblItem tblItem) throws Exception {
		itemDAO.itemUpdate(tblItem);
	}
	@Override
	public int getItemCode(String SiteCode) throws Exception {
		return itemDAO.getItemCode(SiteCode);
	}
	@Override
	public TblItem getTblItem(TblItem tblItem) throws Exception {
		return itemDAO.getTblItem(tblItem);
	}
	@Override
	public List<TblItem_01> item01list(String SiteCode) throws Exception {
		// TODO Auto-generated method stub
		return itemDAO.item01list(SiteCode);
	}
	@Override
	public List<TblItem_02> item02list(TblItem_02 tblItem_02) throws Exception {
		// TODO Auto-generated method stub
		return itemDAO.item02list(tblItem_02);
	}
	@Override
	public List<TblItem_03> item03list(String SiteCode) throws Exception {
		// TODO Auto-generated method stub
		return itemDAO.item03list(SiteCode);
	}
	@Override
	public List<applicationlist> applicationlist(Map<String, Object> fmsc_s01)
			throws Exception {
		return itemDAO.applicationlist(fmsc_s01);
	}
	@Override
	public List<selectitembyitemcode> daylist(String SiteCode) throws Exception {

		return itemDAO.daylist(SiteCode);
	}
	@Override
	public List<maturitylist> maturitylist(Map<String, Object> map) throws Exception {
		
		return itemDAO.maturitylist(map);
	}
	@Override
	public List<selectitem> findItem(Map<String, Object> find) throws Exception {
		return itemDAO.findItem(find);
	}	
	
}
