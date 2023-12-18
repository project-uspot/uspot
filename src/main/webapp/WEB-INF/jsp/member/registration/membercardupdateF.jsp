<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드발급정보 등록 및 변경</title>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



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
    <link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet/leaflet.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/MarkerCluster.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/MarkerCluster.Default.css" rel="stylesheet">
</head>
<body>
	<div class="card h-100">
		<div class="card-body pb-3">
			<div class="col-12 col-xxl-8">
    			<div class="mb-6">
      				<h3 class="mb-4" style="padding-top: 5px; width: 265px;">카드발급정보 등록 및 변경</h3>
      				<form action="membercardupdateP.do" method="post" id="form">
						<div class="row w-75 mb-3">
							<input type="hidden" id="MemberID" name="MemberID" value="${card.memberID}">
					        <div class="col md-1">
					            <input class="form-check-input" id="isReissueN" type="radio" name="isReissue" value="N"
					                   <c:if test="${card.isReissue == 'N'}">checked="checked"</c:if>>
					            <label class="form-check-label mb-0" for="isReissueN">신규</label>
					        </div>
					        <div class="col md-1">
					            <input class="form-check-input" id="isReissueY" type="radio" name="isReissue" value="Y" 
					                   <c:if test="${card.isReissue == 'Y'}">checked="checked"</c:if>>
					            <label class="form-check-label mb-0" for="isReissueY">재발급</label>
					        </div>
					    </div>
						<div class="input-group mb-3">
							<div class="input-group-text">카드번호</div>
							<input class="form-control" id="barCode" name="barCode" type="text" value="${card.barCode}"/>
							<input class="form-control" id="barCodeOrigin" name="barCodeOrigin" type="hidden" value="${card.barCode}"/>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-text">카드수령자</div>
							<input class="form-control" id="suryungJa" name="suryungJa" type="text" value="${card.suryungJa}"/>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-text">수령자 연락처</div>
							<input class="form-control" id="suryungJaPhone" name="suryungJaPhone" type="text" value="${card.suryungJaPhone}"/>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-text">관계</div>
							<input class="form-control" id="relation" name="relation" type="text" value="${card.relation}"/>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-text">재발급 사유</div>
							<input class="form-control" id="note" name="note" type="text" value="${card.note}"/>
						</div>
						<div class="row">
						<div class="col me-5">
							<button class="btn btn-success" type="button" onclick="submitconfirm()">저장</button>
						</div>
					  	<div class="col ms-5">
					  		<button class="btn btn-outline-primary" type="button" onclick="self.close();">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
function submitconfirm() {
	if(document.getElementById('suryungJa').value.trim() == ''){
		alert('수령자를 입력해주세요.');
		return false;
	}
	if(document.getElementById('barCode').value.trim() == ''){
		alert('카드번호를 입력해주세요.');
		return false;
	}
	if(document.getElementById('barCodeOrigin').value.trim() !== document.getElementById('barCode').value.trim()){
		$.ajax({
	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
	        url: "barCodefind", // 실제 엔드포인트로 교체해야 합니다
	        dataType : 'json',
	        data: { 
	         barCode: document.getElementById('barCode').value.trim()
	        },
	        success: function(data) {	
	       	 if(data != 0){
					alert('중복된 카드번호입니다');
					return false;
	           }
	       	 
	        },
	        error: function(xhr, status, error) {
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
	        }
		});
	}
    // 중복 체크가 필요 없는 경우에도 폼 데이터를 서버로 전송하는 로직
    var formData = new FormData(document.getElementById('form'));

    // AJAX를 이용한 폼 데이터 서버 전송
    $.ajax({
        type: "POST", // 또는 "GET", 서버 설정에 따라 다름
        url: "membercardupdateP.do", // 실제 엔드포인트로 교체해야 합니다
        data: formData,
        contentType: false,
        processData: false,
        success: function (response) {
            // 서버로부터의 응답을 처리하는 로직
            window.close(); // 작업 완료 후 창 닫기
            window.opener.location.reload(); // 부모 창 리로드
        },
        error: function (xhr, status, error) {
            // 요청이 실패한 경우 에러 처리
            console.error("Error:", error);
        }
    });
}
</script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/anchorjs/anchor.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/is/is.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/fontawesome/all.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/lodash/lodash.min.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/list.js/list.min.js"></script>
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
</html>