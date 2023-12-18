<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/main.css' />">
<!-- Bootstrap -->
	<link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="/lib/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
	<link href="/lib/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
	<link href="/lib/assets/styles.css" rel="stylesheet" media="screen">
	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<script src="/lib/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<title>eGovFrame 공통 컴포넌트</title>
</head>
<body>
<div id="header">
	<div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">${HOME_TITLE } 관리자페이지</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li>
                                <a href="javascript:Logout();" role="button" > <i class="icon-user"></i> Logout</a>
                            </li>
                        </ul>
                        <ul class="nav ">
                            <li>
                                <a href="#">강습관리</a>
                            </li>              
                            <li >
                                <a href="#">회원관리</a>
                            </li>
                            <li >
                                <a href="#">출입관리</a>
                            </li>
                            <li >
                                <a href="#">사물함관리</a>
                            </li>
							<li>
                                <a href="#">대관관리</a>
                            </li>              
                            <li>
                                <a href="#">인원현황</a>
                            </li>
                            <li>
                                <a href="#">매출현황</a>
                            </li>
                            <li>
                                <a href="#">SMS</a>
                            </li>
                            <li>
                                <a href="#">기초관리</a>
                            </li>
                        </ul>
                    </div>
                    
                    <div></div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
</div>
</body>
</html>