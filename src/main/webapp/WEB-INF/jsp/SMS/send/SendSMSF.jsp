<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMS</title>
</head>
<body style="overflow: hidden;">
    <div class="card h-100 mb-1">
        <div class="card-body mb-n4 mt-n3">
            <div class="col-auto">
        		<div class="row justify-content-between">
        			<div class="col-auto">
						<h3 class="mb-3 pt-2">SMS 관리</h3>
            		</div>
            		<div class="col-auto">
            			<button class="btn btn-secondary" type="button" onclick="etcsave()">발송닷컴 CallBack인증(1회용)</button>
            			<button class="btn btn-primary" type="button" data-bs-toggle="modal" id="munguButton" data-bs-target="#insertModal" onclick="munguManage()">자주쓰는 문구관리</button>
						<button class="btn btn-danger" type="button" onclick="window.location.reload();">작업 초기화</button>
            		</div>
        		</div>
        	</div>
        </div>
    </div>
    <div class="row g-0 g-md-4 g-xl-6">
    	<div class="me-n5" style="width: 478px;">
    		<div class="card bg-1100 h-100 mb-1 w-20 ms-3 me-1 rounded-5">
		        <div class="card-body mb-n5 mt-n3 me-3 mx-n3" style="height: 800px;">
		        	<div class="col-auto mt-2">
						<div class="card border border-secondary">
							<div class="card-body" style="height: 670px;">
								<h4 class="card-title">▶제목</h4>
								<input class="form-control" id="title" name="title" type="text"/>
								<h4 class="card-title mt-3">▶문자내용</h4>
								<textarea class="form-control" id="content" name="content" rows="20" oninput="Countcontent()"></textarea>
								<div class="text-end" id="smsCount">
								SMS:0/90Bytes
								</div>
								<h4 class="card-title mt-3">▶보내는 사람 번호</h4>
								<input class="form-control" id="senderPN" name="senderPN" type="text" value="${sitecode.phone1}" readonly="readonly"/>
							</div>
						</div>
						<div class="ms-13 mt-2">
							<button class="btn btn-info" type="button" onclick="balsong()">보내기</button>
							<button class="btn btn-soft-info" type="button" onclick="$('#content').val('');">삭제</button>
						</div>
					</div>
				</div>
			</div>
    	</div>
		<div class="col-md-7 col-lg-7 col-xl-8">
			<div class="card h-50">
		    	<div class="card-body my-n3">
		    		<h4 class="card-title mt-3">▶수신번호(받는 사람 번호)</h4>
		    		<div class="border-top border-bottom border-200" id="customerOrdersTable" style="overflow-y: scroll; height: 257px;"
	                    data-list='{"valueNames":["paiddate","paidcategory","paidprice","paidassignType","paidmapsa",""paidcardtype"","paidassignN","paidcardN","POS","signpad","OID","PayKind"],"page":6,"pagination":true}'>
	                	<div class="table-responsive scrollbar">
	                    	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
	                        	<thead>
		                        	<tr>
			                        	<th class="sort align-middle text-center" scope="col" data-sort="paiddate">선택</th>
			                           	<th class="sort align-middle text-center" scope="col" data-sort="paidcategory">회원번호</th>
			                           	<th class="sort align-middle text-center" scope="col" data-sort="paidprice">회원성명</th>
			                            <th class="sort align-middle text-center" scope="col" data-sort="paidassignType">성별</th>
			                            <th class="sort align-middle text-center" scope="col" data-sort="paidmapsa">회원구분</th>
			                            <th class="sort align-middle text-center" scope="col" data-sort="paidcardtype">일반전화</th>
			                            <th class="sort align-middle text-center" scope="col" data-sort="paidassignN">휴대전화</th>
			                            <th class="sort align-middle text-center" scope="col" data-sort="paidcardN">수신</th>
		                            </tr>
	                        	</thead>
	                        	<tbody class="list" id="paidbody">
	                        	</tbody>
	                    	</table>
	                    </div>
	            	</div>
	            	<div class="row mt-2">
	            		<div class="col">
	            			<button class="btn btn-info" type="button">전체선택</button>
	            			<button class="btn btn-outline-info" type="button">전체해제</button>
	            		</div>
	            		<div class="col">
	            			<button class="btn btn-warning" type="button">검색결과 지우기</button>
	            		</div>
	            		<div class="col text-end">
	            			<button class="btn btn-success" type="button">+목록추가</button>
	            		</div>
	            	</div>
		    	</div>
		    </div>
		    <div class="row">
		    	<div class="col me-n15">
		    		<div class="card mb-1 w-20 me-1" style="width: 350px;height:380px;">
				    	<div class="card-body mb-n5 mt-n3 me-3 mx-n4">
							<div class="row">
								<div class="col">
									<h4 class="card-title mt-3">▶전송자목록</h4>
									<div class="table-responsive scrollbar w-70 border">
				                    	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
				                    		<colgroup>
												<col style="width: 40%;">
												<col style="width: 60%;">
											</colgroup>
				                        	<thead>
					                        	<tr>
						                        	<th class="sort align-middle text-center" scope="col" data-sort="paiddate">이름</th>
						                           	<th class="sort align-middle text-center" scope="col" data-sort="paidcategory">전화번호</th>
					                            </tr>
				                        	</thead>
				                        </table>
				                        <div style="height: 227px; overflow-y: auto;">
				                        	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
					                        	<colgroup>
													<col style="width: 40%;">
													<col style="width: 60%;">
												</colgroup>
					                        	<tbody class="list" id="balsongbody">
					                        	</tbody>
					                    	</table>
				                        </div>
			                    	</div>
			                    	<div class="row">
			                    		<div class="col mt-2">
			                    			<button class="btn btn-soft-danger me-2" type="button" onclick="$('#balsongbody').empty();">전체삭제</button>
			                    			<button class="btn btn-soft-warning" type="button" onclick="$(balsongpreRow).remove();balsongpreRow = null;">선택영역 삭제</button>
			                    		</div>
			                    	</div>
								</div>
							</div>
				    	</div>
				    </div>
		    	</div>
		    	<div class="col ms-n8">
		    		<div class="card mb-1" style="width: 500px;height:380px;">
				    	<div class="card-body mb-n5 mt-n3 me-3 mx-n4">
							<div class="row">
								<div class="col">
									<div class="row justify-content-between">
										<div class="col-auto">
											<h4 class="card-title mt-3">▶전송자목록</h4>	
										</div>
										<div class="col-auto">
											<div class="form-check form-check-inline mt-2">
												<input class="form-check-input" id="nocheck" type="checkbox" value="option1" />
												<label class="form-check-label" for="nocheck">수신거부제외</label>
											</div>
										</div>
									</div>
									<div class="col-5 ms-4">
										<div class="input-group">
											<span class="input-group-text" id="basic-addon1">회원성명</span>
											<input class="form-control" id="memberName" name="memberName" type="text" aria-describedby="basic-addon1" />
										</div>
									</div>
									<div class="col-9 ms-4 mb-2">
										<div class="input-group">
											<span class="input-group-text" id="basic-addon1">전화번호</span>
											<input class="form-control" name="memberPN" id="memberPN" type="text" aria-describedby="basic-addon1" oninput="mustNumber(this)"/>
											<span class="input-group-text cursor-pointer" onclick="sederPlus()">입력(추가)</span>
  											<span class="input-group-text cursor-pointer" onclick="$('#memberName,#memberPN').val('');">취소</span>
										</div>
									</div>
									<div class="table-responsive scrollbar">
				                    	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
				                    		<colgroup>
												<col style="width: 10%;">
												<col style="width: 90%;">
											</colgroup>
				                        	<thead>
					                        	<tr>
						                        	<th class="sort align-middle text-center" scope="col" data-sort="paiddate"></th>
						                           	<th class="sort align-middle text-center" scope="col" data-sort="paidcategory">자주쓰는문구</th>
					                            </tr>
				                        	</thead>
				                        </table>
				                        <div style="height: 196px;overflow-y: auto;">
				                        	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
					                        	<tbody class="mungubody">
					                        		<c:forEach items="${mungulist}" var="vo" varStatus="status">
							                   			<tr onclick="openermungubodyclick(this)">
							                   				<td class="code" style="display:none;">${vo.code}</td>
															<td class="index text-center fw-bold">${status.index+1}</td>
															<td class="mungu fw-bold white-space-nowrap" style="max-width: 200px;">${vo.mungu}</td>
														</tr>
							                   		</c:forEach>
					                        	</tbody>
					                    	</table>
				                        </div>
			                    	</div>
								</div>
							</div>
				    	</div>
				    </div>
		    	</div>
		    </div>
		</div>
	</div>
</body>
<script type="text/javascript">

<!--esc를 눌러서 창을 닫는 함수-->
var modalcheck = false;
document.addEventListener('keydown', function(event) {
	if (event.key === 'Escape' && !modalcheck) {
		window.close();
   	}
   	else if (event.key === 'Escape' && modalcheck) {
   		setTimeout(() => {
   	    	modalcheck = false;
   	    }, 500);
   	}
});

<!--문구리스트선택하는 함수-->
var mungupreRow = null;
function openermungubodyclick(munguclickedRow){
	if (mungupreRow !== null) {
    	$(mungupreRow).css('background-color', '');
    }
	$(munguclickedRow).css('background-color', 'lightblue');
	mungupreRow = munguclickedRow;
	$('#content').val($(mungupreRow).find('.mungu').text());
	Countcontent();
}

<!--전송자리스트선택하는 함수-->
var balsongpreRow = null;
function balsongbodyclick(balsongclickedRow){
	if (balsongpreRow !== null) {
    	$(balsongpreRow).css('background-color', '');
    }
	$(balsongclickedRow).css('background-color', 'lightblue');
	balsongpreRow = balsongclickedRow;
}

$('#munguButton').on('click', function() {
	modalcheck = true;
});

<!--문구 길이 제한하는 함수-->
let preInput = '';
function Countcontent() {
    let inputText = $('#content').val();
    let byteCount = 0;
    
    for (let i = 0; i < inputText.length; i++) {
        if (inputText.charCodeAt(i) <= 0x7F) {
            byteCount += 1;
        } else {
            byteCount += 2;
        }
    }
    let byteText = '';
    if(byteCount<90){
    	byteText = 'SMS:'+byteCount+'/90Bytes';	
    }else if(byteCount<3900){
    	byteText = 'LMS:'+byteCount+'/3900Bytes';
    }else{
    	alert('3900Byte을 초과하여 문자를 작성할 수 없습니다.');
    	$('#content').val(preInput);
    	return false;
    }
    
    preInput = inputText;
    
    $('#smsCount').empty();
    $('#smsCount').html(byteText);
}

<!--전송자 추가해주는 함수-->
function sederPlus() {
	const memberName = $('#memberName').val();
	const memberPN = $('#memberPN').val();
	
	if(memberName == ''){
		$('#resultmessage').html('추가할 회원성명을 입력하세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	
	if(memberPN == ''){
		$('#resultmessage').html('추가할 회원의 휴대전화번호를 입력하세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	
	if(memberPN.length != 11){
		$('#resultmessage').html('유효한 휴대전화 형식이 아닙니다.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	
	var newRow = $('<tr onclick="balsongbodyclick(this)"></tr>');
	newRow.append('<td class="balsongName text-center fw-bold">' + memberName + '</td>');
	newRow.append('<td class="balsongPN fw-bold text-center">' + formatPhoneNumber(memberPN) + '</td>');
	$('#balsongbody').append(newRow);
}

function balsong() {
	const title = $('#title').val();
	const content = $('#content').val();
	
	if(title == ''){
		$('#resultmessage').html('유효한 휴대전화 형식이 아닙니다.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	
	if(content == ''){
		$('#resultmessage').html('전송할 메세지를 작성하세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	
	$.ajax({
        type: "POST", 
        url: "smsBalsong", 
        dataType : 'json',
        data: { 
        	Title : title,
        	Content : content,
        	SenderPN : $('#senderPN').val()
        },
        success: function(data) {	
       	 	alert(data);
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
         console.log("Error: " + error);
        }
	});
}
</script>
<div class="modal fade" id="insertModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="insertModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-md">
		<div class="modal-content" id="01">
			<jsp:include page="munguSMSF.jsp"/>
		</div>
	</div>
</div>
</html>
<%@ include file="../../include/foot.jsp" %>