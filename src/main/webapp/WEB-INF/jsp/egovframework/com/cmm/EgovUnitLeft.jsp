<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>eGovFrame 공통 컴포넌트</title>
<link href="<c:url value='/css/egovframework/com/cmm/main.css' />" rel="stylesheet" type="text/css">
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
<style type="text/css">
link { color: #666666; text-decoration: none; }
link:hover { color: #000000; text-decoration: none; }
</style>
</head>
<body>
<div id="lnb">
		<div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                	<!-- <div style="max-width:228px;">
                		<a href="/" target="_new">
                			<img src="/images/ci.png" style="width:100%;" />
                		</a>
                	</div> -->
					<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li> <!-- class="active" -->
                            <a href="#"><i class="icon-chevron-right"></i> 프로그램</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 공지사항</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 행사안내</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 건강정보</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 채용공고</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 입찰공고</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 일반자료실</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 묻고답하기</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 사진갤러리</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 동영상갤러리</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 경영공시</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 규정</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 종목/단체</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 팝업창 관리</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 메인이미지 관리</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon-chevron-right"></i> 팝업존 관리</a>
                        </li>
                    </ul>
                </div>
			</div>
		</div>
</div>

</body>
</html>
