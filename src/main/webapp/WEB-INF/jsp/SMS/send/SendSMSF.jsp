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
            			<button class="btn btn-outline-warning" type="button" onclick="location.href='SendTalkF.do?sendTable=${param.sendTable}';">알림톡</button>
            			<button class="btn btn-primary" type="button" data-bs-toggle="modal" id="munguButton" data-bs-target="#insertModal">자주쓰는 문구관리</button>
						<button class="btn btn-danger" type="button" onclick="location.href='SendSMSF.do';">작업 초기화</button>
            		</div>
        		</div>
        	</div>
        </div>
    </div>
    <div class="row g-0 g-md-4 g-xl-6">
    	<div class="me-n5" style="width: 478px;">
    		<div class="card bg-1100 h-100 mb-1 ms-3 me-1 rounded-5">
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
							<button class="btn btn-info" type="button" onclick="Beforebalsong()">보내기</button>
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
		    		<div class="border-top border-bottom border-200" id="customerOrdersTable"
	                    data-list='{"valueNames":["choice","memberid","membername","gender","homephone","cellphone","send"]}'>
	                	<div class="table-responsive scrollbar">
	                    	<table class="table table-sm fs--1 mb-0 table-hover table-bordered" style="width: 98%;">
	                    		<colgroup>
									<col style="width: 10%;">
									<col style="width: 15%;">
									<col style="width: 15%;">
									<col style="width: 10%;">
									<col style="width: 20%;">
									<col style="width: 20%;">
									<col style="width: 10%;">
								</colgroup>
	                        	<thead>
		                        	<tr>
			                        	<th class="sort text-center" data-sort="choice">선택</th>
			                           	<th class="sort text-center" data-sort="memberid">회원번호</th>
			                           	<th class="sort text-center" data-sort="membername">회원성명</th>
			                            <th class="sort text-center" data-sort="gender">성별</th>
			                            <th class="sort text-center" data-sort="homephone">일반전화</th>
			                            <th class="sort text-center" data-sort="cellphone">휴대전화</th>
			                            <th class="sort text-center" data-sort="send">수신</th>
		                            </tr>
	                        	</thead>
	                        </table>
	                        <div style="overflow-y: scroll; height: 222px;">
	                        	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
	                        		<colgroup>
										<col style="width: 10%;">
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 10%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 10%;">
									</colgroup>
		                        	<tbody class="list" id="memberbody">
		                        	</tbody>
		                    	</table>
	                        </div>
	                    </div>
	            	</div>
	            	<div class="row mt-2">
	            		<div class="col">
	            			<button class="btn btn-info" type="button" onclick="allChoice()">전체선택</button>
	            			<button class="btn btn-outline-info" type="button" onclick="notChoice()">전체해제</button>
	            		</div>
	            		<div class="col">
	            			<button class="btn btn-warning" type="button" onclick="$('#memberbody').empty();">검색결과 지우기</button>
	            		</div>
	            		<div class="col text-end">
	            			<button class="btn btn-success" type="button" onclick="balsongAdd()">+목록추가</button>
	            		</div>
	            	</div>
		    	</div>
		    </div>
		    <div class="row">
		    	<div class="col me-n15">
		    		<div class="card mb-1 me-1" style="width: 350px;height:380px;">
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
											<h4 class="card-title mt-3">▶전송자추가</h4>	
										</div>
										<div class="col-auto">
											<div class="form-check form-check-inline mt-2">
												<input class="form-check-input" id="choicecheck" type="checkbox" checked="checked" onclick="listChange()"/>
												<label class="form-check-label" for="choicecheck">수신거부제외</label>
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

<!--회원검색리스트선택하는 함수-->
var prememberRow = null;
function memberbodyclick(clickedmemberRow){
	if (prememberRow !== null) {
    	$(prememberRow).css('background-color', '');
    }
	$(clickedmemberRow).css('background-color', 'lightblue');
	prememberRow = clickedmemberRow;
}

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

if('${param.sendTable}' == 'Y'){
	ifcheckList();
}

function choiceChange(row) {
	const choice = $(row).find("#choice").is(':checked');
	if(!choice){
		$(row).find("#choice").prop('checked', true);
	}else{
		$(row).find("#choice").prop('checked', false);
	}
}

function allChoice() {
	$("#memberbody tr").each(function() {
		$(this).find("#choice").prop('checked', true);
	});
}

function notChoice() {
	$("#memberbody tr").each(function() {
		$(this).find("#choice").prop('checked', false);
	});
}

function ifcheckList() {
	$(window.opener.document).find("#listbody tr").each(function() {
		let RSMS = '';
		if($(this).find(".RSMS").text() == ''){
			RSMS = 'Y';
		}else{
			RSMS = $(this).find(".RSMS").text();
		}
		
		if(RSMS == 'Y'){
			var newRow = $('<tr onclick="memberbodyclick(this)" ondblclick="choiceChange(this)"></tr>');
			newRow.append('<td class="choice text-center"><input class="form-check-input" id="choice" type="checkbox"/></td>');
			newRow.append('<td class="memberid text-center">'+$(this).find(".MemberID").text()+'</td>');
			newRow.append('<td class="membername white-space-nowrap text-center">'+$(this).find(".Name").text()+'</td>');
			newRow.append('<td class="gender text-center">'+$(this).find(".Gender").text()+'</td>');
			newRow.append('<td class="homephone text-center">'+$(this).find(".HomePhone").text()+'</td>');
			newRow.append('<td class="cellphone text-center">'+$(this).find(".CellPhone").text()+'</td>');
			newRow.append('<td class="send text-center">'+RSMS+'</td>');
			$('#memberbody').append(newRow);
		}
	});
}

function allList() {
	$(window.opener.document).find("#listbody tr").each(function() {
		let RSMS = '';
		if($(this).find(".RSMS").text() == ''){
			RSMS = 'Y';
		}else{
			RSMS = $(this).find(".RSMS").text();
		}
		var newRow = $('<tr onclick="memberbodyclick(this)" ondblclick="choiceChange(this)"></tr>');
		newRow.append('<td class="choice text-center"><input class="form-check-input" id="choice" type="checkbox"/></td>');
		newRow.append('<td class="memberid text-center">'+$(this).find(".MemberID").text()+'</td>');
		newRow.append('<td class="membername white-space-nowrap text-center">'+$(this).find(".Name").text()+'</td>');
		newRow.append('<td class="gender text-center">'+$(this).find(".Gender").text()+'</td>');
		newRow.append('<td class="homephone text-center">'+$(this).find(".HomePhone").text()+'</td>');
		newRow.append('<td class="cellphone text-center">'+$(this).find(".CellPhone").text()+'</td>');
		newRow.append('<td class="send text-center">'+RSMS+'</td>');
		$('#memberbody').append(newRow);
	});
}

function listChange() {
	var checked = $('#choicecheck').is(':checked');
	$('#memberbody').empty();
	if(checked){
		ifcheckList();
	}else{
		allList();
	}
}

function balsongAdd() {
	var trlength = 0;
	var addlength = 0;
	
	$('#memberbody tr').each(function() {
		var membername = $(this).find('td.membername').text().trim();
	    var choice = $(this).find('#choice').is(':checked');
	    var cellphone = $(this).find('td.cellphone').text();
	    var celllength = cellphone.replace(/-/g, '');
	    if (choice) {
	    	trlength++;
	    	if (cellphone != '' && celllength.length == 11) {
	    		var newRow = $('<tr onclick="balsongbodyclick(this)"></tr>');
	    		newRow.append('<td class="balsongName text-center fw-bold">' + membername + '</td>');
	    		newRow.append('<td class="balsongPN fw-bold text-center">' + cellphone + '</td>');
	    		$('#balsongbody').append(newRow);
	    		addlength++;
		    }
	    }
	});
	var xlength = trlength-addlength;
	$('#resultmessage').html('선택된 검색목록 총 <font style="font-weight:900;">'+trlength+'</font>'+
	' 건 중에서 잘못된 휴대전화번호 <font style="font-weight:900;color: red;">'+xlength+'</font>건을 제외한 총 '+
	'<font style="font-weight:900;color: blue;">'+addlength+'</font>건을 목록에 추가하였습니다.');
  	$('.modal-footer').empty();
  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
  	$('.modal-footer').append(cancelbutton);
    $('#modalButton').click();
    modalcheck = true;
    return false;
}

<!--문구 길이 제한하는 함수-->
let preInput = '';
var BalsongType = '';
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
    	BalsongType = 'SMS';
    }else if(byteCount<3900){
    	byteText = 'LMS:'+byteCount+'/3900Bytes';
    	BalsongType = 'LMS';
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

function Beforebalsong() {
	var result = confirm("발송하시겠습니까?");
	if(result){
		balsong();
	}else{
	    return false;
	}
}

function balsong() {
	const title = $('#title').val();
	const content = $('#content').val();
	
	if($('#balsongbody').find('tr').length === 0){
		$('#resultmessage').html('회원검색목록에서 SMS 전송대상회원을 추가하세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	
 	if(title == ''){
		$('#resultmessage').html('전송할 메세지의 제목을 작성하세요.');
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
	
	var contactArray = [];

	$('#balsongbody tr').each(function() {
	    // 이름과 전화번호 추출
	    var name = $(this).find('.balsongName').text().trim();
	    var phoneNumber = $(this).find('.balsongPN').text().trim();
	    
	    // 객체 생성 및 배열에 추가
	    var contact = {
	        name: name,
	        phoneNumber: phoneNumber
	    };
	    contactArray.push(contact);
	});

	var formData = new FormData();

	// 기본 데이터 추가
	formData.append('Title', title);
	formData.append('Content', content);
	formData.append('SenderPN', $('#senderPN').val());
	formData.append('BalsongType', BalsongType);
	formData.append('contactArray', JSON.stringify(contactArray));
	
	$.ajax({
        type: "POST", 
        url: "smsBalsong", 
        processData: false,
        contentType: false,
        data: formData,
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