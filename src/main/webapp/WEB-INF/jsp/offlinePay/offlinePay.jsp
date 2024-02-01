<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/include/head.jsp">
	<jsp:param value="결제" name="title"/>
</jsp:include>
<body>
	<div class="card ">
		<div class="card-header ">
			<h1>결제</h1>
		</div>
		<div class="card-body pb-3">
			<div class="col-12 col-xxl-8">
				<div class="mb-6">
					<div class="row flex-row">
						<div class="row">
							<div class="col-auto">
								<div class="card">
									<div class="card-header">
										<div class="row">
											<div class="col-auto">
												<div class="input-group input-group-sm mb-1">
													<span class="input-group-text" id="BarCodeSpan">확인번호</span>
													<input class="form-control" id="BarCode" name="BarCode" type="text" readonly="">
												</div>
												<div class="input-group input-group-sm mb-1">
													<span class="input-group-text" id="HalbuSpan">할부개월</span>
													<input class="form-control" id="Halbu" name="Halbu" type="text" readonly="" maxlength="2">
												</div>
												<div class="input-group input-group-sm mb-1">
													<span class="input-group-text" id="PriceSpan">결제금액</span>
													<input class="form-control" id="Price" name="Price" type="text" value="${param.payprice }" readonly="readonly">
												</div>
												<div class="card">
													<div class="card-header p-1 bg-soft">
														<h4 class="" id="ZipCodespan">결제방법</h4>
													</div>
													<div class="card-body p-0 row">
														<div class="m-3 mt-0 mb-0 p-1 col">
															<div class="form-check">
																<input class="form-check-input" id="optPay0" name="optPay" type="radio" value="0" checked="checked">
																<label class="form-check-label" for="optPay0">카드결제</label>
															</div>
															<div class="form-check">
																<input class="form-check-input" id="optPay1" name="optPay" type="radio" value="1" >
																<label class="form-check-label" for="optPay1">현금영수증</label>
															</div>
															<div class="form-check">
																<input class="form-check-input" id="optPay2" name="optPay" type="radio" value="2">
																<label class="form-check-label" for="optPay2">간편결제</label>
															</div>
															<div class="form-check">
																<input class="form-check-input" id="optPay3" name="optPay" type="radio" value="3">
																<label class="form-check-label" for="optPay3">제로페이</label>
															</div>
														</div>
														<div class="p-1 col">
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
											<div class="col-auto">
												<div class="row mt-1">
													<div class="col-auto">
														<button type="button" class="btn btn-soft-primary btn-lg" name="number" style="width: 88px;">7</button>
														<button type="button" class="btn btn-soft-primary btn-lg" name="number" style="width: 88px;">8</button>
														<button type="button" class="btn btn-soft-primary btn-lg" name="number" style="width: 88px;">9</button>
													</div>                                                                      
												</div>                                                                          
												<div class="row mt-1">                                                               
													<div class="col-auto">                                                      
														<button type="button" class="btn btn-soft-primary btn-lg" name="number" style="width: 88px;">4</button>
														<button type="button" class="btn btn-soft-primary btn-lg" name="number" style="width: 88px;">5</button>
														<button type="button" class="btn btn-soft-primary btn-lg" name="number" style="width: 88px;">6</button>
													</div>                                                                      
												</div>                                                                          
												<div class="row mt-1" >                                                               
													<div class="col-auto">                                                      
														<button type="button" class="btn btn-soft-primary btn-lg" name="number" style="width: 88px;">1</button>
														<button type="button" class="btn btn-soft-primary btn-lg" name="number" style="width: 88px;">2</button>
														<button type="button" class="btn btn-soft-primary btn-lg" name="number" style="width: 88px;">3</button>
													</div>
												</div>
												<div class="row mt-1" >                                                               
													<div class="col-auto">                                                      
														<button type="button" class="btn btn-soft-primary btn-lg" name="number" style="width: 88px;">0</button>
														<button type="button" class="btn btn-soft-primary btn-lg" name="number" style="width: 88px;"><span class="uil-backspace"></span></button>
														<button type="button" class="btn btn-soft-primary btn-lg" name="number" style="width: 88px;">CLS</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card-body">
										<div id="msg_box">
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="card">
									<div class="card-header">
										<h4 class="input-group-text" id="ZipCodespan">서명방법</h4>
										<div class="input-group input-group-sm mb-1">
											<div class="form-check">
												<input class="form-check-input" id="optSign0" name="optSign" type="radio" value="0">
												<label class="form-check-label" for="optSign0">전자서명</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" id="optSign1" name="optSign" type="radio" value="1" checked="checked">
												<label class="form-check-label" for="optSign1">직접서명</label>
											</div>
										</div>
									</div>
									<div class="card-body">
										<h4 class="input-group-text" id="ZipCodespan">전자서명</h4>
    									<canvas id="signatureCanvas" style="border:1px solid #000;width:100%;height:100%;"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
					<form id="frmOffline" name="frmOffline" action="">
						<input type="hidden" id="RealSaleDate" name="RealSaleDate" value="">
						<input type="hidden" id="SaleType" name="SaleType" value="">
						<input type="hidden" id="Price" name="Price" value="">
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
						<input type="hidden" id="MemberID" name="MemberID" value="${param.memberID }">
					</form>
					<div class="row">
						<div class="col-auto position-absolute" style="margin-left:750px;">
							<button class="btn btn-phoenix-success" type="button" onclick="manualPay()">임의카드</button>
						</div>
						<div class="col-auto position-absolute" style="margin-left:870px;">
							<button class="btn btn-phoenix-primary" type="button" onclick="paid()">결제하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
var canvas = document.getElementById('signatureCanvas');
var ctx = canvas.getContext('2d');
var drawing = false;

function getMousePos(evt) {
    var rect = canvas.getBoundingClientRect();
    return {
        x: evt.clientX - rect.left,
        y: evt.clientY - rect.top
    };
}

function startDrawing(evt) {
    drawing = true;
    ctx.beginPath();
    var pos = getMousePos(evt);
    ctx.moveTo(pos.x, pos.y);
}

function draw(evt) {
    if (!drawing) return;
    var pos = getMousePos(evt);
    ctx.lineTo(pos.x, pos.y);
    ctx.stroke();
}

function stopDrawing() {
    drawing = false;
}

function toggleCanvas(enabled) {
    if (enabled) {
        canvas.addEventListener('mousedown', startDrawing);
        canvas.addEventListener('mousemove', draw);
        canvas.addEventListener('mouseup', stopDrawing);
        canvas.addEventListener('mouseout', stopDrawing);

        <%-- 터치 이벤트 추가 --%>
        canvas.addEventListener('touchstart', handleTouchStart, false);
        canvas.addEventListener('touchmove', handleTouchMove, false);
        canvas.addEventListener('touchend', stopDrawing, false);
        canvas.addEventListener('touchcancel', stopDrawing, false);

        canvas.style.pointerEvents = 'auto';
        canvas.style.opacity = 1;
    } else {
        canvas.removeEventListener('mousedown', startDrawing);
        canvas.removeEventListener('mousemove', draw);
        canvas.removeEventListener('mouseup', stopDrawing);
        canvas.removeEventListener('mouseout', stopDrawing);

        <%-- 터치 이벤트 제거 --%>
        canvas.removeEventListener('touchstart', handleTouchStart, false);
        canvas.removeEventListener('touchmove', handleTouchMove, false);
        canvas.removeEventListener('touchend', stopDrawing, false);
        canvas.removeEventListener('touchcancel', stopDrawing, false);

        canvas.style.pointerEvents = 'none';
        canvas.style.opacity = 0.5;
    }
}

function handleTouchStart(e) {
    var touch = e.touches[0];
    var mouseEvent = new MouseEvent("mousedown", {
        clientX: touch.clientX,
        clientY: touch.clientY
    });
    canvas.dispatchEvent(mouseEvent);
    e.preventDefault();
}

function handleTouchMove(e) {
    var touch = e.touches[0];
    var mouseEvent = new MouseEvent("mousemove", {
        clientX: touch.clientX,
        clientY: touch.clientY
    });
    canvas.dispatchEvent(mouseEvent);
    e.preventDefault();
}

document.querySelectorAll('input[name="optSign"]').forEach(input => {
    input.addEventListener('change', function() {
        toggleCanvas(this.value === '0');
    });
});

function initializeCanvas() {
    var checkedRadio = document.querySelector('input[name="optSign"]:checked').value;
    toggleCanvas(checkedRadio === '0');
}

document.addEventListener('DOMContentLoaded', initializeCanvas);

function fetchData() {
	var checkedRadio = document.querySelector('input[name="optPay"]:checked').value;
	//console.log(checkedRadio);
	if(checkedRadio > 1){
		var xhr = new XMLHttpRequest();
	    xhr.onreadystatechange = function() {
	    	//console.log(this.readyState+","+this.status+","+this.responseText);
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
	var url = "${pageContext.request.contextPath}/"+urlParam+"/manualReg.do?payprice=" + $("#Price").val();
    var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=800,height=700";
    window.open(url, "manualReg", windowFeatures);
}

<%-- 결제 완료 --%>
function save(){
	var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static"></tr>');
	newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + $("#RealSaleDate").val() + '</td>');
	newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">' + $("#SaleType").val() + '</td>');
	newRow.append('<td class="paidprice align-middle white-space-nowrap text-start fw-bold text-end">' + formatNumberWithCommas(parseInt(removeCommasFromNumber($("#Price").val()))) + '</td>');
	newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + $("#AssignType").val() + '</td>');
	newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + $("#Maeipsa").val() + '</td>');
	newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' + $("#CardName").val() + '</td>');
	newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + $("#AssignNo").val() + '</td>');
	newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
	newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + $("#Pos").val() + '</td>');
	newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '</td>');
	newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '</td>');
	newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
	newRow.append('<td class="Halbu py-2 align-middle white-space-nowrap" style="display:hidden">' + $("#Halbu").val() + '</td>');
	newRow.append('<td class="SaleTime py-2 align-middle white-space-nowrap" style="display:hidden">' + $("#SaleTime").val() + '</td>');
	$(opener.document).find('#paidbody').append(newRow);
	self.close();
}

<%-- 결제 --%>
function paid(){
	if($("#Price").val() == "" || $("#Price").val() == "0" ){
		$("#verticallyCenteredModalLabel").html(" 오 류 ");
		$('#resultmessage').html('결제금액을 확인해주세요.');
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
		if($("#BarCode").val() == ""){
			$("#verticallyCenteredModalLabel").html(" 오 류 ");
			$('#resultmessage').html('확인번호를 입력해주세요.');
		  	$('.modal-footer').empty();
		  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		  	$('.modal-footer').append(cancelbutton);
		    $('#modalButton').click();
		    modalcheck = true;
		    return false;
		}
		urlParam = "cash";
	}else if(checkedRadio == '2'){
		if($("#BarCode").val() == ""){
			$("#verticallyCenteredModalLabel").html(" 오 류 ");
			$('#resultmessage').html('확인번호를 입력해주세요.');
		  	$('.modal-footer').empty();
		  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		  	$('.modal-footer').append(cancelbutton);
		    $('#modalButton').click();
		    modalcheck = true;
		    return false;
		}
		urlParam = "simple";
	}else if(checkedRadio == '3'){
		if($("#BarCode").val() == ""){
			$("#verticallyCenteredModalLabel").html(" 오 류 ");
			$('#resultmessage').html('확인번호를 입력해주세요.');
		  	$('.modal-footer').empty();
		  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		  	$('.modal-footer').append(cancelbutton);
		    $('#modalButton').click();
		    modalcheck = true;
		    return false;
		}
		urlParam = "zero";
	}

	$.ajax({
		type : 'POST',
		url : '${pageContext.request.contextPath}/'+urlParam+'/paidReg',
		async : false,
		dataType : 'json',
		data: {
			BarCode : $("#BarCode").val(),
			Halbu : $("#Halbu").val(),
			Price : parseInt(removeCommasFromNumber($("#Price").val())),
			optPay : document.querySelector('input[name="optPay"]:checked').value,
			optType : document.querySelector('input[name="optType"]:checked').value,
			MemberID : $("#MemberID").val()
		},
		success: function(data){
			
		},
		error: function(xhr, status, error){
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
		}
	});
}
</script>
<jsp:include page="/WEB-INF/jsp/include/foot.jsp"></jsp:include>
</body>
</html>