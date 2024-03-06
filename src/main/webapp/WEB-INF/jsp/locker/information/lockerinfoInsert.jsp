<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/head.jsp" %>
<body style="overflow: hidden;">
    <div class="card h-100 mb-1">
        <div class="card-body mb-n4 mt-n3">
            <div class="col-auto">
        		<div class="row justify-content-between">
        			<div class="col-auto">
						<h3 class="mb-3 pt-2">사물함 분류정보 등록</h3>
            		</div>
            		<div class="col-auto">
						<button class="btn btn-success" type="button" onclick="saveCheck()">저장</button>						
						<button class="btn btn-danger" type="button" onclick="self.close()">취소</button>
            		</div>
        		</div>
        	</div>
        </div>
    </div>
    <div class="row">
	    <div class="card ms-3" style="width: 440px;">
	        <div class="card-body" style="height: 390px;">
	       		<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">&ensp;분&emsp;류&ensp;</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="plockergroupname" name="plockergroupname"/>
					</div>
				</div>
				<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">&ensp;위&emsp;치&ensp;</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="plockerlocation" name="plockerlocation"/>
					</div>
				</div>
				<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">&ensp;구&emsp;분&ensp;</span>
						<select class="form-select" aria-label="basic-addon1" id="plockertype" name="plockertype">
							<option value="1">일반락커</option>
						  	<option value="2">옷장</option>
						</select>
					</div>
				</div>
				<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">&ensp;보증금&ensp;</span>
						<input class="form-control text-end" type="text" aria-describedby="basic-addon1" id="plockerdeposite" name="plockerdeposite" oninput="onlyNumber(this)"/>
					</div>
				</div>
				<div class="row mb-2">
					<div style="width: 241px;">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">&ensp;사용료&ensp;</span>
							<input class="form-control text-end" type="text" aria-describedby="basic-addon1" id="plockerprice" name="plockerprice" oninput="onlyNumber(this)"/>
						</div>
					</div>
					<div class="mt-1" style="width: 136px;">
						<div class="form-check form-check-inline">
							<input class="form-check-input" id="nvat" type="checkbox" value="Y"/>
							<label class="form-check-label" for="nvat">부가세포함</label>
						</div>
					</div>
				</div>
				<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">기준개월</span>
						<select class="form-select" aria-describedby="basic-addon1" id="plockermonth" name="plockermonth">
							<option value="0">없음</option>
							<c:forEach begin="1" end="12" varStatus="status">
								<option value="${status.count}">${status.count}개월</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">&ensp;순&emsp;위&ensp;</span>
						<input class="form-control text-end" type="text" aria-describedby="basic-addon1" id="sortorder" name="sortorder" value="${param.sort}"/>
					</div>
				</div>
				<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">&ensp;단수량&ensp;</span>
						<select class="form-select" aria-describedby="basic-addon1" id="dancnt" name="dancnt">
							<c:forEach begin="1" end="10" varStatus="status">
								<option value="${status.count}">${status.count}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<!-- <div class="col-auto">
					<div class="form-check form-check-inline">
						<input class="form-check-input" id="isdelete" type="checkbox" value="Y"/>
						<label class="form-check-label" for="isdelete">삭제</label>
					</div>
				</div> -->
	        </div>
		</div>
	    <div class="card" style="width: 460px;">
	        <div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 440px;">
       			<div class="col-auto">
					<h4 class="pt-2">온라인 이미지 정보</h4>
           		</div>
	        	<div class="card text-white overflow-hidden" id="imagecard" style="max-width:30rem;height: 260px;">
			  		<%-- <img class="card-img-top" src="${pageContext.request.contextPath}/images/egovframework/com/cmm/main/imagesample.jpg" name="lockerimg" id="lockerimg"/> --%>
				</div>
				<div class="row mt-2">
					<div class="col-auto">
						<input type="file" id="imageInput" style="display:none;" accept="image/*"/>
						<button class="btn btn-primary" type="button" id="imageUpload" name="imageUpload">등록</button>
						<button class="btn btn-outline-primary" id="deleteImage" type="button">삭제</button>
					</div>				
				</div>
	        </div>
	    </div>
	</div>
	<div class="card">
    	<div class="card-body">
   			<div class="col">
				<h4>정시접수</h4>
         	</div>
       		<div class="col ms-11">
       			<div class="row mb-3">
       				<div class="col-2 me-n7 mt-1">
						<input class="form-check-input" id="newCheck" name="newCheck" type="checkbox" value="Y"/>
						<label class="form-check-label" for="isdelete">신규:</label>
       				</div>
       				<div style="width: 160px;">
       					<input class="form-control" id="jungsinewfromdate" name="jungsinewfromdate" type="date"/>
       				</div>
       				<div class="ms-n4" style="width: 160px;">
       					<input class="form-control datetimepicker" id="JungsiNewSTime" name="JungsiNewSTime" type="text" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i"}' value="00:00"/>
       				</div>
       				<div class="col-1 mx-n2 me-n6">
       					_
       				</div>
       				<div style="width: 160px;">
       					<input class="form-control" id="jungsinewtodate" name="jungsinewtodate" type="date"/>
       				</div>
       				<div class="ms-n4" style="width: 160px;">
       					<input class="form-control datetimepicker" id="JungsiNewETime" name="JungsiNewETime" type="text" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i"}' value="00:00"/>
       				</div>
       			</div>
       			<div class="row mb-3">
       				<div class="col-2 me-n7 mt-1">
						<input class="form-check-input" id="reCheck" name="reCheck" type="checkbox" value="Y"/>
						<label class="form-check-label" for="isdelete">재등록:</label>
       				</div>
       				<div style="width: 160px;">
       					<input class="form-control" id="JungsiReFromDate" name="JungsiReFromDate" type="date"/>
       				</div>
       				<div class="ms-n4" style="width: 160px;">
       					<input class="form-control datetimepicker" id="JungsiReSTime" name="JungsiReSTime" type="text" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i"}' value="00:00"/>
       				</div>
       				<div class="col-1 mx-n2 me-n6">
       					_
       				</div>
       				<div style="width: 160px;">
       					<input class="form-control" id="JungsiReToDate" name="JungsiReToDate" type="date"/>
       				</div>
       				<div class="ms-n4" style="width: 160px;">
       					<input class="form-control datetimepicker" id="JungsiReETime" name="JungsiReETime" type="text" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i"}' value="00:00"/>
       				</div>
       			</div>
       			<div class="row">
       				<div class="col-2 me-n7 mt-1">
						<input class="form-check-input" id="jungsiCheck" name="jungsiCheck" type="checkbox" value="Y"/>
						<label class="form-check-label" for="isdelete">강습기간:</label>
       				</div>
       				<div style="width: 160px;">
       					<input class="form-control" id="JungsiFromDate" name="JungsiFromDate" type="date"/>
       				</div>
       				<div class="col-1 me-n5 ms-15 ps-4">
       					_
       				</div>
       				<div style="width: 160px;">
       					<input class="form-control" id="JungsiToDate" name="JungsiToDate" type="date"/>
       				</div>
       			</div>
       			<div class="mb-n4 mt-3">
       				<p>※시간설정 예) 00:00 ~ 23:59(오전,오후 설정)</p>
       				<p>※기간 설정은 대표그룹 1개만 설정해도 온라인접수에 적용됨.</p>
       			</div>
       		</div>
    	</div>
    </div>
</body>
<script>

$('#jungsinewfromdate,#jungsinewtodate,#JungsiReFromDate,#JungsiReToDate,#JungsiFromDate,#JungsiToDate').val(getCurrentDate());

$("#imageUpload").click(function() {
	$("#imageInput").click();
});

$("#deleteImage").click(function() {
	$('#imageInput').val('');
	$("#lockerimg").remove();
});

$("#imageInput").change(function() {
	const fileInput = this;
	if (fileInput.files && fileInput.files[0]) {
		const reader = new FileReader();

		reader.onload = function(e) {
			const newImage = $("<img>")
				.addClass("card-img-top")
				.attr({
					src: e.target.result,
					name: "lockerimg",
					id: "lockerimg"
				});
			$("#lockerimg").remove();
			$("#imagecard").append(newImage);
		};
		reader.readAsDataURL(fileInput.files[0]);
	}
});
var nvat = 'N';
$("#nvat").change(function() {
	if ($('#nvat').prop('checked')) {
		nvat = 'Y';
	} else {
		nvat = 'N';
	}
});

function saveCheck(){
	if($('#plockergroupname').val().trim() == ''){
		$('#resultmessage').html('분류명을 입력하세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	if(nvat == 'N'){
		$('#resultmessage').html('부가세포함 유무를 확인하세요.<br>모든 사물함의 부가세가 미포함으로 적용됩니다.<br>저장하시겠습니까?');
		$('.modal-footer').empty();
		var okaybutton = '<button class="btn btn-primary" type="button" data-bs-dismiss="modal" onclick="save()">확인</button>';
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(okaybutton);
		$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	}else{
		save();
	}
}

function save() {
	var JungsiNewDate = '';
	var JungsiNewSTime = '';
	var JungsiNewETime = '';
	var JungsiReDate = '';
	var JungsiReSTime = '';
	var JungsiReETime = '';
	var JungsiFromToDate = '';
	
	if ($('#newCheck').prop('checked')) {
		JungsiNewDate = $('#jungsinewfromdate').val()+'~'+$('#jungsinewtodate').val();
		JungsiNewSTime = $('#JungsiNewSTime').val();
		JungsiNewETime = $('#JungsiNewETime').val();
	}
	
	if ($('#reCheck').prop('checked')) {
		JungsiReDate = $('#JungsiReFromDate').val()+'~'+$('#JungsiReToDate').val();
		JungsiReSTime = $('#JungsiReSTime').val();
		JungsiReETime = $('#JungsiReETime').val();
	}
	
	if ($('#jungsiCheck').prop('checked')) {
		JungsiFromToDate = $('#JungsiFromDate').val()+'~'+$('#JungsiToDate').val();
	}
	
	const formData = new FormData();
	formData.append('imageInput', $('#imageInput').get(0).files[0]);
	formData.append('PLockerGroupName', $('#plockergroupname').val());
    formData.append('PLockerLocation', $('#plockerlocation').val());
    formData.append('PLockerType', $('#plockertype').val());
    if($('#plockerdeposite').val() != ''){
    	formData.append('PLockerDeposite', removeCommasFromNumber($('#plockerdeposite').val()));
    }
    if($('#plockerprice').val() != ''){
    	formData.append('PLockerPrice', removeCommasFromNumber($('#plockerprice').val()));
    }
    formData.append('PLockerMonth', $('#plockermonth').val());
    formData.append('SortOrder', $('#sortorder').val());
    formData.append('NVAT', nvat);
    formData.append('JungsiNewDate', JungsiNewDate);
    formData.append('JungsiReDate', JungsiReDate);
    formData.append('JungsiFromToDate', JungsiFromToDate);
    formData.append('JungsiNewSTime', JungsiNewSTime);
    formData.append('JungsiNewETime', JungsiNewETime);
    formData.append('JungsiReSTime', JungsiReSTime);
    formData.append('JungsiReETime', JungsiReETime);
    formData.append('DanCnt', $('#dancnt').val());
	
	$.ajax({
        type: "POST", 
        url: "LockerInfoInsert", 
        data: formData,
        processData: false,
        contentType: false,
        success: function(data) {
        	if(data == '0'){
        		alert('세션이 만료되었습니다.로그인해주세요.');
        	}
        	window.close();
        	window.opener.location.reload();
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
         console.log("Error: " + error);
        }
	});
}
</script>
<%@ include file="../../include/foot.jsp" %>