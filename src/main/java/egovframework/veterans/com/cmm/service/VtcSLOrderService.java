package egovframework.veterans.com.cmm.service;

import java.util.List;
import java.util.Map;

import egovframework.veterans.com.cmm.service.vo.SLOrderGroup;
import egovframework.veterans.com.cmm.service.vo.SLOrderItem;

public interface VtcSLOrderService {

	List<SLOrderGroup> selectSLOrderGroup(String SiteCode) throws Exception;
	SLOrderGroup getOrderGroupDetail(SLOrderGroup group) throws Exception;
	void updateOrderGroup(SLOrderGroup group) throws Exception;
	void insertOrderGroup(SLOrderGroup group) throws Exception;
	void deleteOrderGroup(SLOrderGroup group) throws Exception;
	int getGroupSortOrder(String SiteCode) throws Exception;
	
	List<SLOrderItem> listSLOderItem(String SiteCode) throws Exception;
	SLOrderItem getOrderItemDetail(SLOrderItem item) throws Exception;
	void updateOrderItem(SLOrderItem item) throws Exception;
	void insertOrderItem(SLOrderItem item) throws Exception;
	void deleteOrderItem(SLOrderItem item) throws Exception;
	int getItemSortOrder(String SiteCode) throws Exception;
	
	List<SLOrderItem> listGroupItem(Map<String, Object> pkid) throws Exception;
	int getOrderItemJungwon(Map<String, Object> setSql);
	Map<String, Object> getItemJungwon(Map<String, Object> setSql);
	
}
