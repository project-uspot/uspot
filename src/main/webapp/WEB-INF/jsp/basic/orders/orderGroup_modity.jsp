<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file ="../../include/AdminTop.jsp"%>
<%@ include file ="../../include/AdminLeft.jsp"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/lib/js/exeDaumPostCode.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
function onlyNumber(obj) {
    $(obj).keyup(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
    }); 
}
function valueChk() {
	var frm = document.frm; 
	
	if(!frm.GroupName.value) {
		alert("분류명을 입력해주세요.");
		frm.GroupName.focus();
		return false
	}
	if(!frm.GroupJungWon.value) {
		alert("정원을 입력해주세요.");
		frm.GroupJungWon.focus();
		return false
	}
	if(!frm.SortOrder.value) {
		alert("정렬순서를 입력해주세요.");
		frm.SortOrder.focus();
		return false
	}
	
	if(confirm("수정하시겠습니까?")) {
		frm.submit();
		alert("수정완료");
	} else {
		return false;
	}
}

function fn_egov_delete_article(form) {
	if (confirm("삭제하시겠습니까?")) {
		// Delete하기 위한 키값을 셋팅
		form.submit();
	} else {
		return false;
	}
}

</script>

<h2 class="mb-4">기타매출그룹 관리</h2>
<div class="row">
	<div class="col-xl-9">
		<form method="post" id="frm"  name="frm" action="${pageContext.request.contextPath}/OrderGroupUpdOK.do" class="row g-3 mb-6">
			<input type="hidden" name="SiteCode" value="${group.siteCode }">
			<input type="hidden" name="pkid" value="${group.pkid }">
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="GroupName" name="GroupName" type="text" placeholder="분류명" value="${group.groupName }" />
					<label for="GroupName">분류명</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="GroupJungWon" name="GroupJungWon" type="text" placeholder="정원" value="${group.groupJungWon }" onkeydown="onlyNumber(this)" />
					<label for="GroupJungWon">정원</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="SortOrder" name="SortOrder" type="text" placeholder="정렬순서" value="${group.sortOrder }" onkeydown="onlyNumber(this)" />
					<label for="SortOrder">정렬순서</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<select class="form-select" id="ParkingTimeWeek" name="ParkingTimeWeek">
						<option value="0" <c:if test="${group.parkingTimeWeek eq '0' }">selected</c:if>>해당없음</option>
						<option value="60" <c:if test="${group.parkingTimeWeek eq '60' }">selected</c:if>>1시간</option>
						<option value="120" <c:if test="${group.parkingTimeWeek eq '120' }">selected</c:if>>2시간</option>
						<option value="180" <c:if test="${group.parkingTimeWeek eq '180' }">selected</c:if>>3시간</option>
						<option value="240" <c:if test="${group.parkingTimeWeek eq '240' }">selected</c:if>>4시간</option>
						<option value="300" <c:if test="${group.parkingTimeWeek eq '300' }">selected</c:if>>5시간</option>
						<option value="360" <c:if test="${group.parkingTimeWeek eq '360' }">selected</c:if>>6시간</option>
						<option value="420" <c:if test="${group.parkingTimeWeek eq '420' }">selected</c:if>>7시간</option>
					</select>
					<label for="ParkingTimeWeek">평일주차시간</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<select class="form-select" id="ParkingTimeWeekend" name="ParkingTimeWeekend">
						<option value="0" <c:if test="${group.parkingTimeWeek eq '0' }">selected</c:if>>해당없음</option>
						<option value="60" <c:if test="${group.parkingTimeWeek eq '60' }">selected</c:if>>1시간</option>
						<option value="120" <c:if test="${group.parkingTimeWeek eq '120' }">selected</c:if>>2시간</option>
						<option value="180" <c:if test="${group.parkingTimeWeek eq '180' }">selected</c:if>>3시간</option>
						<option value="240" <c:if test="${group.parkingTimeWeek eq '240' }">selected</c:if>>4시간</option>
						<option value="300" <c:if test="${group.parkingTimeWeek eq '300' }">selected</c:if>>5시간</option>
						<option value="360" <c:if test="${group.parkingTimeWeek eq '360' }">selected</c:if>>6시간</option>
						<option value="420" <c:if test="${group.parkingTimeWeek eq '420' }">selected</c:if>>7시간</option>
					</select>
					<label for="ParkingTimeWeekend">주말주차시간</label>
				</div>
			</div>
		</form>
		<div class="col-12 gy-6">
			<div class="row g-3 justify-content-end">
				<div class="col-auto">
					<input type="button" class="btn btn-warning px-5" value="수정(F2)" id="modify" onclick="valueChk();"/>
				</div>
				<div class="col-auto">
					<a class="btn btn-phoenix-primary px-5"  href="${pageContext.request.contextPath}/SLOrderGroup.do" id="back" title="목록(F3)">목록(F3)</a><!-- 목록 -->
				</div>
				<div class="col-auto">
					<form action="${pageContext.request.contextPath}/deleteSlGp.do" id="delfrm" name="formDelete" method="post">
						<input type="submit" class="btn btn-danger px-5" value="삭제(F4)" id="delete" onclick="fn_egov_delete_article(this.form);"> <!-- 삭제 -->
						<input type="hidden" name="SiteCode" value="${group.siteCode }">
						<input type="hidden" name="pkid" value="${group.pkid }">
					</form>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script>
	if('${authyn.upd}' == 'N'){
		$('#modify').attr('disabled','disabled');
	}
	if('${authyn.del}' == 'N'){
		$('#delete').attr('disabled','disabled');
	}
	// 키보드 이벤트 감지
	document.addEventListener('keydown', function(event) {
		if (event.key === 'F2') { // F2 키를 눌렀을 때
			if('${authyn.upd}' == 'N'){
				return false;
			}
			event.preventDefault(); // 기본 동작 방지
			valueChk()
		}
		if (event.key === 'F3') { // F2 키를 눌렀을 때
			event.preventDefault(); // 기본 동작 방지
			window.location.href = document.getElementById('back').getAttribute('href'); // 링크 주소로 이동
		}
		if (event.key === 'F4') { // F2 키를 눌렀을 때
			if('${authyn.del}' == 'N'){
				return false;
			}
			event.preventDefault(); // 기본 동작 방지
			document.getElementById('delete').click();
		}
	});
</script>
