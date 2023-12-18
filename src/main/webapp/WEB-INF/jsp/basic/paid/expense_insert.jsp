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
	
	if(!frm.ExpenseName.value) {
		alert("항목를 입력해주세요.");
		frm.ExpenseName.focus();
		return false
	}
	if(!frm.SortOrder.value) {
		alert("정렬순서를 입력해주세요.");
		frm.SortOrder.focus();
		return false
	}
	if(!frm.DefPrice.value) {
		alert("기초금액을 입력해주세요.");
		frm.DefPrice.focus();
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
<h2 class="mb-4">기타매출항목 관리</h2>
<div class="row">
	<div class="col-xl-9">
		<form method="post" id="frm"  name="frm" action="${pageContext.request.contextPath}/ExpenseInsertOK.do" class="row g-3 mb-5">
			<input type="hidden" name="SiteCode" value="${expense.siteCode }">
			<input type="hidden" name="ExpenseID" value="${expense.expenseID }">
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<select class="form-select" id="ExpenseGroupID" name="ExpenseGroupID">
						<c:forEach items="${list}" var="list">
							<option value="${list.expenseGroupID }">${list.expenseGroupName }</option>
						</c:forEach>
					</select>
					<label for="ExpenseGroupID">분류</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="ExpenseName" name="ExpenseName" type="text" placeholder="항목" />
					<label for="ExpenseName">항목</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="SortOrder" name="SortOrder" type="text" placeholder="정렬순서" onkeydown="onlyNumber(this)" />
					<label for="SortOrder">정렬순서</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<select class="form-select" id="ExpenseType" name="ExpenseType">
						<option value="I" <c:if test="${expense.expenseType eq 'I' }">selected</c:if>>수입</option>
						<option value="O" <c:if test="${expense.expenseType eq 'O' }">selected</c:if>>지출</option>
					</select>
					<label for="ExpenseType">수/지 구분</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="input-group mb-3">
					<div class="input-group-text ">
						<input class="form-check-input " type="checkbox" id="Nvat" name="Nvat" value="Y" aria-label="Checkbox for following text input" />
						<label class="mb-0 ms-2 form-check-label" for="Nvat">부가세포함</label>
					</div>
					<div class="form-floating">
						<input class="form-control" type="text" aria-label="Text input with checkbox" id="DefPrice" name="DefPrice" />
						<label for="DefPrice">기초금액</label>
					</div>
				</div>
			</div>
		</form>
		<div class="col-12 gy-6">
			<div class="row g-3 justify-content-end">
				<div class="col-auto">
					<a class="btn btn-phoenix-primary px-5" href="${pageContext.request.contextPath}/Expense.do" title="취소">취소</a><!-- 목록 -->
				</div>
				<div class="col-auto">
					<input type="button" class="btn btn-info px-5"  value="등록" id="modify" onclick="valueChk();"/>
				</div>
			</div>
		</div>
	</div>
</div>

