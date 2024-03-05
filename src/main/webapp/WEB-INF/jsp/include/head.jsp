<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>${param.title }</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	<script src="${pageContext.request.contextPath}/lib/js/common.js"></script>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>


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
      }
    </script>
    <link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet/leaflet.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/MarkerCluster.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/MarkerCluster.Default.css" rel="stylesheet">
</head>
</html>