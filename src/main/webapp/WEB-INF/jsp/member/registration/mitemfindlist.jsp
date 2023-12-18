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
                        <h3 class="mb-3 w-25 pt-2">강습반 찾기</h3>
                    </div>
					<div class="row">
						<div class="col-auto mt-1">
                            <p>찾을 강습반</p>
						</div>
	                    <div class="col-sm-6 col-md-2">
	                    	<div class="input-group">
							  <input class="form-control" type="text" aria-label="Recipient's username" aria-describedby="basic-addon2" name="findstring" id="findstring" onkeydown="handleKeyPress(event)"/>
							  <span class="input-group-text" id="basic-addon2" onclick="finditem()" style="cursor: pointer;">찾기</span>
							</div>
							<script type="text/javascript">
							function handleKeyPress(event) {
		                    	  if (event.key === "Enter") {
		                    	    $('#basic-addon2').trigger('click');
		                    	  }
		                    }
							function finditem() {
								var findstring = document.getElementById('findstring').value;
								if(findstring == '' || findstring == null){
									alert('검색어를 입력해주세요.');
									return false;
								}
								window.location.href = "mitemfindlist?findstring=" + findstring;
							}
							</script>
	                    </div>
	                    <div class="col-auto mt-1">
                            <p>(강습반코드 또는 강습반명을 입력합니다.)</p>
						</div>
                    </div>
                    <p>[강습반을 선택한 후 엔터키를 누르거나 더블클릭하면 자동으로 등록됩니다.]</p>
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
	                                	<tr class="hover-actions-trigger btn-reveal-trigger position-static" ondblclick="tronclick(${list.ItemID})">
		                                    <td class="code align-middle text-end fw-semi-bold pe-7 text-1000">${list.ItemCode}</td>
		                                    <td class="category align-middle white-space-nowrap text-start fw-bold text-700">${list.CategoryName}</td>
		                                    <td class="name align-middle white-space-nowrap text-start fw-bold text-700">${list.JungName}</td>
		                                    <td class="level align-middle white-space-nowrap text-900 fs--1 text-start">${list.LevelName}</td>
		                                    <td class="start align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.FromTime}</td>
		                                    <td class="finish align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.ToTime}</td>
		                                    <td class="day align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.DayName}</td>
		                                    <td class="member align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.DaesangName}</td>
		                                    <td class="teacher align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.SawonName}</td>
		                                    <td class="offline align-middle white-space-nowrap text-700 fs--1 ps-4 text-end"></td>
		                                    <td class="online align-middle white-space-nowrap text-700 fs--1 ps-4 text-end"></td>
		                                    <td class="max align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.OffMax + list.OnMax}</td>
		                                    <td class="nickname align-middle white-space-nowrap text-700 fs--1 ps-4 text-end">${list.YakChing}</td>
		                                    <td class="remain align-middle white-space-nowrap text-700 fs--1 ps-4 text-end"></td>
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
function tronclick(ItemID) {
	opener.parent.test(ItemID);
	opener.focus();
	window.close();
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