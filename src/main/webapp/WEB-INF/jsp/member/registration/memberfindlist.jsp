<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 찾기</title>
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
	<div class="card h-100">
	<div class="card-body pb-3">
	<div class="col-12 col-xxl-8">
    <div class="mb-6">
    	<div class="row g-3">
      		<h3 class="mb-4" style="padding-top: 5px; width: 130px;">회원찾기</h3>
          		<div class="col-sm-6 col-md-3">
					<div class="input-group mb-3">
						<div class="input-group-text" id="basic-addon2">회원조회</div>
							<input class="form-control" id="memberfind" type="text" placeholder="검색어" aria-describedby="basic-addon2"/>
						</div>
					</div>
					<div class="col-sm-6 col-md-2">
						<select class="form-select" id="memberfindcategory">
							<option selected="selected" value="0">회원번호</option>
							<option value="1">카드번호</option>
						</select>
					</div>
					<div class="col-auto">
						<button class="btn btn-info" type="button" id="findbutton">조회</button>
					</div>
          		</div>
          		<script type="text/javascript">
						$('#findbutton').click(function() {
							findvalue = document.getElementById('memberfind').value;
							findcategory = document.getElementById('memberfindcategory').value;
							
							 if (findcategory === '1') {
							    // 숫자만일때
							    if (/^\d{4}$/.test(findvalue)) {
							      findcategory = 2;
							      //문자도 섞일때
							    } else if (/^[0-9a-zA-Z]+$/.test(findvalue)) {
							     	
							    	findcategory = 3;
							    }
							}
							$.ajax({
					             type: "POST", // 또는 "POST", 서버 설정에 따라 다름
					             url: "memberfind", // 실제 엔드포인트로 교체해야 합니다
					             dataType : 'json',
					             data: { 
					            	 findvalue: findvalue,
					            	 findcategory : findcategory
					             },
					             success: function(data) {	
					            	 if(data === '-1'){
						            		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
						            		$('#resultmessage').text('회원번호검색은 숫자6자리,전화번호검색은 끝에 4자리를 숫자형식으로 입력하십시오.');
						                    $('body').append(buttonHTML);
						                    $('#modalButton').click();
						            }
					            	if(data === '0'){
					            		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
					            		$('#resultmessage').text('검색어를 입력해주세요.');
					                    $('body').append(buttonHTML);
					                    $('#modalButton').click();
					            	}
					            	else if(data === '1'){
					            		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
					            		$('#resultmessage').text('검색결과가 없습니다.');
					                    $('body').append(buttonHTML);
					                    $('#modalButton').click();
					            	}
					            	else if(data === '2'){
					            		window.close();
					            		window.opener.location.href = 'membership.do?findvalue='+findvalue+'&findcategory='+findcategory+ '&findtype=1';
					            	}
					            	else if(data === '3'){
					            		window.location.href = "findlist?findvalue="+findvalue+"&findcategory="+findcategory;
					            	}
					             },
					             error: function(xhr, status, error) {
					            	 console.log("Status: " + status);
					                 console.log("Error: " + error);
					             }
								});
						});
						
				</script>	
                <div class="border-top border-bottom border-200" id="customerOrdersTable" data-list='{"valueNames":["memberID","name","gender","type","birthday","cellphone","MLevel","carNo","siteCode"],"page":6,"pagination":true}'>
                  <div class="table-responsive scrollbar">
                    <table class="table table-sm fs--1 mb-0 table-hover">
                      <thead>
                        <tr>
                          <th class="sort white-space-nowrap align-middle ps-0 pe-3" scope="col" data-sort="memberID" style="width:10%;">회원번호</th>
                          <th class="sort align-middle text-end pe-7" scope="col" data-sort="name" style="width:10%;">성명</th>
                          <th class="sort align-middle white-space-nowrap pe-3" scope="col" data-sort="gender" style="width:15%;">성별</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="type" style="width:20%;">회원구분</th>
                          <th class="sort align-middle white-space-nowrap text-start" scope="col" data-sort="birthday" style="width:30%;">생년월일</th>
                          <th class="sort align-middle text-end pe-0" scope="col" data-sort="cellphone">휴대전화</th>
                          <th class="sort align-middle text-end pe-0" scope="col" data-sort="MLevel">회원종류</th>
                          <th class="sort align-middle text-end pe-0" scope="col" data-sort="carNo">차량번호</th>
                          <th class="sort align-middle text-end pe-0" scope="col" data-sort="siteCode">주 이용시설</th>
                        </tr>
                      </thead>
                      <tbody class="list" id="customer-order-table-body">
	                      <c:forEach var="list" items="${findlist}">
	                        	<tr class="hover-actions-trigger btn-reveal-trigger position-static" ondblclick="tronclick(this)">
		                          <td class="memberID align-middle text-end fw-semi-bold pe-7 text-1000">${list.memberID}</td>
		                          <td class="name align-middle white-space-nowrap text-start fw-bold text-700">${list.name}</td>
		                          <td class="gender align-middle white-space-nowrap text-start fw-bold text-700">${list.genderText}</td>
		                          <td class="type align-middle white-space-nowrap text-900 fs--1 text-start">${list.typeText}</td>
		                          <td class="birthday align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.birthDay}</td>
		                          <td class="cellphone align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.cellPhone}</td>
		                          <td class="MLevel align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.MLevel}</td>
		                          <td class="carNo align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.carNo}</td>
		                          <td class="siteCode align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">
		                          	<c:forEach var="site" items="${sitelist}">
										<c:if test="${list.siteCode == site.siteCode}">
											${site.siteName}
										</c:if>
									</c:forEach>
		                          </td>
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
		
<div class="modal fade" id="verticallyCentered" tabindex="-1" aria-labelledby="verticallyCenteredModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="verticallyCenteredModalLabel">Uspot</h5>
        <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1"></span></button>
      </div>
      <div class="modal-body">
        <p class="text-700 lh-lg mb-0" id="resultmessage">검색결과가 없습니다.</p>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" type="button" data-bs-dismiss="modal">나가기</button>
      </div>
    </div>
  </div>
</div>

<!-- 모달 3개 -->
	<script>
function tronclick(row) {
    var memberID = row.querySelector('.memberID').textContent;
    
    window.close();
    
    window.opener.location.href='membership.do?MemberID='+memberID +'&findtype=2';
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