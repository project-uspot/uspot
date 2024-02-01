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
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title -->
    <!-- ===============================================-->

<title>${HOME_TITLE}회원관리 프로그램</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="${pageContext.request.contextPath}/new_lib/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <meta name="robots" content="noindex">
    <script src="${pageContext.request.contextPath}/new_lib/vendors/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/vendors/simplebar/simplebar.min.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/assets/js/config.js"></script>



    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/new_lib/vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link href="${pageContext.request.contextPath}/new_lib/assets/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl">
    <link href="${pageContext.request.contextPath}/new_lib/assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
    <link href="${pageContext.request.contextPath}/new_lib/assets/css/user-rtl.min.css" type="text/css" rel="stylesheet" id="user-style-rtl">
    <link href="${pageContext.request.contextPath}/new_lib/assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
    <link href="${pageContext.request.contextPath}/new_lib/scss/theme/_navbar-vertical.scss" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/new_lib/vendors/dropzone/dropzone.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/new_lib/vendors/choices/choices.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    
    <script>
      var phoenixIsRTL = window.config.config.phoenixIsRTL;
      if (phoenixIsRTL) {
        var linkDefault = document.getElementById('style-default');
        var userLinkDefault = document.getElementById('user-style-default');
        linkDefault.setAttribute('disabled', true);
        userLinkDefault.setAttribute('disabled', true);
        document.querySelector('html').setAttribute('dir', 'rtl');
      } else {
        var linkRTL = document.getElementById('style-rtl');
        var userLinkRTL = document.getElementById('user-style-rtl');
        linkRTL.setAttribute('disabled', true);
        userLinkRTL.setAttribute('disabled', true);
      }
    </script>
    <link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet/leaflet.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/MarkerCluster.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/MarkerCluster.Default.css" rel="stylesheet">
</head>
<body>
	<main class="main" id="top">
	<!-- side -->
	<nav class="navbar navbar-vertical navbar-expand-lg">
        <script>
          var navbarStyle = window.config.config.phoenixNavbarStyle;
          if (navbarStyle && navbarStyle !== 'transparent') {
            document.querySelector('body').classList.add(`navbar-${navbarStyle}`);
          }
        </script>
        <div class="collapse navbar-collapse" id="navbarVerticalCollapse">
          <!-- scrollbar removed-->
          <div class="navbar-vertical-content">
            <ul class="navbar-nav flex-column" id="navbarVerticalNav">
              <!-- 강습관리 -->
             <c:choose>
			  <c:when test="${empty sessiontblAuthuserGroups}">
			    <li class="nav-item" style="display: none;">
			      <!-- 내용이 없을 때 처리할 내용 -->
			  </c:when>
			  <c:otherwise>
			    <c:forEach items="${sessiontblAuthuserGroups}" var="item">
			      <c:if test="${item.pgmPKID eq 37 or item.pgmPKID eq 38 or item.pgmPKID eq 39 
			       or item.pgmPKID eq 40 or item.pgmPKID eq 41 
			      or item.pgmPKID eq 42}">
			        <c:set var="itemValue" value="true" />
			      </c:if>
			      <c:if test="${item.pgmPKID eq 37}">
			      	<c:set var="value37" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 38}">
			      	<c:set var="value38" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 39}">
			      	<c:set var="value39" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 40}">
			      	<c:set var="value40" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 41}">
			      	<c:set var="value41" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 42}">
			      	<c:set var="value42" value="true"/>
			      </c:if>
			    </c:forEach>
			    <c:choose>
			      <c:when test="${itemValue eq true}">
			        <li class="nav-item">
			      </c:when>
			      <c:otherwise>
			        <li class="nav-item" style="display: none;">
			      </c:otherwise>
			    </c:choose>
			  </c:otherwise>
			</c:choose>
                <hr class="navbar-vertical-line" />
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#lesson" role="button" 
                data-bs-toggle="collapse" aria-expanded="false" aria-controls="lesson" style="display: block;">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon">
                      	<span class="fas fa-caret-right"></span>
                      </div>
                      <span class="nav-link-icon">
                      	<!-- <span data-feather="shopping-cart"></span> -->
                      	<span class="far fa-clipboard fs-1"></span>
                      </span>
                      <span class="nav-link-text">강습관리</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="lesson">
                    <c:if test="${value38 eq true}">
                      <li class="nav-item">
                      	<a class="nav-link dropdown-indicator" href="${pageContext.request.contextPath}/itemcode.do" data-bs-toggle="" aria-expanded="true" aria-controls="lesson">
                          <div class="d-flex align-items-center">
                            <div class=dropdown-indicator-icon></div><span class="nav-link-text">강습코드관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value37 eq true}">
                      <li class="nav-item">
                      	<a class="nav-link dropdown-indicator" href="${pageContext.request.contextPath}/classinfo.do" data-bs-toggle="" aria-expanded="true" aria-controls="lesson">
                          <div class="d-flex align-items-center">
                            <div class="dropdown-indicator-icon"></div><span class="nav-link-text">강습관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value41 eq true}">
                      <li class="nav-item">
                      	<a class="nav-link dropdown-indicator" href="#nv-customer" data-bs-toggle="" aria-expanded="true" aria-controls="lesson">
                          <div class="d-flex align-items-center">
                            <div class="dropdown-indicator-icon"></div><span class="nav-link-text">강습반 정원관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value39 eq true}">
                      <li class="nav-item">
                      	<a class="nav-link dropdown-indicator" href="#nv-customer" data-bs-toggle="" aria-expanded="true" aria-controls="lesson">
                          <div class="d-flex align-items-center">
                            <div class="dropdown-indicator-icon"></div><span class="nav-link-text">강사배정관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value40 eq true}">
                      <li class="nav-item">
                      	<a class="nav-link dropdown-indicator" href="#nv-customer" data-bs-toggle="" aria-expanded="true" aria-controls="lesson">
                          <div class="d-flex align-items-center">
                            <div class="dropdown-indicator-icon"></div><span class="nav-link-text">강습반별 재등록 대상현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value42 eq true}">
                      <li class="nav-item">
                      	<a class="nav-link dropdown-indicator" href="#nv-customer" data-bs-toggle="" aria-expanded="true" aria-controls="lesson">
                          <div class="d-flex align-items-center">
                            <div class="dropdown-indicator-icon"></div><span class="nav-link-text">휴관일자 관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                    </ul>
                  </div>
                </div>
                <!-- parent pages-->
              </li>
              <!-- 회원관리 -->
              <c:choose>
			  <c:when test="${empty sessiontblAuthuserGroups}">
			    <li class="nav-item" style="display: none;">
			      <!-- 내용이 없을 때 처리할 내용 -->
			  </c:when>
			  <c:otherwise>
			    <c:forEach items="${sessiontblAuthuserGroups}" var="item">
			      <c:if test="${item.pgmPKID eq 25 or item.pgmPKID eq 26 or item.pgmPKID eq 27 
			       or item.pgmPKID eq 28 or item.pgmPKID eq 30 
			      or item.pgmPKID eq 29 or item.pgmPKID eq 31 or item.pgmPKID eq 131 or item.pgmPKID eq 132
			       or item.pgmPKID eq 133 or item.pgmPKID eq 134 or item.pgmPKID eq 135}">
			        <c:set var="memberValue" value="true" />
			      </c:if>
			      <c:if test="${item.pgmPKID eq 25}">
			      	<c:set var="value25" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 26}">
			      	<c:set var="value26" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 27}">
			      	<c:set var="value27" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 28}">
			      	<c:set var="value28" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 30}">
			      	<c:set var="value30" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 29}">
			      	<c:set var="value29" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 31}">
			      	<c:set var="value31" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 131}">
			      	<c:set var="value131" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 132}">
			      	<c:set var="value132" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 133}">
			      	<c:set var="value133" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 134}">
			      	<c:set var="value134" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 135}">
			      	<c:set var="value135" value="true"/>
			      </c:if>
			    </c:forEach>
			    <c:choose>
			      <c:when test="${memberValue eq true}">
			        <li class="nav-item">
			      </c:when>
			      <c:otherwise>
			        <li class="nav-item" style="display: none;">
			      </c:otherwise>
			    </c:choose>
			  </c:otherwise>
			</c:choose>
                <hr class="navbar-vertical-line" />
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#member" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="member">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon">
                      	<span class="fas fa-caret-right"></span>
                      </div>
                      <span class="nav-link-icon">
                      	<span class="far fa-user-circle fs-1"></span>
                      </span>
                      <span class="nav-link-text">회원관리</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="member">
                      <li class="collapsed-nav-item-title d-none">회원관리
                      </li>
                      <c:if test="${value25 eq true}">
	                      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/membership.do" data-bs-toggle="" aria-expanded="false">
	                          <div class="d-flex align-items-center"><span class="nav-link-text">회원등록관리</span>
	                          </div>
	                        </a>
	                      </li>
                      </c:if>
                      <c:if test="${value26 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">회원카드발급현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value27 eq true}">
                      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/memberlist.do" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">회원명부조회</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value28 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">강습반 일괄변경</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value30 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">강습반 이월관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value29 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">회원상담현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value31 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">회원정보동의관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value131 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대기자관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value132 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대기자현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value133 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대기자강좌별현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value134 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대기자추첨기준정보</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value135 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대기자추첨</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                    </ul>
                  </div>
                </div>
              </li>
              <!-- 출입관리 -->
              <c:choose>
			  <c:when test="${empty sessiontblAuthuserGroups}">
			    <li class="nav-item" style="display: none;">
			      <!-- 내용이 없을 때 처리할 내용 -->
			  </c:when>
			  <c:otherwise>
			    <c:forEach items="${sessiontblAuthuserGroups}" var="item">
			      <c:if test="${item.pgmPKID eq 32 or item.pgmPKID eq 33 or item.pgmPKID eq 34 
			       or item.pgmPKID eq 35 or item.pgmPKID eq 36}">
			        <c:set var="chulibValue" value="true" />
			      </c:if>
			      <c:if test="${item.pgmPKID eq 32}">
			      	<c:set var="value32" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 33}">
			      	<c:set var="value33" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 34}">
			      	<c:set var="value34" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 35}">
			      	<c:set var="value35" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 36}">
			      	<c:set var="value36" value="true"/>
			      </c:if>
			    </c:forEach>
			    <c:choose>
			      <c:when test="${chulibValue eq true}">
			        <li class="nav-item">
			      </c:when>
			      <c:otherwise>
			        <li class="nav-item" style="display: none;">
			      </c:otherwise>
			    </c:choose>
			  </c:otherwise>
			</c:choose>
                <hr class="navbar-vertical-line" />
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#entry" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="entry">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon">
                      <span class="fas fa-caret-right"></span>
                      </div>
                      <span class="nav-link-icon">
                      	<!-- <span data-feather="help-circle"></span> -->
                      	<span class="fas fa-walking fs-1"></span>
                      </span>
                      <span class="nav-link-text">출입관리</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="entry">
                    <c:if test="${value32 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-accordion.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">출입관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value33 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">입장현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value34 eq true}">
                      <li class="nav-item">
                      	<%-- <a class="nav-link" href="${pageContext.request.contextPath}/OneDayOrder.do" data-bs-toggle="" aria-expanded="false"> --%>
                      	<a class="nav-link" href="javascript:void(0);" onclick="OneDayOrderPopup()" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center">
                          	<span class="nav-link-text">일일입장관리</span>
                          </div>
                        </a>
                        <script type="text/javascript">
                       		var myPopup;
                       		
	                        function OneDayOrderPopup() {
	                        	var url = "${pageContext.request.contextPath}/OneDayOrder.do";
	                            var windowName = "OneDayOrderPopup"; // 팝업 창의 이름
	                            var windowWidth = 1500; // 팝업 창의 가로 크기
	                            var windowHeight = 700; // 팝업 창의 세로 크기

	                            // 뷰포트의 가로, 세로 크기 가져오기
	                            var screenWidth = window.innerWidth;
	                            var screenHeight = window.innerHeight;

	                            // 팝업 창이 화면 중앙에 위치하도록 계산
	                            var left = (screenWidth - windowWidth) / 2 + window.screenX;
	                            var top = (screenHeight - windowHeight) / 2 + window.screenY;

	                            // 팝업 창 열기
	                            var windowFeatures = "width=" + windowWidth + ",height=" + windowHeight + ",left=" + left + ",top=" + top;
	                            if (myPopup === undefined || myPopup.closed) {
	                            	myPopup = window.open(url, "_blank", windowFeatures);
	                            } else {
	                            	myPopup.focus();
	                            }
	                            document.addEventListener('click', function() {
	    	                        if (myPopup && !myPopup.closed) {
	    	                            myPopup.focus();
	    	                        }
	                          	});
		                        
	                        }
                        </script>
                      </li>
                      </c:if>
                      <c:if test="${value35 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">일일입장 번호순출력</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value36 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">쿠폰 관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                    </ul>
                  </div>
                </div>
              </li>
              <!-- 사물함관리 -->
              <c:choose>
			  <c:when test="${empty sessiontblAuthuserGroups}">
			    <li class="nav-item" style="display: none;">
			  </c:when>
			  <c:otherwise>
			    <c:set var="containsValue" value="false" />
			    <c:forEach items="${sessiontblAuthuserGroups}" var="item">
			      <c:if test="${item.pgmPKID eq 87 or item.pgmPKID eq 88 or item.pgmPKID eq 89 or item.pgmPKID eq 90 or item.pgmPKID eq 91}">
			        <c:set var="containsValue" value="true" />
			      </c:if>
			    </c:forEach>
			    <c:choose>
			      <c:when test="${containsValue eq true}">
			        <li class="nav-item">
			      </c:when>
			      <c:otherwise>
			        <li class="nav-item" style="display: none;">
			      </c:otherwise>
			    </c:choose>
			  </c:otherwise>
			</c:choose>
                <hr class="navbar-vertical-line"/>
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#locker" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="locker">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon">
                      	<span class="fas fa-caret-right"></span>
                      </div>
                      <span class="nav-link-icon">
                      	<!-- <span data-feather="settings"></span> -->
                      	<span class="uil-keyhole-square fs-1"></span>
                      </span>
                      <span class="nav-link-text">사물함관리</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="locker">
	                   	<c:forEach items="${sessiontblAuthuserGroups}" var="list">
	                   		<c:if test="${list.pgmPKID == 87}">
	                   			<li class="nav-item">
	                   				<a class="nav-link" href="${pageContext.request.contextPath}/samulhaminfo.do" data-bs-toggle="" aria-expanded="false">
                         				<div class="d-flex align-items-center">
                         					<span class="nav-link-text">사물함 분류정보 관리</span>
                         				</div>
	                       			</a>
	                     		</li>
	                   		</c:if>
	                   		<c:if test="${list.pgmPKID == 88}">
	                   			<li class="nav-item">
	                   				<a class="nav-link" href="${pageContext.request.contextPath}/lockercodelist.do" data-bs-toggle="" aria-expanded="false">
                          				<div class="d-flex align-items-center"><span class="nav-link-text">사물함코드 관리</span>
                          				</div>
                        			</a>
                      			</li>
	                   		</c:if>

	                   		<c:if test="${list.pgmPKID == 89}">
	                   			<li class="nav-item">
	                   				<a class="nav-link" href="documentation/customization/dark-mode.html" data-bs-toggle="" aria-expanded="false">
                          				<div class="d-flex align-items-center">
                          					<span class="nav-link-text">사물함 이용현황</span>
                          				</div>
                        			</a>
                      			</li>
	                   		</c:if>

	                   		<c:if test="${list.pgmPKID == 90}">
	                   			<li class="nav-item">
	                   				<a class="nav-link" href="documentation/customization/plugin.html" data-bs-toggle="" aria-expanded="false">
	                         			<div class="d-flex align-items-center">
	                         				<span class="nav-link-text">사물함 보증금내역</span>
	                         			</div>
                        			</a>
                      			</li>
	                   		</c:if>

	                   		<c:if test="${list.pgmPKID == 91}">
	                   			<li class="nav-item">
	                   				<a class="nav-link" href="documentation/customization/plugin.html" data-bs-toggle="" aria-expanded="false">
			                          <div class="d-flex align-items-center">
			                          	<span class="nav-link-text">사물함 이용내역</span>
			                          </div>
			                        </a>
			                   	</li>
	                   		</c:if>
		                  </c:forEach>
                    </ul>
                  </div>
                </div>
              </li>
              <!-- 대관관리 -->
              <c:choose>
			  <c:when test="${empty sessiontblAuthuserGroups}">
			    <li class="nav-item" style="display: none;">
			      <!-- 내용이 없을 때 처리할 내용 -->
			  </c:when>
			  <c:otherwise>
			    <c:forEach items="${sessiontblAuthuserGroups}" var="item">
				  <c:if test="${item.pgmPKID eq 95 or item.pgmPKID eq 92 or item.pgmPKID eq 94 
				               or item.pgmPKID eq 93 or item.pgmPKID eq 97 
				               or item.pgmPKID eq 98 or item.pgmPKID eq 96
				               or item.pgmPKID eq 110 or item.pgmPKID eq 99 
				               or item.pgmPKID eq 100 or item.pgmPKID eq 101 
				               or item.pgmPKID eq 105 or item.pgmPKID eq 106 
				               or item.pgmPKID eq 102 or item.pgmPKID eq 103 
				               or item.pgmPKID eq 104 or item.pgmPKID eq 107 
				               or item.pgmPKID eq 108 or item.pgmPKID eq 109}">
				    <c:set var="value" value="true" scope="page" />
				    <c:set target="${pageScope}" property="value${item.pgmPKID}" value="${value}" />
				    <c:set var="rentValue" value="true"/>
				  </c:if>
				</c:forEach>
			    <c:choose>
			      <c:when test="${rentValue eq true}">
			        <li class="nav-item">
			      </c:when>
			      <c:otherwise>
			        <li class="nav-item" style="display: none;">
			      </c:otherwise>
			    </c:choose>
			  </c:otherwise>
			</c:choose>
                <hr class="navbar-vertical-line" />
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#rent" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="rent">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon">
                      	<span class="fas fa-caret-right"></span>
                      </div>
                      <span class="nav-link-icon">
                      	<!-- <span data-feather="help-circle"></span> -->
                      	<span class="far fa-building fs-1"></span>
                      </span>
                      <span class="nav-link-text">대관관리</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="rent">
                    <c:if test="${value95 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-accordion.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value92 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관코드관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value94 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관기간관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value93 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관-휴관관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value97 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관-공휴일관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value98 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관-기타금액관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value96 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관환불/취소·정지</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value110 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value99 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관매출현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value100 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관환불현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value101 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관미납현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value105 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관설비현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value106 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관불허가현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value102 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관추첨</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value103 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관추첨자현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value104 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관추첨현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value107 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관팀 관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value108 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">대관팀원 관리</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value109 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">미사용대관현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                    </ul>
                  </div>
                </div>
              </li>
               <!-- 인원현황 -->
              <c:choose>
				  <c:when test="${empty sessiontblAuthuserGroups}">
				    <li class="nav-item" style="display: none;">
				  </c:when>
				  <c:otherwise>
				    <c:forEach items="${sessiontblAuthuserGroups}" var="item">
				      <c:if test="${item.pgmPKID eq 43 or item.pgmPKID eq 44 or item.pgmPKID eq 45 
				                   or item.pgmPKID eq 46 or item.pgmPKID eq 47 
				                   or item.pgmPKID eq 48 or item.pgmPKID eq 49 
				                   or item.pgmPKID eq 50 or item.pgmPKID eq 52 
				                   or item.pgmPKID eq 53 or item.pgmPKID eq 54 
				                   or item.pgmPKID eq 55 or item.pgmPKID eq 56 
				                   or item.pgmPKID eq 51 or item.pgmPKID eq 57 
				                   or item.pgmPKID eq 58}">
				        <c:set var="pervalue" value="true"/>
				        <c:set target="${pageScope}" property="value${item.pgmPKID}" value="${pervalue}" />
				        <c:set var="personValue" value="true" />
				      </c:if>
				    </c:forEach>
				    <c:choose>
				      <c:when test="${personValue eq true}">
				        <li class="nav-item">
				      </c:when>
				      <c:otherwise>
				        <li class="nav-item" style="display: none;">
				      </c:otherwise>
				    </c:choose>
				  </c:otherwise>
				</c:choose>
                <hr class="navbar-vertical-line" />
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#people" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="people">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon">
                      <span class="fas fa-caret-right"></span>
                     </div>
                     <span class="nav-link-icon">
                     	<!-- <span data-feather="help-circle"></span> -->
                     	<svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                     </span>
                     <span class="nav-link-text">인원현황</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="people">
                    <c:if test="${value43 eq true}">
                      <li class="nav-item"><a class="nav-link" href="applicationlist.do" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">접수현황 조회</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value44 eq true}">
                      <li class="nav-item"><a class="nav-link" href="maturitylist.do" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">만기현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value45 eq true}">
                      <li class="nav-item"><a class="nav-link" href="refundpersonlist.do" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">환불인원현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value46 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">강좌별 현회원명부</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value47 eq true}">
                      <li class="nav-item"><a class="nav-link" href="learningcurrentlist.do" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">강좌별 현인원현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value48 eq true}">
                      <li class="nav-item"><a class="nav-link" href="attendancelist.do" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">출석부</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value49 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">강사별출석부</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value50 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">수업일지</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value52 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">정기/반변경 상세내역</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value53 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">미방문회원현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value54 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">휴회관련회원현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value55 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">환불대기자현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value56 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">접수현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value51 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">실시간접수현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value57 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">종목별월별회원현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value58 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">재등록 제한 현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                    </ul>
                  </div>
                </div>
              </li>
              <!-- 매출현황 -->
              <c:choose>
				  <c:when test="${empty sessiontblAuthuserGroups}">
				    <li class="nav-item" style="display: none;">
				  </c:when>
				  <c:otherwise>
				    <c:forEach items="${sessiontblAuthuserGroups}" var="item">
				      <c:if test="${item.pgmPKID eq 81 or item.pgmPKID eq 61 or item.pgmPKID eq 63 
				                   or item.pgmPKID eq 85 or item.pgmPKID eq 64 
				                   or item.pgmPKID eq 79 or item.pgmPKID eq 69 
				                   or item.pgmPKID eq 68 or item.pgmPKID eq 83 
				                   or item.pgmPKID eq 70 or item.pgmPKID eq 71 
				                   or item.pgmPKID eq 72 or item.pgmPKID eq 62 
				                   or item.pgmPKID eq 73 or item.pgmPKID eq 65 
				                   or item.pgmPKID eq 74 or item.pgmPKID eq 75 
				                   or item.pgmPKID eq 76 or item.pgmPKID eq 77 
				                   or item.pgmPKID eq 78 or item.pgmPKID eq 80 
				                   or item.pgmPKID eq 82 or item.pgmPKID eq 86}">
				        <c:set var="salvalue" value="true"/>
				        <c:set target="${pageScope}" property="value${item.pgmPKID}" value="${salvalue}" />
				        <c:set var="salesValue" value="true" />
				      </c:if>
				    </c:forEach>
				    <c:choose>
				      <c:when test="${salesValue eq true}">
				        <li class="nav-item">
				      </c:when>
				      <c:otherwise>
				        <li class="nav-item" style="display: none;">
				      </c:otherwise>
				    </c:choose>
				  </c:otherwise>
				</c:choose>
                <hr class="navbar-vertical-line" />
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#paid" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="paid">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon">
                      	<span class="fas fa-caret-right"></span>
                      </div>
                      <span class="nav-link-icon">
                      	<!-- <span data-feather="help-circle"></span> -->
                      	<svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
                      </span>
                      <span class="nav-link-text">매출현황</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="paid">
                    <c:if test="${value81 eq true}">
                      <li class="nav-item"><a class="nav-link" href="settlemnetlist.do" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">기간결산</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value61 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">매출일보</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value63 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">일일마감</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value85 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">강사료산정</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value64 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">미납자현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value79 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">환불현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value69 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">카드결제처리현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value68 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">강습매출조정</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value83 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">현금영수증승인현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value70 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">월별 종목별 가입통계</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value71 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">월별 종목별 가입금액통계</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value72 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">수납자별 입금현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value62 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">일일입장 판매내역</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value73 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">일일업장 수입금</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value65 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">일일입장 매출현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value74 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">품목별 매출분포현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value75 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">월별 일일운영현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value76 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">분기별 연간수입내역</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value77 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">연도별 수입내역</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value78 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">수강료 납입영수증</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value80 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">할인</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value82 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">기타비용 매출현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value86 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">제로페이 매출현황</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                    </ul>
                  </div>
                </div>
              </li>
              <!-- SMS -->
              <c:choose>
				  <c:when test="${empty sessiontblAuthuserGroups}">
				    <li class="nav-item" style="display: none;">
				  </c:when>
				  <c:otherwise>
				    <c:forEach items="${sessiontblAuthuserGroups}" var="item">
				      <c:if test="${item.pgmPKID eq 59 or item.pgmPKID eq 60}">
				        <c:set var="mesvalue" value="true"/>
				        <c:set target="${pageScope}" property="value${item.pgmPKID}" value="${mesvalue}" />
				        <c:set var="messageValue" value="true" />
				      </c:if>
				    </c:forEach>
				    <c:choose>
				      <c:when test="${messageValue eq true}">
				        <li class="nav-item">
				      </c:when>
				      <c:otherwise>
				        <li class="nav-item" style="display: none;">
				      </c:otherwise>
				    </c:choose>
				  </c:otherwise>
				</c:choose>
                <hr class="navbar-vertical-line" />
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#sms" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="sms">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon">
                      	<span class="fas fa-caret-right"></span>
                      </div>
                      <span class="nav-link-icon">
                      	<!-- <span data-feather="help-circle"></span> -->
                      	<svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
                      </span>
                      <span class="nav-link-text">SMS</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="sms">
                    <c:if test="${value59 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-accordion.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">SMS보내기</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                      <c:if test="${value60 eq true}">
                      <li class="nav-item"><a class="nav-link" href="pages/faq/faq-tab.html" data-bs-toggle="" aria-expanded="false">
                          <div class="d-flex align-items-center"><span class="nav-link-text">SMS전송내역</span>
                          </div>
                        </a>
                      </li>
                      </c:if>
                    </ul>
                  </div>
                </div>
              </li>
              <!-- 기초관리 -->
              <c:choose>
			  <c:when test="${empty sessiontblAuthuserGroups}">
			    <li class="nav-item" style="display: none;">
			      <!-- 내용이 없을 때 처리할 내용 -->
			  </c:when>
			  <c:otherwise>
			    <c:forEach items="${sessiontblAuthuserGroups}" var="item">
			      <c:if test="${item.pgmPKID eq 5 or item.pgmPKID eq 3 or item.pgmPKID eq 4 
			       or item.pgmPKID eq 1 or item.pgmPKID eq 8 
			      or item.pgmPKID eq 2 or item.pgmPKID eq 10 or item.pgmPKID eq 9
			       or item.pgmPKID eq 20 or item.pgmPKID eq 14 or item.pgmPKID eq 15
			        or item.pgmPKID eq 16 or item.pgmPKID eq 24}">
			        <c:set var="basicValue" value="true" />
			      </c:if>
			      <c:if test="${item.pgmPKID eq 5}">
			      	<c:set var="value5" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 3}">
			      	<c:set var="value3" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 4}">
			      	<c:set var="value4" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 1}">
			      	<c:set var="value1" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 8}">
			      	<c:set var="value8" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 2}">
			      	<c:set var="value2" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 10}">
			      	<c:set var="value10" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 9}">
			      	<c:set var="value9" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 20}">
			      	<c:set var="value20" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 14}">
			      	<c:set var="value14" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 15}">
			      	<c:set var="value15" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 16}">
			      	<c:set var="value16" value="true"/>
			      </c:if>
			      <c:if test="${item.pgmPKID eq 24}">
			      	<c:set var="value24" value="true"/>
			      </c:if>
			    </c:forEach>
			    <c:choose>
			      <c:when test="${basicValue eq true}">
			        <li class="nav-item">
			      </c:when>
			      <c:otherwise>
			        <li class="nav-item" style="display: none;">
			      </c:otherwise>
			    </c:choose>
			  </c:otherwise>
			</c:choose>
                <hr class="navbar-vertical-line" />
                <!-- parent pages-->
                <div class="nav-item-wrapper"><a class="nav-link dropdown-indicator label-1" href="#basics" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="basics">
                    <div class="d-flex align-items-center">
                      <div class="dropdown-indicator-icon">
                      	<span class="fas fa-caret-right"></span>
                      </div>
                      <span class="nav-link-icon">
                      	<!-- <span data-feather="settings"></span> -->
                      	<svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg>
                      </span>
                      <span class="nav-link-text">기초관리</span>
                    </div>
                  </a>
                  <div class="parent-wrapper label-1">
                    <ul class="nav collapse parent" data-bs-parent="#navbarVerticalCollapse" id="basics">
                      <li class="collapsed-nav-item-title d-none">기초관리</li>
	                  	<c:if test="${value5 eq true}">
	                      <li class="nav-item">
	                      	<a class="nav-link" href="${pageContext.request.contextPath}/selecSitecode.do?siteCode=10001" data-bs-toggle="" aria-expanded="false" aria-controls="basics">
	                          <div class="d-flex align-items-center">
	                          	<span class="nav-link-text">사업장관리</span>
	                          </div>
	                        </a>
	                      </li>
                      	</c:if>
                      	<c:if test="${value3 eq true}">
	                      <li class="nav-item">
	                      	<a class="nav-link" href="${pageContext.request.contextPath}/selecSitecode.do" data-bs-toggle="" aria-expanded="false" aria-controls="basics">
	                          <div class="d-flex align-items-center">
	                          	<span class="nav-link-text">프로그램그룹관리</span>
	                          </div>
	                        </a>
	                      </li>
                      	</c:if>
                      	<c:if test="${value4 eq true}">
	                      <li class="nav-item">
	                      	<a class="nav-link" href="${pageContext.request.contextPath}/selecSitecode.do" data-bs-toggle="" aria-expanded="false" aria-controls="basics">
	                          <div class="d-flex align-items-center">
	                          	<span class="nav-link-text">프로그램관리</span>
	                          </div>
	                        </a>
	                      </li>
                      	</c:if>
                      	<c:if test="${value1 eq true}">
	                      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/UserGroup.do" data-bs-toggle="" aria-expanded="false"aria-controls="basics">
	                          <div class="d-flex align-items-center"><span class="nav-link-text">사용자그룹관리</span></div>
	                        </a>
	                      </li>
                      </c:if>
                      <c:if test="${value8 eq true}">
	                      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/groupAuthority.do" data-bs-toggle="" aria-expanded="false" aria-controls="basics">
	                          <div class="d-flex align-items-center"><span class="nav-link-text">사용자그룹별 권한관리</span></div>
	                        </a>
	                      </li>
                      </c:if>
                      <c:if test="${value2 eq true}">
	                      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Users.do" data-bs-toggle="" aria-expanded="false" aria-controls="basics">
	                          <div class="d-flex align-items-center"><span class="nav-link-text">사용자관리</span></div>
	                        </a>
	                      </li>
                      </c:if>
                      <c:if test="${value10 eq true}">
	                      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/userAuthorityGroup.do" data-bs-toggle="" aria-expanded="false" aria-controls="basics">
	                          <div class="d-flex align-items-center"><span class="nav-link-text">사용자별 권한그룹 지정</span></div>
	                        </a>
	                      </li>
                      </c:if>
                      <c:if test="${value9 eq true}">
	                      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/DCType.do" data-bs-toggle="" aria-expanded="false" aria-controls="basics">
	                          <div class="d-flex align-items-center"><span class="nav-link-text">할인유형관리</span></div>
	                        </a>
	                      </li>
                      </c:if>
                      <c:if test="${value20 eq true}">
	                      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ExpenseGroup.do" data-bs-toggle="" aria-expanded="false" aria-controls="basics">
	                          <div class="d-flex align-items-center"><span class="nav-link-text">비용항목그룹관리</span></div>
	                        </a>
	                      </li>
                      </c:if>
                      <c:if test="${value14 eq true}">
	                      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Expense.do" data-bs-toggle="" aria-expanded="false" aria-controls="basics">
	                          <div class="d-flex align-items-center"><span class="nav-link-text">비용항목관리</span></div>
	                        </a>
	                      </li>
                      </c:if>
                      <c:if test="${value15 eq true}">
	                      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/SLOrderGroup.do" data-bs-toggle="" aria-expanded="false" aria-controls="basics">
	                          <div class="d-flex align-items-center"><span class="nav-link-text">일일입장 메뉴 분류관리</span></div>
	                        </a>
	                      </li>
                      </c:if>
                      <c:if test="${value16 eq true}">
	                      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/SLOrderItem.do" data-bs-toggle="" aria-expanded="false" aria-controls="basics">
	                          <div class="d-flex align-items-center"><span class="nav-link-text">일일입장 메뉴 관리</span></div>
	                        </a>
	                      </li>
                      </c:if>
                      <c:if test="${value24 eq true}">
	                      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/selectBaseList.do" data-bs-toggle="" aria-expanded="false" aria-controls="basics">
	                          <div class="d-flex align-items-center"><span class="nav-link-text">관리자 수정기능</span></div>
	                        </a>
	                      </li>
                      </c:if>
                    </ul>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div class="navbar-vertical-footer">
          <button class="btn navbar-vertical-toggle border-0 fw-semi-bold w-100 white-space-nowrap d-flex align-items-center"><span class="uil uil-left-arrow-to-left fs-0"></span><span class="uil uil-arrow-from-right fs-0"></span><span class="navbar-vertical-footer-text ms-2">닫기</span></button>
        </div>
      </nav>
      
      
  
	<!-- side end -->
	
	<!-- header -->
	<nav class="navbar navbar-top fixed-top navbar-expand" id="navbarDefault">
        <div class="collapse navbar-collapse justify-content-between">
          <div class="navbar-logo">

            <button class="btn navbar-toggler navbar-toggler-humburger-icon hover-bg-transparent" type="button" data-bs-toggle="collapse" data-bs-target="#navbarVerticalCollapse" aria-controls="navbarVerticalCollapse" aria-expanded="false" aria-label="Toggle Navigation"><span class="navbar-toggle-icon"><span class="toggle-line"></span></span></button>
            <a class="navbar-brand me-1 me-sm-3" href="${pageContext.request.contextPath}/selecSitecode.do">
              <div class="d-flex align-items-center">
                <div class="d-flex align-items-center"><img src="${pageContext.request.contextPath}/new_lib/assets/img/icons/uspot.jpg" alt="phoenix" width="27" />
                  <p class="logo-text ms-2 d-none d-sm-block">회원관리프로그램</p>
                </div>
              </div>
            </a>
          </div>
          <div class="search-box navbar-top-search-box d-none d-lg-block" data-list='{"valueNames":["title"]}' style="width:25rem;">
            <form class="position-relative" data-bs-toggle="search" data-bs-display="static">
              <input class="form-control search-input fuzzy-search rounded-pill form-control-sm" type="search" placeholder="Search..." aria-label="Search" data-bs-toggle="tooltip" data-bs-placement="right" title="검색" />
              <span class="fas fa-search search-box-icon"></span>

            </form>
            <div class="btn-close position-absolute end-0 top-50 translate-middle cursor-pointer shadow-none" data-bs-dismiss="search">
              <button class="btn btn-link btn-close-falcon p-0" aria-label="Close"></button>
            </div>
            <div class="dropdown-menu border border-300 font-base start-0 py-0 overflow-hidden w-100">
              <div class="scrollbar-overlay" style="max-height: 30rem;">
                <div class="list pb-3">
                  <h6 class="dropdown-header text-1000 fs--2 py-2">24 <span class="text-500">results</span></h6>
                  <hr class="text-200 my-0" />
                  <h6 class="dropdown-header text-1000 fs--1 border-bottom border-200 py-2 lh-sm">Recently Searched </h6>
                  <div class="py-2"><a class="dropdown-item" href="apps/e-commerce/landing/product-details.html">
                      <div class="d-flex align-items-center">

                        <div class="fw-normal text-1000 title"><span class="fa-solid fa-clock-rotate-left" data-fa-transform="shrink-2"></span> Store Macbook</div>
                      </div>
                    </a>
                    <a class="dropdown-item" href="apps/e-commerce/landing/product-details.html">
                      <div class="d-flex align-items-center">

                        <div class="fw-normal text-1000 title"> <span class="fa-solid fa-clock-rotate-left" data-fa-transform="shrink-2"></span> MacBook Air - 13″</div>
                      </div>
                    </a>

                  </div>
                  <hr class="text-200 my-0" />
                  <h6 class="dropdown-header text-1000 fs--1 border-bottom border-200 py-2 lh-sm">Products</h6>
                  <div class="py-2"><a class="dropdown-item py-2 d-flex align-items-center" href="apps/e-commerce/landing/product-details.html">
                      <div class="file-thumbnail me-2"><img class="h-100 w-100 fit-cover rounded-3" src="${pageContext.request.contextPath}/new_lib/assets/img/products/60x60/3.png" alt="" /></div>
                      <div class="flex-1">
                        <h6 class="mb-0 text-1000 title">MacBook Air - 13″</h6>
                        <p class="fs--2 mb-0 d-flex text-700"><span class="fw-medium text-600">8GB Memory - 1.6GHz - 128GB Storage</span></p>
                      </div>
                    </a>
                    <a class="dropdown-item py-2 d-flex align-items-center" href="apps/e-commerce/landing/product-details.html">
                      <div class="file-thumbnail me-2"><img class="img-fluid" src="${pageContext.request.contextPath}/new_lib/assets/img/products/60x60/3.png" alt="" /></div>
                      <div class="flex-1">
                        <h6 class="mb-0 text-1000 title">MacBook Pro - 13″</h6>
                        <p class="fs--2 mb-0 d-flex text-700"><span class="fw-medium text-600 ms-2">30 Sep at 12:30 PM</span></p>
                      </div>
                    </a>

                  </div>
                  <hr class="text-200 my-0" />
                  <h6 class="dropdown-header text-1000 fs--1 border-bottom border-200 py-2 lh-sm">Quick Links</h6>
                  <div class="py-2"><a class="dropdown-item" href="apps/e-commerce/landing/product-details.html">
                      <div class="d-flex align-items-center">

                        <div class="fw-normal text-1000 title"><span class="fa-solid fa-link text-900" data-fa-transform="shrink-2"></span> Support MacBook House</div>
                      </div>
                    </a>
                    <a class="dropdown-item" href="apps/e-commerce/landing/product-details.html">
                      <div class="d-flex align-items-center">

                        <div class="fw-normal text-1000 title"> <span class="fa-solid fa-link text-900" data-fa-transform="shrink-2"></span> Store MacBook″</div>
                      </div>
                    </a>

                  </div>
                  <hr class="text-200 my-0" />
                  <h6 class="dropdown-header text-1000 fs--1 border-bottom border-200 py-2 lh-sm">Files</h6>
                  <div class="py-2"><a class="dropdown-item" href="apps/e-commerce/landing/product-details.html">
                      <div class="d-flex align-items-center">

                        <div class="fw-normal text-1000 title"><span class="fa-solid fa-file-zipper text-900" data-fa-transform="shrink-2"></span> Library MacBook folder.rar</div>
                      </div>
                    </a>
                    <a class="dropdown-item" href="apps/e-commerce/landing/product-details.html">
                      <div class="d-flex align-items-center">

                        <div class="fw-normal text-1000 title"> <span class="fa-solid fa-file-lines text-900" data-fa-transform="shrink-2"></span> Feature MacBook extensions.txt</div>
                      </div>
                    </a>
                    <a class="dropdown-item" href="apps/e-commerce/landing/product-details.html">
                      <div class="d-flex align-items-center">

                        <div class="fw-normal text-1000 title"> <span class="fa-solid fa-image text-900" data-fa-transform="shrink-2"></span> MacBook Pro_13.jpg</div>
                      </div>
                    </a>

                  </div>
                  <hr class="text-200 my-0" />
                  <h6 class="dropdown-header text-1000 fs--1 border-bottom border-200 py-2 lh-sm">Members</h6>
                  <hr class="text-200 my-0" />
                  <h6 class="dropdown-header text-1000 fs--1 border-bottom border-200 py-2 lh-sm">Related Searches</h6>
                  <div class="py-2"><a class="dropdown-item" href="apps/e-commerce/landing/product-details.html">
                      <div class="d-flex align-items-center">

                        <div class="fw-normal text-1000 title"><span class="fa-brands fa-firefox-browser text-900" data-fa-transform="shrink-2"></span> Search in the Web MacBook</div>
                      </div>
                    </a>
                    <a class="dropdown-item" href="apps/e-commerce/landing/product-details.html">
                      <div class="d-flex align-items-center">

                        <div class="fw-normal text-1000 title"> <span class="fa-brands fa-chrome text-900" data-fa-transform="shrink-2"></span> Store MacBook″</div>
                      </div>
                    </a>

                  </div>
                </div>
                <div class="text-center">
                  <p class="fallback fw-bold fs-1 d-none">No Result Found.</p>
                </div>
              </div>
            </div>
          </div>
          <ul class="navbar-nav navbar-nav-icons flex-row">
            <li class="nav-item">
              <div class="theme-control-toggle fa-icon-wait px-2">
                <input class="form-check-input ms-0 theme-control-toggle-input" type="checkbox" data-theme-control="phoenixTheme" value="dark" id="themeControlToggle" />
                <label class="mb-0 theme-control-toggle-label theme-control-toggle-light" for="themeControlToggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Switch theme"><span class="icon" data-feather="moon"></span></label>
                <label class="mb-0 theme-control-toggle-label theme-control-toggle-dark" for="themeControlToggle" data-bs-toggle="tooltip" data-bs-placement="left" title="Switch theme"><span class="icon" data-feather="sun"></span></label>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link" href="#" style="min-width: 2.5rem" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-bs-auto-close="outside"><span data-feather="bell" style="height:20px;width:20px;"></span></a>

              <div class="dropdown-menu dropdown-menu-end notification-dropdown-menu py-0 shadow border border-300 navbar-dropdown-caret" id="navbarDropdownNotfication" aria-labelledby="navbarDropdownNotfication">
                <div class="card position-relative border-0">
                  <div class="card-header p-2">
                    <div class="d-flex justify-content-between">
                      <h5 class="text-black mb-0">Notificatons</h5>
                      <button class="btn btn-link p-0 fs--1 fw-normal" type="button">Mark all as read</button>
                    </div>
                  </div>
                  <div class="card-body p-0">
                    <div class="scrollbar-overlay" style="height: 27rem;">
                      <div class="border-300">
                        <div class="px-2 px-sm-3 py-3 border-300 notification-card position-relative read border-bottom">
                          <div class="d-flex align-items-center justify-content-between position-relative">
                            <div class="d-flex">
                              <div class="avatar avatar-m status-online me-3"><img class="rounded-circle" src="${pageContext.request.contextPath}/new_lib/assets/img/team/40x40/30.webp" alt="" />
                              </div>
                              <div class="flex-1 me-sm-3">
                                <h4 class="fs--1 text-black">Jessie Samson</h4>
                                <p class="fs--1 text-1000 mb-2 mb-sm-3 fw-normal"><span class='me-1 fs--2'>💬</span>Mentioned you in a comment.<span class="ms-2 text-400 fw-bold fs--2">10m</span></p>
                                <p class="text-800 fs--1 mb-0"><span class="me-1 fas fa-clock"></span><span class="fw-bold">10:41 AM </span>August 7,2021</p>
                              </div>
                            </div>
                            <div class="font-sans-serif d-none d-sm-block">
                              <button class="btn fs--2 btn-sm dropdown-toggle dropdown-caret-none transition-none notification-dropdown-toggle" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="fas fa-ellipsis-h fs--2 text-900"></span></button>
                              <div class="dropdown-menu dropdown-menu-end py-2"><a class="dropdown-item" href="#!">Mark as unread</a></div>
                            </div>
                          </div>
                        </div>
                        <div class="px-2 px-sm-3 py-3 border-300 notification-card position-relative unread border-bottom">
                          <div class="d-flex align-items-center justify-content-between position-relative">
                            <div class="d-flex">
                              <div class="avatar avatar-m status-online me-3">
                                <div class="avatar-name rounded-circle"><span>J</span></div>
                              </div>
                              <div class="flex-1 me-sm-3">
                                <h4 class="fs--1 text-black">Jane Foster</h4>
                                <p class="fs--1 text-1000 mb-2 mb-sm-3 fw-normal"><span class='me-1 fs--2'>📅</span>Created an event.<span class="ms-2 text-400 fw-bold fs--2">20m</span></p>
                                <p class="text-800 fs--1 mb-0"><span class="me-1 fas fa-clock"></span><span class="fw-bold">10:20 AM </span>August 7,2021</p>
                              </div>
                            </div>
                            <div class="font-sans-serif d-none d-sm-block">
                              <button class="btn fs--2 btn-sm dropdown-toggle dropdown-caret-none transition-none notification-dropdown-toggle" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="fas fa-ellipsis-h fs--2 text-900"></span></button>
                              <div class="dropdown-menu dropdown-menu-end py-2"><a class="dropdown-item" href="#!">Mark as unread</a></div>
                            </div>
                          </div>
                        </div>
                        <div class="px-2 px-sm-3 py-3 border-300 notification-card position-relative unread border-bottom">
                          <div class="d-flex align-items-center justify-content-between position-relative">
                            <div class="d-flex">
                              <div class="avatar avatar-m status-online me-3"><img class="rounded-circle avatar-placeholder" src="${pageContext.request.contextPath}/new_lib/assets/img/team/40x40/avatar.webp" alt="" />
                              </div>
                              <div class="flex-1 me-sm-3">
                                <h4 class="fs--1 text-black">Jessie Samson</h4>
                                <p class="fs--1 text-1000 mb-2 mb-sm-3 fw-normal"><span class='me-1 fs--2'>👍</span>Liked your comment.<span class="ms-2 text-400 fw-bold fs--2">1h</span></p>
                                <p class="text-800 fs--1 mb-0"><span class="me-1 fas fa-clock"></span><span class="fw-bold">9:30 AM </span>August 7,2021</p>
                              </div>
                            </div>
                            <div class="font-sans-serif d-none d-sm-block">
                              <button class="btn fs--2 btn-sm dropdown-toggle dropdown-caret-none transition-none notification-dropdown-toggle" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="fas fa-ellipsis-h fs--2 text-900"></span></button>
                              <div class="dropdown-menu dropdown-menu-end py-2"><a class="dropdown-item" href="#!">Mark as unread</a></div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="border-300">
                        <div class="px-2 px-sm-3 py-3 border-300 notification-card position-relative unread border-bottom">
                          <div class="d-flex align-items-center justify-content-between position-relative">
                            <div class="d-flex">
                              <div class="avatar avatar-m status-online me-3"><img class="rounded-circle" src="${pageContext.request.contextPath}/new_lib/assets/img/team/40x40/57.webp" alt="" />
                              </div>
                              <div class="flex-1 me-sm-3">
                                <h4 class="fs--1 text-black">Kiera Anderson</h4>
                                <p class="fs--1 text-1000 mb-2 mb-sm-3 fw-normal"><span class='me-1 fs--2'>💬</span>Mentioned you in a comment.<span class="ms-2 text-400 fw-bold fs--2"></span></p>
                                <p class="text-800 fs--1 mb-0"><span class="me-1 fas fa-clock"></span><span class="fw-bold">9:11 AM </span>August 7,2021</p>
                              </div>
                            </div>
                            <div class="font-sans-serif d-none d-sm-block">
                              <button class="btn fs--2 btn-sm dropdown-toggle dropdown-caret-none transition-none notification-dropdown-toggle" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="fas fa-ellipsis-h fs--2 text-900"></span></button>
                              <div class="dropdown-menu dropdown-menu-end py-2"><a class="dropdown-item" href="#!">Mark as unread</a></div>
                            </div>
                          </div>
                        </div>
                        <div class="px-2 px-sm-3 py-3 border-300 notification-card position-relative unread border-bottom">
                          <div class="d-flex align-items-center justify-content-between position-relative">
                            <div class="d-flex">
                              <div class="avatar avatar-m status-online me-3"><img class="rounded-circle" src="${pageContext.request.contextPath}/new_lib/assets/img/team/40x40/59.webp" alt="" />
                              </div>
                              <div class="flex-1 me-sm-3">
                                <h4 class="fs--1 text-black">Herman Carter</h4>
                                <p class="fs--1 text-1000 mb-2 mb-sm-3 fw-normal"><span class='me-1 fs--2'>👤</span>Tagged you in a comment.<span class="ms-2 text-400 fw-bold fs--2"></span></p>
                                <p class="text-800 fs--1 mb-0"><span class="me-1 fas fa-clock"></span><span class="fw-bold">10:58 PM </span>August 7,2021</p>
                              </div>
                            </div>
                            <div class="font-sans-serif d-none d-sm-block">
                              <button class="btn fs--2 btn-sm dropdown-toggle dropdown-caret-none transition-none notification-dropdown-toggle" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="fas fa-ellipsis-h fs--2 text-900"></span></button>
                              <div class="dropdown-menu dropdown-menu-end py-2"><a class="dropdown-item" href="#!">Mark as unread</a></div>
                            </div>
                          </div>
                        </div>
                        <div class="px-2 px-sm-3 py-3 border-300 notification-card position-relative read ">
                          <div class="d-flex align-items-center justify-content-between position-relative">
                            <div class="d-flex">
                              <div class="avatar avatar-m status-online me-3"><img class="rounded-circle" src="${pageContext.request.contextPath}/new_lib/assets/img/team/40x40/58.webp" alt="" />
                              </div>
                              <div class="flex-1 me-sm-3">
                                <h4 class="fs--1 text-black">Benjamin Button</h4>
                                <p class="fs--1 text-1000 mb-2 mb-sm-3 fw-normal"><span class='me-1 fs--2'>👍</span>Liked your comment.<span class="ms-2 text-400 fw-bold fs--2"></span></p>
                                <p class="text-800 fs--1 mb-0"><span class="me-1 fas fa-clock"></span><span class="fw-bold">10:18 AM </span>August 7,2021</p>
                              </div>
                            </div>
                            <div class="font-sans-serif d-none d-sm-block">
                              <button class="btn fs--2 btn-sm dropdown-toggle dropdown-caret-none transition-none notification-dropdown-toggle" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="fas fa-ellipsis-h fs--2 text-900"></span></button>
                              <div class="dropdown-menu dropdown-menu-end py-2"><a class="dropdown-item" href="#!">Mark as unread</a></div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card-footer p-0 border-top border-0">
                    <div class="my-2 text-center fw-bold fs--2 text-600"><a class="fw-bolder" href="pages/notifications.html">Notification history</a></div>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link" id="navbarDropdownNindeDots" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" data-bs-auto-close="outside" aria-expanded="false">
                <svg width="16" height="16" viewbox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <circle cx="2" cy="2" r="2" fill="currentColor"></circle>
                  <circle cx="2" cy="8" r="2" fill="currentColor"></circle>
                  <circle cx="2" cy="14" r="2" fill="currentColor"></circle>
                  <circle cx="8" cy="8" r="2" fill="currentColor"></circle>
                  <circle cx="8" cy="14" r="2" fill="currentColor"></circle>
                  <circle cx="14" cy="8" r="2" fill="currentColor"></circle>
                  <circle cx="14" cy="14" r="2" fill="currentColor"></circle>
                  <circle cx="8" cy="2" r="2" fill="currentColor"></circle>
                  <circle cx="14" cy="2" r="2" fill="currentColor"></circle>
                </svg></a>

              <div class="dropdown-menu dropdown-menu-end navbar-dropdown-caret py-0 dropdown-nide-dots shadow border border-300" aria-labelledby="navbarDropdownNindeDots">
                <div class="card bg-white position-relative border-0">
                  <div class="card-body pt-3 px-3 pb-0 overflow-auto scrollbar" style="height: 20rem;">
                    <div class="row text-center align-items-center gx-0 gy-0">
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/behance.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Behance</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/google-cloud.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Cloud</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/slack.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Slack</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/gitlab.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Gitlab</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/bitbucket.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">BitBucket</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/google-drive.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Drive</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/trello.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Trello</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/figma.webp" alt="" width="20" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Figma</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/twitter.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Twitter</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/pinterest.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Pinterest</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/ln.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Linkedin</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/google-maps.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Maps</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/google-photos.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Photos</p>
                        </a></div>
                      <div class="col-4"><a class="d-block hover-bg-200 p-2 rounded-3 text-center text-decoration-none mb-3" href="#!"><img src="${pageContext.request.contextPath}/new_lib/assets/img/nav-icons/spotify.webp" alt="" width="30" />
                          <p class="mb-0 text-black text-truncate fs--2 mt-1 pt-1">Spotify</p>
                        </a></div>
                    </div>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item dropdown"><a class="nav-link lh-1 pe-0" id="navbarDropdownUser" href="#!" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-haspopup="true" aria-expanded="false">
                <div class="avatar avatar-l ">
                  <!-- <img class="rounded-circle " src="assets/img/team/40x40/57.webp" alt="" 1/> -->
				<span class="uil-user-circle fs-3" style="margin-top: 2px; position: absolute;"></span>
                </div>
              </a>
              <div class="dropdown-menu dropdown-menu-end navbar-dropdown-caret py-0 dropdown-profile shadow border border-300" aria-labelledby="navbarDropdownUser">
                <div class="card position-relative border-0">
                  <div class="card-body p-0">
                    <div class="text-center pt-4 pb-3">
                      <div class="avatar avatar-xl ">
                        <span class="uil-user-circle fs-4"></span>

                      </div>
                      <h6 class="mt-2 text-black">${loginuserinfo.sawonName}</h6>
                    </div>
                    <div class="mb-3 mx-3">
                      <input class="form-control form-control-sm" id="statusUpdateInput" type="text" placeholder="Update your status" />
                    </div>
                  </div>
                  <div class="overflow-auto scrollbar" style="height: 10rem;">
                    <ul class="nav d-flex flex-column mb-2 pb-1">
                      <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-900" data-feather="user"></span><span>Profile</span></a></li>
                      <li class="nav-item"><a class="nav-link px-3" href="#!"><span class="me-2 text-900" data-feather="pie-chart"></span>Dashboard</a></li>
                      <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-900" data-feather="lock"></span>Posts &amp; Activity</a></li>
                      <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-900" data-feather="settings"></span>Settings &amp; Privacy </a></li>
                      <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-900" data-feather="help-circle"></span>Help Center</a></li>
                      <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-900" data-feather="globe"></span>Language</a></li>
                    </ul>
                  </div>
                  <div class="card-footer p-0 border-top">
                    <ul class="nav d-flex flex-column my-3">
                      <li class="nav-item"><a class="nav-link px-3" href="#!"> <span class="me-2 text-900" data-feather="user-plus"></span>Add another account</a></li>
                    </ul>
                    <hr />
                    <div class="px-3"> <a class="btn btn-phoenix-secondary d-flex flex-center w-100" href="logout.do"> <span class="me-2" data-feather="log-out"> </span>Sign out</a></div>
                    <div class="my-2 text-center fw-bold fs--2 text-600"><a class="text-600 me-1" href="#!">Privacy policy</a>&bull;<a class="text-600 mx-1" href="#!">Terms</a>&bull;<a class="text-600 ms-1" href="#!">Cookies</a></div>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </nav>
	<script src="${pageContext.request.contextPath}/new_lib/vendors/popper/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/new_lib/vendors/list.js/list.min.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/vendors/anchorjs/anchor.min.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/vendors/is/is.min.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/vendors/fontawesome/all.min.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="${pageContext.request.contextPath}/new_lib/vendors/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/vendors/dayjs/dayjs.min.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/assets/js/phoenix.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/vendors/echarts/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/vendors/leaflet/leaflet.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/leaflet.markercluster.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/vendors/leaflet.tilelayer.colorfilter/leaflet-tilelayer-colorfilter.min.js"></script>
    <script src="${pageContext.request.contextPath}/new_lib/assets/js/ecommerce-dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/new_lib/vendors/tinymce/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/new_lib/vendors/dropzone/dropzone.min.js"></script>
	<script src="${pageContext.request.contextPath}/new_lib/vendors/choices/choices.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
      
      <div class="content">