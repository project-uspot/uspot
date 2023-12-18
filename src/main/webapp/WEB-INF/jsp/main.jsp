<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="./common/functions.jsp" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file ="./include/AdminTop.jsp" %>
<%@ include file ="./include/AdminLeft.jsp" %>

<%-- <c:import url="/AdminTop.do"></c:import>
<c:import url="/AdminLeft.do"></c:import> --%>

	<div class="span9" id="content">
		<div class="row-fluid">
		    <!-- block -->
			<div class="block">
	        	<div class="navbar navbar-inner block-header">
	            	<div class="muted pull-left"></div>
				</div>
	            <div class="block-content collapse in">
	            	<div class="span3">
	                	<div class="">
							<span class="label label-info"></span>님 환영합니다.
	            		</div>
	        		</div>
	    		</div> 
	    		
			</div>
	    		
		<!-- /block -->
		</div>
	</div>
