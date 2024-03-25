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
$(document).ready(function() {
	$("#dcType1").on("change", function() {
		if ($(this).prop("checked")) {
			$("#dcType2").prop("checked", false);
		} else {
			$("#dcType2").prop("checked", true);
		}
	});
	$("#dcType2").on("change", function() {
		if ($(this).prop("checked")) {
			$("#dcType1").prop("checked", false);
		} else {
			$("#dcType1").prop("checked", true);
		}
	});
	
	$('input[type="radio"][class="dcType form-check-input"]').on('click',function(){
        var rate = $('input[type=radio][id="dcType1"]:checked').val();
        var price = $('input[type=radio][id="dcType2"]:checked').val();
       
       if(rate == 'D'){
            $('[id="Rate"]').css('display','flex');
            $('[id="Price"]').css('display','none').attr('value','0');
        }else{
            $('[id="Rate"]').css('display','none');
            $('[id="Price"]').css('display','flex');
        }
       if(price == 'U'){
            $('[id="Price"]').css('display','flex');
            $('[id="Rate"]').css('display','none').attr('value','0');
        }else{
            $('[id="Price"]').css('display','none');
            $('[id="Rate"]').css('display','flex');
        }
    });
});
function onlyNumber(obj) {
    $(obj).keyup(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
    }); 
}
function valueChk() {
	var frm = document.frm; 
	
	if(!frm.dcid.value) {
		alert("할인코드를 입력해주세요.");
		frm.dcid.focus();
		return false
	}
	if(!frm.dcName.value) {
		alert("할인명을 입력해주세요.");
		frm.dcName.focus();
		return false
	}
	if(!frm.dcType.value ) {
		alert("할인유형을 입력해주세요.");
		frm.dcType.focus();
		return false
	}
	if(frm.dcType.value=='D' && !frm.Rate.value ) {
		alert("할인율을 입력해주세요.");
		frm.Rate.focus();
		return false
	}
	if(frm.dcType.value=='U' && !frm.Price.value ) {
		alert("할인금액을 입력해주세요.");
		frm.Price.focus();
		return false
	}
	if(!frm.SortOrder.value ) {
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
<h2 class="mb-4">할인유형 관리</h2>
<div class="row">
	<div class="col-xl-9">
		<form method="post" id="frm"  name="frm" action="${pageContext.request.contextPath}/DCTypeUpdOK.do" class="row g-3 mb-6">
			<input type="hidden" name="SiteCode" value="${dc.siteCode }">
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="dcid" name="dcid" type="text" placeholder="할인코드" value="${dc.dcid }" />
					<label for="dcid">할인코드</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="dcName" name="dcName" type="text" placeholder="할인유형" value="${dc.dcName }" />
					<label for="dcName">할인유형</label>
				</div>
			</div>
			<div class="col-12 mt-4">
				<div class="form-check form-check-inline">
					<input type="radio" class="dcType form-check-input" name="dcType" id="dcType1" maxlength="1" value="D" <c:if test="${dc.dcType eq 'D' }">checked</c:if>>
					<label class="form-check-label" for="dcType1">%할인</label>
				</div>
				<div class="form-check form-check-inline ">
					<input type="radio" class="dcType form-check-input" name="dcType" id="dcType2" maxlength="1" value="U" <c:if test="${dc.dcType eq 'U' or empty dc.dcType}">checked</c:if>>
					<label class="form-check-label" for="dcType2">금액할인</label>
				</div>
			</div>
			<div class="col-md-6 gy-6 ">
				<div class="form-floating">
					<input class="form-control Rate" type="text" id="Rate" name="Rate" value="${dc.rate }" onkeydown="onlyNumber(this)" placeholder="할인율" >
					<label for="Rate" id="Rate"><font class="Rate">할인율</font></label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control Price" type="text" id="Price" name="Price" value="${dc.price }" onkeydown="onlyNumber(this)" placeholder="할인금액">
					<label for="Price" id="Price"><font class="Price">할인금액</font></label>
				</div>
			</div>
			<div class="col-md-6 gy-6 ">
				<div class="form-floating">
					<select class="form-select" id="pissCD" name="pissCD">
						<c:forEach items="${list}" var="list">
							<option value="${list.pissCD }">${list.pissCD }</option>
						</c:forEach>
					</select>
					<label for="pissCD">행정정보코드</label>
				</div>
			</div>
			<div class="col-md-6 gy-6">
				<div class="form-floating">
					<input class="form-control" id="SortOrder" name="SortOrder" type="text" placeholder="정렬순서" onkeydown="onlyNumber(this)" value="${dc.sortOrder }"/>
					<label for="SortOrder">정렬순서</label>
				</div>
			</div>
			<div class="border-bottom border-top pb-3 mb-3 w-80">
                <div class="form-check mb-2 mt-3">
                  <input class="form-check-input" id="ApplyFamily" type="checkbox" name="ApplyFamily" value="Y" <c:if test="${dc.applyFamily eq 'Y'}">checked</c:if>/>
                  <label class="form-check-label fw-normal" for="ApplyFamily">연관회원적용</label>
                </div>
                <div class="form-floating">
					<input class="form-control" id="ApplyFamilyCnt" name="ApplyFamilyCnt" type="number" placeholder="인원" value="${dc.applyFamilyCnt }" />
					<label for="ApplyFamilyCnt">연관회원 할인 적용시 0인 허용은 연관된 회원 전체에 할인을 적용합니다.</label>
				</div>
			</div>
			<div class="border-bottom  pb-3 mb-3 w-80">
                <div class="form-check mb-2">
                  <input class="form-check-input" id="ReDCNoYN" type="checkbox" name="ReDCNoYN" value="Y" <c:if test="${dc.reDCNoYN eq 'Y'}">checked</c:if>/>
                  <label class="form-check-label fw-normal" for="ReDCNoYN">재등록 할인 제한</label>
                </div>
                <div class="form-floating">
					<input class="form-control" id="ReDCNoChkDayCnt" name="ReDCNoChkDayCnt" type="number" placeholder="인원" value="${dc.reDCNoChkDayCnt }" />
					<label for="ReDCNoChkDayCnt">감면확인 일 이후 일 경과</label>
				</div>
			</div>
		</form>
		<div class="col-12 gy-2">
			<div class="row g-3 justify-content-end">
				<div class="col-auto">
					<input type="button" class="btn btn-info px-5" value="수정(F2)" id="modify" onclick="valueChk();"/>
				</div>
				<div class="col-auto">
					<a class="btn btn-phoenix-primary px-5" href="${pageContext.request.contextPath}/DCType.do" id="back" title="목록(F3)">목록(F3)</a><!-- 목록 -->
				</div>
				<div class="col-auto">
					<form action="${pageContext.request.contextPath}/deleteDC.do" name="formDelete" method="post">
						<input type="submit" class="btn btn-warning px-5" value="삭제(F4)" id="delete" onclick="fn_egov_delete_article(this.form); "> <!-- 삭제 -->
						<input type="hidden" name="SiteCode" value="${dc.siteCode }">
						<input type="hidden" name="dcid" value="${dc.dcid }">
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
