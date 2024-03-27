<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="card h-100 mb-1">
        <div class="card-body mb-n4 mt-n3">
            <div class="col-auto">
        		<div class="row justify-content-between">
        			<div class="col-auto">
						<h3 class="mb-3 pt-2">자주쓰는 문구 관리</h3>
            		</div>
            		<div class="col-auto">
						<button class="btn btn-primary" type="button" onclick="save()">등록</button>
						<button class="btn btn-warning" type="button" onclick="window.location.reload()">초기화</button>
						<button class="btn btn-danger" type="button" onclick="remove()">삭제</button>
            		</div>
        		</div>
        	</div>
        </div>
    </div>
	<div class="modal-body overflow-hidden">
		<div class="text-start me-1">
			※ 템플릿 등록후 심사기간을 거쳐 리스트에 반영됩니다.
		</div>
		<div class="input-group">
			<span class="input-group-text" id="basic-addon1">제목</span>
			<input class="form-control" type="text" id="munguTitle" name="munguTitle"/>
		</div>
		<div class="input-group">
			<span class="input-group-text" id="basic-addon1">내용</span>
			<textarea class="form-control" id="munguText" name="munguText" aria-label="With textarea" oninput="CountMungu()" rows="10"></textarea>
		</div>
		<div class="text-end me-1" id="CountMungu">
			0/1000 자
		</div>
		<div class="row ps-13">
			<div class="col-auto">
				<button class="func btn btn-primary me-1 mb-1" type="button">이름</button>
			</div>
			<div class="col-auto">
				<button class="func btn btn-primary me-1 mb-1" type="button">기타1</button>
			</div>
			<div class="col-auto">
				<button class="func btn btn-primary me-1 mb-1" type="button">기타2</button>
			</div>
			<div class="col-auto">
				<button class="func btn btn-primary me-1 mb-1" type="button">기타3</button>
			</div>
			<div class="col-auto">
				<button class="func btn btn-primary me-1 mb-1" type="button">기타4</button>
			</div>
		</div>
		<div class="border-top border-bottom border-200" id="customerOrdersTable">
			<div class="table-responsive scrollbar bg-white">
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
	                   		<c:forEach items="${templatelist}" var="template" varStatus="status">
	                   			<tr onclick="Mungubodyclick(this)">
	                   				<td class="Template_NM" style="display:none;">${template.Template_NM}</td>
	                   				<td class="Template_Seq" style="display:none;">${template.Template_Seq}</td>
									<td class="index text-center fw-bold">${status.index+1}</td>
									<td class="Template_Text fw-bold white-space-nowrap" style="max-width: 200px;">${template.Template_Text}</td>
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
	$('#munguTitle').val($(prevMunguRow).find('.Template_NM').text());
	$('#munguText').val($(prevMunguRow).find('.Template_Text').text());
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
    if(byteCount<1000){
    	byteText = byteCount+'/1000 자';
    }else{
    	alert('1000자를 초과하여 문자를 작성할 수 없습니다.');
    	$('#munguText').val(previousInput);
    	return false;
    }
    
    previousInput = inputText;
    
    $('#CountMungu').empty();
    $('#CountMungu').html(byteText);
}

$('.func').on('click', function() {
	var newValue = previousInput +'#'+ '{'+ $(this).text()+'}';
	$('#munguText').val(newValue);
	CountMungu();
});


function save() {
	if(confirm("등록하시겠습니까?")){
		munguSave();
	}else{
		return false;
	}
}

<!--문구 등록하는 함수-->
function munguSave() {
	
	const munguTitle = $('#munguTitle').val();
	const munguText = $('#munguText').val();
	
	if(munguText == ''){
		alert('내용을 입력해주세요.');
		$('#munguText').focus();
		return false;
	}
	
	if(munguTitle == ''){
		alert('제목을 입력해주세요.');
		$('#munguTitle').focus();
		return false;
	}
		
		
	$.ajax({
        type: "POST", 
        url: "TemplateInsert", 
        dataType : 'json',
        data: { 
        	Template_NM : munguTitle,
        	Template_Text : munguText
        },
        success: function(data) {	
        	if(data == '0'){
        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
        		window.opener.location.reload();
                window.close();
        	}else{
        		alert(data);
        		if(data == '등록되었습니다.'){
        			mungubodyRefact();
        		}
        	}
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
         console.log("Error: " + error);
        }
	});
	
}

<!--문구 삭제 하는 함수-->
function remove() {
	if(confirm("삭제하시겠습니까?")){
		munguRemove();
	}else{
		return false;
	}
}

function munguRemove() {
	const Template_Seq = $(prevMunguRow).find('.Template_Seq').text();
	
	if(Template_Seq == ''){
		alert('삭제할 템플릿을 선택해주세요.');
		return false;
	}else{
		$.ajax({
	        type: "POST", 
	        url: "TemplateRemove", 
	        dataType : 'json',
	        data: { 
	        	Template_Seq : Template_Seq
	        },
	        success: function(data) {	
	        	if(data == '0'){
	        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
	        		window.opener.location.reload();
	                window.close();
	        	}else{
	        		alert(data);
	        		if(data == '삭제되었습니다.'){
	        			mungubodyRefact();
	        		}
	        	}
	        },
	        error: function(xhr, status, error) {
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
	        }
		});
	}
}
var isProcessing = false; // 처리 중인지 여부를 나타내는 변수

<!--문구 작업시 부모창 문구리스트 반영 함수-->
function mungubodyRefact() {
	
	$.ajax({
        type: "POST", 
        url: "TemplateList", 
        dataType : 'json',
        success: function(data) {			
        	$('#mungubody').empty();
			$.each(data, function (index, item) {
                var newRow = '<tr onclick="Mungubodyclick(this)">' +
                    '<td class="Template_NM" style="display:none;">' + item.Template_NM + '</td>' +
                    '<td class="Template_Seq" style="display:none;">' + item.Template_Seq + '</td>' +
                    '<td class="index text-center fw-bold">' + (index + 1) + '</td>' +
                    '<td class="Template_Text fw-bold white-space-nowrap" style="max-width: 200px;">' + item.Template_Text + '</td>' +
                    '</tr>';
                $('#mungubody').append(newRow);
            });

			opener.mungubodyRefact();
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
         console.log("Error: " + error);
        }
	});
}
</script>
</html>
<%@ include file="../../include/foot.jsp" %>