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
			<h1>신용카드선택</h1>
		</div>
		<div class="card-body pb-3">
			<div class="card">
				<div class="card-header">
					<div class="btn-group btn-group-lg" role="group" aria-label="First group">
					    <button class="btn btn-secondary ms-2 fs-5" id="prevButton" type="button"><span data-feather="chevron-left"></span></button>
					    <c:forEach items="${arrCreditCardList}" var="arrCreditCard" varStatus="loop">
					        <button class="btn btn-secondary ms-1 groupButton" type="button" value="${arrCreditCard.Code }">${arrCreditCard.CreditName}</button>
					    </c:forEach>
					    <button class="btn btn-secondary ms-2" id="nextButton" ><span data-feather="chevron-right"></span></button>
					</div>
				</div>
				<div class="card-body">
					<form action="">
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">카드종류</span>
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
		$('#resultmessage').html('카드를 선택해주세요.');
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

	opener.frmOffline.RealSaleDate.value = year+"-"+month+"-"+day+" "+ getCurrentTime();
	opener.frmOffline.PayType.value = "신용카드";
	opener.frmOffline.AssignType.value = "신용승인";
	opener.frmOffline.Maeipsa.value = $("#Maeipsa").val();
	opener.frmOffline.CardName.value = $("#CardName").val();
	opener.frmOffline.AssignNo.value = $("#AssignNo").val();
	opener.frmOffline.Pos.value = "OFFLINE";
	opener.frmOffline.Halbu.value = $("#Halbu").val();
	opener.frmOffline.SaleTime.value = $("#SaleDate").val();
	opener.save();
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