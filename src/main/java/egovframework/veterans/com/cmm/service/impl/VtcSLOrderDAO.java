package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.SLOrderGroup;
import egovframework.veterans.com.cmm.service.vo.SLOrderItem;

@Repository("VtcSLOrderDAO")
public class VtcSLOrderDAO extends EgovComAbstractDAO {

	public List<SLOrderGroup> selectSLOrderGroup(String SiteCode) throws Exception {
		return selectList("order.selectSLOrderGroup", SiteCode);
	}
	public SLOrderGroup getOrderGroupDetail(SLOrderGroup group) throws Exception {
		return selectOne("order.getOrderGroupDetail", group);
	}
	public void updateOrderGroup(SLOrderGroup group) throws Exception {
		update("order.updateOrderGroup", group);
	}
	public void insertOrderGroup(SLOrderGroup group) throws Exception {
		insert("order.insertOrderGroup", group);
	}
	public void deleteOrderGroup(SLOrderGroup group) throws Exception {
		update("order.deleteOrderGroup", group);
	}
	public int getGroupSortOrder(String siteCode) {
		return selectOne("order.getGroupSortOrder", siteCode);
	}
	

	public List<SLOrderItem> listSLOderItem(String SiteCode) throws Exception {
		return selectList("order.listSLOderItem", SiteCode);
	}
	public SLOrderItem getOrderItemDetail(SLOrderItem item) throws Exception {
		return selectOne("order.getOrderItemDetail", item);
	}
	public void updateOrderItem(SLOrderItem item) throws Exception {
		update("order.updateOrderItem", item);
	}
	public void insertOrderItem(SLOrderItem item) throws Exception {
		insert("order.insertOrderItem", item);
	}
	public void deleteOrderItem(SLOrderItem item) throws Exception {
		update("order.deleteOrderItem", item);
	}
	public int getItemSortOrder(String siteCode) {
		return selectOne("order.getItemSortOrder", siteCode);
	}
	


	

}
