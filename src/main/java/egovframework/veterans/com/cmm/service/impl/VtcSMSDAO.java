package egovframework.veterans.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.veterans.com.cmm.service.vo.sms_mungu;

@Repository
public class VtcSMSDAO extends EgovComAbstractDAO{

	public List<sms_mungu> munguBySitecode(String SiteCode)throws Exception{
		return selectList("sms.munguBySitecode",SiteCode);
	}
	
	public void sms_munguInsert(sms_mungu sms_mungu)throws Exception{
		insert("sms.sms_munguInsert",sms_mungu);
	}
	
	public void sms_munguUpdate(sms_mungu sms_mungu)throws Exception{
		update("sms.sms_munguUpdate",sms_mungu);
	}
	
	public void sms_munguRemove(sms_mungu sms_mungu)throws Exception{
		update("sms.sms_munguRemove",sms_mungu);
	}
}
