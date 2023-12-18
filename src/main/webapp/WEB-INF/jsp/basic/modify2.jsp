<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file ="../include/AdminTop.jsp"%>
<%@ include file ="../include/AdminLeft.jsp"%>

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
	//alert("alert");
	if(!frm.SiteID.value) {
		alert("사업장아이디를 입력해주세요.");
		frm.SiteID.focus();
		return false
	}
	if(!frm.SiteName.value) {
		alert("사업장명을 입력해주세요.");
		frm.SiteName.focus();
		return false
	}
	if(!frm.SiteBNo.value) {
		alert("사업자번호를 입력해주세요.");
		frm.SiteBNo.focus();
		return false
	}
	if(!frm.Pname.value) {
		alert("대표자명을 입력해주세요.");
		frm.Pname.focus();
		return false
	}
	if(!frm.UpTae.value) {
		alert("업태를 입력해주세요.");
		frm.UpTae.focus();
		return false
	}
	if(!frm.JongMok.value) {
		alert("종목을 입력해주세요.");
		frm.JongMok.focus();
		return false
	}
	if(!frm.JongMok.value) {
		alert("종목을 입력해주세요.");
		frm.JongMok.focus();
		return false
	}
	if(!frm.Phone1.value) {
		alert("전화번호를 입력해주세요.");
		frm.Phone1.focus();
		return false
	}
	if(!frm.Phone2.value) {
		alert("휴대폰번호를 입력해주세요.");
		frm.Phone2.focus();
		return false
	}
	if(!frm.Email.value) {
		alert("이메일을 입력해주세요.");
		frm.Email.focus();
		return false
	}
	if(!frm.DamDangJa.value) {
		alert("담당자를 입력해주세요.");
		frm.DamDangJa.focus();
		return false
	}
	if(!frm.DamDangJaPhone.value) {
		alert("담당자연락처를 입력해주세요.");
		frm.DamDangJaPhone.focus();
		return false
	}
	if(!frm.Note.value) {
		alert("비고를 입력해주세요.");
		frm.Note.focus();
		return false
	}
	
	if(confirm("수정하시겠습니까?")) {
		frm.submit();
		alert("수정 완료");
	} else {
		return false;
	}
}

</script>
<h2 class="mb-4">사업장 관리</h2>
<div class="row">
	<div class="col-xl-9">
		<form method="post" id="frm"  name="frm" action="${pageContext.request.contextPath}/modifyOK.do" class="row g-3 mb-6">
			<input type="hidden" name="SiteCode" value="${sitecode.siteCode }">
			<div class="col-sm-6 col-md-8">
               <div class="form-floating">
                 <input class="form-control" id="SiteName" name="SiteName" type="text" value="<c:out value="${sitecode.siteName }"/>"  />
                 <label for="SiteName">사업장명</label>
               </div>
             </div>
             <div class="col-sm-6 col-md-4">
               <div class="form-floating">
                 <input class="form-control" id="SiteID" name="SiteID" type="text" value="<c:out value="${sitecode.siteID }"/>" />
                 <label for="SiteID">사업장코드</label>
               </div>
             </div>
             <div class="col-sm-6 col-md-4">
               <div class="form-floating">
                 <input class="form-control" id="SiteBNo" name="SiteBNo" type="text" value="<c:out value="${sitecode.siteBNo }"/>" />
                 <label for="SiteBNo">사업자번호</label>
               </div>
             </div>
             <div class="col-sm-6 col-md-4">
               <div class="form-floating">
                 <input class="form-control" id="Pname" name="Pname" type="text" value="<c:out value="${sitecode.pname }"/>" />
                 <label for="Pname">대표자명</label>
               </div>
             </div>
             <div class="col-sm-6 col-md-4">
               <div class="form-floating">
                 <input class="form-control" id="UpTae" name="UpTae" type="text" value="<c:out value="${sitecode.upTae }"/>" />
                 <label for="UpTae">업태</label>
               </div>
             </div>
             <div class="col-sm-6 col-md-4">
               <div class="form-floating">
                 <input class="form-control" id="JongMok" name="JongMok" type="text" value="<c:out value="${sitecode.jongMok }"/>" />
                 <label for="JongMok">종목</label>
               </div>
             </div>
             <div class="col-sm-6 col-md-4">
                <div class="form-floating">
                 <input class="form-control" id="Phone1" name="Phone1" type="text" value="<c:out value="${fn:replace(sitecode.phone1,'-','')}"></c:out>" />
                 <label for="Phone1">전화번호1</label>
               </div>
             </div>
             <div class="col-sm-6 col-md-4">
                <div class="form-floating">
                 <input class="form-control" id="Phone2" name="Phone2" type="text" value="<c:out value="${fn:replace(sitecode.phone2,'-','')}"></c:out>" />
                 <label for="Phone2">전화번호2</label>
               </div>
             </div>
             <div class="col-12 gy-6">
               <div class="form-floating">
                 <textarea class="form-control" id="Note" name="Note" style="height: 100px" ><c:out value="${sitecode.note }"/></textarea>
                 <label for="Note">비고</label>
               </div>
             </div>
             <div class="col-sm-6 col-md-4">
             	<!-- <button class="btn_w s" type="button" onclick="execDaumPostcode()">주소검색</button> -->
               <div class="form-floating">
                 <input class="form-control" id="ZipCode" name="ZipCode" type="text" value="<c:out value="${sitecode.zipCode }"/>" />
                 <label for="ZipCode">우편번호</label>
               </div>
             </div>
             <div class="col-sm-6 col-md-4">
                <div class="form-floating">
                 <input class="form-control" id="Address" name="Address" type="text" value="<c:out value="${sitecode.address }"/>" />
                 <label for="Address">주소</label>
               </div>
             </div>
             <div class="col-sm-6 col-md-4">
                <div class="form-floating">
                 <input class="form-control" id="SubAddress" name="SubAddress" type="text" value="<c:out value="${sitecode.subAddress }"/>" />
                 <label for="SubAddress">세부주소</label>
               </div>
             </div>
             <div class="col-md-6 gy-6">
               <div class="form-floating">
                 <input class="form-control" id="Fax" name="Fax" type="text" value="<c:out value="${sitecode.fax }"></c:out>" />
                 <label for="Fax">FAX</label>
               </div>
             </div>
             <div class="col-md-6 gy-6">
               <div class="form-floating">
                 <input class="form-control" id="Email" name="Email" type="text" value="<c:out value="${sitecode.email }"></c:out>" />
                 <label for="Email">E-Mail</label>
               </div>
             </div>
             <div class="col-md-6 gy-6">
               <div class="form-floating">
                 <input class="form-control" id="DamDangJa" name="DamDangJa" type="text" value="<c:out value="${sitecode.damDangJa }"></c:out>" />
                 <label for="DamDangJa">담당자</label>
               </div>
             </div>
             <div class="col-md-6 gy-6">
               <div class="form-floating">
                 <input class="form-control" id="DamDangJaPhone" name="DamDangJaPhone" type="text" value="<c:out value="${sitecode.damDangJaPhone }"/>" />
                 <label for="DamDangJaPhone">담당자 연락처</label>
               </div>
             </div>
		</form>
		<div class="col-12 gy-6">
			<div class="row g-3 justify-content-end">
				<div class="col-auto">
					<a class="btn btn-phoenix-primary px-5" href="${pageContext.request.contextPath}/main.do" style="float: right; margin: 0 0 0 3px;" title="목록">목록</a><!-- 목록 -->
				</div>
				<div class="col-auto">
					<input type="button" class="btn btn-info px-5 px-sm-15" style="float: right; margin: 0 0 0 3px;" value="수정" id="modify" onclick="valueChk();"/>
				</div>
			</div>
		</div>
	</div>
</div>

