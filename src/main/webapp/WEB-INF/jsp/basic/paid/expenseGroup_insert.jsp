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
window.onload = function() {
	document.getElementById("ExpenseGroupName").focus();
};
	
function onlyNumber(obj) {
    $(obj).keyup(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
    }); 
}

function valueChk() {
	var frm = document.frm; 
	
	if(!frm.ExpenseGroupName.value) {
		alert("분류항목을 입력해주세요.");
		frm.ExpenseGroupName.focus();
		return false
	}
	if(!frm.SortOrder.value) {
		alert("정렬순서를 입력해주세요.");
		frm.SortOrder.focus();
		return false
	}
	
	if(confirm("등록하시겠습니까?")) {
		frm.submit();
		alert("등록완료");
	} else {
		return false;
	}
}

</script>
<h2 class="mb-4">기타매출그룹 관리</h2>
<div class="row">
	<div class="col-xl-9">
		<form method="post" id="frm"  name="frm" action="${pageContext.request.contextPath}/ExpenseGpInsertOK.do" class="row g-3 mb-6">
			<input type="hidden" name="SiteCode" value="${list.siteCode }">
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="ExpenseGroupName" name="ExpenseGroupName" type="text" placeholder="분류항목" />
					<label for="ExpenseGroupName">분류항목</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="SortOrder" name="SortOrder" type="text" value="${SortOrder }" placeholder="정렬순서" onkeydown="onlyNumber(this)" />
					<label for="SortOrder">정렬순서</label>
				</div>
			</div>
		</form>
		<div class="col-12 gy-6">
			<div class="row g-3 justify-content-end">
				<div class="col-auto">
					<a class="btn btn-phoenix-primary px-5" href="${pageContext.request.contextPath}/ExpenseGroup.do" id="back" title="취소(F3)">취소(F3)</a><!-- 목록 -->
				</div>
				<div class="col-auto">
					<input type="button" class="btn btn-info px-5" value="등록(F2)" id="insert" onclick="valueChk();"/>
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
			valueChk();
		}
		if (event.key === 'F3') { // F2 키를 눌렀을 때
			event.preventDefault(); // 기본 동작 방지
			window.location.href = document.getElementById('back').getAttribute('href'); // 링크 주소로 이동
		}
	});
</script>
