<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>휴회(연기)정보 등록 및 변경</title>
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
<body style="overflow: hidden;">
    <div class="card h-100 mb-1">
        <div class="card-body mb-n4 mt-n3">
        	<div class="col-auto">
        		<div class="row justify-content-between">
        			<div class="col-auto">
						<h3 class="mb-3 pt-2">휴회(연기)정보 등록 및 변경</h3>
            		</div>
            		<div class="col-auto">
						<button class="btn btn-success" type="button">저장</button>
            		</div>
        		</div>
        	</div>
            <div class="card border border-primary mb-3">
				<div class="card-body">
					<div class="col-auto">
						<div class="row">
							<div class="col-md-3 mb-2">
								<div class="input-group input-group-sm">
									<span class="input-group-text" id="basic-addon1">휴회신청일</span>
									<input class="form-control" type="date" id="regdate" name="regdate" readonly="readonly"/>
								</div>
							</div>
							<div class="col-auto mt-1">
								<p>기존(처음)기간:</p>
							</div>
						</div>
					</div>
					<div class="col-auto mb-2">
						<div class="row">
							<div class="col-md-3">
								<div class="input-group input-group-sm">
									<span class="input-group-text" id="basic-addon1">휴회기간</span>
									<input class="form-control" type="date" id="fromdate" name="fromdate" readonly="readonly"/>
								</div>
							</div>
							<div class="col-auto mx-n3 pt-1">
								~
							</div>
							<div class="col-md-3">
								<div class="input-group input-group-sm">
									<input class="form-control" type="date" id="todate" name="todate" readonly="readonly"/>
									<span class="input-group-text" id="basic-addon1">19일</span>
								</div>
							</div>
							<div class="col-auto">
								<button class="btn btn-outline-info" type="button">조회</button>
							</div>
						</div>
					</div>
					<div class="col-auto mb-2">
						<div class="row">
							<div class="col-md-3">
								<div class="input-group input-group-sm">
									<span class="input-group-text" id="basic-addon1">재수강일자</span>
									<input class="form-control" type="date" id="refromdate" name="refromdate" readonly="readonly"/>
								</div>
							</div>
							<div class="col-auto mx-n3 pt-1">
								~
							</div>
							<div class="col-md-3">
								<div class="input-group input-group-sm">
									<input class="form-control" type="date" id="retodate" name="retodate" readonly="readonly" value="${fmsc_s01.RToDate}"/>
									<span class="input-group-text" id="basic-addon1">19일</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">휴회사유</span>
							<input class="form-control" type="text" id="note" name="note"/>
						</div>
					</div>
				</div>
			</div>
        </div>
    </div>
    <div class="row">
	    <div class="card h-50">
	    	<div class="card-body my-n3">
	    		<div class="border-top border-bottom border-200" id="customerOrdersTable" style="overflow-y: scroll; height: 210px;"
                    data-list='{"valueNames":["paiddate","paidcategory","paidprice","paidassignType","paidmapsa",""paidcardtype"","paidassignN","paidcardN","POS","signpad","OID","PayKind"],"page":6,"pagination":true}'>
                	<div class="table-responsive scrollbar">
                    	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
                        	<thead>
	                        	<tr>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paiddate">신청일자</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidcategory">기존시작일</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidprice">기존종료일</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidassignType">기존일수</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidmapsa">휴회시작일</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidcardtype">휴회종료일</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidassignN">휴회일수</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidcardN">휴회복귀일</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="POS">휴회복귀(강습)종료일</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="signpad">잔여일수</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="OID">휴회사유</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="PayKind">생성일</th>
	                            </tr>
                        	</thead>
                        	<tbody class="list" id="paidbody">
                        		<c:forEach var="paid" items="${paidlist}">
	                        		<tr class="hover-actions-trigger btn-reveal-trigger position-static">
									    <td class="paiddate align-middle white-space-nowrap text-center fw-bold">${paid.realSaleDate}</td>
									    <td class="paidcategory align-middle white-space-nowrap text-center">${paid.payType}</td>
									    <fmt:parseNumber var="paidprice" integerOnly="true" value="${paid.price}"/>
									    <td class="paidprice align-middle white-space-nowrap text-start fw-bold text-700"><fmt:formatNumber value="${paidprice}" pattern="#,###"/></td>
									    <td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">${paid.assignType}</td>
									    <td class="paidmapsa align-middle white-space-nowrap text-center">${paid.maeipsa}</td>
									    <td class="paidcardtype align-middle white-space-nowrap text-start">${paid.cardName}</td>
									    <td class="paidassignN align-middle white-space-nowrap text-start">${paid.assignNo}</td>
									    <td class="paidcardN align-middle white-space-nowrap text-start">${paid.cardNo}</td>
									    <td class="POS align-middle white-space-nowrap text-start">${paid.pos}</td>
									    <td class="signpad py-2 align-middle white-space-nowrap">${paid.signPad}</td>
									    <td class="OID py-2 align-middle white-space-nowrap">${paid.OID}</td>
									    <td class="PayKind py-2 align-middle white-space-nowrap"></td>
									</tr>
								</c:forEach>
                        	</tbody>
                    	</table>
                    </div>
            	</div>
	    	</div>
	    </div>
	</div>
</body>
<script type="text/javascript">
//숨겨진 모달 버튼
var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
$('body').append(buttonHTML);
	
var modalcheck = false;
document.addEventListener('keydown', function(event) {
	if (event.key === 'Escape' && !modalcheck) {
		if($('#itemtbody tr').length > 0){
			$('#resultmessage').html('강습정보가 존재합니다.<br>정말 나가시겠습니까?');
			$('.modal-footer').empty();
			var okaybutton = '<button class="btn btn-primary" type="button" onclick="window.close();">확인</button>';
			var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			$('.modal-footer').append(okaybutton);
			$('.modal-footer').append(cancelbutton);
		    $('#modalButton').click();
		    modalcheck = true;
		} else{
			window.close();
		}
   	}
   	else if (event.key === 'Escape' && modalcheck) {
   		setTimeout(() => {
   	    	modalcheck = false;
   	    }, 500);
   	}
});

//Get today's date
var today = new Date();

// Format the date as "YYYY-MM-DD" which is the required format for the date input
var formattedDate = today.toISOString().split('T')[0];

var tomorrow = new Date(today);
tomorrow.setDate(today.getDate()+1);
var formattedTomorrow = tomorrow.toISOString().split('T')[0];

// Set the value of the input field to today's date
$('#regdate,#fromdate,#todate').val(formattedDate);
$('#refromdate').val(formattedTomorrow);

var retodate = $('#retodate').val();

//$('#fromdate').val();
//$('#todate').val();

$('#fromdate').on('change', function() {
	var fromDate = new Date($('#fromdate').val());
	var toDate = new Date($('#todate').val());
	
	// Calculate the difference in milliseconds
	var differenceInMilliseconds = toDate - fromDate;
	
	// Calculate the difference in days
	var differenceInDays = differenceInMilliseconds / (1000 * 60 * 60 * 24);
	
	// Add 1 if the dates are the same
	if (differenceInDays === 0) {
	    differenceInDays += 1;
	}
});

$('#todate').on('change', function() {
	var fromDate = new Date($('#fromdate').val());
	var toDate = new Date($('#todate').val());
	
	// Calculate the difference in milliseconds
	var differenceInMilliseconds = toDate - fromDate;
	
	// Calculate the difference in days
	var differenceInDays = differenceInMilliseconds / (1000 * 60 * 60 * 24);
	
	// Add 1 if the dates are the same
	if (differenceInDays === 0) {
	    differenceInDays += 1;
	}
});
// Now, differenceInDays contains the result you're looking for
console.log(differenceInDays);
</script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/anchorjs/anchor.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/is/is.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/list.js/list.min.js"></script>
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

<div class="modal fade" id="verticallyCentered" tabindex="-1" aria-labelledby="verticallyCenteredModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="verticallyCenteredModalLabel">Uspot</h5>
        <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1"></span></button>
      </div>
      <div class="modal-body">
        <p class="text-700 lh-lg mb-0" id="resultmessage"></p>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

</html>