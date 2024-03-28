package egovframework.veterans.com.cmm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.veterans.com.cmm.service.VtcSLOrderService;
import egovframework.veterans.com.cmm.service.vo.SLOrderGroup;
import egovframework.veterans.com.cmm.service.vo.SLOrderItem;
import egovframework.veterans.com.cmm.service.vo.SLOrders;

@Service("VtcSLOrderService")
public class VtcSLOrderServiceImpl extends EgovAbstractServiceImpl implements VtcSLOrderService {
	
	@Resource(name="VtcSLOrderDAO")
	private VtcSLOrderDAO slOrderDAO;

	@Override
	public List<SLOrderGroup> selectSLOrderGroup(String SiteCode) throws Exception {
		return slOrderDAO.selectSLOrderGroup(SiteCode);
	}
	@Override
	public SLOrderGroup getOrderGroupDetail(SLOrderGroup group) throws Exception {
		return slOrderDAO.getOrderGroupDetail(group);
	}
	@Override
	public void updateOrderGroup(SLOrderGroup group) throws Exception {
		slOrderDAO.updateOrderGroup(group);
	}
	@Override
	public void insertOrderGroup(SLOrderGroup group) throws Exception {
		slOrderDAO.insertOrderGroup(group);
	}
	@Override
	public void deleteOrderGroup(SLOrderGroup group) throws Exception {
		slOrderDAO.deleteOrderGroup(group);
	}
	@Override
	public int getGroupSortOrder(String SiteCode) throws Exception {
		return slOrderDAO.getGroupSortOrder(SiteCode);
	}
	
	@Override
	public List<SLOrderItem> listSLOderItem(String SiteCode) throws Exception {
		return slOrderDAO.listSLOderItem(SiteCode);
	}
	@Override
	public SLOrderItem getOrderItemDetail(SLOrderItem item) throws Exception {
		return slOrderDAO.getOrderItemDetail(item);
	}
	@Override
	public void updateOrderItem(SLOrderItem item) throws Exception {
		slOrderDAO.updateOrderItem(item);
	}
	@Override
	public void insertOrderItem(SLOrderItem item) throws Exception {
		slOrderDAO.insertOrderItem(item);
	}
	@Override
	public void deleteOrderItem(SLOrderItem item) throws Exception {
		slOrderDAO.deleteOrderItem(item);
	}
	@Override
	public int getItemSortOrder(String SiteCode) throws Exception {
		return slOrderDAO.getItemSortOrder(SiteCode);
	}

	@Override
	public List<SLOrderItem> listGroupItem(Map<String, Object> pkid) throws Exception {
		return slOrderDAO.listGroupItem(pkid);
	}
	@Override
	@Transactional(isolation = Isolation.READ_UNCOMMITTED)
	public int getOrderItemJungwon(Map<String, Object> setSql) {
		return slOrderDAO.getOrderItemJungwon(setSql);
	}
	@Override
	@Transactional(isolation = Isolation.READ_UNCOMMITTED)
	public Map<String, Object> getItemJungwon(Map<String, Object> setSql) {
		return slOrderDAO.getItemJungwon(setSql);
	}
	@Override
	@Transactional
	public int insertSLOrdersTemp(SLOrders orders) throws Exception {
		slOrderDAO.insertSLOrdersTemp(orders);
		slOrderDAO.insertSLOrdersDetailTemp(orders);
		return orders.getOrderID();
	}
	@Override
	public List<Map<String, Object>> selectOrderBarCode(Map<String, Object> setSql) {
		return slOrderDAO.selectOrderBarCode(setSql);
	}
	@Override
	public void updateBarCode(Map<String, Object> setSql) {
		slOrderDAO.updateBarCode(setSql);
	}
	
}
