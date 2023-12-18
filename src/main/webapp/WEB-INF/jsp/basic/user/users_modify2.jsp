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
	var idReg = /^[가-힣A-Za-z0-9]{1,29}$/ ;
	var pwReg = /^[A-Za-z0-9!@$%^*]{8,30}$/;
	var homeReg = /^(070|02|0[3-9]{1}[0-9]{1})[0-9]{3,4}[0-9]{4}$/;
	
	if( ! pwReg.test($("#UserPWD").val() ) ){
		alert("비밀번호 구성을 확인해 주십시오.\n(영문/숫자/특수문자(!@$%^&* 만 허용)로 이루어진 8자~30자)");
		//alert("비밀번호 구성을 확인해 주십시오.\n(영문/숫자 (특수문자가능)로 이루어진 8자~30자)");
		$("#UserPWD").focus();
		return false;
	}

	// 비밀번호(패스워드) 유효성 체크 (문자, 숫자, 특수문자의 조합으로 8~30자리)
	var ObjUserPassword = document.frm.UserPWD;

	if(ObjUserPassword.value.length < 8) {
		alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 8~30자까지 가능합니다.");
		$("#webPWD").focus();
		return false;
	}

	if(!ObjUserPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,*,?,_,~])|([!,@,#,$,%,^,*,?,_,~].*[a-zA-Z0-9])/)) {
		alert("비밀번호는 영문,숫자,특수문자(!@$%^* 만 허용)를 사용하여 8~30자까지 가능합니다..");
		return false;
	}
  
	var SamePass_0 = 0; //동일문자 카운트
	var SamePass_1 = 0; //연속성(+) 카운드
	var SamePass_2 = 0; //연속성(-) 카운드

	for(var i=0; i < ObjUserPassword.value.length; i++) {
		var chr_pass_0 = ObjUserPassword.value.charAt(i);
		var chr_pass_1 = ObjUserPassword.value.charAt(i+1);

		//동일문자 카운트
		if(chr_pass_0 == chr_pass_1) {
			SamePass_0 = SamePass_0 + 1
		}

		var chr_pass_2 = ObjUserPassword.value.charAt(i+2);

		//연속성(+) 카운드
		if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1) {
			SamePass_1 = SamePass_1 + 1
		}

		//연속성(-) 카운드
		if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1) {
			SamePass_2 = SamePass_2 + 1
		}
	}
	if(SamePass_0 > 2) {
		alert("비밀번호는 동일문자를 3번 이상 사용할 수 없습니다.");
		return false;
	}

	if(SamePass_1 > 2 || SamePass_2 > 2 ) {
		alert("비밀번호는 연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다.");
		return false;
	}
	if( $("#UserPWD").val() != $("#member_pw_confirm").val() ){
		alert("비밀번호와 비밀번호 확인 값이 다릅니다.");
		$("#UserPWD").focus();
		return false;
	}
	
	if(!frm.Email.value) {
		alert("이메일을 입력해주세요.");
		frm.Email.focus();
		return false
	}
	if(!frm.HomePhone.value) {
		alert("일반전화를 입력해주세요.");
		frm.HomePhone.focus();
		return false
	}
	if(!frm.CellPhone.value) {
		alert("휴대폰번호를 입력해주세요.");
		frm.CellPhone.focus();
		return false
	}
	if(!frm.Address.value) {
		alert("주소를 입력해주세요.");
		frm.Address.focus();
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
<div class="row" >
	<form method="post" id="frm"  name="frm" action="${pageContext.request.contextPath}/UsersUpdOK.do" class="row g-3 mb-6">
		<input type="hidden" name="SiteCode" value="${user.siteCode }">
		<input type="hidden" name="UserPKID" value="${user.userPKID }">
		<div class="col-sm-6 col-md-5">
           	<div class="form-floating">
              <input class="form-control" id="SiteName" name="SiteName" type="text" placeholder="사업장명" value="${user.siteName }" readonly />
              <label for="SiteName">사업장명 </label>
           	</div>
		</div>
		<div class="col-sm-6 col-md-5">
			<div class="form-floating input-group">
				<input class="form-control" id="SawonNo" name="SawonNo" type="text" placeholder="사원번호" value="${user.sawonNo }"  readonly/>
				<label for="SawonNo">사원번호</label>
				<!-- <button class="btn btn-danger me-1 mb-1" type="button" onclick="noCheck_to_srk()">중복확인</button><br> -->
			</div>
			<!-- <span id="Sawon_no_text"></span> -->
		</div>
		<div class="col-sm-6 col-md-5">
			<div class="form-floating">
				<input class="form-control" id="SawonName" name="SawonName" type="text" placeholder="사원명" value="${user.sawonName }" />
				<label for="SawonName">사원명</label>
			</div>
		</div>
		<div class="col-sm-6 col-md-5">
			<div class="form-floating input-group">
				<input class="form-control" id="UserID" name="UserID" type="text" placeholder="사용자ID" value="${user.userID }"  readonly/>
				<label for="UserID">사용자ID</label>
				<!-- <button class="btn btn-danger me-1 mb-1" type="button" onclick="idCheck_to_srk()">중복확인</button><br> -->
			</div>
			<span id="member_id_text"></span>
		</div>
		<div class="col-md-6 gy-6">
           	<div class="form-floating">
              <input class="form-control" id="UserPWD" name="UserPWD" type="password" placeholder="비밀번호" value="${user.userPWD }" />
              <label for="UserPWD">비밀번호 </label>
           	</div>
		</div>
		<div class="col-md-6 gy-6">
			<div class="form-floating">
              <input class="form-control" id="member_pw_confirm" name="member_pw_confirm" type="password" placeholder="비밀번호확인" value="${user.userPWD }" />
              <label for="member_pw_confirm">비밀번호확인</label>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="form-floating">
				<input class="form-control" id="ZipCode" name="ZipCode" type="text" placeholder="우편번호" value="${user.zipCode}" onclick="execDaumPostcode()" readonly />
				<label for="ZipCode">우편번호</label>
 				</div>
 			</div>
		<div class="col-sm-6 col-md-4">
   			<div class="form-floating">
			    <input class="form-control" id="Address" name="Address" type="text" placeholder="주소" value="${user.address }" readonly/>
			    <label for="Address">주소</label>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="form-floating">
				<input class="form-control" id="SubAddress" name="SubAddress" type="text" value="${user.subAddress }" placeholder="상세주소" />
				<label for="SubAddress">상세주소</label>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="form-floating">
				<select class="form-select" id="Gender" name="Gender">
					<option value="1" <c:if test="${user.gender eq '1' }">selected</c:if>>남자</option>
					<option value="0" <c:if test="${user.gender eq '0' }">selected</c:if>>여자</option>
				</select>
				<label for="Gender">성별 </label>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="form-floating">
				<input class="form-control" id="HomePhone" name="HomePhone" type="text" maxlength="11" onkeydown="onlyNumber(this)" value="${user.homePhone }" placeholder="일반전화 (-)제외하고 입력하세요" />
				<label for="HomePhone">일반전화 (-)제외하고 입력하세요</label>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="form-floating">
				<input class="form-control" id="CellPhone" name="CellPhone" type="text" maxlength="11" onkeydown="onlyNumber(this)" value="${user.cellPhone }" placeholder="휴대전화 (-)제외하고 입력하세요" />
				<label for="CellPhone">휴대전화 (-)제외하고 입력하세요</label>
			</div>
		</div>
		<div class="col-md-4 gy-4">
			<div class="form-floating">
				<input class="form-control" id="Email" name="Email" type="email" placeholder="이메일" value="${user.email }" />
				<label for="Email">이메일</label>
			</div>
		</div>
		<div class="col-md-4 gy-4">
			<div class="form-floating">
				<input class="form-control" id="BirthDay" name="BirthDay" type="date" placeholder="생년월일" value="${user.birthDay }" />
				<label for="Email">생년월일</label>
			</div>
		</div>
		<div class="col-sm-4 gy-4">
			<div class="form-floating">
				<select class="form-select" id="BirthType" name="BirthType">
					<option value="0" <c:if test="${user.birthType eq '0' }">selected</c:if>>양력</option>
					<option value="1" <c:if test="${user.birthType eq '1' }">selected</c:if>>음력</option>
				</select>
				<label for="BirthType">구분 </label>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="form-floating">
				<input class="form-control" id="InDate" name="InDate" type="date" placeholder="입사일자" value="${user.inDate }" />
				<label for="InDate">입사일자</label>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="form-floating">
				<input class="form-control" id="OutDate" name="OutDate" type="date" placeholder="퇴직일자" value="${user.outDate}" />
				<label for="OutDate">퇴직일자</label>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="form-floating">
				<input class="form-control" id="JobStart" name="JobStart" type="date" placeholder="운영일자" value="${user.jobStart}" />
				<label for="JobStart">운영일자</label>
			</div>
		</div>
		<div class="col-sm-4 gy-4">
			<div class="form-floating">
				<select class="form-select" id="GroupName" name="GroupName">
					<option value=""></option>
					<option value=""></option>
				</select>
				<label for="GroupName">담당강습반 </label>
			</div>
		</div>
		<div class="col-sm-4 gy-4">
			<div class="form-floating">
				<select class="form-select" id="JikMooID" name="JikMooID">
					<option value="0" <c:if test="${user.jikMooID eq '0' }">selected</c:if>>정규직</option>
					<option value="1" <c:if test="${user.jikMooID eq '1' }">selected</c:if>>계약직</option>
					<option value="2" <c:if test="${user.jikMooID eq '2' }">selected</c:if>>아르바이트</option>
				</select>
				<label for="JikMooID">계약구분</label>
			</div>
		</div>
		<div class="col-sm-4 gy-4">
			<div class="form-floating">
				<select class="form-select" id="JikwiID" name="JikwiID">
					<option value="0" <c:if test="${user.jikwiID eq '0' }">selected</c:if>></option>
					<option value="1" <c:if test="${user.jikwiID eq '1' }">selected</c:if>>팀장</option>
					<option value="2" <c:if test="${user.jikwiID eq '2' }">selected</c:if>>파트장</option>
					<option value="3" <c:if test="${user.jikwiID eq '3' }">selected</c:if>>대리</option>
					<option value="4" <c:if test="${user.jikwiID eq '4' }">selected</c:if>>주임</option>
					<option value="5" <c:if test="${user.jikwiID eq '5' }">selected</c:if>>사원</option>
				</select>
				<label for="JikwiID">직위 </label>
			</div>
		</div>
		<div class="col-sm-4 gy-4">
			<div class="form-floating">
				<select class="form-select" id="State" name="State">
					<option value="0" <c:if test="${user.state eq '0' }">selected</c:if>>재직</option>
					<option value="1" <c:if test="${user.state eq '1' }">selected</c:if>>휴직</option>
					<option value="2" <c:if test="${user.state eq '2' }">selected</c:if>>퇴직</option>
				</select>
				<label for="State">재직상태 </label>
			</div>
		</div>
		<div class="col-sm-4 gy-4">
			<div class="form-floating">
				<select class="form-select" id="BuseoID" name="BuseoID">
					<option value="0" <c:if test="${user.buseoID eq '0' }">selected</c:if>></option>
					<option value="1" <c:if test="${user.buseoID eq '1' }">selected</c:if>>관리팀</option>
					<option value="2" <c:if test="${user.buseoID eq '2' }">selected</c:if>>운영팀</option>
				</select>
				<label for="BuseoID">근무부서 </label>
			</div>
		</div>
		<div class="col-sm-4 gy-4">
			<div class="form-floating">
				<select class="form-select" id="AuthType" name="AuthType">
					<option value="0" <c:if test="${user.authType eq '0' }">selected</c:if>>일반</option>
					<option value="1" <c:if test="${user.authType eq '1' }">selected</c:if>>강사</option>
					<option value="2" <c:if test="${user.authType eq '2' }">selected</c:if>>수납자</option>
				</select>
				<label for="AuthType">구분 </label>
			</div>
		</div>
		<h4 class="mb-4 mt-4 pt-3">기타 내용</h4>
		<div class="row g-0 border-top border-bottom border-300">
			<div class="col-sm-4">
				<div class="nav flex-sm-column border-bottom border-bottom-sm-0 border-end-sm border-300 fs--1 vertical-tab h-100 justify-content-between" role="tablist" aria-orientation="vertical">
					<a class="nav-link border-end border-end-sm-0 border-bottom-sm border-300 text-center text-sm-start cursor-pointer outline-none d-sm-flex align-items-sm-center active" id="pricingTab" data-bs-toggle="tab" data-bs-target="#pricingTabContent" role="tab" aria-controls="pricingTabContent" aria-selected="true">
						<span class="me-sm-2 fs-4 nav-icons" data-feather="tag"></span><span class="d-none d-sm-inline">출입업장</span>
					</a>
					<a class="nav-link border-end border-end-sm-0 border-bottom-sm border-300 text-center text-sm-start cursor-pointer outline-none d-sm-flex align-items-sm-center" id="restockTab" data-bs-toggle="tab" data-bs-target="#restockTabContent" role="tab" aria-controls="restockTabContent" aria-selected="false">
						<span class="me-sm-2 fs-4 nav-icons" data-feather="package"></span>
						<span class="d-none d-sm-inline">정보</span>
					</a>
					<a class="nav-link border-end border-end-sm-0 border-bottom-sm border-300 text-center text-sm-start cursor-pointer outline-none d-sm-flex align-items-sm-center" id="shippingTab" data-bs-toggle="tab" data-bs-target="#shippingTabContent" role="tab" aria-controls="shippingTabContent" aria-selected="false"> 
						<span class="me-sm-2 fs-4 nav-icons" data-feather="truck"></span>
						<span class="d-none d-sm-inline">강사 이력</span>
					</a>
					<a class="nav-link border-end border-end-sm-0 border-bottom-sm border-300 text-center text-sm-start cursor-pointer outline-none d-sm-flex align-items-sm-center" id="productsTab" data-bs-toggle="tab" data-bs-target="#productsTabContent" role="tab" aria-controls="productsTabContent" aria-selected="false"> 
						<span class="me-sm-2 fs-4 nav-icons" data-feather="globe"></span>
						<span class="d-none d-sm-inline">수상 이력</span>
					</a>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="tab-content py-3 ps-sm-4 h-100">
					<div class="tab-pane fade show active" id="pricingTabContent" role="tabpanel">
						<h4 class="mb-3 d-sm-none">출입 업장</h4>
						<div class="form-check">
							<input class="form-check-input" id="fragileCheck" type="checkbox" name="Upjang" value="0" <c:if test="${user.upjang eq '0' }">checked</c:if> />
							<label class="form-check-label text-900 fs-0" for="fragileCheck">수영장</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" id="biodegradableCheck" type="checkbox" name="Upjang" value="1" <c:if test="${user.upjang eq '1' }">checked</c:if> />
							<label class="form-check-label text-900 fs-0" for="biodegradableCheck">헬스장</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" id="frozenCheck" type="checkbox" name="Upjang" value="2" <c:if test="${user.upjang eq '2' }">checked</c:if> />
							<label class="form-check-label text-900 fs-0" for="frozenCheck">요가/에어로빅</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" id="productCheck" type="checkbox" name="Upjang" value="3" <c:if test="${user.upjang eq '3' }">checked</c:if> />
							<label class="form-check-label text-900 fs-0" for="productCheck">강의실</label>
						</div>
					</div>
					<div class="tab-pane fade h-100" id="restockTabContent" role="tabpanel" aria-labelledby="restockTab">
						<div class="d-flex flex-column h-100">
							<h5 class="mb-3 text-1000">정보</h5>
							<div class="row g-3 flex-1 mb-4">
								<div class="col-sm-7">
									<textarea class="tinymce" name="Note" style="width: 500px; height: 150px;" ><c:out value="${user.note }"></c:out> </textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade h-100" id="shippingTabContent" role="tabpanel" aria-labelledby="shippingTab">
						<div class="d-flex flex-column h-100">
							<h5 class="mb-3 text-1000">강사 이력</h5>
							<div class="row g-3 flex-1 mb-4">
								<div class="col-sm-7">
									<textarea class="tinymce" name="Chistory" style="width: 500px; height: 150px;" ><c:out value="${user.chistory }"></c:out> </textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="productsTabContent" role="tabpanel" aria-labelledby="productsTab">
						<h5 class="mb-3 text-1000">수상 이력</h5>
						<div class="mb-3">
							<div class="row g-3 flex-1 mb-4">
								<div class="col-sm-7">
									<textarea class="tinymce" name="Phistory" style="width: 500px; height: 150px;" ><c:out value="${user.phistory }"></c:out> </textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="col-12 gy-2">
		<div class="row g-3 justify-content-end">
			<div class="col-auto">
				<a class="btn btn-phoenix-primary px-5" href="${pageContext.request.contextPath}/Users.do"  title="목록">목록</a><!-- 목록 -->
			</div>
			<div class="col-auto">
				<input type="button" class="btn btn-info px-5"  value="수정" id="modify" onclick="valueChk();"/>
			</div>
			<div class="col-auto">
				<form action="${pageContext.request.contextPath}/delete.do" name="formDelete" method="post">
					<input type="submit" class="btn btn-warning px-5" value="삭제" id="delete" onclick="fn_egov_delete_article(this.form); return false;"> <!-- 삭제 -->
					<input type="hidden" name="SiteCode" value="${user.siteCode }">
					<input type="hidden" name="SawonNo" value="${user.sawonNo }">
				</form>
			</div>
		</div>
	</div>
</div>

