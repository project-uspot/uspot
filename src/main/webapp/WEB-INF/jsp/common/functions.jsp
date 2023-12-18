<%@page import="egovframework.veterans.com.cmm.service.VtcService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="egovframework.rte.fdl.property.EgovPropertyService"%>
<%@page import="egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo"%>
<%@page import="java.util.Objects"%>
<%@page import="org.apache.commons.net.util.Base64"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.springframework.jdbc.datasource.DataSourceTransactionManager"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>


<%!
private String HOME_URL = "http://112.222.214.53:8082/"; 
private String HOME_URL2 = "http://112.222.214.53:8082/";
private String SERVER_NAME = "112.222.214.53:8082";
private String HOME_TITLE = "메인페이지";
%> 
<%-- <%!
private String HOME_URL = "http://localhost:8082/"; 
private String HOME_URL2 = "http://localhost:8082/";
private String SERVER_NAME = "localhost:8082";
private String HOME_TITLE = "메인페이지";
%>  --%>

<%
ServletContext ctx = pageContext.getServletContext();
WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(ctx);
VtcService vtcService = (VtcService)wac.getBean("VtcService");
EgovPropertyService propertyService = (EgovPropertyService)wac.getBean("propertiesService");
DataSourceTransactionManager txManager = (DataSourceTransactionManager)wac.getBean("txManager");

Logger log;
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>


<%!

public Object getNullToSpace(Object param) {
	return (Objects.isNull(param) || param.equals("null")) ? "" : param;
}

public String getNullToSpaceStrValue(Object obj) {
	return (Objects.isNull(obj) || obj.equals("null") || obj.equals("")) ? "" : String.valueOf(obj).trim();
}

public int getNullToSpaceInt(Object obj) {
	if (String.valueOf(obj).equals("null") || String.valueOf(obj).equals("") || Objects.isNull(obj)) {
		return 0;
	} else {
		try {
			return Integer.parseInt(String.valueOf(obj).trim());
		} catch (Exception e) {
			try {
				return (int) Double.parseDouble(String.valueOf(obj).trim());
			}catch (Exception e1) {
				return -1;
			}
		}
	}
}

protected String unscript(String data) {
	if (data == null || data.trim().equals("")) {
		return "";
	}

	String ret = data;

	ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
	ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

	ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
	ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

	ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
	ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

	ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
	ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

	ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
	ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

	return ret;
}

public String GetIPAddress(HttpServletRequest request) {
	String svr_cIP = "";
	String[] ar_cIP;
	if (Objects.isNull(request.getHeader("X-Forwarded-For")) || request.getHeader("X-Forwarded-For").equals("")) {
		svr_cIP = request.getRemoteAddr();
	} else {
		svr_cIP = request.getHeader("X-Forwarded-For");
	}
	if (svr_cIP.length() > 15) {
		ar_cIP = svr_cIP.split(",");
		svr_cIP = ar_cIP[0];
	}

	return svr_cIP;
}
%>