<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<c:choose>
	<c:when test="${menu_idx == 1}">
		<c:set var="open1" value="class='active'"/>
	</c:when>
	<c:when test="${menu_idx == 2}">
		<c:set var="open2" value="class='active'"/>
	</c:when>
	<c:when test="${menu_idx == 3}">
		<c:set var="open3" value="class='active'"/>
	</c:when>
	<c:when test="${menu_idx == 4}">
		<c:set var="open4" value="class='active'"/>
	</c:when>
	<c:when test="${menu_idx == 5}">
		<c:set var="open5" value="class='active'"/>
	</c:when>
	<c:when test="${menu_idx == 6}">
		<c:set var="open6" value="class='active'"/>
	</c:when>
	<c:when test="${menu_idx == 7}">
		<c:set var="open7" value="class='active'"/>
	</c:when>
	<c:when test="${menu_idx == 8}">
		<c:set var="open8" value="class='active'"/>
	</c:when>
	<c:when test="${menu_idx == 9}">
		<c:set var="open9" value="class='active'"/>
	</c:when>
	<c:when test="${menu_idx == 10}">
		<c:set var="open10" value="class='active'"/>
	</c:when>
</c:choose>
<html class="no-js">
<head>
<title>${HOME_TITLE} 관리자 페이지</title>
<!-- Bootstrap -->
<link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="/lib/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
<link href="/lib/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
<link href="/lib/assets/styles.css" rel="stylesheet" media="screen">
<script src="/lib/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script>
	function Logout(){
		//url
		top.location = "<c:url value='/m99.do'/>";
	}
</script>
</head>
<body>
	<div class="navbar navbar-fixed-top">
    	<div class="navbar-inner">
        	<div class="container-fluid">
            	<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
	            	<span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
				</a>
                <a class="brand" href="#">${HOME_TITLE } 관리자페이지</a>
                <div class="nav-collapse collapse">
					<ul class="nav">
    					<li ${open1 }>
        					<a href="${pageContext.request.contextPath}/selectLogList.do?PKID=111">로그관리</a>
						</li>         
						<li ${open2 }>
						    <a href="${pageContext.request.contextPath}/selectLessonList.do?PKID=37">강습관리</a>
						</li>
						<li ${open3 }>
						    <a href="${pageContext.request.contextPath}/selectMemberList.do?PKID=25">회원관리</a>
						</li>
						<li ${open4 }>
						    <a href="${pageContext.request.contextPath}/selectAccessList.do?PKID=32">출입관리</a>
						</li>              
						<li ${open5 }>
						    <a href="${pageContext.request.contextPath}/selectLockerList.do?PKID=87">사물함관리</a>
						</li>         
						<li ${open6 }>
						    <a href="${pageContext.request.contextPath}/selectRentList.do?PKID=95">대관관리</a>
						</li>
						<li ${open7 }>
						    <a href="${pageContext.request.contextPath}/selectPeopleList.do?PKID=43">인원현황</a>
						</li>
						<li ${open8 }>
						    <a href="${pageContext.request.contextPath}/selectPaidList.do?PKID=81">매출현황</a>
						</li>              
						<li ${open9 }>
						    <a href="${pageContext.request.contextPath}/selectSMSList.do?PKID=59">SMS</a>
						</li>
						<li ${open10 }>
						    <a href="${pageContext.request.contextPath}/selecSitecode.do?PKID=5">기초관리</a>
						</li>              
					</ul>
				</div>
                    <!--/.nav-collapse -->
        	</div>
    	</div>
	</div>