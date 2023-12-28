<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드발급현황 및 재발급</title>
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
    <script type="text/javascript">
    $(document).ready(function() {
        var previousRow = null;

        $('#customer-order-table-body tr').on('click', function() {
          if (previousRow !== null) {
            $(previousRow).css('background-color', ''); // 이전 선택 취소
          }

          $(this).css('background-color', 'lightblue'); // 새로운 선택 적용
          previousRow = this; // 이전 행 업데이트
        });
      });
    
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
          window.close();
        }
	    });
    </script>
</head>
<body>
	<div class="card h-100">
		<div class="card-body pb-3">
			<div class="col-12 col-xxl-8">
    			<div class="mb-6">
    				<div class="row g-3">
      					<h3 class="mb-4" style="padding-top: 5px; width: 265px;">카드발급현황 및 재발급</h3>
						<div class="col-auto">
							<button class="btn btn-info me-1 mb-1" type="button" id="membercardinsert" onclick="membercardinsertF(${memberID})">신규</button>
							<button class="btn btn-warning me-1 mb-1" type="button" id="updatebutton" onclick="cardupdate(repkid)">수정</button>
							<button class="btn btn-danger me-1 mb-1" type="button" onclick="carddelete(repkid)">삭제</button>
						</div>
          			</div>	
                	<div class="border-top border-bottom border-200" id="customerOrdersTable" data-list='{"valueNames":["memberID","name","gender","type","birthday","cellphone","MLevel","carNo","siteCode"],"page":6,"pagination":true}'>
                  		<div class="table-responsive scrollbar">
                    		<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
		                      <thead>
		                        <tr>
		                          <th class="sort white-space-nowrap align-middle" scope="col"></th>
		                          <th class="sort align-middle text-end" scope="col" data-sort="name">카드번호</th>
		                          <th class="sort align-middle text-start" scope="col" data-sort="gender">발급일자</th>
		                          <th class="sort align-middle white-space-nowrap" scope="col" data-sort="type">발급유형</th>
		                          <th class="sort align-middle white-space-nowrap text-start" scope="col" data-sort="birthday" style="width:30%;">수령자</th>
		                          <th class="sort align-middle white-space-nowrap" scope="col" data-sort="cellphone">연락처</th>
		                          <th class="sort align-middle text-end pe-0" scope="col" data-sort="MLevel">관계</th>
		                          <th class="sort align-middle text-end pe-0" scope="col" data-sort="carNo">비고</th>
		                        </tr>
		                      </thead>
                      		  <tbody class="list" id="customer-order-table-body">
			                      <c:forEach var="list" items="${list}" varStatus="status">
			                        	<tr class="hover-actions-trigger btn-reveal-trigger position-static" ondblclick="cardupdate(${list.PKID})" onclick="colorchange(${list.PKID})"> 		
				                          <td class="memberID align-middle fw-semi-bold pe-3 text-1000">${status.index+1}</td>
				                          <td class="name align-middle white-space-nowrap text-start fw-bold text-700">${list.barCode}</td>
				                          <td class="gender align-middle white-space-nowrap">${list.issueDate}</td>
				                          <td class="type align-middle white-space-nowrap">${list.isReissueT}</td>
				                          <td class="birthday align-middle">${list.suryungJa}</td>
				                          <td class="cellphone align-middle white-space-nowrap text-start">${list.suryungJaPhone}</td>
				                          <td class="MLevel align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.relation}</td>
				                          <td class="carNo align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.note}</td>
			                        	</tr>
			                      </c:forEach>
                      		  </tbody>
                    	 </table>
                  		</div>
                  		<div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
                    		<div class="col-auto d-flex">
                      			<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p><a class="fw-semi-bold" href="#!" data-list-view="*">View all<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a><a class="fw-semi-bold d-none" href="#!" data-list-view="less">View Less<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a>
                    		</div>
                    		<div class="col-auto d-flex">
		                      <button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
		                      <ul class="mb-0 pagination"></ul>
		                      <button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
		                    </div>
                  		</div>
                	</div>
              	</div>
         	</div>
    	</div>
	</div>
</body>
<script type="text/javascript">
var repkid = 0;
function cardupdate(pkid) {
	if(pkid == 0){
		alert('수정할 행을 선택해주세요');
		return false;
	}
	var url = 'membercardupdateF.do?pkid='+pkid;
	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=400,height=480";
    window.open(url, "_blank", windowFeatures);
}

function membercardinsertF(memberid) {
	var url = 'membercardinsertF.do?memberID='+memberid;
	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=400,height=480";
    window.open(url, "_blank", windowFeatures);
}

function colorchange(rpkid) {
	repkid = rpkid;
	var selectedRow = document.querySelector(`tr[onclick="colorchange(${rpkid})"]`);
    if (selectedRow) {
      if (selectedRow.style.backgroundColor === 'lightblue' || selectedRow.classList.contains('selected')) {
        selectedRow.style.backgroundColor = ''; // 기본값으로 변경
        selectedRow.classList.remove('selected');
      } else {
        selectedRow.style.backgroundColor = 'lightblue'; // 선택한 색상으로 변경
        selectedRow.classList.add('selected');
      }
    }
}

function carddelete(pkid) {
	if(pkid == 0){
		alert('수정할 행을 선택해주세요');
		return false;
	}
	var newpkid = pkid;
	var result = confirm('선택하신 회원카드발급정보를 삭제하시겠습니까?');
	if(result){
		$.ajax({
		    type: "POST",
		    url: "carddelete.do?PKID="+pkid,
		    dataType : 'text',
		    data: { 
		        PKID: newpkid
		    },
		    processData: false,
		    success: function (response) {
		        window.location.reload();
		    },
		    error: function (xhr, status, error) {
		        console.error("Error:", error);
		    }
		});
	}
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