<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<div class="p-0">
	<div class="mb-9 ">
		<div class="row g-2 mb-4">
			<div class="col-auto">
				<h2 class="mb-0">강습코드관리</h2>
			</div>
		</div>
		<div class="mb-1">
			<div class="row g-6">
				<div class="col-sm-3 col-md-2 mb-2">
					<select class="form-select" id="item" name="item" aria-label="Default select example">
						<option value="0" selected >종목</option>
						<option value="1">강습반명</option>
						<option value="2">단계</option>
					</select>
				</div>
				<div class="col-sm-6 col-md-3 mb-2">
					<div class="form-check" style="padding-top: 15px;">
						<input class="form-check-input" id="isdeletecheck" type="checkbox" name="isdeletecheck"/>
						<label class="form-check-label text-900 fs-0" for="isdeletecheck">삭제데이터보기</label>
						<input type="hidden" name="IsDelete" id="IsDelete">
					</div>
				</div>
				<div class="col-auto" style="padding-top: 5px;">
					<button class="btn btn-primary" type="button" data-bs-toggle="modal" id="modal" data-bs-target="#insertModal" onclick="openModal()">등록(F2)</button>
					<button class="btn btn-success" type="button" id="excelButton" onclick="fnExcelReport('itemTable','강습코드관리')"><span class="far fa-file-excel"></span>&emsp;엑셀로 저장</button>
				</div>
				<script type="text/javascript">
					if('${authyn.ins}' == 'N'){
						$('#modal').attr('disabled','disabled');
					}
					if('${authyn.excel}' == 'N'){
						$('#excelButton').attr('disabled','disabled');
					}
					document.addEventListener('keydown', function(event) {
						if (event.key === 'F2') {
							if('${authyn.ins}' == 'N'){
								return false;
							}
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
      
		<div class="mx-n4 px-1 mx-lg-n6 bg-white border-top border-bottom border-200 position-relative top-1" >
			<div id="tableotherlearn" data-list='{"valueNames":["GroupName","jsType","fromDate","jungSi1","jungSi2","jungSi3","jungSi1Inlive","sortOrder", "againMonth","webYN","itemRejectCnt","monthSelNo",
			"jungSiLotteryFromDate", "jungSiLotteryDate", "jungSiLotteryPayFromDate", "jungSiLotteryAddFromDate"],"page":5,"pagination":true}'>
				<div class="table-responsive scrollbar-overlay mx-n1 px-1">
					<table class="table table-sm fs--1 mb-1 table-hover table-bordered" id="itemTable">
						<thead class="itemcodelist">
							<tr>
							   <th rowspan="2" class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="GroupName" scope="col" >강습종목</th>
							   <th rowspan="2" class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="jsType" scope="col">접수구분</th>
							   <th colspan="5" class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col">접수기간</th>
							   <th rowspan="2" class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="sortOrder" scope="col" >정렬순서</th>
							   <th rowspan="2" class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="againMonth" scope="col" >재등록<br>제한개월</th>
							   <th rowspan="2" class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="webYN" scope="col">온라인<br>사용</th>
							   <th rowspan="2" class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="itemRejectCnt" scope="col">등록제한<br>건수</th>
							   <th rowspan="2" class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="monthSelNo" scope="col">다개월<br>불가</th>
							   <th colspan="4" class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col">추첨접수기간</th>
							</tr>
							<tr>
								<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="fromDate" scope="col">기간</th>
								<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="jungSi1" scope="col">신규</th>
								<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="jungSi2" scope="col">재등록</th>
								<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="jungSi3" scope="col">강습기간</th>
								<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="jungSi1Inlive" scope="col">구민접수</th>
								<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="jungSiLotteryFromDate" scope="col">접수기간</th>
								<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="jungSiLotteryDate" scope="col">추첨일</th>
								<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="jungSiLotteryPayFromDate" scope="col">결제기간</th>
								<th class="white-space-nowrap sort fs--1 align-middle ps-0 text-center" scope="col" data-sort="jungSiLotteryAddFromDate" scope="col">선착순</th>
							</tr>
						</thead>
						<tbody class="list" id="tbody">
							<c:forEach items="${list}" var="list">
								<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center"  
	                     			id="updateTR01" onclick="openpop(${list.groupID})" style="cursor:pointer;"  >
									<td class="GroupName align-middle py-3 " id="GroupName" data-item-id=${list.groupID } >
										<c:out value="${list.groupName} "/>
									</td>
									<td class="jsType align-middle white-space-nowrap ">
										<c:choose>
											<c:when test="${list.jsType == '0'}">정시접수</c:when>
											<c:when test="${list.jsType == '1'}">수시접수</c:when>
											<c:when test="${list.jsType == '2'}">기간지정</c:when>
										</c:choose>
									</td> 
									<td class="fromDate align-middle py-3 ">
										<c:out value="${list.fromDate }"/> ~ <c:out value="${list.toDate }"/>
									</td>
									<td class="jungSi1 align-middle py-3 ">
										<c:out value="${fn:substring(list.jungSi1,0,10)}"/> <c:out value="${list.jungSi1STime }"/>
										~ <c:out value="${fn:substring(list.jungSi1,11,21)}"/> <c:out value="${list.jungSi1ETime }"/> 
									</td>
									<td class="jungSi2 align-middle py-3 ">
										<c:out value="${fn:substring(list.jungSi2,0,10)}"/> <c:out value="${list.jungSi2STime }"/>
										~ <c:out value="${fn:substring(list.jungSi2,11,21)}"/> <c:out value="${list.jungSi2ETime }"/> 
									</td>
									<td class="jungSi3 align-middle py-3 ">
										<c:out value="${fn:substring(list.jungSi3,0,10)}"/> ~ <c:out value="${fn:substring(list.jungSi3,11,21)}"/> 
									</td>
									<td class="jungSi1Inlive align-middle py-3 ">
										<c:out value="${list.jungSi1Inlive}"/> 
									</td>
									<td class="sortOrder align-middle py-3 ">
										<c:out value="${list.sortOrder}"/> 
									</td>
									<td class="againMonth align-middle py-3 ">
										<c:out value="${list.againMonth}"/> 
									</td>
									<td class="webYN align-middle py-3 ">
										<c:out value="${list.webYN}"/> 
									</td>
									<td class="itemRejectCnt align-middle py-3 ">
										<c:out value="${list.itemRejectCnt}"/> 
									</td>
									<td class="monthSelNo align-middle py-3 ">
										<c:out value="${list.monthSelNo}"/> 
									</td>
									<td class="jungSiLotteryFromDate align-middle py-3 ">
										<c:out value="${list.jungSiLotteryFromDate}"/> ~ <c:out value="${list.jungSiLotteryToDate}"/> 
									</td>
									<td class="jungSiLotteryDate align-middle py-3 ">
										<c:out value="${list.jungSiLotteryDate}"/> 
									</td>
									<td class="jungSiLotteryPayFromDate align-middle py-3 ">
										<c:out value="${list.jungSiLotteryPayFromDate}"/> ~ <c:out value="${list.jungSiLotteryPayToDate}"/> 
									</td>
									<td class="jungSiLotteryAddFromDate align-middle py-3 ">
										<c:out value="${list.jungSiLotteryAddFromDate}"/> ~ <c:out value="${list.jungSiLotteryAddToDate}"/> 
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
	</div>  
</div>





<script type="text/javascript">
function openModal() {
    
   var item = $("#item").val();
   if(item === '0') {
      $('#modal-content').load("insertItem01.do");
   } else if (item === '1') {
      $('#modal-content').load("insertItem02.do");
   } else {
      $('#modal-content').load("insertItem03.do");
   }
}


function openpop(groupID) {
	if('${authyn.upd}' == 'N'){
		return false;
	}
	var url = "updateItem01.do";
	if(typeof groupID !== "undefined"){
		var url = "updateItem01.do?groupID="+groupID;
	}
	 var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1000,height=600";
     window.open(url, "_blank", windowFeatures);
}
function openpop01(subGroupID) {
	if('${authyn.upd}' == 'N'){
		return false;
	}
	var url = "updateItem02.do";
	if(typeof subGroupID !== "undefined"){
		var url = "updateItem02.do?subGroupID="+subGroupID;
	}
	 var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=600,height=600";
     window.open(url, "_blank", windowFeatures);
}

function openpop02(levelID) {
	if('${authyn.upd}' == 'N'){
		return false;
	}
	var url = "updateItem03.do";
	if(typeof levelID !== "undefined"){
		var url = "updateItem03.do?levelID="+levelID;
	}
	 var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=600,height=600";
     window.open(url, "_blank", windowFeatures);
}

var checkbox = document.getElementById("isdeletecheck");
var hiddenInput = document.getElementById("IsDelete");

if (checkbox.checked) {
    hiddenInput.value = "Y";
} else {
    hiddenInput.value = "N";
}



$("#item,#isdeletecheck").change(function() {
    var checkbox = document.getElementById("isdeletecheck");
    var hiddenInput = document.getElementById("IsDelete");
    var item = $("#item").val();
    

    if (checkbox.checked) {
        hiddenInput.value = "Y";
    } else {
        hiddenInput.value = "N";
    }
    
    var thead =$(".itemcodelist");
    var tbody =$(".list");
    thead.empty();
    tbody.empty();
    
    $.ajax({
      type: "GET",
      url: "itemCodeList.do",
      dataType: 'json',
      data: {
         item:item,
         isDelete:hiddenInput.value
      },
      success: function(data) {
         if(item === '0') {
            var item01 = data.item01
            var head = '<tr>'
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >강습종목</th>';
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col">접수구분</th>';
               head += '<th colspan="5" class="sort align-middle pe-1 text-center" scope="col">접수기간</th>';
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >정렬순서</th>';
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >재등록<br>제한개월</th>';
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col">온라인<br>사용</th>';
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col">등록제한<br>건수</th>';
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col">다개월<br>불가</th>';
               head += '<th colspan="4" class="sort align-middle pe-1 text-center" scope="col">추첨접수기간</th>';
               head += '</tr>';
               head += '<tr>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">기간</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">신규</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">재등록</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">강습기간</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">구민접수</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">접수기간</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">추첨일</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">결제기간</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">선착순</th>';
               head += '</tr>';
               thead.append(head);
            item01.forEach(function(list) {
               var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" id="updateTR01" ' +
        			'onclick="openpop(' + list.groupID + ')" style="cursor:pointer; >';
               /* row += '<td class="groupName align-middle py-3 "><input type="checkbox"></td>'; */
               row += '<td class="groupName align-middle py-3 " id="GroupName" data-item-id=' + list.groupID + '>' + list.groupName + '</td>';
               var JSType = '';
               if(list.jsType == '0') {
                  JSType = '정시접수';
               } else if (list.jsType == '1') {
                  JSType = '수시접수';
               } else if (list.jsType == '2') {
                  JSType = '기간지정'
               }
               row += '<td class="JSType align-middle py-3 ">' + JSType + '</td>';
               var FromDate = list.fromDate
               var ToDate = list.toDate
               if(FromDate == null && ToDate == null) {
                  FromDate = '';
                  ToDate = '';
               }
               row += '<td class="inTime align-middle py-3 ">' + FromDate + ' ~ ' +  ToDate + '</td>';
               var JSi1 = list.jungSi1
               if(JSi1 === null) {
                  JSi1 = '';
               } else {
                  var js1FD = JSi1.substr(0,10)
                  var js1TD = JSi1.substr(11,21)
               }
               row += '<td class="inTime align-middle py-3 ">' + js1FD +' '+ list.jungSi1STime + ' ~ ' +  js1TD +' '+  list.jungSi1ETime+ '</td>';
               var JSi2 = list.jungSi2
               if (JSi2 === null  ) {
                  JSi2 = '';
               } else {
                  var js2FD = JSi2.substr(0,10)
                  var js2TD = JSi2.substr(11,21)
               }
               row += '<td class="inTime align-middle py-3 ">' + js2FD +' '+ list.jungSi2STime + ' ~ ' +  js2TD +' '+ list.jungSi2ETime+ '</td>';
               var JSi3 = list.jungSi3
               if(JSi3 === null) {
                  JSi3 = '';
               } else {
                  var js3FD = JSi3.substr(0,10)
                  var js3TD = JSi3.substr(11,21)
               }
               row += '<td class="inTime align-middle py-3 ">' + js3FD +' '+ list.jungSi2STime + ' ~ ' +  js3TD +' '+ list.jungSi2ETime+ '</td>';
               if(list.jungSi1Inlive === null) {
                  JungSi1Inlive = "";
               } else {
                  JungSi1Inlive = list.jungSi1Inlive;
               }
               row += '<td class="inTime align-middle py-3 ">' + JungSi1Inlive + '</td>';
               row += '<td class="inTime align-middle py-3 ">' + list.sortOrder + '</td>';
               row += '<td class="inTime align-middle py-3 ">' + list.againMonth + '</td>';
               if(list.webYN === null) {
                  WebYN = "";
               } else {
                  WebYN = list.webYN; 
               }
               row += '<td class="inTime align-middle py-3 ">' + WebYN + '</td>';
               if(list.itemRejectCnt === null) {
                  ItemRejectCnt = "";
               } else {
                  ItemRejectCnt = list.itemRejectCnt;
               }
               row += '<td class="inTime align-middle py-3 ">' + ItemRejectCnt + '</td>';
               if(list.monthSelNo === null) {
                  MonthSelNo = "";
               } else {
                  MonthSelNo = list.monthSelNo;
               }
               row += '<td class="inTime align-middle py-3 ">' + MonthSelNo + '</td>';
               var JungSiLotteryFromDate = list.jungSiLotteryFromDate;
               if(JungSiLotteryFromDate === null) {
                  JungSiLotteryFromDate = '';
               }
               var JungSiLotteryToDate = list.jungSiLotteryToDate;
               if(JungSiLotteryToDate == null) {
                  JungSiLotteryToDate = '';
               }
               var JungSiLotteryDate = list.jungSiLotteryDate;
               if(JungSiLotteryDate == null) {
                  JungSiLotteryDate = '';
               }
               var JungSiLotteryPayFromDate = list.jungSiLotteryPayFromDate;
               if(JungSiLotteryPayFromDate == null) {
                  JungSiLotteryPayFromDate = '';
               }
               var JungSiLotteryPayToDate = list.jungSiLotteryPayToDate;
               if(JungSiLotteryPayToDate == null ) {
                  JungSiLotteryPayToDate = '';
               }
               var JungSiLotteryAddFromDate = list.jungSiLotteryAddFromDate;
               if(JungSiLotteryAddFromDate == null) {
                  JungSiLotteryAddFromDate = '';
               }
               var JungSiLotteryAddToDate = list.jungSiLotteryAddToDate;
               if(JungSiLotteryAddToDate == null) {
                  JungSiLotteryAddToDate  = '';
               }
               
               row += '<td class="inTime align-middle py-3 ">' + JungSiLotteryFromDate + ' ~ ' + JungSiLotteryToDate + '</td>';
               row += '<td class="inTime align-middle py-3 ">' + JungSiLotteryDate + '</td>';
               row += '<td class="inTime align-middle py-3 ">' + JungSiLotteryPayFromDate + ' ~ ' + JungSiLotteryPayToDate + '</td>';
               row += '<td class="inTime align-middle py-3 ">' + JungSiLotteryAddFromDate + ' ~ ' + JungSiLotteryAddToDate + '</td>';
               row += '</tr>';
               tbody.append(row);
               
            }) 
         } else if(item === '1') {
            var item02= data.item02
            var head = '<tr>'
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >강습종목</th>';
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >강습반명</th>';
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >입장시간</th>';
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >입장종료시간</th>';
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >정렬순서</th>';
               head += '</tr>';
               thead.append(head);
               
            item02.forEach(function(list) {
               var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center"  '+
                  'onclick="openpop01(' + list.subGroupID + ')"  style="cursor:pointer;" id="updateTR02">';
               row += '<td class="groupName align-middle py-3 ">' + list.groupName + '</td>';
               row += '<td class="subGroupName align-middle py-3 " id="SubGroupName" data-item-id=' + list.subGroupID + '>' + list.subGroupName + '</td>';
               row += '<td class="inTime align-middle py-3 ">' + list.inTime + '</td>';
               row += '<td class="inEndTime align-middle py-3 ">' + list.inEndTime + '</td>';
               row += '<td class="sortOrder align-middle py-3 ">' + list.sortOrder + '</td>';
               row += '</tr>';
               tbody.append(row);
            })
         } else if (item === '2') {
            var item03= data.item03
            var head = '<tr>'
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >코드</th>';
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >단계</th>';
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >정렬순서</th>';
               head += '</tr>';
               thead.append(head);
            item03.forEach(function(list) {
               var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center"  '+
               'onclick="openpop02(' + list.levelID + ')"  style="cursor:pointer;" id="updateTR02">';
               row += '<td class="groupName align-middle py-3 ">' + list.defCode + '</td>';
               row += '<td class="subGroupName align-middle py-3 " id="LevelName" data-item-id=' + list.LevelID + '>' + list.levelName + '</td>';
               row += '<td class="sortOrder align-middle py-3 ">' + list.sortOrder + '</td>';
               row += '</tr>';
               tbody.append(row);
            })
         }
      },
      error: function(xhr, status, error) {
         console.log("Status: " + status);
            console.log("Error: " + error);
      }
    });
    
});


</script>




<div class="modal fade" id="insertModal" tabindex="-1"
   data-bs-backdrop="static" aria-labelledby="insertModalLabel"
   aria-hidden="true">
   <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content" id="01">
         <jsp:include page="item01insert.jsp" />
      </div>
      <div class="modal-content" style="display: none;" id="02">
         <jsp:include page="item02insert.jsp" />
      </div>
      <div class="modal-content" style="display: none;" id="03">
         <jsp:include page="item03insert.jsp" />
      </div>
   </div>
</div>

<script>

	/* 종목 반명 단계 등록 */
    // select 요소 가져오기
    var selectElement= 0;
    var selectedValue = 0;

    selectElement = document.getElementById("item");
    var div01 = document.getElementById("01");
    if (selectedValue === "0") {
         div01.style.display = "block";
     }
    var div02 = document.getElementById("02");
    var div03 = document.getElementById("03");


    // select 요소의 값이 변경될 때 실행할 함수 정의
    selectElement.addEventListener("change", function () {
        // 선택된 옵션의 값을 가져와서 alert 창에 표시
        selectedValue = selectElement.value;
        div01.style.display = "none";
        div02.style.display = "none";
        div03.style.display = "none";

        if (selectedValue === "0") {
            div01.style.display = "block";
        } else if (selectedValue === "1") {
            div02.style.display = "block";
        } else if (selectedValue === "2") {
            div03.style.display = "block";
        } 
    });
</script>



