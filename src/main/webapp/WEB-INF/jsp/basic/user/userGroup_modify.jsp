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

function checkDisable(form) {
    if( form.UseDBAccess.checked == true ){
   		form.dbid.disabled = false;
   		form.dbPassword.disabled = false;
	} else {
		form.dbid.disabled = true;
		form.dbPassword.disabled = true;
	}
}

function onlyNumber(obj) {
    $(obj).keyup(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
    }); 
}
function valueChk() {
	var frm = document.frm; 
	
	if(!frm.UserGroupName.value) {
		alert("사용자그룹을 입력해주세요.");
		frm.UserGroupName.focus();
		return false
	}if(!frm.SortOrder.value) {
		alert("정렬순서을 입력해주세요.");
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
	}
}


</script>
<h2 class="mb-4">사용자 그룹관리</h2>
<div class="row">
	<div class="col-xl-9">
		<form method="post" id="frm"  name="frm" action="${pageContext.request.contextPath}/UserGroupUpdOK.do" class="row g-3 mb-6">
			<input type="hidden" name="SiteCode" value="${list.siteCode }">
			<input type="hidden" name="UserGroupID" value="${list.userGroupID }">
			<div class="col-md-6 gy-6">
				<div class="form-floating ">
					<input class="form-control" id="UserGroupName" name="UserGroupName" type="text" value="${list.userGroupName }" />
					<label for="UserGroupName">사용자그룹</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating ">
					<input class="form-control" id="SortOrder" name="SortOrder" type="text" value="${list.sortOrder }" onkeydown="onlyNumber(this)" />
					<label for="SortOrder">정렬순서</label>
				</div>
			</div>
			<div class="pb-3 mb-3 w-80">
				<div class="form-check mb-2 mt-3">
					<input class="UseDBAccess form-check-input" id="UseDBAccess" type="checkbox" name="UseDBAccess" value="Y" onClick="checkDisable(this.form)" <c:if test="${list.useDBAccess eq 'Y' }">checked</c:if>/>
					<label class="form-check-label fw-normal" for="UseDBAccess">사용자 권한그룹별로 DB계정 사용함.</label>
				</div>
				<div class="input-group">
					<div class="form-floating">
						<input class="form-control" id="dbid" name="dbid" type="text" placeholder="아이디" value="${list.dbid }" <c:if test="${list.useDBAccess ne 'Y' }">disabled</c:if>/>
						<label for="dbid">아이디</label>
					</div>
					<div class="form-floating">
						<input class="form-control" id="dbPassword" name="dbPassword" type="password" placeholder="비빌번호" value="${list.dbPassword }"  <c:if test="${list.useDBAccess ne 'Y' }">disabled</c:if>/>
						<label for="dbPassword">비빌번호</label>
					</div>
				</div>
			</div>
		</form>
		<div class="col-12 gy-6">
			<div class="row g-3 justify-content-end">
				<div class="col-auto">
					<input type="button" class="btn btn-warning px-5"  value="수정(F2)" id="modify" onclick="valueChk();"/>
				</div>
				<div class="col-auto">
					<a class="btn btn-phoenix-primary px-5" href="${pageContext.request.contextPath}/UserGroup.do" id="back" title="목록(F3)">목록(F3)</a><!-- 목록 -->
				</div>
				<div class="col-auto">
					<form action="${pageContext.request.contextPath}/deleteUserGroup.do" name="formDelete" method="post">
						<input type="submit" class="btn btn-danger px-5" value="삭제(F4)" id="delete" onclick="fn_egov_delete_article(this.form); return false;"> <!-- 삭제 -->
						<input type="hidden" name="SiteCode" value="${list.siteCode }">
						<input type="hidden" name="UserGroupID" value="${list.userGroupID }">
					</form>
				</div>
				<script type="text/javascript">
				if('${authyn.upd}' == 'N'){
					$('#modify').attr('disabled','disabled');
				}
				if('${authyn.del}' == 'N'){
					$('#delete').attr('disabled','disabled');
				}
				</script>
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
