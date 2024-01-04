<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file ="../../include/AdminTop.jsp"%>
<%@ include file ="../../include/AdminLeft.jsp"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/lib/js/exeDaumPostCode.js"></script>
<script type="text/javascript">
function valueChk() {
	var frm = document.frm; 
	
	if(!frm.ItemName.value) {
		alert("메뉴명을 입력해주세요.");
		frm.ItemName.focus();
		return false
	}
	if(!frm.FromTime.value) {
		alert("시작시간을 입력해주세요.");
		frm.FromTime.focus();
		return false
	}
	if(!frm.ToTime.value) {
		alert("종료시간을 입력해주세요.");
		frm.ToTime.focus();
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
		alert("삭제되었습니다.");
	} else {
		return false;
	}
}

</script>

<h2 class="mb-4">기타매출그룹 관리</h2>
<div class="row">
	<div class="col-xl-9">
		<form method="post" id="frm"  name="frm" action="${pageContext.request.contextPath}/OrderItemUpdOK.do" class="row g-3 mb-6">
			<input type="hidden" name="SiteCode" value="${item.siteCode }">
			<input type="hidden" name="pkid" value="${item.pkid }">
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<select class="form-select" id="GroupCode" name="GroupCode">
						<c:forEach items="${list}" var="list">
							<option value="${list.pkid }" <c:if test ="${item.groupName eq list.groupName}">selected="selected"</c:if>>${list.groupName }</option>
						</c:forEach>
					</select>
					<label for="GroupCode">메뉴분류명</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="ItemName" name="ItemName" type="text" placeholder="메뉴명" value="${item.itemName }" />
					<label for="ItemName">메뉴명</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="ShortName" name="ShortName" type="text" placeholder="메뉴명(약칭)" value="${item.shortName }"  />
					<label for="ShortName">메뉴명(약칭)</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="FromTime" name="FromTime" type="time" placeholder="시작시간" value="${item.fromTime }" />
					<label for="FromTime">시작시간</label>
					
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="ToTime" name="ToTime" type="time" placeholder="종료시간" value="${item.toTime }" />
					<label for="FromTime">종료시간</label>
				</div>
			</div>
			<div class="col-sm-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="SortOrder" name="SortOrder" type="text" placeholder="정렬순서" value="${item.sortOrder }" />
					<label for="SortOrder">정렬순서</label>
				</div>
			</div>
			<div class="col-sm-6 gy-6">
				<div class="form-floating">
					<select class="form-select" id="UpJang" name="UpJang">
						<option value="0" <c:if test="${item.upJang eq '0' }">selected</c:if>>없음</option>
						<option value="1" <c:if test="${item.upJang eq '1' }">selected</c:if>>수영장</option>
						<option value="2" <c:if test="${item.upJang eq '2' }">selected</c:if>>헬스장</option>
						<option value="3" <c:if test="${item.upJang eq '3' }">selected</c:if>>요가/필라테스</option>
						<option value="4" <c:if test="${item.upJang eq '4' }">selected</c:if>>강의실</option>
					</select>
					<label for="UpJang">출입업장 </label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="input-group mb-3">
					<div class="input-group-text ">
						<input class="form-check-input " type="checkbox" id="Nvat" name="Nvat" value="Y" <c:if test="${item.nvat eq 'Y' }">checked</c:if>  aria-label="Checkbox for following text input" />
						<label class="mb-0 ms-2 form-check-label" for="Nvat">부가세포함</label>
					</div>
					<div class="form-floating">
						<input class="form-control" type="text" aria-label="Text input with checkbox" id="Price" name="Price" placeholder="이용금액"  value="${item.price }"/>
						<label for="Price">이용금액</label>
					</div>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="input-group mb-3">
					<div class="input-group-text ">
						<input class="form-check-input " type="checkbox" id="KioskYN" name="KioskYN" value="Y" <c:if test="${item.kioskYN eq 'Y' }">checked</c:if> aria-label="Checkbox for following text input" />
						<label class="mb-0 ms-2 form-check-label" for="KioskYN">무인발권기사용여부</label>
					</div>
					<div class="form-floating">
						<input class="form-control" type="text" aria-label="Text input with checkbox" id="Jungwon" name="Jungwon" placeholder="정원" value="${item.jungwon }"/>
						<label for="Jungwon">정원</label>
					</div>
				</div>
			</div>
			<div class="col-sm-4 gy-4">
				<div class="form-floating">
					<select class="form-select" id="AdultGBN" name="AdultGBN">
						<option value="0" <c:if test="${item.adultGBN eq '0' }">selected</c:if>>어른</option>
						<option value="1" <c:if test="${item.adultGBN eq '1' }">selected</c:if>>청소년</option>
						<option value="2" <c:if test="${item.adultGBN eq '2' }">selected</c:if>>어린이</option>
						<option value="3" <c:if test="${item.adultGBN eq '3' }">selected</c:if>>경로</option>
					</select>
					<label for="AdultGBN">이용구분 </label>
				</div>
			</div>
			<div class="col-sm-4 gy-4">
				<div class="form-floating">
					<select class="form-select" id="Gender" name="Gender">
						<option value="1" <c:if test="${item.gender eq '1' }">selected</c:if>>남자</option>
						<option value="0" <c:if test="${item.gender eq '0' }">selected</c:if>>여자</option>
					</select>
					<label for="Gender">성별 </label>
				</div>
			</div>
			<div class="col-sm-4 gy-4">
				<div class="form-floating">
					<select class="form-select" id="dcType" name="dcType">
						<option value="-1" <c:if test="${item.dcType eq '-1' }">selected</c:if>></option>
						<option value="0" <c:if test="${item.dcType eq '0' }">selected</c:if>>단체</option>
						<option value="1" <c:if test="${item.dcType eq '1' }">selected</c:if>>감면</option>
						<option value="2" <c:if test="${item.dcType eq '2' }">selected</c:if>>CA</option>
					</select>
					<label for="dcType">할인</label>
				</div>
			</div>
			<fieldset>
				<label class="col-form-label col-sm-2 pt-0">가용요일</label>
				<div class="pb-3 mb-3">
					<div class="form-floating">
						<div class="form-check form-check-inline">
							<input class="form-check-input" id="Sun" name="Sun" type="checkbox" <c:if test="${item.sun eq '1' }">checked</c:if> value="1" />
							<label class="form-check-label" for="Sun">일</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" id="Mon" name="Mon" type="checkbox" <c:if test="${item.mon eq '1' }">checked</c:if> value="1" />
							<label class="form-check-label" for="Mon">월</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" id="Tue" name="Tue" type="checkbox" <c:if test="${item.tue eq '1' }">checked</c:if> value="1" />
							<label class="form-check-label" for="Tue">화</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" id="Wed" name="Wed" type="checkbox" <c:if test="${item.wed eq '1' }">checked</c:if> value="1" />
							<label class="form-check-label" for="Wed">수</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" id="Thu" name="Thu" type="checkbox" <c:if test="${item.thu eq '1' }">checked</c:if> value="1" />
							<label class="form-check-label" for="Thu">목</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" id="Fri" name="Fri" type="checkbox" <c:if test="${item.fri eq '1' }">checked</c:if> value="1" />
							<label class="form-check-label" for="Fri">금</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" id="Sat" name="Sat" type="checkbox" <c:if test="${item.sat eq '1' }">checked</c:if> value="1" />
							<label class="form-check-label" for="Sat">토</label>
						</div>
					</div>
				</div>
			</fieldset>
		</form>
		<div class="col-12 gy-6">
			<div class="row g-3 justify-content-end">
				<div class="col-auto">
					<input type="button" class="btn btn-warning px-5" value="수정(F2)" id="modify" onclick="valueChk();"/>
				</div>
				<div class="col-auto">
					<a class="btn btn-phoenix-primary px-5" href="${pageContext.request.contextPath}/SLOrderItem.do" id="back" title="목록(F3)">목록(F3)</a><!-- 목록 -->
				</div>
				<div class="col-auto">
					<form action="${pageContext.request.contextPath}/deleteDsItem.do" name="formDelete" method="post">
						<input type="submit" class="btn btn-danger px-5" style="float: right; margin: 0 0 0 3px;" value="삭제(F4)" id="delete" onclick="fn_egov_delete_article(this.form);"> <!-- 삭제 -->
						<input type="hidden" name="SiteCode" value="${item.siteCode }">
						<input type="hidden" name="pkid" value="${item.pkid }">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	// 키보드 이벤트 감지
	document.addEventListener('keydown', function(event) {
		if (event.key === 'F2') { // F2 키를 눌렀을 때
			event.preventDefault(); // 기본 동작 방지
			valueChk()
		}
		if (event.key === 'F3') { // F2 키를 눌렀을 때
			event.preventDefault(); // 기본 동작 방지
			window.location.href = document.getElementById('back').getAttribute('href'); // 링크 주소로 이동
		}
		if (event.key === 'F4') { // F2 키를 눌렀을 때
			event.preventDefault(); // 기본 동작 방지
			document.getElementById('delete').click();
		}
	});
</script>


