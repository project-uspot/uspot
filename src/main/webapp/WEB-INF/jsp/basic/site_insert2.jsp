<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file ="../include/AdminTop.jsp"%>
<%@ include file ="../include/AdminLeft.jsp"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/lib/js/exeDaumPostCode.js"></script>
<script type="text/javascript">
function valueChk() {
	var frm = document.frm; 
	//alert("alert");
	if(!frm.Phone2.value) {
		alert("전화번호를 입력해주세요.");
		frm.Phone2.focus();
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
			<div class="col-sm-6 col-md-8">
				<div class="form-floating">
					<input class="form-control" id="SiteName" name="SiteName" type="text" placeholder="사업장명" />
					<label for="SiteName">사업장명</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="SiteID" name="SiteID" type="text" placeholder="사업장코드" />
					<label for="SiteID">사업장코드</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="SiteBNo" name="SiteBNo" type="text" placeholder="사업자번호" />
					<label for="SiteBNo">사업자번호</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="Pname" name="Pname" type="text" placeholder="대표자명" />
					<label for="Pname">대표자명</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="UpTae" name="UpTae" type="text" placeholder="업태" />
					<label for="UpTae">업태</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="JongMok" name="JongMok" type="text" placeholder="종목" />
					<label for="JongMok">종목</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="Phone1" name="Phone1" type="text" placeholder="전화번호1" />
					<label for="Phone1">전화번호1</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="Phone2" name="Phone2" type="text" placeholder="전화번호2" />
					<label for="Phone2">전화번호2</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="ZipCode" name="ZipCode" type="text" placeholder="우편번호" onclick="execDaumPostcode()" readonly />
					<label for="ZipCode">우편번호</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="Address" name="Address" type="text" placeholder="주소" readonly />
					<label for="Address">주소</label>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="form-floating">
					<input class="form-control" id="SubAddress" name="SubAddress" type="text" placeholder="세부주소" />
					<label for="SubAddress">세부주소</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="Fax" name="Fax" type="text" placeholder="FAX" />
					<label for="Fax">FAX</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="Email" name="Email" type="text" placeholder="E-Mail" />
					<label for="Email">E-Mail</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="DamDangJa" name="DamDangJa" type="text" placeholder="담당자" />
					<label for="DamDangJa">담당자</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="DamDangJaPhone" name="DamDangJaPhone" type="text" placeholder="담당자 연락처" />
					<label for="DamDangJaPhone">담당자 연락처</label>
				</div>
			</div>
			<div class="col-12 gy-6">
				<div class="form-floating">
					<textarea class="form-control" id="Note" name="Note" placeholder="비고" style="height: 100px"></textarea>
					<label for="Note">비고</label>
				</div>
			</div>
		</form>
		<div class="col-12 gy-6">
			<div class="row g-3 justify-content-end">
				<div class="col-auto">
					<a class="btn btn-phoenix-primary px-5" href="${pageContext.request.contextPath}/selectSitecode.do"  title="목록">목록</a><!-- 목록 -->
				</div>
				<div class="col-auto">
					<input type="button" class="btn btn-info px-5 px-sm-15"  value="등록" id="insert" onclick="valueChk();"/>
				</div>
			</div>
		</div>
	</div>
</div>

