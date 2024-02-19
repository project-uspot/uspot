<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>강습반 찾기</title>
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="${pageContext.request.contextPath}/new_lib/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <meta name="robots" content="noindex">
    <script src="${pageContext.request.contextPath}/new_lib/vendors/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
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
        var isSearchFocused = false;
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
                        <h3 class="mb-3 w-25 pt-2">강습반 찾기</h3>
                    </div>
					<div class="row">
						<div class="col-auto mt-1">
                            <p>찾을 강습반</p>
						</div>
	                    <div class="col-sm-6 col-md-2">
	                    	<div class="input-group">
	                    	  <input type="hidden" value="${findvalue}" id="findvalue">
							  <input class="form-control" type="text" aria-label="Recipient's username" aria-describedby="basic-addon2" name="findstring" id="findstring" onkeydown="handleKeyPress(event)" onfocus="isSearchFocused = true" onblur="isSearchFocused = false"/>
							  <span class="input-group-text" id="basic-addon2" onclick="finditem()" style="cursor: pointer;">찾기</span>
							</div>
							<script type="text/javascript">
							function handleKeyPress(event) {
						        if (event.key === "Enter") {
						            if (isSearchFocused) {
						                $('#basic-addon2').trigger('click'); // Perform search action
						            } else if (previousRow !== null) {
						                $(previousRow).trigger('dblclick'); // Simulate double-click on selected row
						            }
						        }
						    }
							function finditem() {
								var findstring = document.getElementById('findstring').value;
								if(findstring == '' || findstring == null){
									alert('검색어를 입력해주세요.');
									return false;
								}
								window.location.href = "mitemfindlist?findstring=" + findstring+"&finddate="+'${formattedDate}';
							}
							</script>
	                    </div>
	                    <div class="col-auto mt-1">
                            <p>(강습반코드 또는 강습반명을 입력합니다.)</p>
						</div>
                    </div>
                    <div class="row">
                    	<div class="col-auto">
                    		<p>[강습반을 선택한 후 엔터키를 누르거나 더블클릭하면 자동으로 등록됩니다.]</p>
                    	</div>
                    	<div class="col-auto mt-n2 ms-15">
                    		<div class="input-group">
  								<span class="input-group-text">강습기준일</span>
								<input class="form-control" type="date" id="dateInput" value="${formattedDate}"/>
							</div>
                    	</div>
                    </div>
                    <script type="text/javascript">
                    var dateInput = document.getElementById('dateInput');
                    dateInput.addEventListener('change', function() {
                    dateInput.value = dateInput.value;
                    if(dateInput.value == '' || dateInput.value == null){
                    	dateInput.value = '${formattedDate}';
                    }
                    var findvalue = document.getElementById('findvalue').value;
                        $.ajax({
                	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
                	        url: "mitemlistChange", // 실제 엔드포인트로 교체해야 합니다
                	        dataType : 'json',
                	        data: { 
                	        	SubGroupName: findvalue,
                	        	UpdDate : dateInput.value
                	        },
                	        success: function(list) {
                	            var tableBody = $('#customer-order-table-body');
                	            tableBody.empty();
                	            // Iterate through the list using jQuery.each() method
                	            $.each(list, function(index, listItem) {
                	                var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" ondblclick="tronclick(' + listItem.ItemID + ',' + listItem.itemmonth + ',' + (listItem.OffMax + listItem.OnMax) + ',' + listItem.RegCnt + listItem.RegCnt3 + ',' + listItem.RegCnt2 + ')" onclick="findtbodyclick(this)"></tr>');
                	                newRow.append('<td class="code align-middle white-space-nowrap text-end fw-semi-bold pe-7 text-1000">' + listItem.ItemCode + '</td>');
                	                newRow.append('<td class="category align-middle white-space-nowrap text-start fw-bold text-700">' + listItem.CategoryName + '</td>');
                	                newRow.append('<td class="name align-middle white-space-nowrap text-start fw-bold text-700">' + listItem.JungName + '</td>');
                	                newRow.append('<td class="level align-middle white-space-nowrap text-900 fs--1 text-start">' + listItem.LevelName + '</td>');
                	                newRow.append('<td class="start align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">' + listItem.FromTime + '</td>');
                	                newRow.append('<td class="finish align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">' + listItem.ToTime + '</td>');
                	                newRow.append('<td class="day align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">' + listItem.DayName + '</td>');
                	                newRow.append('<td class="member align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">' + listItem.DaesangName + '</td>');
                	                newRow.append('<td class="teacher align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">' + listItem.SawonName + '</td>');
                	                newRow.append('<td class="offline align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">' + listItem.RegCnt + listItem.RegCnt3 + '</td>');
                	                newRow.append('<td class="online align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">' + listItem.RegCnt2 + '</td>');
                	                newRow.append('<td class="max align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">' + (listItem.OffMax + listItem.OnMax) + '</td>');
                	                newRow.append('<td class="nickname align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">' + listItem.YakChing + '</td>');
                	                newRow.append('<td class="remain align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">' + (listItem.OffMax + listItem.OnMax - (listItem.RegCnt + listItem.RegCnt2 + listItem.RegCnt3)) + '</td>');

                	                tableBody.append(newRow);
                	            });
                	            
                	            $('#customer-order-table-body').children('tr:first').click();
                	        },
                	        error: function(xhr, status, error) {
                	       	 console.log("Status: " + status);
                	         console.log("Error: " + error);
                	        }
                		});
                    });
             		var previousRow = null;
					//행을 클릭했을때 데이터를 밑에 뿌려주는 함수
					function findtbodyclick(clickedRow) {
						if (previousRow !== null) {
					    	$(previousRow).css('background-color', '');
					    }
						$(clickedRow).css('background-color', 'lightblue');
					    previousRow = clickedRow;
					}
                    </script>
                    <div class="border-top border-bottom border-200" id="customerOrdersTable" data-list='{"valueNames":["code","category","name","level","start","finish","day","member","teacher","offline","online","max","nickname","remain"]}'>
                        <div class="table-responsive scrollbar">
                            <table class="table table-sm fs--1 mb-0 table-hover">
                                <thead>
                                    <tr>
                                        <th class="sort white-space-nowrap align-middle ps-0 pe-3" scope="col" data-sort="code">코드</th>
                                        <th class="sort align-middle text-end pe-7" scope="col" data-sort="category">종목</th>
                                        <th class="sort align-middle white-space-nowrap pe-3" scope="col" data-sort="name">강좌명</th>
                                        <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="level">단계</th>
                                        <th class="sort align-middle white-space-nowrap text-start" scope="col" data-sort="start">시작</th>
                                        <th class="sort align-middle text-end pe-0" scope="col" data-sort="finish">종료</th>
                                        <th class="sort align-middle text-end pe-0" scope="col" data-sort="day">요일</th>
                                        <th class="sort align-middle text-end pe-0" scope="col" data-sort="member">대상</th>
                                        <th class="sort align-middle text-end pe-0" scope="col" data-sort="teacher">담당강사</th>
                                        <th class="sort align-middle text-end pe-0" scope="col" data-sort="offline">오프라인</th>
                                        <th class="sort align-middle text-end pe-0" scope="col" data-sort="online">온라인</th>
                                        <th class="sort align-middle text-end pe-0" scope="col" data-sort="max">정원</th>
                                        <th class="sort align-middle text-end pe-0" scope="col" data-sort="nickname">약칭</th>
                                        <th class="sort align-middle text-end pe-0" scope="col" data-sort="remain">잔여</th>
                                    </tr>
                                </thead>
                                <tbody class="list" id="customer-order-table-body">
                                	<c:forEach items="${lists}" var="list">
	                                	<tr class="hover-actions-trigger btn-reveal-trigger position-static" ondblclick="tronclick(${list.ItemID},${list.itemmonth},${list.OffMax+list.OnMax},${list.RegCnt + list.RegCnt3},${list.RegCnt2})" onclick="findtbodyclick(this)">
		                                    <td class="code align-middle text-end fw-semi-bold pe-7 text-1000">${list.ItemCode}</td>
		                                    <td class="category align-middle white-space-nowrap text-start fw-bold text-700">${list.CategoryName}</td>
		                                    <td class="name align-middle white-space-nowrap text-start fw-bold text-700">${list.JungName}</td>
		                                    <td class="level align-middle white-space-nowrap text-900 fs--1 text-start">${list.LevelName}</td>
		                                    <td class="start align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.FromTime}</td>
		                                    <td class="finish align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.ToTime}</td>
		                                    <td class="day align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.DayName}</td>
		                                    <td class="member align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.DaesangName}</td>
		                                    <td class="teacher align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.SawonName}</td>
		                                    <td class="offline align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.RegCnt + list.RegCnt3}</td>
		                                    <td class="online align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.RegCnt2}</td>
		                                    <td class="max align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.OffMax + list.OnMax}</td>
		                                    <td class="nickname align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.YakChing}</td>
		                                    <td class="remain align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.OffMax + list.OnMax-(list.RegCnt+list.RegCnt2 + list.RegCnt3)}</td>
	                                	</tr>
	                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
<script type="text/javascript">
function tronclick(ItemID,itemmonth,max,offline,online) {
	if(max-offline-online < 1){
		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
		$('body').append(buttonHTML);
		$('#resultmessage').html('<font style="color: red;">'+ (online+offline+1-max) +'명 초과됨 (정원 '+max+' 명/오프라인 '+offline+' 명/온라인 '+online+'명)</font><br>강제로 등록처리하실려면 [예]버튼을,<br>취소하려면 [아니오]버튼을 클릭하세요.');
        $('#modalButton').click();
        $('#successbutton').attr('onclick', 'success("' + ItemID + '", ' + itemmonth + ')');
	}else{
		success(ItemID,itemmonth);
	}
	
}

function success(ItemID,itemmonth){
	const dateInputValue = dateInput.value;
    const formattedDate = new Date(dateInputValue);
    formattedDate.setMonth(formattedDate.getMonth() + itemmonth);
    formattedDate.setDate(formattedDate.getDate()-1);
    const formattedDateString = formatDate(formattedDate);
    opener.parent.test(ItemID, dateInputValue, formattedDateString);
	opener.focus();
	window.close();
}

function formatDate(date) {
	  const yyyy = date.getFullYear();
	  const mm = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 2자리 숫자로 표시
	  const dd = String(date.getDate()).padStart(2, '0'); // 일자를 2자리 숫자로 표시
	  return yyyy+'-'+mm+'-'+dd;
}
$('#customer-order-table-body').children('tr:first').click();

$(document).keydown(function(e) {
    if (previousRow !== null) {
        var currentRowIndex = $(previousRow).index();
        var numRows = $('#customer-order-table-body').children('tr').length;

        if (e.keyCode === 40 && currentRowIndex < numRows - 1) { // Down arrow key
            $(previousRow).css('background-color', ''); // Reset current row color
            var nextRow = $('#customer-order-table-body').children('tr').eq(currentRowIndex + 1);
            findtbodyclick(nextRow);
        } else if (e.keyCode === 38 && currentRowIndex > 0) { // Up arrow key
            $(previousRow).css('background-color', ''); // Reset current row color
            var prevRow = $('#customer-order-table-body').children('tr').eq(currentRowIndex - 1);
            findtbodyclick(prevRow);
        } else if (e.keyCode === 13 && !isSearchFocused) { // Enter key
            if (previousRow) {
                $(previousRow).trigger('dblclick');
            }
        }
    }
});
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
<div class="modal fade" id="verticallyCentered" tabindex="-1" aria-labelledby="verticallyCenteredModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="verticallyCenteredModalLabel" >정 원 초 과</h5>
        <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1"></span></button>
      </div>
      <div class="modal-body">
        <p class="text-700 lh-lg mb-0" id="resultmessage"></p>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="successbutton" type="button">예</button>
        <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">아니오</button>
      </div>
    </div>
  </div>
</div>
</html>