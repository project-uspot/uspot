<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/include/head.jsp">
	<jsp:param value="결제" name="title"/>
</jsp:include>
<body>
	<div class="card ">
		<div class="card-header ">
			<h1>결제취소</h1>
		</div>
		<div class="card-body pb-3">
			<div class="col-12 col-xxl-8">
				<div class="mb-6">
					<div class="row flex-row">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col-auto w-50">
										<div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="OIDSpan">확인번호</span>
											<input class="form-control" id="OID" name="OID" type="text" value="${param.OID }" readonly="readonly">
										</div>
										<div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="SaleTimeSpan">결제일시</span>
											<input class="form-control" id="SaleTime" name="SaleTime" type="text" value="${param.SaleTime }" readonly="readonly">
											<input class="form-control" id="AssignNo" name="AssignNo" type="hidden" value="${param.AssignNo }">
										</div>
										<div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="PriceSpan">결제금액</span>
											<input class="form-control" id="Price" name="Price" type="text" value="${param.payprice }" readonly="readonly">
										</div>
										<div class="row">
											<div class="col card p-0">
												<div class="card-header p-1 bg-soft">
													<h4 class="" id="" style="text-align: center;">결제방법</h4>
												</div>
												<div class="card-body p-0 align-items-center">
													<div class="m-3 mt-0 mb-0 p-1 col">
														<div class="form-check">
															<input class="form-check-input" id="optPay0" name="optPay" type="radio" value="0" <c:if test="${param.paidCategory eq '신용카드' }"> checked="checked"</c:if> readonly="readonly">
															<label class="form-check-label" for="optPay0">카드결제</label>
														</div>
														<div class="form-check">
															<input class="form-check-input" id="optPay1" name="optPay" type="radio" value="1" <c:if test="${param.paidCategory eq '현금영수증' }"> checked="checked"</c:if> readonly="readonly">
															<label class="form-check-label" for="optPay1">현금영수증</label>
														</div>
														<div class="form-check">
															<input class="form-check-input" id="optPay2" name="optPay" type="radio" value="2" <c:if test="${param.paidCategory eq '간편결제' }"> checked="checked"</c:if> readonly="readonly">
															<label class="form-check-label" for="optPay2">간편결제</label>
														</div>
														<div class="form-check">
															<input class="form-check-input" id="optPay3" name="optPay" type="radio" value="3" <c:if test="${param.paidCategory eq '제로페이' }"> checked="checked"</c:if> readonly="readonly">
															<label class="form-check-label" for="optPay3">제로페이</label>
														</div>
													</div>
												</div>
											</div>
											<div class="col card p-0">
												<div class="card-header p-1 bg-soft">
													<h4 class="" id="" style="text-align: center;">현금영수증 거래용도</h4>
												</div>
												<div class="card-body p-0 align-items-center">
													<div class="m-3 mt-0 mb-0 p-1 col">
														<div class="form-check">
															<input class="form-check-input" id="optType0" name="optType" type="radio" value="0" checked="checked" disabled="disabled">
															<label class="form-check-label" for="optType0">소비자</label>
														</div>
														<div class="form-check">
															<input class="form-check-input" id="optType1" name="optType" type="radio" value="1" disabled="disabled">
															<label class="form-check-label" for="optType1">사업자</label>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-auto w-50">
										<div class="row mt-1 w-100">
											<div class="col-auto w-100">
												<button type="button" class="btn btn-soft-primary btn-lg w-30" name="number" >7</button>
												<button type="button" class="btn btn-soft-primary btn-lg w-30" name="number" >8</button>
												<button type="button" class="btn btn-soft-primary btn-lg w-30" name="number" >9</button>
											</div>
										</div>
										<div class="row mt-1 w-100">
											<div class="col-auto w-100">
												<button type="button" class="btn btn-soft-primary btn-lg w-30" name="number" >4</button>
												<button type="button" class="btn btn-soft-primary btn-lg w-30" name="number" >5</button>
												<button type="button" class="btn btn-soft-primary btn-lg w-30" name="number" >6</button>
											</div>
										</div>
										<div class="row mt-1 w-100" >
											<div class="col-auto w-100">
												<button type="button" class="btn btn-soft-primary btn-lg w-30" name="number" >1</button>
												<button type="button" class="btn btn-soft-primary btn-lg w-30" name="number" >2</button>
												<button type="button" class="btn btn-soft-primary btn-lg w-30" name="number" >3</button>
											</div>
										</div>
										<div class="row mt-1 w-100" >
											<div class="col-auto w-100">
												<button type="button" class="btn btn-soft-primary btn-lg w-30" name="number" >0</button>
												<button type="button" class="btn btn-soft-primary btn-lg w-30" name="number" ><span class="uil-backspace"></span></button>
												<button type="button" class="btn btn-soft-primary btn-lg w-30" name="number" >CLS</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body row">
								<div class="col-md-auto ms-auto row">
									<div class="col-auto">
										<button class="btn btn-phoenix-success" type="button" onclick="manualPay()">임의카드</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-soft-danger" type="button" onclick="paid()">결제취소</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<form id="frmOffline" name="frmOffline" action="">
						<input type="hidden" id="RealSaleDate" name="RealSaleDate" value="">
						<input type="hidden" id="PayType" name="PayType" value="">
						<input type="hidden" id="payPrice" name="payPrice" value="">
						<input type="hidden" id="AssignType" name="AssignType" value="">
						<input type="hidden" id="Maeipsa" name="Maeipsa" value="">
						<input type="hidden" id="CardName" name="CardName" value="">
						<input type="hidden" id="AssignNo" name="AssignNo" value="">
						<input type="hidden" id="Pos" name="Pos" value="">
						<input type="hidden" id="SignPad" name="SignPad" value="">
						<input type="hidden" id="Halbu" name="Halbu" value="">
						<input type="hidden" id="SaleTime" name="SaleTime" value="">
						<input type="hidden" id="OID" name="OID" value="">
						<input type="hidden" id="TID" name="TID" value="">
						<input type="hidden" id="FCardNo" name="FCardNo" value="">
						<input type="hidden" id="MemberID" name="MemberID" value="${param.MemberID }">
					</form>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

var myPopup;

function fetchData() {
	var checkedRadio = document.querySelector('input[name="optPay"]:checked').value;
	//console.log(checkedRadio);
	if(checkedRadio > 1){
		var xhr = new XMLHttpRequest();
	    xhr.onreadystatechange = function() {
	    	console.log(this.readyState+","+this.status+","+this.responseText);
	        if (this.readyState == 4 && this.status == 200 && this.responseText != "") {
	            <%-- TODO: 서버로부터 받은 데이터를 처리합니다. --%>
	        	document.getElementById('BarCode').value = this.responseText;
	        }
	    };
	    xhr.open("GET", "${pageContext.request.contextPath}/barCodeGetData.do", true); <%-- 데이터를 받아오는 서버의 URL --%>
	    xhr.send();
	}
}

setInterval(fetchData, 5000); <%-- 5초마다 fetchData 함수를 호출하여 서버로부터 데이터를 받아옵니다. --%>

document.querySelectorAll('input[name="optPay"]').forEach(input => {
    input.addEventListener('change', function() {
    	toggleType(this.value === '1');
    });
});

function toggleType(enabled) {
    if (enabled) {
    	$('input[name="optType"]').removeAttr("disabled");
    } else {
    	$('input[name="optType"]').attr("disabled",true);
    }
}
</script>
<script type="text/javascript">
    let selectedInput = null;

    <%-- 모든 읽기 전용 입력 필드에 대해 클릭 이벤트 리스너 추가 --%>
    document.querySelectorAll('input[readonly]').forEach(input => {
        input.addEventListener('click', function() {
            selectedInput = this; <%-- 현재 선택된 입력 필드 업데이트 --%>
        });
    });

    <%-- 모든 버튼에 대해 클릭 이벤트 리스너 추가 --%>
    document.querySelectorAll('button[name="number"]').forEach(button => {
        button.addEventListener('click', function() {
            if (selectedInput) {
            	
                const buttonValue = this.innerText;
                var checkedRadio = document.querySelector('input[name="optPay"]:checked').value;

                if((checkedRadio == '1' && selectedInput.getAttribute("name") == "BarCode")
                ||(checkedRadio == '0' && selectedInput.getAttribute("name") == "Halbu")){
                	<%-- Backspace 기능 --%>
                    if (this.querySelector('span.uil-backspace')) { <%-- uil-backspace 아이콘에 대한 텍스트를 여기에 적절히 설정 --%>
                        selectedInput.value = selectedInput.value.slice(0, -1);
                    } 
                    <%-- Clear 기능 --%>
                    else if (buttonValue === 'CLS') {
                        selectedInput.value = '';
                    } 
                    <%-- 숫자 추가 --%>
                    else {
                        selectedInput.value += buttonValue;
                    }
                }
            }
        });
    });
</script>
<script type="text/javascript">
<%-- 임의카드 --%>
function manualPay(){
	var checkedRadio = document.querySelector('input[name="optPay"]:checked').value;
	var urlParam = "";
	if(checkedRadio == '0'){
		urlParam = "card";
	}else if(checkedRadio == '1'){
		urlParam = "cash";
	}else if(checkedRadio == '2'){
		urlParam = "simple";
	}else if(checkedRadio == '3'){
		urlParam = "zero";
	}
	var url = "${pageContext.request.contextPath}/"+urlParam+"/manualRegCancel.do?payprice=" + $("#Price").val()+"&Maeipsa=${param.Maeipsa}&CardName=${param.CardName}";
    var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=800,height=700";
    if (myPopup === undefined || myPopup.closed) {
        myPopup = window.open(url, "manualReg", windowFeatures);
    } else {
    	myPopup.focus();
    }
    document.addEventListener('click', function() {
        if (myPopup && !myPopup.closed) {
            myPopup.focus();
        }
  	});
}

<%-- 결제 완료 --%>
function save(){
	var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id="new" itemid="off"></tr>');
	newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + $("#RealSaleDate").val() + '</td>');
	newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">' + $("#PayType").val() + '</td>');
	newRow.append('<td class="paidprice align-middle white-space-nowrap text-start fw-bold text-end">-' + formatNumberWithCommas(parseInt(removeCommasFromNumber($("#Price").val()))) + '</td>');
	newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + $("#AssignType").val() + '</td>');
	newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + $("#Maeipsa").val() + '</td>');
	newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' + $("#CardName").val() + '</td>');
	newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + $("#AssignNo").val() + '</td>');
	newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
	newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + $("#Pos").val() + '</td>');
	newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + $("#SignPad").val() + '</td>');
	newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  $("#OID").val() + '</td>');
	newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
	newRow.append('<td class="Halbu py-2 align-middle white-space-nowrap" style="display:none">' + $("#Halbu").val() + '</td>');
	newRow.append('<td class="SaleTime py-2 align-middle white-space-nowrap" style="display:none">' + $("#SaleTime").val() + '</td>');
	newRow.append('<td class="TID py-2 align-middle white-space-nowrap" style="display:none">' + $("#TID").val() + '</td>');

	$(opener.document).find('#paidbody').append(newRow);
	<%--
	$(opener.document).find('#paidbody .hover-actions-trigger').each(function() {
			var bgColor = $(this).css("background-color");
	        if (bgColor === "rgb(173, 216, 230)" || bgColor === "lightblue") {
	        	$(this).attr('class','cancel');
	        }
	});--%>
	opener.totalchange();
	self.close();
}

<%-- 결제취소 --%>
function paid(){
	if($("#Price").val() == "" || $("#Price").val() <= "0" ){
		$("#verticallyCenteredModalLabel").html(" 오 류 ");
		$('#resultmessage').html('취소금액을 확인해주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	if (opener && !opener.closed) {
	}else{
		$("#verticallyCenteredModalLabel").html(" 오 류 ");
		$('#resultmessage').html('이전 창이 닫혔습니다.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	var checkedRadio = document.querySelector('input[name="optPay"]:checked').value;
	var urlParam = "";
	if(checkedRadio == '0'){
		urlParam = "card";
	}else if(checkedRadio == '1'){
		urlParam = "cash";
	}else if(checkedRadio == '2'){
		urlParam = "simple";
	}else if(checkedRadio == '3'){
		urlParam = "zero";
	}
	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/'+urlParam+'/paidRegCancel',
		async : false,
		dataType : 'json',
		data: {
			OID : $("#OID").val(),
			SaleTime : $("#SaleTime").val(),
			AssignNo : $("#AssignNo").val(),
			Price : parseInt(removeCommasFromNumber($("#Price").val().replaceAll('-',''))),
			optPay : document.querySelector('input[name="optPay"]:checked').value,
			optType : document.querySelector('input[name="optType"]:checked').value,
			MemberID : $("#MemberID").val(),
			saleType : "${uparam}",
			pkid : '${param.pkid}',
			InType : '${param.InType}',
			tempSaleNo : '${param.tempSaleNo}',
		},
		success: function(data){
			console.log(data);
			if(typeof data === "string"){
				data = JSON.parse(data);
			}
			if(data.responseCode == "0000"){
				$("#RealSaleDate").val(formatDate(data.SaleDate,"yMdHms"));
				$("#PayType").val(data.PayType);
				$("#payPrice").val(data.Price);
				$("#AssignType").val(data.AssignType);
				$("#Maeipsa").val(data.CompanyName);
				$("#CardName").val(data.CardName);
				$("#AssignNo").val(data.AssignNo);
				$("#Pos").val("POS");
				$("#SignPad").val(data.SignGubun);
				$("#Halbu").val(data.Halbu);
				$("#SaleTime").val(data.SaleDate);
				$("#OID").val(data.OID);
				$("#TID").val(data.TID);
				save();	
			}else{
				$("#verticallyCenteredModalLabel").html("거래실패");
				$('#resultmessage').html(data.msg2);
			  	$('.modal-footer').empty();
			  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			  	$('.modal-footer').append(cancelbutton);
			    $('#modalButton').click();
			    modalcheck = true;
			    return false;
			}
		},
		error: function(xhr, status, error){
			$("#verticallyCenteredModalLabel").html(" 오 류 ");
			$('#resultmessage').html('결제를 실패하였습니다.');
		  	$('.modal-footer').empty();
		  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		  	$('.modal-footer').append(cancelbutton);
		    $('#modalButton').click();
		    modalcheck = true;
		    return false;
		}
	});
}
</script>
<jsp:include page="/WEB-INF/jsp/include/foot.jsp"></jsp:include>
</body>
</html>