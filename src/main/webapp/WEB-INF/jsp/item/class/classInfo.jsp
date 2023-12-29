<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<div class="p-0">
	<div class="mb-9 ">
		<div class="row g-2 mb-4">
		    <div class="col-auto">
				<h2 class="mb-0">강습반 정보관리</h2>
		    </div>
		</div>
		<form name="selectForm" id="DocumentForm" action="${pageContext.request.contextPath}/classinfo.do">
			<div class="mb-1">
				<div class="row g-6">
					<div class="card h-100 col-md-9">
						<div class="card-body">
							<div class="row g-3">
								<div class="col-sm-3 col-md-2 mb-2">
									<select class="form-select" id="IsUse" name="IsUse" >
										<option value="1">사용</option>
										<option value="2">사용안함</option>
										<option value="3">삭제</option>
									</select>
								</div>
								<div class="col-sm-3 col-md-2 mb-2">
									<select class="form-select" id="Type" name="Type" >
										<option value="0">전체</option>
										<option value="1">일반</option>
										<option value="2">특강</option>
									</select>
								</div>
								<div class="col-sm-3 col-md-2 mb-2">
									<select class="form-select" id="findcategory" name="findcategory" >
										<option value="0" >종목</option>
										<option value="1">강습반명</option>
										<option value="2">강사</option>
										<option value="3">약칭</option>
									</select>
								</div>
								<div class="col-sm-3 col-md-2 mb-2">
									<div class="form-floating">
										<input class="form-control" name="findvalue" id="findvalue" type="text" placeholder="항목" onkeydown="handleKeyPress(event)" />
										<label for="ExpenseName">항목</label>
									</div>
								</div>
								<div class="col-sm-5 col-md-1 mb-2">
		            			</div>
								<div class="col-auto">
									<button class="btn btn-outline-info" type="button" id="findbutton" onclick="finditem()" >조회(F3)</button>
								</div>
								
								<script type="text/javascript">
									
									/* $('#findbutton').click(function() { */
										function finditem() {
											IsUse = document.getElementById('IsUse').value;
											Type = document.getElementById('Type').value;
											findvalue = document.getElementById('findvalue').value;
											findcategory = document.getElementById('findcategory').value;
											$.ajax({
												type: "POST", // 또는 "POST", 서버 설정에 따라 다름
									            url: "selectItemFind", // 실제 엔드포인트로 교체해야 합니다
									            dataType : 'json',
									            data: {
									            	IsUse : IsUse, 
									            	Type : Type,
									            	findvalue: findvalue,
									            	findcategory : findcategory
									            },
									            success: function(data) {
													var list = data.list;
													var tbody = $('#tbody');
													tbody.empty();
													if(list == ''){
														var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
														$('#resultmessage').text('검색결과가 없습니다.');
														$('body').append(buttonHTML);
														$('#modalButton').click();
													}
														list.forEach(function(item) {
														var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" onclick="openpop(' + item.itemCode + ')" style="cursor:pointer;">'													
														var keys= [
															'itemCode', 'type', 'jsType', 'groupName', 'subGroupName', 'levelName', 'itemMonth', 'weekName', 
															'fromTime', 'toTime', 'defPrice', 'price1', 'price2', 'price3', 'price4', 'offMax', 'onMax', 'junwon', 
															'isUse', 'dcNoChk', 'parkingTime', 'webEnd', 'ageStart', 'ageYearGbn', 'recommendGbn',
															'oldAgeDCNoGbn', 'lotteryGbn', 'inliveRegster',
														];
														keys.forEach(function(key) {
															var value = item[key] ?? '';
															if (key === 'type') {
																// 'type' 키의 값이 'G'이면 '일반', 'S'이면 '특강'으로 변경
																value = value === 'G' ? '일반' : value === 'S' ? '특강' : value;
															}
															if (key === 'jsType') {
																value = value === '0' ? '정시접수' : value === '1' ? '수시접수' : value === '2' ? '기간접수' : value;
															}
															if (key === 'junwon') {
													            var offMax = parseInt(item['offMax']) || 0;
													            var onMax = parseInt(item['onMax']) || 0;
													            value = offMax + onMax; // 'offMax'와 'onMax' 값을 더한 값으로 설정
															}
															if (key === 'parkingTime') {
																switch(value) {
																case '0':
																	value = '해당없음';
																	break;
																case '61':
													                value = '30분';
													                break;
													            case '62':
													                value = '1시간';
													                break;
													            case '63':
													                value = '1시간30분';
													                break;
													            case '64':
													                value = '2시간';
													                break;
													            case '65':
													                value = '2시간30분';
													                break;
													            case '66':
													                value = '3시간';
													                break;
													            case '67':
													                value = '3시간30분';
													                break;
													            case '68':
													                value = '4시간';
													                break;
													            case '69':
													                value = '4시간30분';
													                break;
													            case '70':
													                value = '5시간';
													                break;
													            case '71':
													                value = '5시간30분';
													                break;
													            case '72':
													                value = '6시간';
													                break;
													            case '73':
													                value = '6시간30분';
													                break;
													            case '74':
													                value = '7시간';
													                break;
													            case '75':
													                value = '7시간30분';
													                break;
													            case '76':
													                value = '8시간';
													                break;
													            case '77':
													                value = '8시간30분';
													                break;
													            case '78':
													                value = '9시간';
													                break;
													            case '79':
													                value = '9시간30분';
													                break;
													            case '80':
													                value = '10시간';
													                break;
																}
															}
															if (key === 'ageStart') {
														        value = item['ageStart'] + ' ~ ' + item['ageEnd']; // 'ageStart'와 'ageEnd'를 조합하여 문자열 생성
														    }
															row += '<td class="align-middle py-3">' + value + '</td>';
														});
														row += '</tr>';
														tbody.append(row);
													})
												},
												error: function(xhr, status, error) {
												console.log("Status: " + status);
												console.log("Error: " + error);
												}
											});
										};
										function handleKeyPress(event) {
											if (event.key === "Enter" || event.key === 'F3') {
											    finditem();
											  }
											}
										
								/* }); */
							</script>
								<div class="col-auto">
									<button class="btn btn-primary" type="button"
										data-bs-toggle="modal" id="modal" data-bs-target="#insertModal"
										onclick="openModal()">등록(F2)</button>
								</div>
								<script type="text/javascript">
									document.addEventListener('keydown', function(event) {
										if (event.key === 'F2') {
										// F2 키를 눌렀을 때 버튼을 찾아 클릭 이벤트를 발생시킵니다.
											var button = document.getElementById('modal');
											if (button) {
												button.click(); // 버튼 클릭
											}
										}
									});
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1" >
				<div id="tableotherlearn" data-list='{"valueNames":["ItemCode","Type","JsType","GroupName","SubGroupName","LevelName","ItemMonth","WeekName", "FromTime","ToTime","DefPrice","Price1",
				 "Price2", "Price3", "Price4", "offMax", "onMax", "IsUse", "DcNoChk", "ParkingTime", "WebEnd", "AgeStart", "AageYearGbn", "RecommendGbn", "OldAgeDCNoGbn", "LotteryGbn", "InliveRegster"]
					,"page":10,"pagination":true}'>
					<!-- <div class="search-box my-3 mx-auto">
						<form class="position-relative" data-bs-toggle="search" data-bs-display="static">
							<input class="form-control search-input search form-control-sm" type="search" placeholder="Search" aria-label="Search" />
							<span class="fas fa-search search-box-icon"></span>
						</form>
					</div> -->
					<div class="table-responsive scrollbar-overlay mx-n1 px-1">
						<table class="table table-sm fs--1 mb-1 table-hover table-bordered">
							<thead>
								<tr>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="ItemCode" scope="col">코드</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="Type" scope="col">구분</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="JsType" scope="col">접수유형</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="GroupName" scope="col">종목</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="SubGroupName" scope="col">강습반명</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="LevelName" scope="col">단계</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="ItemMonth" scope="col">개월수</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="WeekName" scope="col">요일</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="FromTime" scope="col">강습시작시간</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="ToTime" scope="col">강습종료시간</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="DefPrice" scope="col">어른</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="Price1" scope="col">청소년</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="Price2" scope="col">어린이</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="Price2" scope="col">경로</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="Price3" scope="col">기본금</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="Price4" scope="col">오프라인</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="Price4" scope="col">온라인</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="OffMax" scope="col">정원</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="OnMax" scope="col">상태</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="IsUse" scope="col">할인불가</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="DcNoChk" scope="col">주차시간</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="ParkingTime" scope="col">신규마감</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="WebEnd" scope="col">나이설정</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="AgeStart" scope="col">연도나이</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="AageYearGbn" scope="col">추천강좌</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="RecommendGbn" scope="col">고령할인X</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="OldAgeDCNoGbn" scope="col">추첨접수</th>
									<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" data-sort="LotteryGbn" scope="col">구민접수</th>
								</tr>
							</thead>
							<tbody class="list" id="tbody">
								<c:forEach items="${list }" var="list">
									<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" onclick="openpop(${list.itemCode})" style="cursor:pointer;">
										<td class="ItemCode align-middle white-space-nowrap text-900 fs--1">
											${list.itemCode }
										</td>
										<td class="Type align-middle white-space-nowrap ">
											<c:choose>
												<c:when test="${list.type == 'G'}">일반</c:when>
												<c:when test="${list.type == 'S'}">특강</c:when>
											</c:choose>
										</td>
										<td class="JsType align-middle white-space-nowrap ">
											<c:choose>
				                              <c:when test="${list.jsType == '0'}">정시접수</c:when>
				                              <c:when test="${list.jsType == '1'}">수시접수</c:when>
				                              <c:when test="${list.jsType == '2'}">기간지정</c:when>
				                           </c:choose>
										</td>
										<td class="GroupName align-middle white-space-nowrap ">
											${list.groupName }
										</td>
										<td class="SubGroupName align-middle py-3 white-space-nowrap ">
											${list.subGroupName }
										</td>
										<td class="LevelName align-middle white-space-nowrap ">
											${list.levelName }
										</td>
										<td class="ItemMonth align-middle white-space-nowrap ">
											${list.itemMonth }
										</td>
										<td class="WeekName align-middle white-space-nowrap ">
											${list.weekName }
										</td>
										<td class="FromTime align-middle white-space-nowrap">
											${list.fromTime }
										</td>
										<td class="ToTime align-middle white-space-nowrap ">
											${list.toTime }
										</td>
										<td class="DefPrice align-middle white-space-nowrap ">
											<fmt:parseNumber value="${list.defPrice }" var="defPrice"/>
											<fmt:formatNumber value="${defPrice }"/>
										</td>
										<td class="Price1 align-middle white-space-nowrap ">
											<fmt:parseNumber value="${list.price1 }" var="price1"/>
											<fmt:formatNumber value="${price1 }"/>
										</td>
										<td class="Price2 align-middle white-space-nowrap ">
											<fmt:parseNumber value="${list.price2 }" var="price2"/>
											<fmt:formatNumber value="${price2 }"/>
										</td>
										<td class="Price3 align-middle white-space-nowrap ">
											<fmt:parseNumber value="${list.price3 }" var="price3"/>
											<fmt:formatNumber value="${price3 }"/>
										</td>
										<td class="Price4 align-middle white-space-nowrap ">
											<fmt:parseNumber value="${list.price4 }" var="price4"/>
											<fmt:formatNumber value="${price4 }"/>
										</td>
										<td class="OffMax align-middle white-space-nowrap ">
											${list.offMax }
										</td>
										<td class="OnMax align-middle white-space-nowrap ">
											${list.onMax}
										</td>
										<td class="OnMax align-middle white-space-nowrap ">
											${list.onMax + list.offMax}
										</td>
										<td class="IsUse align-middle white-space-nowrap ">
											<c:choose>
												<c:when test="${list.isUse == 'Y'}">사용</c:when>
												<c:when test="${list.isUse == 'N'}">사용안함</c:when>
											</c:choose>
										</td>
										<td class="DcNoChk align-middle white-space-nowrap ">
											<c:choose>
												<c:when test="${list.dcNoChk == 'Y'}">불가</c:when>
												<c:when test="${list.dcNoChk == 'N'}">가능</c:when>
											</c:choose>
										</td>
										<td class="ParkingTime align-middle white-space-nowrap ">
											<c:choose>
												<c:when test="${list.parkingTime == '0'}">해당없음</c:when>
												<c:when test="${list.parkingTime == '61'}">30분</c:when>
												<c:when test="${list.parkingTime == '62'}">1시간</c:when>
												<c:when test="${list.parkingTime == '63'}">1시간 30분</c:when>
												<c:when test="${list.parkingTime == '64'}">2시간</c:when>
												<c:when test="${list.parkingTime == '65'}">2시간 30분</c:when>
												<c:when test="${list.parkingTime == '66'}">3시간</c:when>
												<c:when test="${list.parkingTime == '67'}">3시간 30분</c:when>
												<c:when test="${list.parkingTime == '68'}">4시간</c:when>
												<c:when test="${list.parkingTime == '69'}">4시간 30분</c:when>
												<c:when test="${list.parkingTime == '70'}">5시간</c:when>
												<c:when test="${list.parkingTime == '71'}">5시간 30분</c:when>
												<c:when test="${list.parkingTime == '72'}">6시간</c:when>
												<c:when test="${list.parkingTime == '73'}">6시간 30분</c:when>
												<c:when test="${list.parkingTime == '74'}">7시간</c:when>
												<c:when test="${list.parkingTime == '75'}">7시간 30분</c:when>
												<c:when test="${list.parkingTime == '76'}">8시간</c:when>
												<c:when test="${list.parkingTime == '77'}">8시간 30분</c:when>
												<c:when test="${list.parkingTime == '78'}">9시간</c:when>
												<c:when test="${list.parkingTime == '79'}">9시간 30분</c:when>
												<c:when test="${list.parkingTime == '80'}">10시간</c:when>
											</c:choose>
										</td>
										<td class="WebEnd align-middle white-space-nowrap ">
											${list.webEnd }
										</td>
										<td class="AgeStart align-middle white-space-nowrap ">
											${list.ageStart } ~ ${list.ageEnd }
										</td>
										<td class="AageYearGbn align-middle white-space-nowrap ">
											${list.ageYearGbn }
										</td>
										<td class="RecommendGbn align-middle white-space-nowrap ">
											${list.recommendGbn }
										</td>
										<td class="OldAgeDCNoGbn align-middle white-space-nowrap ">
											${list.oldAgeDCNoGbn }
										</td>
										<td class="LotteryGbn align-middle white-space-nowrap ">
											${list.lotteryGbn }
										</td>
										<td class="InliveRegster align-middle white-space-nowrap ">
											${list.inliveRegster }
										</td>
									</tr>
								</c:forEach>
							</tbody>
							
						</table>
						<div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
							<div class="col-auto d-flex">
								<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
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
		</form>
	</div>
</div>

<div class="modal fade" id="insertModal" tabindex="-1"
   data-bs-backdrop="static" aria-labelledby="insertModalLabel"
   aria-hidden="true">
   <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content" id="01">
         <jsp:include page="classinsert.jsp" />
      </div>
   </div>
</div>

<script>
function openModal() {
	   var item = $("#item").val();
	   if(item === '1') {
	      $('#modal-content').load("insertClassInfo.do");
	   }
	}
	
function openpop(ItemCode) {
	var url = "updateItem.do";
	if(typeof ItemCode !== "undefined"){
		var url = "updateItem.do?ItemCode="+ItemCode;
	}
	var popupWidth = 1200;
	var popupHeight = 600;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	window.open(url, "_blank_","toolbar=no, menubar=no, scrollbars=yes, resizable=no, height=" + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
}

function goPage() {
	var frm    = document.selectForm;
	frm.itemid.value	= '';
	frm.pageIndex.value	= 1;
	frm.action = '${pageContext.request.contextPath}/classinfo.do';
	frm.submit();
}

function enterkey() {//엔터 처리
	if (window.event.keyCode == 13) {
		cat_Search()
    }
}


$("#IsUse,#Type").change(function() {
	
	var tableBody = $(".list");
    tableBody.empty(); // 기존 내용을 지웁니다
    
    var item = $("#IsUse").val();
    var type = $("#Type").val();
    
    $.ajax({
    	type:"GET",
    	url:"tblItemIsUse.do",
    	dataType:"json",
    	data: {
            item:item,
            type:type
         },
         success:function(data) {
        	 if(item === '1') {
        		 var isUse = data.ItemUseY;
        		 isUse.forEach(function(list) {
        			 var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" onclick="openpop(' + list.itemCode + ')" style="cursor:pointer;">'
        			 row += '<td class="ItemCode align-middle white-space-nowrap text-900 fs--1 text-start">' + list.itemCode + '</td>';
        			 var type = '';
        			 if(list.type == 'G') {
        				 type = '일반';
        			 } else  {
        				 type = '특강';
        			 }
        			 row += '<td class="Type align-middle white-space-nowrap "> ' + type + '</td>';
        			 var JSType = '';
                     if(list.jsType == '0') {
                        JSType = '정시접수';
                     } else if (list.jsType == '1') {
                        JSType = '수시접수';
                     } else if (list.jsType == '2') {
                        JSType = '기간지정'
                     }
                     row += '<td class="JSType align-middle py-3 ">' + JSType + '</td>';
                     row += '<td class="GroupName align-middle white-space-nowrap ">' + list.groupName + '</td>';
                     row += '<td class="SubGroupName align-middle py-3 white-space-nowrap ">' + list.subGroupName + '</td>';
                     row += '<td class="LevelName align-middle white-space-nowrap ">' + list.levelName + '</td>';
                     row += '<td class="ItemMonth align-middle white-space-nowrap ">' + list.itemMonth + '</td>';
                     row += '<td class="WeekName align-middle white-space-nowrap ">' + list.weekName + '</td>';
                     row += '<td class="FromTime align-middle white-space-nowrap ">' + list.fromTime + '</td>';
                     row += '<td class="ToTime align-middle white-space-nowrap ">' + list.toTime + '</td>';
                     row += '<td class="DefPrice align-middle white-space-nowrap ">' + list.defPrice + '</td>';
                     row += '<td class="Price1 align-middle white-space-nowrap ">' + list.price1 + '</td>';
                     row += '<td class="Price2 align-middle white-space-nowrap ">' + list.price2 + '</td>';
                     row += '<td class="Price3 align-middle white-space-nowrap ">' + list.price3 + '</td>';
                     row += '<td class="Price4 align-middle white-space-nowrap ">' + list.price4 + '</td>';
                     row += '<td class="OffMax align-middle white-space-nowrap ">' + list.offMax + '</td>';
                     row += '<td class="OnMax align-middle white-space-nowrap ">' + list.onMax + '</td>';
                     var sum = parseInt(list.offMax) + parseInt(list.onMax);
                     row += '<td class="Price4 align-middle white-space-nowrap ">' + sum + '</td>';
                     var IsUse = '';
                     if(list.isUse == 'Y') {
                    	 IsUse = '사용';
                     }
                     row += '<td class="IsUse align-middle white-space-nowrap ">' + IsUse  + '</td>';
                     var DcNoChk = '';
                     if(list.dcNoChk != 'Y') {
                    	 DcNoChk = '가능';
                     }else {
                    	 DcNoChk = '불가';
                     }
                     row += '<td class="DcNoChk align-middle py-3 ">' + DcNoChk + '</td>';
                     var ParkingTime = '';
                     if(list.parkingTime == '0') {
                    	 ParkingTime = '해당없음';
                     }else if(list.parkingTime == '61') {
                    	 ParkingTime = '30분';
                     }else if(list.parkingTime == '62') {
                    	 ParkingTime = '1시간';
                     }else if(list.parkingTime == '63') {
                    	 ParkingTime = '1시간 30분';
                     }else if(list.parkingTime == '64') {
                    	 ParkingTime = '2시간';
                     }else if(list.parkingTime == '65') {
                    	 ParkingTime = '2시간 30분';
                     }else if(list.parkingTime == '66') {
                    	 ParkingTime = '3시간';
                     }else if(list.parkingTime == '67') {
                    	 ParkingTime = '3시간 30분';
                     }else if(list.parkingTime == '68') {
                    	 ParkingTime = '4시간';
                     }else if(list.parkingTime == '69') {
                    	 ParkingTime = '4시간 30분';
                     }else if(list.parkingTime == '70') {
                    	 ParkingTime = '5시간';
                     }else if(list.parkingTime == '71') {
                    	 ParkingTime = '5시간 30분';
                     }else if(list.parkingTime == '72') {
                    	 ParkingTime = '6시간';
                     }else if(list.parkingTime == '73') {
                    	 ParkingTime = '6시간 30분';
                     }else if(list.parkingTime == '74') {
                    	 ParkingTime = '7시간';
                     }else if(list.parkingTime == '75') {
                    	 ParkingTime = '7시간 30분';
                     }else if(list.parkingTime == '76') {
                    	 ParkingTime = '8시간';
                     }else if(list.parkingTime == '77') {
                    	 ParkingTime = '8시간 30분';
                     }else if(list.parkingTime == '78') {
                    	 ParkingTime = '9시간';
                     }else if(list.parkingTime == '79') {
                    	 ParkingTime = '9시간 30분';
                     }else if(list.parkingTime == '80') {
                    	 ParkingTime = '10시간';
                     }
                     row += '<td class="ParkingTime align-middle py-3 ">' + ParkingTime + '</td>';
                     var WebEnd = '';
                     if(list.webEnd == 'Y') {
                    	 WebEnd = 'Y';
                     } else {
                    	 WebEnd = '';
                     }
                     row += '<td class="WebEnd align-middle white-space-nowrap ">' + WebEnd  + '</td>';
                     row += '<td class="AgeStart align-middle white-space-nowrap ">' + list.ageStart + ' ~ ' + list.ageEnd  + '</td>';
                     var AgeYearGbn = '';
                     if(list.ageYearGbn == 'Y') {
                    	 AgeYearGbn = 'Y';
                     }else {
                    	 AgeYearGbn = '';
                     }
                     row += '<td class="AageYearGbn align-middle white-space-nowrap ">' + AgeYearGbn  + '</td>';
                     var RecommendGbn = '';
                     if(list.recommendGbn == 'Y') {
                    	 RecommendGbn = 'Y';
                     }else {
                    	 RecommendGbn = '';
                     }
                     row += '<td class="RecommendGbn align-middle white-space-nowrap ">' + RecommendGbn + '</td>';
                     var OldAgeDCNoGbn = '';
                     if(list.oldAgeDCNoGbn == 'Y') {
                    	 OldAgeDCNoGbn = 'Y';
                     }else {
                    	 OldAgeDCNoGbn = '';
                     }
                     row += '<td class="OldAgeDCNoGbn align-middle white-space-nowrap ">' + OldAgeDCNoGbn + '</td>';
                     var LotteryGbn = '';
                     if(list.lotteryGbn == 'Y') {
                    	 LotteryGbn = 'Y';
                     }else {
                    	 LotteryGbn = '';
                     }
                     row += '<td class="LotteryGbn align-middle white-space-nowrap ">' + LotteryGbn + '</td>';
                     var InliveRegster = '';
                     if(list.inliveRegster == 'Y') {
                    	 InliveRegster = 'Y';
                     }else {
                    	 InliveRegster = '';
                     }
                     row += '<td class="InliveRegster align-middle white-space-nowrap ">' + InliveRegster  + '</td>';
                     row += '</tr>';
                     tableBody.append(row);
        		 });
        	 }else if(item === '2') {
        		 var isUseN = data.itemUseN;
        		 isUseN.forEach(function(list) {
        			 var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" onclick="openpop(' + list.itemCode + ')" style="cursor:pointer;">'
        			 row += '<td class="ItemCode align-middle white-space-nowrap text-900 fs--1 text-start">' + list.itemCode + '</td>';
        			 var type = '';
        			 if(list.type == 'G') {
        				 type = '일반';
        			 } else  {
        				 type = '특강';
        			 }
        			 row += '<td class="Type align-middle white-space-nowrap "> ' + type + '</td>';
        			 var JSType = '';
                     if(list.jsType == '0') {
                        JSType = '정시접수';
                     } else if (list.jsType == '1') {
                        JSType = '수시접수';
                     } else if (list.jsType == '2') {
                        JSType = '기간지정'
                     }
                     row += '<td class="JSType align-middle py-3 ">' + JSType + '</td>';
                     row += '<td class="GroupName align-middle white-space-nowrap ">' + list.groupName + '</td>';
                     row += '<td class="SubGroupName align-middle py-3 white-space-nowrap ">' + list.subGroupName + '</td>';
                     row += '<td class="LevelName align-middle white-space-nowrap ">' + list.levelName + '</td>';
                     row += '<td class="ItemMonth align-middle white-space-nowrap ">' + list.itemMonth + '</td>';
                     row += '<td class="WeekName align-middle white-space-nowrap ">' + list.weekName + '</td>';
                     row += '<td class="FromTime align-middle white-space-nowrap ">' + list.fromTime + '</td>';
                     row += '<td class="ToTime align-middle white-space-nowrap ">' + list.toTime + '</td>';
                     row += '<td class="DefPrice align-middle white-space-nowrap ">' + list.defPrice + '</td>';
                     row += '<td class="Price1 align-middle white-space-nowrap ">' + list.price1 + '</td>';
                     row += '<td class="Price2 align-middle white-space-nowrap ">' + list.price2 + '</td>';
                     row += '<td class="Price3 align-middle white-space-nowrap ">' + list.price3 + '</td>';
                     row += '<td class="Price4 align-middle white-space-nowrap ">' + list.price4 + '</td>';
                     row += '<td class="OffMax align-middle white-space-nowrap ">' + list.offMax + '</td>';
                     row += '<td class="OnMax align-middle white-space-nowrap ">' + list.onMax + '</td>';
                     var sum = parseInt(list.offMax) + parseInt(list.onMax);
                     row += '<td class="Price4 align-middle white-space-nowrap ">' + sum + '</td>';
                     var IsUse = '';
                     if(list.isUse == 'N') {
                    	 IsUse = '사용안함';
                     }
                     row += '<td class="IsUse align-middle white-space-nowrap ">' + IsUse  + '</td>';
                     var DcNoChk = '';
                     if(list.dcNoChk != 'Y') {
                    	 DcNoChk = '가능';
                     }else {
                    	 DcNoChk = '불가';
                     }
                     row += '<td class="DcNoChk align-middle py-3 ">' + DcNoChk + '</td>';
                     var ParkingTime = '';
                     if(list.parkingTime == '0') {
                    	 ParkingTime = '해당없음';
                     }else if(list.parkingTime == '61') {
                    	 ParkingTime = '30분';
                     }else if(list.parkingTime == '62') {
                    	 ParkingTime = '1시간';
                     }else if(list.parkingTime == '63') {
                    	 ParkingTime = '1시간 30분';
                     }else if(list.parkingTime == '64') {
                    	 ParkingTime = '2시간';
                     }else if(list.parkingTime == '65') {
                    	 ParkingTime = '2시간 30분';
                     }else if(list.parkingTime == '66') {
                    	 ParkingTime = '3시간';
                     }else if(list.parkingTime == '67') {
                    	 ParkingTime = '3시간 30분';
                     }else if(list.parkingTime == '68') {
                    	 ParkingTime = '4시간';
                     }else if(list.parkingTime == '69') {
                    	 ParkingTime = '4시간 30분';
                     }else if(list.parkingTime == '70') {
                    	 ParkingTime = '5시간';
                     }else if(list.parkingTime == '71') {
                    	 ParkingTime = '5시간 30분';
                     }else if(list.parkingTime == '72') {
                    	 ParkingTime = '6시간';
                     }else if(list.parkingTime == '73') {
                    	 ParkingTime = '6시간 30분';
                     }else if(list.parkingTime == '74') {
                    	 ParkingTime = '7시간';
                     }else if(list.parkingTime == '75') {
                    	 ParkingTime = '7시간 30분';
                     }else if(list.parkingTime == '76') {
                    	 ParkingTime = '8시간';
                     }else if(list.parkingTime == '77') {
                    	 ParkingTime = '8시간 30분';
                     }else if(list.parkingTime == '78') {
                    	 ParkingTime = '9시간';
                     }else if(list.parkingTime == '79') {
                    	 ParkingTime = '9시간 30분';
                     }else if(list.parkingTime == '80') {
                    	 ParkingTime = '10시간';
                     }
                     row += '<td class="ParkingTime align-middle py-3 ">' + ParkingTime + '</td>';
                     var WebEnd = '';
                     if(list.webEnd == 'Y') {
                    	 WebEnd = 'Y';
                     } else {
                    	 WebEnd = '';
                     }
                     row += '<td class="WebEnd align-middle white-space-nowrap ">' + WebEnd  + '</td>';
                     row += '<td class="AgeStart align-middle white-space-nowrap ">' + list.ageStart + ' ~ ' + list.ageEnd  + '</td>';
                     var AgeYearGbn = '';
                     if(list.ageYearGbn == 'Y') {
                    	 AgeYearGbn = 'Y';
                     }else {
                    	 AgeYearGbn = '';
                     }
                     row += '<td class="AageYearGbn align-middle white-space-nowrap ">' + AgeYearGbn  + '</td>';
                     var RecommendGbn = '';
                     if(list.recommendGbn == 'Y') {
                    	 RecommendGbn = 'Y';
                     }else {
                    	 RecommendGbn = '';
                     }
                     row += '<td class="RecommendGbn align-middle white-space-nowrap ">' + RecommendGbn + '</td>';
                     var OldAgeDCNoGbn = '';
                     if(list.oldAgeDCNoGbn == 'Y') {
                    	 OldAgeDCNoGbn = 'Y';
                     }else {
                    	 OldAgeDCNoGbn = '';
                     }
                     row += '<td class="OldAgeDCNoGbn align-middle white-space-nowrap ">' + OldAgeDCNoGbn + '</td>';
                     var LotteryGbn = '';
                     if(list.lotteryGbn == 'Y') {
                    	 LotteryGbn = 'Y';
                     }else {
                    	 LotteryGbn = '';
                     }
                     row += '<td class="LotteryGbn align-middle white-space-nowrap ">' + LotteryGbn + '</td>';
                     var InliveRegster = '';
                     if(list.inliveRegster == 'Y') {
                    	 InliveRegster = 'Y';
                     }else {
                    	 InliveRegster = '';
                     }
                     row += '<td class="InliveRegster align-middle white-space-nowrap ">' + InliveRegster  + '</td>';
                     row += '</tr>';
                     tableBody.append(row);
        		 });
        	 }else if(item === '3') {
        		 var isdelete = data.IsDelete;
        		 isdelete.forEach(function(list) {
        			 var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" onclick="openpop(' + list.itemCode + ')" style="cursor:pointer;">'
        			 row += '<td class="ItemCode align-middle white-space-nowrap text-900 fs--1 text-start">' + list.itemCode + '</td>';
        			 var type = '';
        			 if(list.type == 'G') {
        				 type = '일반';
        			 } else  {
        				 type = '특강';
        			 }
        			 row += '<td class="Type align-middle white-space-nowrap "> ' + type + '</td>';
        			 var JSType = '';
                     if(list.jsType == '0') {
                        JSType = '정시접수';
                     } else if (list.jsType == '1') {
                        JSType = '수시접수';
                     } else if (list.jsType == '2') {
                        JSType = '기간지정'
                     }
                     row += '<td class="JSType align-middle py-3 ">' + JSType + '</td>';
                     row += '<td class="GroupName align-middle white-space-nowrap ">' + list.groupName + '</td>';
                     row += '<td class="SubGroupName align-middle py-3 white-space-nowrap ">' + list.subGroupName + '</td>';
                     row += '<td class="LevelName align-middle white-space-nowrap ">' + list.levelName + '</td>';
                     row += '<td class="ItemMonth align-middle white-space-nowrap ">' + list.itemMonth + '</td>';
                     row += '<td class="WeekName align-middle white-space-nowrap ">' + list.weekName + '</td>';
                     row += '<td class="FromTime align-middle white-space-nowrap ">' + list.fromTime + '</td>';
                     row += '<td class="ToTime align-middle white-space-nowrap ">' + list.toTime + '</td>';
                     row += '<td class="DefPrice align-middle white-space-nowrap ">' + list.defPrice + '</td>';
                     row += '<td class="Price1 align-middle white-space-nowrap ">' + list.price1 + '</td>';
                     row += '<td class="Price2 align-middle white-space-nowrap ">' + list.price2 + '</td>';
                     row += '<td class="Price3 align-middle white-space-nowrap ">' + list.price3 + '</td>';
                     row += '<td class="Price4 align-middle white-space-nowrap ">' + list.price4 + '</td>';
                     row += '<td class="OffMax align-middle white-space-nowrap ">' + list.offMax + '</td>';
                     row += '<td class="OnMax align-middle white-space-nowrap ">' + list.onMax + '</td>';
                     var sum = parseInt(list.offMax) + parseInt(list.onMax);
                     row += '<td class="Price4 align-middle white-space-nowrap ">' + sum + '</td>';
                     var IsUse = '';
                     if(list.isUse == 'N') {
                    	 IsUse = '사용안함';
                     }
                     row += '<td class="IsUse align-middle white-space-nowrap ">' + IsUse  + '</td>';
                     var DcNoChk = '';
                     if(list.dcNoChk != 'Y') {
                    	 DcNoChk = '가능';
                     }else {
                    	 DcNoChk = '불가';
                     }
                     row += '<td class="DcNoChk align-middle py-3 ">' + DcNoChk + '</td>';
                     var ParkingTime = '';
                     if(list.parkingTime == '0') {
                    	 ParkingTime = '해당없음';
                     }else if(list.parkingTime == '61') {
                    	 ParkingTime = '30분';
                     }else if(list.parkingTime == '62') {
                    	 ParkingTime = '1시간';
                     }else if(list.parkingTime == '63') {
                    	 ParkingTime = '1시간 30분';
                     }else if(list.parkingTime == '64') {
                    	 ParkingTime = '2시간';
                     }else if(list.parkingTime == '65') {
                    	 ParkingTime = '2시간 30분';
                     }else if(list.parkingTime == '66') {
                    	 ParkingTime = '3시간';
                     }else if(list.parkingTime == '67') {
                    	 ParkingTime = '3시간 30분';
                     }else if(list.parkingTime == '68') {
                    	 ParkingTime = '4시간';
                     }else if(list.parkingTime == '69') {
                    	 ParkingTime = '4시간 30분';
                     }else if(list.parkingTime == '70') {
                    	 ParkingTime = '5시간';
                     }else if(list.parkingTime == '71') {
                    	 ParkingTime = '5시간 30분';
                     }else if(list.parkingTime == '72') {
                    	 ParkingTime = '6시간';
                     }else if(list.parkingTime == '73') {
                    	 ParkingTime = '6시간 30분';
                     }else if(list.parkingTime == '74') {
                    	 ParkingTime = '7시간';
                     }else if(list.parkingTime == '75') {
                    	 ParkingTime = '7시간 30분';
                     }else if(list.parkingTime == '76') {
                    	 ParkingTime = '8시간';
                     }else if(list.parkingTime == '77') {
                    	 ParkingTime = '8시간 30분';
                     }else if(list.parkingTime == '78') {
                    	 ParkingTime = '9시간';
                     }else if(list.parkingTime == '79') {
                    	 ParkingTime = '9시간 30분';
                     }else if(list.parkingTime == '80') {
                    	 ParkingTime = '10시간';
                     }
                     row += '<td class="ParkingTime align-middle py-3 ">' + ParkingTime + '</td>';
                     var WebEnd = '';
                     if(list.webEnd == 'Y') {
                    	 WebEnd = 'Y';
                     } else {
                    	 WebEnd = '';
                     }
                     row += '<td class="WebEnd align-middle white-space-nowrap ">' + WebEnd  + '</td>';
                     row += '<td class="AgeStart align-middle white-space-nowrap ">' + list.ageStart + ' ~ ' + list.ageEnd  + '</td>';
                     var AgeYearGbn = '';
                     if(list.ageYearGbn == 'Y') {
                    	 AgeYearGbn = 'Y';
                     }else {
                    	 AgeYearGbn = '';
                     }
                     row += '<td class="AageYearGbn align-middle white-space-nowrap ">' + AgeYearGbn  + '</td>';
                     var RecommendGbn = '';
                     if(list.recommendGbn == 'Y') {
                    	 RecommendGbn = 'Y';
                     }else {
                    	 RecommendGbn = '';
                     }
                     row += '<td class="RecommendGbn align-middle white-space-nowrap ">' + RecommendGbn + '</td>';
                     var OldAgeDCNoGbn = '';
                     if(list.oldAgeDCNoGbn == 'Y') {
                    	 OldAgeDCNoGbn = 'Y';
                     }else {
                    	 OldAgeDCNoGbn = '';
                     }
                     row += '<td class="OldAgeDCNoGbn align-middle white-space-nowrap ">' + OldAgeDCNoGbn + '</td>';
                     var LotteryGbn = '';
                     if(list.lotteryGbn == 'Y') {
                    	 LotteryGbn = 'Y';
                     }else {
                    	 LotteryGbn = '';
                     }
                     row += '<td class="LotteryGbn align-middle white-space-nowrap ">' + LotteryGbn + '</td>';
                     var InliveRegster = '';
                     if(list.inliveRegster == 'Y') {
                    	 InliveRegster = 'Y';
                     }else {
                    	 InliveRegster = '';
                     }
                     row += '<td class="InliveRegster align-middle white-space-nowrap ">' + InliveRegster  + '</td>';
                     row += '</tr>';
                     tableBody.append(row);
        		 });
        	 }
         }
    })
});



</script>
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