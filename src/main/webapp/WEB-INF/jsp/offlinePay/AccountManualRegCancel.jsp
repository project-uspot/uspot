<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/include/head.jsp">
	<jsp:param value="결제" name="title"/>
</jsp:include>
<body>
	<div class="card ">
		<div class="card-header ">
			<h1>계좌선택</h1>
		</div>
		<div class="card-body pb-3">
			<div class="card">
				<div class="card-header">
					<div class="btn-group btn-group-lg" role="group" aria-label="First group">
					    <button class="btn btn-secondary ms-2 fs-5" id="prevButton" type="button"><span data-feather="chevron-left"></span></button>
					    <c:forEach items="${accountList}" var="accountMap" varStatus="loop">
					        <button class="btn btn-secondary ms-1 groupButton" type="button" value="${accountMap.PKID}">${accountMap.BankName}</button>
					    </c:forEach>
					    <button class="btn btn-secondary ms-2" id="nextButton" ><span data-feather="chevron-right"></span></button>
					</div>
				</div>
				<div class="card-body">
					<form action="">
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">은행명</span>
							<input class="form-control" id="CardName" name="CardName" type="text" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${param.CardName }" readonly="readonly">
							<input id="Maeipsa" name="Maeipsa" type="hidden" value="${param.Maeipsa }">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">할부개월</span>
							<input class="form-control" id="Halbu" name="Halbu" type="text" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
							<span class="input-group-text">※일시불은 공백/ 할부 3개월인 경우 03 형식</span>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">승인번호</span>
							<input class="form-control" id="AssignNo" name="AssignNo" type="text" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" maxlength="12">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">승인일자</span>
							<input class="form-control" id="SaleDate" name="SaleDate" type="text" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
							<span class="input-group-text">※YYYYMMDD 형식으로 입력</span>
						</div>
					</form>
					<div class="pb-5">
						<div class="col-auto position-absolute" style="margin-left:450px;">
							<button class="btn btn-success" type="button" onclick="save()">확인</button>
						</div>
						<div class="col-auto position-absolute" style="margin-left:570px;">
							<button class="btn btn-danger" type="button" onclick="closePage()">취소</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
<script type="text/javascript">
let groupButtons = document.querySelectorAll('.groupButton');
let prevButton = document.getElementById('prevButton');
let nextButton = document.getElementById('nextButton');
let currentIndex = 0;
const groupsPerPage = 6; <%-- 한 페이지에 보여질 그룹 개수 --%>

showGroups();

function showGroups() {
    for (let i = 0; i < groupButtons.length; i++) {
        if (i >= currentIndex && i < currentIndex + groupsPerPage) {
            groupButtons[i].style.display = 'inline-block';
        } else {
            groupButtons[i].style.display = 'none';
        }
    }
}

prevButton.addEventListener('click', function() {
    if (currentIndex > 0) {
        currentIndex -= groupsPerPage;
        showGroups();
    }
});

nextButton.addEventListener('click', function() {
    if (currentIndex + groupsPerPage < groupButtons.length) {
        currentIndex += groupsPerPage;
        showGroups();
    }
});

$('.groupButton').on('click', function() {
	var code = $(this).val();
	var name = $(this).html();
	$("#CardName").val(name);
	$("#Maeipsa").val(code);
});

function save(){
	if($("#CardName").val() == ""){
		$("#verticallyCenteredModalLabel").html(" 오 류 ");
		$('#resultmessage').html('은행을 선택해주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	if($("#AssignNo").val() == ""){
		$("#verticallyCenteredModalLabel").html(" 오 류 ");
		$('#resultmessage').html('승인번호를 입력해주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	if($("#SaleDate").val() == ""){
		$("#verticallyCenteredModalLabel").html(" 오 류 ");
		$('#resultmessage').html('승인일자를 입력해주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}else if(!$.isNumeric($("#SaleDate").val())||$("#SaleDate").val().length != 8){
		$("#verticallyCenteredModalLabel").html(" 오 류 ");
		$('#resultmessage').html('승인일자를 형식에 맞게 입력해주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	var year = $("#SaleDate").val().substring(0, 4);
    var month = $("#SaleDate").val().substring(4, 6);
    var day = $("#SaleDate").val().substring(6, 8);

	var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id="new"></tr>');
	newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + year+"-"+month+"-"+day+" "+ getCurrentTime() + '</td>');
	newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">' + "계좌이체" + '</td>');
	newRow.append('<td class="paidprice align-middle white-space-nowrap text-start fw-bold text-end">' + formatNumberWithCommas(parseInt(removeCommasFromNumber('-${param.payprice }'))) + '</td>');
	newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + "신용취소" + '</td>');
	newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + $("#Maeipsa").val() + '</td>');
	newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' + $("#CardName").val() + '</td>');
	newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + $("#AssignNo").val() + '</td>');
	newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
	newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + "OFFLINE" + '</td>');
	newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '' + '</td>');
	newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '' + '</td>');
	newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
	newRow.append('<td class="Halbu py-2 align-middle white-space-nowrap" style="display:none">' + $("#Halbu").val() + '</td>');
	newRow.append('<td class="SaleTime py-2 align-middle white-space-nowrap" style="display:none">' + $("#SaleTime").val() + '</td>');
	newRow.append('<td class="TID py-2 align-middle white-space-nowrap" style="display:none">' + '' + '</td>');
	newRow.append('<td class="PKID py-2 align-middle white-space-nowrap" style="display:none">' + '' + '</td>');

	$(opener.document).find('#paidbody').append(newRow);

	opener.totalchange();
	self.close();
}

function getCurrentTime() {
    var now = new Date();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();

    // 시간, 분, 초가 10보다 작으면 앞에 0을 붙여줍니다.
    hours = hours < 10 ? '0' + hours : hours;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    seconds = seconds < 10 ? '0' + seconds : seconds;

    return hours + ':' + minutes + ':' + seconds;
}

function closePage(){
	self.close();
}

</script>
<jsp:include page="/WEB-INF/jsp/include/foot.jsp"></jsp:include>
</body>
</html>