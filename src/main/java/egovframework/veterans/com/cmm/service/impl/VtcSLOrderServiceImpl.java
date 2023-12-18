package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.veterans.com.cmm.service.VtcSLOrderService;
import egovframework.veterans.com.cmm.service.vo.SLOrderGroup;
import egovframework.veterans.com.cmm.service.vo.SLOrderItem;

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

}
