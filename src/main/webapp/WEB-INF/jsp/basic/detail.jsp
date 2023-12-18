<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file ="../include/AdminTop.jsp"%>
<%@ include file ="../include/AdminLeft.jsp"%>

<%-- <c:import url="/AdminTop.do">
	<c:param name="SiteCode" value="10001"></c:param>
</c:import>
<c:import url="/AdminLeft.do"></c:import> --%>

<script type="text/javascript">
function fn_egov_delete_article(form) {
	if (confirm("삭제하시겠습니까?")) {
		// Delete하기 위한 키값을 셋팅
		form.submit();
	}
}
</script>
<div class="border-bottom mb-7 mx-n3 px-2 mx-lg-n6 px-lg-6">
	<div class="row">
		<div class="col-xl-9">
			<div class="d-sm-flex justify-content-between">
				<h2 class="mb-4">사업장 관리</h2>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-xl-9">
		<form method="post" id="frm"  name="frm" action="${pageContext.request.contextPath}/insertSiteOK.do" class="row g-3 mb-6">
			<input type="hidden" name="SiteCode" value="${sitecode.siteCode }">
			<div class="col-sm-6 col-md-3 mb-2">
				<div class="form-floating">
					<input class="form-control" id="SiteName" name="SiteName" type="text" value="<c:out value="${sitecode.siteName }"/>"  readonly/>
					<label for="SiteName">사업장명</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 mb-2">
				<div class="form-floating">
					<input class="form-control" id="SiteID" name="SiteID" type="text" value="<c:out value="${sitecode.siteID }"/>" readonly/>
					<label for="SiteID">사업장코드</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 mb-2">
				<div class="form-floating">
					<input class="form-control" id="SiteBNo" name="SiteBNo" type="text" value="<c:out value="${sitecode.siteBNo }"/>" readonly/>
					<label for="SiteBNo">사업자번호</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 mb-2">
				<div class="form-floating">
					<input class="form-control" id="Pname" name="Pname" type="text" value="<c:out value="${sitecode.pname }"/>" readonly/>
					<label for="Pname">대표자명</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 mb-2">
				<div class="form-floating">
					<input class="form-control" id="UpTae" name="UpTae" type="text" value="<c:out value="${sitecode.upTae }"/>" readonly/>
					<label for="UpTae">업태</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 mb-2">
				<div class="form-floating">
					<input class="form-control" id="JongMok" name="JongMok" type="text" value="<c:out value="${sitecode.jongMok }"/>" readonly/>
					<label for="JongMok">종목</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 mb-2">
				<div class="form-floating">
					<input class="form-control" id="Phone1" name="Phone1" type="text" value="<c:out value="${fn:replace(sitecode.phone1,'-','')}"></c:out>" readonly/>
					<label for="Phone1">전화번호1</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 mb-2">
				<div class="form-floating">
					<input class="form-control" id="Phone2" name="Phone2" type="text" value="<c:out value="${fn:replace(sitecode.phone2,'-','')}"></c:out>" readonly/>
					<label for="Phone2">전화번호2</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 mb-2">
				<div class="form-floating">
					<input class="form-control" id="Fax" name="Fax" type="text" value="<c:out value="${sitecode.fax }"></c:out>" readonly/>
					<label for="Fax">FAX</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 mb-2">
				<div class="form-floating">
					<input class="form-control" id="Email" name="Email" type="text" value="<c:out value="${sitecode.email }"></c:out>" readonly/>
					<label for="Email">E-Mail</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 mb-2">
				<div class="form-floating">
					<input class="form-control" id="DamDangJa" name="DamDangJa" type="text" value="<c:out value="${sitecode.damDangJa }"></c:out>" readonly/>
					<label for="DamDangJa">담당자</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 mb-2">
				<div class="form-floating">
					<input class="form-control" id="DamDangJaPhone" name="DamDangJaPhone" type="text" value="<c:out value="${sitecode.damDangJaPhone }"/>" readonly/>
					<label for="DamDangJaPhone">담당자 연락처</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="ZipCode" name="ZipCode" type="text" value="<c:out value="${sitecode.zipCode }"/>" readonly/>
					<label for="ZipCode">우편번호</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-8">
				<div class="form-floating">
					<input class="form-control" id="Address" name="Address" type="text" value="<c:out value="${sitecode.address }"/>" readonly/>
					<label for="Address">주소</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-12">
				<div class="form-floating">
					<input class="form-control" id="SubAddress" name="SubAddress" type="text" value="<c:out value="${sitecode.subAddress }"/>" readonly/>
					<label for="SubAddress">세부주소</label>
				</div>
			</div>
			<div class="col-12 gy-6">
				<div class="form-floating">
					<textarea class="form-control" id="Note" name="Note" style="height: 100px" readonly><c:out value="${sitecode.note }"/></textarea>
					<label for="Note">비고</label>
				</div>
			</div>
		</form>
		<div class="col-12 gy-6">
			<div class="row g-3 justify-content-end">
				<div class="col-auto">
					<a class="btn btn-warning px-5" href="${pageContext.request.contextPath}/selecSitecode.do" title="목록">목록</a><!-- 목록 -->
				</div>
				<div class="col-auto">
					<form action="/siteModify.do" method="post">
						<input type="submit" class="btn btn-info px-5" value="수정" /><!-- 수정 -->
						<input type="hidden" name="SiteCode" value="${sitecode.siteCode }"> 
					</form>
				</div>
				<div class="col-auto">
					<form action="${pageContext.request.contextPath}/deleteSite.do" name="formDelete" method="post">
						<input type="submit" class="btn btn-danger px-5"  value="삭제" id="delete" onclick="fn_egov_delete_article(this.form); return false;"> <!-- 삭제 -->
						<input type="hidden" name="SiteCode" value="${sitecode.siteCode }">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
