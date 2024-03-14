<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div class="p-0">
	<div class="mb-9 col-lg-6">
		<div class="row g-2 mb-4">
		    <div class="col-auto">
		      <h2 class="mb-0">사물함코드 관리 </h2>
		    </div>
		</div>
		<div class="mb-1">
			<div class="row g-6">
				<div class="col-sm-6 col-md-3 mb-2">
					<div class="form-floating">
						<select class="form-select" id="PLockergroupid" name="PLockergroupid">
							<option value="0">전체</option>
							<c:forEach items="${grouplist}" var="grouplist">
								<option value="${grouplist.PLockerGroupID}">
									${grouplist.PLockerGroupName} / ${grouplist.PLockerLocation}
								</option>
        					</c:forEach>
						</select>
						<label for="PLockergroupid">분류</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 mb-2">
					<div class="form-floating">
						<select class="form-select" id="state" name="state">
							<option value="0">전체</option>
							<option value="1">빈락커</option>
							<option value="2">사용중</option>
							<option value="3">고장</option>
							<option value="4">사용가능</option>
							<option value="5">사용불가</option>
						</select>
						<label for="state">상태</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 mb-2">
					<div class="form-check" style="padding-top: 15px;">
						<input class="form-check-input" id="isdeletecheck" type="checkbox" name="isdeletecheck"/>
						<label class="form-check-label text-900 fs-0" for="fragileCheck">삭제데이터보기</label>
						<input type="hidden" name="isdelete" id="isdelete">
					</div>
				</div>
				&emsp;&emsp;&emsp;
				<div class="col-auto" style="padding-top: 5px;">
					<button type="button" class="btn btn-info px-5"id="insertButton" onclick="openpop()">등록</button>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		if('${authyn.ins}' == 'N'){
			$('#insertButton').attr('disabled','disabled');
		}
		</script>
		<div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1 ">
			<div class="table-responsive scrollbar-overlay mx-n1 px-1">
				<table class="table table-sm table-hover fs--1 mb-1">
					<colgroup>
						<col style="width:100px">
						<col style="width:80px">
						<col style="width:60px">
						<col style="width:110px">
						<col style="width:90px">
						<col style="width:100px">
					</colgroup>
					<thead>
						<tr>
							<th class="sort align-middle pe-1 text-center" scope="col" >분류/위치</th>
							<th class="sort align-middle pe-1 text-center" scope="col" >번호</th>
							<th class="sort align-middle pe-1 text-center" scope="col">상태</th>
							<th class="sort align-middle pe-1 text-center" scope="col">비고</th>
							<th class="sort align-middle pe-1 text-center" scope="col" >회원번호</th>
							<th class="sort align-middle pe-1 text-center" scope="col" >회원성명</th>
							<th class="sort align-middle pe-1 text-center" scope="col">사용개월</th>
						</tr>
					</thead>
					<tbody class="list">
						<c:forEach items="${list}" var="list">
							<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" onclick="paidbodyclick(this)"
							 ondblclick="openpop(${list.PLockerID})" style="cursor:pointer;">
								<td class="pkid align-middle py-3 ">
									<c:out value="${list.PLockerGroupName} / ${list.PLockerLocation}"/>
								</td>
								<td class="sortOrder align-middle white-space-nowrap ">
									<c:out value="${list.PLockerNO}"/>
								</td>
								<td class="groupJungWon align-middle white-space-nowrap ">
									<c:choose>
										<c:when test="${list.state == 1}">빈락커</c:when>
										<c:when test="${list.state == 2}">사용중</c:when>
										<c:when test="${list.state == 3}">고장</c:when>
										<c:when test="${list.state == 4}">사용가능</c:when>
										<c:when test="${list.state == 5}">사용불가</c:when>
									</c:choose>
								</td>
								<td class="parkingTimeWeek align-middle white-space-nowrap ">
									<c:choose>
										<c:when test="${list.repairID == 803}">키뭉치 파손</c:when>
										<c:when test="${list.repairID == 804}">키분실</c:when>
									</c:choose>
								</td>
								<td class="parkingTimeWeekend align-middle white-space-nowrap ">
									<c:out value="${list.memberID}"/>
								</td>
								<td class="parkingTimeWeekend align-middle white-space-nowrap ">
									<c:out value="${list.name}"/>
								</td>
								<td class="parkingTimeWeekend align-middle white-space-nowrap ">
									<c:if test="${list.regMonth>0}">
									<c:out value="${list.regMonth} 개월"/>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var checkbox = document.getElementById("isdeletecheck");
var hiddenInput = document.getElementById("isdelete");

if (checkbox.checked) {
    hiddenInput.value = "Y";
} else {
    hiddenInput.value = "N";
}

var previousRow = null;
function paidbodyclick(clickedRow){
	if (previousRow !== null) {
    	$(previousRow).css('background-color', '');
    }
	$(clickedRow).css('background-color', 'lightblue');
    previousRow = clickedRow;
}

	function openpop(PLockerID) {
		var url = "lockercodeinsert.do";
		if(typeof PLockerID !== "undefined"){
			
			if('${authyn.upd}' == 'N'){
				return false;
			}
			var url = "lockercodeupdate.do?PLockerID="+PLockerID;
		}
    	var popupWidth = 500;
    	var popupHeight = 600;
    	var popupX = (window.screen.width / 2) - (popupWidth / 2);
    	var popupY= (window.screen.height / 2) - (popupHeight / 2);
    	window.open(url, "_blank_","toolbar=no, menubar=no, scrollbars=yes, resizable=no, height=" + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	}
	 $("#PLockergroupid,#state,#isdeletecheck").change(function() {
		 
		 var checkbox = document.getElementById("isdeletecheck");
		 var hiddenInput = document.getElementById("isdelete");

		 if (checkbox.checked) {
		     hiddenInput.value = "Y";
		 } else {
		     hiddenInput.value = "N";
		 }
		 var tableBody = $(".list");
         tableBody.empty(); // 기존 내용을 지웁니다
         var PLockergroupid = $('#PLockergroupid').val();
         var state = $('#state').val();
         
         //ajax 시작 데이터 불러와서 테이블 채우기
         $.ajax({
             type: "GET", // 또는 "POST", 서버 설정에 따라 다름
             url: "lockercodelistfind.do", // 실제 엔드포인트로 교체해야 합니다
             dataType : 'json',
             data: { 
            	 PLockerGroupID: PLockergroupid,
            	 State : state,
            	 IsDelete : hiddenInput.value
             },
             success: function(data) {	
            	 var commentList = data.commentList;
            	 console.log(commentList);
            	 commentList.forEach(function(list) {
                     // 데이터를 기반으로 HTML 로우를 만듭니다.
                     var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" onclick="paidbodyclick(this)" ' +
                         'ondblclick="openpop(' + list.plockerID + ')" style="cursor:pointer;">';
                     row += '<td class="pkid align-middle py-3 ">' + list.plockerGroupName + ' / ' + list.plockerLocation + '</td>';
                     row += '<td class="sortOrder align-middle white-space-nowrap ">' + list.plockerNO + '</td>';
                     var stateText = '';
                     if (list.state == 1) {
                         stateText = '빈락커';
                     } else if (list.state == 2) {
                         stateText = '사용중';
                     } else if (list.state == 3) {
                         stateText = '고장';
                     } else if (list.state == 4) {
                         stateText = '사용가능';
                     } else if (list.state == 5) {
                         stateText = '사용불가';
                     }
                     row += '<td class="groupJungWon align-middle white-space-nowrap ">' + stateText + '</td>';
                     var repairIDText = '';
                     if (list.repairID == 0) {
                    	 repairIDText = '';
                     } else if (list.repairID == 803) {
                    	 repairIDText = '키뭉치 파손';
                     } else if (list.repairID == 804) {
                    	 repairIDText = '키분실';
                     }
                     row += '<td class="parkingTimeWeek align-middle white-space-nowrap ">' + repairIDText + '</td>';
                     if (list.memberID !== null) {
                     	row += '<td class="parkingTimeWeekend align-middle white-space-nowrap ">' + list.memberID + '</td>';
                     } else{
                    	row += '<td class="parkingTimeWeekend align-middle white-space-nowrap "></td>';
                     }
                     if (list.name !== null) {
                     	row += '<td class="parkingTimeWeekend align-middle white-space-nowrap ">' + list.name + '</td>';
                     } else{
                    	row += '<td class="parkingTimeWeekend align-middle white-space-nowrap "></td>';
                     }
                     if (list.regMonth > 0) {
                         row += '<td class="parkingTimeWeekend align-middle white-space-nowrap ">' + list.regMonth + ' 개월</td>';
                     } else{
                    	row += '<td class="parkingTimeWeekend align-middle white-space-nowrap "></td>';
                     }
                     row += '</tr>';
                     tableBody.append(row);
                 });
             },
             error: function(xhr, status, error) {
                 console.log("Status: " + status);
                 console.log("Error: " + error);
             }
         });
	 });
</script>