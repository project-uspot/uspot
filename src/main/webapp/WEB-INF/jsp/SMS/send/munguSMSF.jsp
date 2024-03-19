<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal-header bg-primary">
		<h5 class="modal-title text-white" id="insertModalLabel">자주쓰는 문구 관리</h5>
		<button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1 text-white"></span></button>
	</div>
	<div class="modal-body">
		<div class="input-group">
			<textarea class="form-control" id="munguText" name="munguText" aria-label="With textarea" oninput="CountMungu()"></textarea>
			<span class="input-group-text cursor-pointer" onclick="munguSave()">등록</span>
			<span class="input-group-text cursor-pointer" onclick="munguRemove()">삭제</span>
		</div>
		<div class="text-end me-15" id="CountMungu">
			SMS:0/90Bytes
		</div>
		<div class="border-top border-bottom border-200" id="customerOrdersTable">
			<div class="table-responsive scrollbar">
				<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 90%;">
					</colgroup>
                   	<thead>
						<tr>
							<th class="sort align-middle text-center"></th>
							<th class="sort align-middle text-center">문자내용</th>
                        </tr>
                   	</thead>
				</table>
				<div style="height: 257px; overflow-y: auto;">
					<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 90%;">
						</colgroup>
	                   	<tbody id="mungubody">
	                   		<c:forEach items="${mungulist}" var="vo" varStatus="status">
	                   			<tr onclick="Mungubodyclick(this)">
	                   				<td class="Code" style="display:none;">${vo.code}</td>
									<td class="text-center fw-bold" id="index">${status.index+1}</td>
									<td class="fw-bold white-space-nowrap mungu" style="max-width: 200px;">${vo.mungu}</td>
								</tr>
	                   		</c:forEach>
	                   	</tbody>
	               	</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
<!---->
var modalcheck = false;
<!--테이블 클릭하면 행 바뀌는 함수-->
var prevMunguRow = null;
function Mungubodyclick(clickedMunguRow){
	if (prevMunguRow !== null) {
    	$(prevMunguRow).css('background-color', '');
    }
	$(clickedMunguRow).css('background-color', 'lightblue');
	prevMunguRow = clickedMunguRow;
	$('#munguText').val($(prevMunguRow).find('.mungu').text());
	CountMungu();
}

<!--문구 길이 제한하는 함수-->
let previousInput = '';
function CountMungu() {
    let inputText = $('#munguText').val();
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
    	textarea.value = previousInput;
    	return false;
    }
    
    previousInput = inputText;
    
    $('#CountMungu').empty();
    $('#CountMungu').html(byteText);
}

<!--문구 등록,수정 하는 함수-->
function munguSave() {
	
	const code = $(prevMunguRow).find('.Code').text();
	const mungu = $('#munguText').val();
	if(code == ''){
		if(mungu == ''){
			alert('내용을 입력주세요.');
			$('#munguText').focus();
			return false;
		}else{
			
			var maxIndex = 0;
			
			$('.text-center.fw-bold#index').each(function() {
			    var index = parseInt($(this).text());
			    if (index > maxIndex) {
			        maxIndex = index;
			    }
			});
			
			$.ajax({
		        type: "POST", 
		        url: "sms_munguInsert", 
		        dataType : 'json',
		        data: { 
		        	mungu : mungu
		        },
		        success: function(data) {	
		        	if(data == 0){
		        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
		        		window.opener.location.reload();
		                window.close();
		        	}else{
		        		var newRow = $('<tr onclick="Mungubodyclick(this)"></tr>');
						newRow.append('<td class="Code" style="display:none;">' + data + '</td>');
						newRow.append('<td class="text-center fw-bold" id="index">' + Number(maxIndex+1) + '</td>');
						newRow.append('<td class="fw-bold white-space-nowrap mungu" style="max-width: 200px;">' + mungu + '</td>');
						$('#mungubody').append(newRow);
						mungubodyRefact();
		        	}
		        },
		        error: function(xhr, status, error) {
		       	 console.log("Status: " + status);
		         console.log("Error: " + error);
		        }
			});
		}
	}else{
		$.ajax({
	        type: "POST", 
	        url: "sms_munguUpdate", 
	        dataType : 'json',
	        data: { 
	        	Code : code,
	        	mungu : mungu
	        },
	        success: function(data) {	
	        	if(data == '0'){
	        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
	        		window.opener.location.reload();
	                window.close();
	                return false;
	        	}
	        	$(prevMunguRow).find('.mungu').text(mungu);
	        	alert('수정되었습니다.');
	        	mungubodyRefact();
	        },
	        error: function(xhr, status, error) {
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
	        }
		});
	}
}

<!--문구 삭제 하는 함수-->
function munguRemove() {
	const code = $(prevMunguRow).find('.Code').text();
	
	if(code == ''){
		alert('삭제할 문구를 선택해주세요.');
		return false;
	}else{
		$.ajax({
	        type: "POST", 
	        url: "sms_munguRemove", 
	        dataType : 'json',
	        data: { 
	        	Code : code
	        },
	        success: function(data) {	
	        	if(data == '0'){
	        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
	        		window.opener.location.reload();
	                window.close();
	                return false;
	        	}
	        	$(prevMunguRow).remove();
	        	alert('삭제되었습니다.');
	        	mungubodyRefact();
	        },
	        error: function(xhr, status, error) {
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
	        }
		});
	}
}

<!--문구 작업시 부모창 문구리스트 반영 함수-->
function mungubodyRefact() {
	$('.mungubody').empty();
	$.ajax({
        type: "POST", 
        url: "sms_munguList", 
        dataType : 'json',
        success: function(data) {				
			$.each(data, function (index, item) {
                var newRow = '<tr onclick="openermungubodyclick(this)">' +
                    '<td class="code" style="display:none;">' + item.Code + '</td>' +
                    '<td class="index text-center fw-bold">' + (index + 1) + '</td>' +
                    '<td class="mungu fw-bold white-space-nowrap" style="max-width: 200px;">' + item.mungu + '</td>' +
                    '</tr>';
                $('.mungubody').append(newRow);
            });
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
         console.log("Error: " + error);
        }
	});
}
</script>
</html>