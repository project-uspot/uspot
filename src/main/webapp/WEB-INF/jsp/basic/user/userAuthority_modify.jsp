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
	if(confirm("수정하시겠습니까?")) {
		frm.submit();
		alert("수정완료");
	} else {
		return false;
	}
		
	
	
}

</script>
<h2 class="mb-4">사용자별 권한그룹 지정</h2>
<div class="row">
	<div class="col-xl-9">
		<form method="post" id="frm"  name="frm" action="${pageContext.request.contextPath}/userAuthUpdOK.do" class="row g-3 mb-4">
			<input type="hidden" name="SiteCode" value="${user.siteCode }">
			<input type="hidden" name=SawonNo value="${user.sawonNo }">
			<div class="col-md-7 gy-6">
				<div class="input-group mb-3">
					<div class="input-group-text ">
						<label class="mb-0 ms-2 form-check-label" for="Nvat">권한그룹</label>
					</div>
					<div class="form-floating">
					<select class="form-select" id="UserGroupID" name="UserGroupID">
						<c:forEach items="${list}" var="list">
							<option value="${list.userGroupID }" <c:if test ="${user.userGroupName eq list.userGroupName}">selected="selected"</c:if>>${list.userGroupName }</option>
						</c:forEach>
					</select>
					<label for="UserGroupID">권한그룹</label>
				</div>
				</div>
			</div>
		</form>
	</div>
	<div class="col-5 gy-6">
		<div class="row g-3 justify-content-end">
			<div class="col-auto">
				<a class="btn btn-phoenix-primary px-5" href="${pageContext.request.contextPath}/userAuthorityGroup.do" title="목록">목록</a><!-- 목록 -->
			</div>
			<div class="col-auto">
				<input type="button" class="btn btn-info px-5" value="수정" id="modify" onclick="valueChk();"/>
			</div>
		</div>
	</div>
</div>

