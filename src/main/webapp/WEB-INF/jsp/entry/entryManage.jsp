<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/include/head.jsp">
	<jsp:param value="회원관리 프로그램 - 출입관리" name="title"/>
</jsp:include>
<body>
<main class="main" id="top">
	<div class="card h-100 mb-1">
		<div class="card-body pb-3">
			<div class="col-12 col-xxl-8">
				<div class="row g-3">
					<div class="col-sm-3 g-3">
                        <h3 class="mb-3 pt-2">출입관리</h3>
                    </div>
                    <div class="col-sm-3">
                    	<div class="input-group">
                    		<span class="input-group-text">회원성명/회원카드번호/전화번호</span>
                    		<input class="form-control" id="barCode" name="barCode" type="text"/>
                    	</div>
                    </div>
                    <div class="col-sm-3">
                    	<ul class="">
	                    	<li class="form-check">
	                    		<input class="form-check-input" type="checkbox" id="inTimeNo" name="inTimeNo">
	                    		<label class="form-check-label" for="inTimeNo">주말입장시간제한 없음(시작시간~23:00)</label>
	                    	</li>
	                    	<li class="form-check">
	                    		<input class="form-check-input" type="checkbox" id="outChkNo" name="outChkNo">
	                    		<label class="form-check-label" for="outChkNo">퇴장처리안함</label>
	                    	</li>
                    	</ul>
                    </div>
                    <div class="col-sm-3">
                    	<div class="input-group input-group-sm">
                    		<div class="form-check form-check-inline">
	                    		<input class="form-check-input" type="checkbox" id="autoLocker" name="autoLocker">
	                    		<label class="form-check-label" for="autoLocker">전자키사용</label>
                    		</div>
	                    	<%-- <select class="form-select w-30" onchange="setCategory(this)" id="sCategory">
	                    		<option value="">자동(출입업장)</option>
		                    	<c:forEach items="${configList }" var="configMap">
		                    		<option value="${configMap.LockerCondition }">${configMap.CodeName } ${configMap.LockerCondition }|${configMap.LockerManAddNum }|${configMap.LockerWomanAddNum }</option>
	                    		</c:forEach>
	                    	</select> --%>
	                    	<input type="hidden" id="Lng_Locker_Condition" name="Lng_Locker_Condition" value=""/>
	                    	<input type="hidden" id="Lng_Locker_ManAddNum" name="Lng_Locker_ManAddNum" value=""/>
	                    	<input type="hidden" id="Lng_Locker_WoManAddNum" name="Lng_Locker_WoManAddNum" value=""/>
                    	</div>
                    	<div class="wsLockerState">
                    		<span class="form-check-label">서버접속:</span>
                    		<span id="wsLockerStateIcon" class="fa fa-circle me-2 d-inline-block text-secondary" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span>
                    		<span id="wsLockerStateText" class="badge badge-phoenix fs--2 badge-phoenix-secondary">사용불가</span>
                    	</div>
                    </div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="card col-sm-6">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-12 row">
							<div class="col-12 col-sm-auto mb-sm-2">
								<div class="avatar avatar-5xl ms-3">
									<img class="rounded-circle" id="memberImg" src="${pageContext.request.contextPath}/new_lib/assets/img/memberimage/uspot.jpg">
								</div>
							</div>
							<div class="col-12 col-sm-auto flex-1">
								<div class="input-group input-group-sm">
									<span class="input-group-text">회원번호</span>
									<input class="form-control" id="memberID" name="memberID" value="">
								</div>
								<div class="input-group input-group-sm">
									<span class="input-group-text">회원성명</span>
									<input class="form-control" id="memberName" name="memberName" value="">
								</div>
								<div class="input-group input-group-sm">
									<span class="input-group-text">회원성별</span>
									<input class="form-control" id="memberGender" name="memberGender" value="">
								</div>
								<!-- <div class="input-group input-group-sm">
									<span class="input-group-text">회원구분</span>
									<input class="form-control" id="memberGubun" name="memberGubun" value="">
								</div> -->
								<div class="input-group input-group-sm">
									<span class="input-group-text">생년월일</span>
									<input class="form-control" id="memberBirthday" name="memberBirthday" value="">
								</div>
								<div class="input-group input-group-sm">
									<span class="input-group-text">휴대전화</span>
									<input class="form-control" id="memberCellPhone" name="memberCellPhone" value="">
								</div>
								<!-- <div class="input-group input-group-sm">
									<span class="input-group-text">일반전화</span>
									<input class="form-control" id="memberHomePhone" name="memberHomePhone" value="">
								</div> -->
								<div class="input-group input-group-sm">
									<span class="input-group-text">회원카드</span>
									<input class="form-control" id="memberBarCode" name="memberBarCode" value="">
								</div>
							</div>
						</div>
					</div>
					<audio id="audioPlayer" controls style="display:none"></audio>
					<div id="learntable" data-list='{"valueNames":["State","SaleDate","CategoryName","JungName","WeekName","Time","LevelName","Date","Regmonth"],"page":6,"pagination":true}'>
						<div class="table-responsive scrollbar">
							<table class="table table-sm fs--1 mb-0">
								<colgroup>
									<col style="width:8%">
									<col style="width:10%">
									<col style="width:8%">
									<col style="width:15%">
									<col style="width:10%">
									<col style="width:10%">
									<col style="width:6%">
									<col style="width:15%">
									<col style="width:8%">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="State"			>상태</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="SaleDate"		>접수일자</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="CategoryName" 		>분류</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="JungName"	>강좌명</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="WeekName"		>요일</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="Time"			>시간</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="LevelName" 		>단계</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="Date" 			>수강기간</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="Regmonth"		>등록개월</th>
									</tr>
								</thead>
								<tbody class="list" id="learntbody">
								</tbody>
							</table>
						</div>
						<script type="text/javascript">
							$('#learntbody').children('tr:first').click();
						</script>
						<div class="row align-items-center justify-content-between py-2  fs--1">
							<div class="col-auto d-flex">
								<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
							</div>
							<div class="col-auto d-flex">
								<button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
								<ul class="mb-0 pagination"></ul>
								<button class="page-link " data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body">
					<%-- <div id="lockertable" data-list='{"valueNames":["Locker","RegDate","FromDate","ToDate","RegMonth","RealPrice","PaidPrice","Misu","ReturnDate"],"page":6,"pagination":true}'>
						<div class="table-responsive scrollbar">
							<table class="table table-sm fs--1 mb-0">
								<colgroup>
									<col style="width:15%">
									<col style="width:8%">
									<col style="width:8%">
									<col style="width:8%">
									<col style="width:8%">
									<col style="width:12%">
									<col style="width:10%">
									<col style="width:8%">
									<col style="width:10%">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="Locker" 	>사물함</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="RegDate" 	>신청일</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="FromDate" 	>시작일</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="ToDate" 	>종료일</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="RegMonth"   >기간</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="RealPrice"  >받을금액</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="PaidPrice"  >결제금액</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="Misu" 		>미수금액</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="ReturnDate" >반납일</th>
									</tr>
								</thead>
								<tbody class="list" id="lockertbody">
								</tbody>
							</table>
						</div>
						<script type="text/javascript">
							$('#lockertbody').children('tr:first').click();
						</script>
						<div class="row align-items-center justify-content-between py-2  fs--1">
							<div class="col-auto d-flex">
								<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
							</div>
							<div class="col-auto d-flex">
								<button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
								<ul class="mb-0 pagination"></ul>
								<button class="page-link " data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
							</div>
						</div>
					</div> --%>
				</div>
			</div>
			<div class="card col-sm-6">
				<div class="card-header">
					<div id="entryLtable" data-list='{"valueNames":["EntryDate","InTime","OutTime","LockerNo","Type"],"page":6,"pagination":true}'>
						<div class="table-responsive scrollbar">
							<table class="table table-sm fs--1 mb-0">
								<colgroup>
									<col style="width:20%">
									<col style="width:20%">
									<col style="width:20%">
									<col style="width:25%">
									<col style="width:15%">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="EntryDate" >출입일자</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="InTime" >입장시간</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="OutTime" >퇴장시간</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="LockerNo" >락커번호</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="Type" >발권방법</th>
									</tr>
								</thead>
								<tbody class="list" id="entryLtbody">
								
								</tbody>
							</table>
						</div>
						<script type="text/javascript">
							$('#entryLtbody').children('tr:first').click();
						</script>
						<div class="row align-items-center justify-content-between py-2  fs--1">
							<div class="col-auto d-flex">
								<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
							</div>
							<div class="col-auto d-flex">
								<button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
								<ul class="mb-0 pagination"></ul>
								<button class="page-link " data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div id="talktable" data-list='{"valueNames":["RegDate","Sawon","Note","Bigo"],"page":6,"pagination":true}'>
						<div class="table-responsive scrollbar">
							<table class="table table-sm fs--1 mb-0">
								<colgroup>
									<col style="width:10%">
									<col style="width:10%">
									<col style="width:40%">
									<col style="width:40%">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="RegDate">상담일자</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="Sawon" 	>상담자</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="Note" 	>상담내용</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="Bigo" 	>조치사항</th>
									</tr>
								</thead>
								<tbody class="list" id="talktbody">
								</tbody>
							</table>
						</div>
						<script type="text/javascript">
							$('#talktbody').children('tr:first').click();
						</script>
						<div class="row align-items-center justify-content-between py-2  fs--1">
							<div class="col-auto d-flex">
								<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
							</div>
							<div class="col-auto d-flex">
								<button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
								<ul class="mb-0 pagination"></ul>
								<button class="page-link " data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
							</div>
						</div>
					</div>
					<%-- <div id="logtable" data-list='{"valueNames":["State","SaleDate","GroupName","SubGroupName","WeekName","Time","LevelName","Date","Regmonth","RealPrice","Note","InType"],"page":6,"pagination":true}'>
						<div class="table-responsive scrollbar">
							<table class="table table-sm fs--1 mb-0">
								<colgroup>
									<col style="width:10%">
									<col style="width:10%">
									<col style="width:10%">
									<col style="width:10%">
									<col style="width:10%">
									<col style="width:10%">
									<col style="width:10%">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="EntryDate"	>락커</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="InTime"		>결과</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="OutTime"	>구분</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="State" 		>일시</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="Bigo" 		>유형</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="InTime"		>중계기</th>
										<th class="sort align-middle white-space-nowrap text-center" scope="col" data-sort="OutTime"	>메세지</th>
									</tr>
								</thead>
								<tbody class="list" id="logtbody">
								</tbody>
							</table>
						</div>
						<script type="text/javascript">
							$('#logtbody').children('tr:first').click();
						</script>
						<div class="row align-items-center justify-content-between py-2  fs--1">
							<div class="col-auto d-flex">
								<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
							</div>
							<div class="col-auto d-flex">
								<button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
								<ul class="mb-0 pagination"></ul>
								<button class="page-link " data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
							</div>
						</div>
					</div> --%>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="/WEB-INF/jsp/include/foot.jsp"></jsp:include>
</main>

</body>
<script type="text/javascript">
$(document).ready(function() {
    $('#barCode').keypress(function(event) {
        if (event.which == 13) {
        	loadMember();
        }
    });
});

function fetchData() {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		try {
			if (this.readyState == 4 && this.status == 200 && this.responseText != "") {
				<%--// TODO: 서버로부터 받은 데이터를 처리합니다.--%>
				<%--//document.getElementById("data").innerHTML = this.responseText;--%>
				document.getElementById('barCode').value = this.responseText;
				if(document.getElementById('barCode').value != ""){
					loadMember();
				}
			}
		} catch (error) {
			console.error("fetchData error:", error);
		}
	};
	xhr.open("GET", "${pageContext.request.contextPath}/barCodeGetData.do", true); <%--// 데이터를 받아오는 서버의 URL--%>
	xhr.send();
}

function loadMember(){
	var barCode = $('#barCode').val();

	if(barCode == ""){
		$('#resultmessage').html('검색결과가 없습니다.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
		$('#modalButton').click();
		modalcheck = true;
		 $('#barCode').val("");
		return false;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/entryChk.do",
		type: "POST",
		dataType : 'json',
		async : false,
		data : {
			"findvalue":barCode,
			"findcategory":4
			},
		success: function(data){
			switch(data.code){
			case "9999":
				$('#resultmessage').html('검색결과가 없습니다.');
				$('.modal-footer').empty();
				var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				$('.modal-footer').append(cancelbutton);
				$('#modalButton').click();
				modalcheck = true;
				$('#barCode').val("");
				return false;
				
				break;
			case "9998":
				$('#resultmessage').html('회원카드가 없습니다.');
				$('.modal-footer').empty();
				var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				$('.modal-footer').append(cancelbutton);
				$('#modalButton').click();
				modalcheck = true;
				$('#barCode').val("");
				return false;
				
				break;
			case "1111":
				//window.location.href = "findlist?findvalue="+barCode+"&findcategory=4";
				var url = "findlist?findvalue=" + barCode + "&findcategory=4";
				var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1000,height=500";
				window.open(url, "_blank", windowFeatures);
				return false;
				
				break;
			case "0000":
				memInfo(data.member.memberID,0);
				break;
			}
		},
		error: function(xhr, status, error){
			console.log("Status: " + status);
			console.log("Error: " + error);
			$('#resultmessage').html('출입체크 오류!\n다시 시도해주시기 바랍니다.');
			$('.modal-footer').empty();
			var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			$('.modal-footer').append(cancelbutton);
			$('#modalButton').click();
			modalcheck = true;
			return false;
		}
	});
}

function memInfo(findvalue,findcategory){
	$.ajax({
		url:"${pageContext.request.contextPath}/entryChk.do",
		type: "POST",
		dataType : 'json',
		async : false,
		data : {
			"findvalue":findvalue,
			"findcategory":findcategory
			},
		success: function(data){
			switch(data.code){
			case "9999":
				$('#resultmessage').html('검색결과가 없습니다.');
				$('.modal-footer').empty();
				var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				$('.modal-footer').append(cancelbutton);
				$('#modalButton').click();
				modalcheck = true;
				$('#barCode').val("");
				return false;
				
				break;
			case "9998":
				$('#resultmessage').html('회원카드가 없습니다.');
				$('.modal-footer').empty();
				var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				$('.modal-footer').append(cancelbutton);
				$('#modalButton').click();
				modalcheck = true;
				$('#barCode').val("");
				return false;
				
				break;
			case "0000":
				var mem = data.member;
				var img = data.base64Image;
				$("#memberID").val(mem.memberID);
				$("#memberName").val(mem.name);
				$("#memberGender").val(mem.genderText);
				//$("#memberGubun").val(mem.typeText);
				$("#memberBirthday").val(mem.birthDay);
				$("#memberCellPhone").val(mem.cellPhone);
				//$("#memberHomePhone").val(mem.homePhone);
				$("#memberBarCode").val(mem.barCode);
				if(img == null){
					$("#memberImg").attr('src','${pageContext.request.contextPath}/new_lib/assets/img/memberimage/uspot.jpg');
				}else{
					$("#memberImg").attr('src','data:image/jpeg;base64,'+img);	
				}
				entryChk(mem.memberID);
				entryClassInfo(mem.memberID);
				//memLockerInfo(mem.memberID);
				memEntryInfo(mem.memberID);
				memTalkInfo(mem.memberID);
				break;
			}
		},
		error: function(xhr, status, error){
			console.log("Status: " + status);
			console.log("Error: " + error);
			$('#resultmessage').html('출입체크 오류!\n다시 시도해주시기 바랍니다.');
			$('.modal-footer').empty();
			var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			$('.modal-footer').append(cancelbutton);
			$('#modalButton').click();
			modalcheck = true;
			return false;
		}
	});
}

function entryChk(MemberID){
	$.ajax({
		url:"${pageContext.request.contextPath}/memEntryChk.do",
		type:"POST",
		dataType : 'json',
		async : false,
		data:{
			"MemberID": MemberID,
			"iCategory":$("#sCategory").val(),
			"strLockerCondition":$("#Lng_Locker_Condition").val(),
			"LngLockerManAddNum":$("#Lng_Locker_ManAddNum").val(),
			"LngLockerWoManAddNum":$("#Lng_Locker_WoManAddNum").val(),
			"chkWeekenInoutTime":$("#inTimeNo").is(":checked"),
			"chkOutYN":$("#outChkNo").is(":checked"),
		},
		success:function(data){
			if(data.validCnt == 1){
				data.entryItemList.forEach(function(map){
					if(map.responseCode){
						entryIn(MemberID,map.SaleNo);
						return false;
					}
				});
			}else if(data.validCnt > 1){
				str = "<div class='row'>";
				data.entryItemList.forEach(function(map){
					if(map.responseCode){
						str = str+"<div class='col text-center'><button class='btn btn-outline-success' type='button' onClick='entryIn("+MemberID+","+map.SaleNo+")' data-bs-dismiss='modal'>"+map.ItemName+"</button></div>";
					}
				});
				str = str + "</div>";
				$('#resultmessage').html(str);
				$('.modal-footer').empty();
				var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				$('.modal-footer').append(cancelbutton);
				$('#modalButton').click();
				modalcheck = true;
				return false;
			}else{
				str = "";
				data.entryItemList.forEach(function(map){
					str = str + map.ItemName + " " + map.resultMsg + "<br>";
				});
				$('#resultmessage').html(str);
				$('.modal-footer').empty();
				var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				$('.modal-footer').append(cancelbutton);
				$('#modalButton').click();
				modalcheck = true;
				switch(data.msgType){
				case 1:
					break;
				case 2:
					playAudio("2회입장.wav");
					break;
				case 3:
					playAudio("입장시간아님.wav");
					break;
				case 4:
					playAudio("강습만료.wav");
					break;
				case 5:
					playAudio("입장처리실패.wav");
					break;
				case 6:
					playAudio("등록된강습정보 미존재.wav");
					break;
				}
				return false;
			}
		},
		error:function(xhr, status, error){
			console.log("Status: " + status);
			console.log("Error: " + error);
			$('#resultmessage').html('출입체크 오류!\n다시 시도해주시기 바랍니다.');
			$('.modal-footer').empty();
			var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			$('.modal-footer').append(cancelbutton);
			$('#modalButton').click();
			modalcheck = true;
			return false;
		}
	});
}

function entryIn(memberID,saleNo){
	$.ajax({
		url: "${pageContext.request.contextPath}/entry.do",
		type: "POST",
		dataType: "json",
		async : false,
		data : {
			"MemberID":memberID,
			"SaleNo":saleNo,
			"autoLockerUse" : $("#autoLocker").is(":checked"),
			"PosGBN" : "POS",
			"strLockerCondition":$("#Lng_Locker_Condition").val(),
			"LngLockerManAddNum":$("#Lng_Locker_ManAddNum").val(),
			"LngLockerWoManAddNum":$("#Lng_Locker_WoManAddNum").val(),
		},
		success : function(data){
			if(data.Code == "0000"){
				playAudio("E.wav");
				$('#resultmessage').html(data.Msg+"<br>"+data.lockerNo+" 입장");
				$('.modal-footer').empty();
				var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				$('.modal-footer').append(cancelbutton);
				$('#modalButton').click();
				modalcheck = true;
				return false;
			}else{
				$('#resultmessage').html(data.Msg);
				$('.modal-footer').empty();
				var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				$('.modal-footer').append(cancelbutton);
				$('#modalButton').click();
				modalcheck = true;
				return false;
			}
		},
		error:function(xhr, status, error){
			console.log("Status: " + status);
			console.log("Error: " + error);
			$('#resultmessage').html('출입체크 오류!\n다시 시도해주시기 바랍니다.');
			$('.modal-footer').empty();
			var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			$('.modal-footer').append(cancelbutton);
			$('#modalButton').click();
			modalcheck = true;
			return false;
		}
	});
	
	memEntryInfo(memberID);
}


function entryClassInfo(MemberID){
	$.ajax({
		url:"${pageContext.request.contextPath}/memClassInfo.do",
		type: "POST",
		dataType : 'json',
		async : false,
		data : {
			"MemberID":MemberID,
			},
		success: function(data){
			$("#learntbody").empty();
			data.forEach(function(map){
				var trStr = "";
				trStr = trStr + "<tr>";
				trStr = trStr + "<td class='State align-middle white-space-nowrap text-center'>"+classState(map.STATE,map.IsChangeItem)+"</td>";
				trStr = trStr + "<td class='SaleDate align-middle white-space-nowrap text-center'>"+map.SaleDate+"</td>";
				trStr = trStr + "<td class='CategoryName align-middle white-space-nowrap text-center'>"+map.CategoryName+"</td>";
				trStr = trStr + "<td class='JungName align-middle white-space-nowrap text-center'>"+map.JungName+"</td>";
				trStr = trStr + "<td class='WeekName align-middle white-space-nowrap text-center'>"+map.DayName+"</td>";
				trStr = trStr + "<td class='Time align-middle white-space-nowrap text-center'>"+map.FromTime+"~"+map.ToTime+"</td>";
				trStr = trStr + "<td class='LevelName align-middle white-space-nowrap text-center'>"+map.LevelName+"</td>";
				trStr = trStr + "<td class='Date align-middle white-space-nowrap text-center'>"+map.RFromDate+"~"+map.RToDate+"</td>";
				trStr = trStr + "<td class='Regmonth align-middle white-space-nowrap text-center'>"+map.RegMonth+"개뭘</td>";
				trStr = trStr + "</tr>";
				$("#learntbody").append(trStr);
			});
		},
		error: function(xhr, status, error){
			console.log("Status: " + status);
			console.log("Error: " + error);
			$('#resultmessage').html('출입체크 오류!\n다시 시도해주시기 바랍니다.');
			$('.modal-footer').empty();
			var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			$('.modal-footer').append(cancelbutton);
			$('#modalButton').click();
			modalcheck = true;
			return false;
		}
	});
}
function memLockerInfo(MemberID){
	$.ajax({
		url:"${pageContext.request.contextPath}/memLockerInfo.do",
		type: "POST",
		dataType : 'json',
		async : false,
		data : {
			"MemberID":MemberID,
			},
		success: function(data){
			$("#lockertbody").empty();
			data.forEach(function(map){
				var trStr = "";
				trStr = trStr + "<tr>";
				trStr = trStr + "<td class='Locker align-middle white-space-nowrap text-center'>["+map.PLockerGroupName+"-"+map.PLockerLocation+"]"+map.PLockerNo+"</td>";
				trStr = trStr + "<td class='RegDate align-middle white-space-nowrap text-center'>"+map.RegDate+"</td>";
				trStr = trStr + "<td class='FromDate align-middle white-space-nowrap text-center'>"+map.FromDate+"</td>";
				trStr = trStr + "<td class='ToDate align-middle white-space-nowrap text-center'>"+map.ToDate+"</td>";
				trStr = trStr + "<td class='RegMonth align-middle white-space-nowrap text-center'>"+map.RegMonth+"개월</td>";
				trStr = trStr + "<td class='RealPrice align-middle white-space-nowrap text-center'>"+map.RealPrice+"</td>";
				trStr = trStr + "<td class='PaidPrice align-middle white-space-nowrap text-center'>"+map.PaidPrice+"</td>";
				trStr = trStr + "<td class='Misu align-middle white-space-nowrap text-center'>"+map.Misu+"</td>";
				trStr = trStr + "<td class='ReturnDate align-middle white-space-nowrap text-center'>"+map.ReturnDate+"</td>";
				trStr = trStr + "</tr>";
				$("#lockertbody").append(trStr);
			});
		},
		error: function(xhr, status, error){
			console.log("Status: " + status);
			console.log("Error: " + error);
			$('#resultmessage').html('출입체크 오류!\n다시 시도해주시기 바랍니다.');
			$('.modal-footer').empty();
			var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			$('.modal-footer').append(cancelbutton);
			$('#modalButton').click();
			modalcheck = true;
			return false;
		}
	});
}
function memEntryInfo(MemberID){
	$.ajax({
		url:"${pageContext.request.contextPath}/memEntryInfo.do",
		type: "POST",
		dataType : 'json',
		async : false,
		data : {
			"MemberID":MemberID,
			},
		success: function(data){
			console.log(data);
			$("#entryLtbody").empty();
			data.forEach(function(map){
				var trStr = "";
				var OutDate = "";
				var PLockerLocation = "";
				var PLockerGroupName = "";
				var PLockerNo = "";
				var BaejungType = "";
				
				if(map.OutDate !== undefined){
					OutDate = map.OutDate.substring(11,16);
				}
				if(map.PLockerLocation !== undefined){
					PLockerLocation = map.PLockerLocation;
				}
				if(map.PLockerGroupName !== undefined){
					PLockerGroupName = map.PLockerGroupName;
				}
				if(map.PLockerNo !== undefined){
					PLockerNo = map.PLockerNo;
				}
				if(map.BaejungType !== undefined){
					BaejungType = map.BaejungType;
				}
				
				trStr = trStr + "<tr>";
				trStr = trStr + "<td class='EntryDate align-middle white-space-nowrap text-center'>"+map.EntryDate.substring(0,10)+"</td>";
				trStr = trStr + "<td class='InTime align-middle white-space-nowrap text-center'>"+map.EntryDate.substring(11,16)+"</td>";
				trStr = trStr + "<td class='OutTime align-middle white-space-nowrap text-center'>"+OutDate+"</td>";
				trStr = trStr + "<td class='LockerNo align-middle white-space-nowrap text-center'>["+PLockerLocation+"]"+PLockerGroupName+"-"+PLockerNo+"</td>";
				trStr = trStr + "<td class='Type align-middle white-space-nowrap text-center'>"+BaejungType+"</td>";
				trStr = trStr + "</tr>";
				$("#entryLtbody").append(trStr);
			});
		},
		error: function(xhr, status, error){
			console.log("Status: " + status);
			console.log("Error: " + error);
			$('#resultmessage').html('출입체크 오류!\n다시 시도해주시기 바랍니다.');
			$('.modal-footer').empty();
			var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			$('.modal-footer').append(cancelbutton);
			$('#modalButton').click();
			modalcheck = true;
			return false;
		}
	});
}
function memTalkInfo(MemberID){
	$.ajax({
		url:"${pageContext.request.contextPath}/memTalkInfo.do",
		type: "POST",
		dataType : 'json',
		async : false,
		data : {
			"MemberID":MemberID,
			},
		success: function(data){
			$("#talktbody").empty();
			data.forEach(function(map){
				var trStr = "";
				trStr = trStr + "<tr>";
				trStr = trStr + "<td class='RegDate align-middle white-space-nowrap text-center'>"+map.TalkDate+"</td>";
				trStr = trStr + "<td class='Sawon align-middle white-space-nowrap text-center'>"+map.UserName+"</td>";
				trStr = trStr + "<td class='Note align-middle white-space-nowrap text-center'>"+map.TalkText+"</td>";
				if(map.IsFollowUp == "Y"){
					trStr = trStr + "<td class='Bigo align-middle white-space-nowrap text-center'>"+map.FollowUpText+"</td>";
				}else{
					trStr = trStr + "<td class='Bigo align-middle white-space-nowrap text-center'>미조치</td>";	
				}
				trStr = trStr + "</tr>";
				$("#talktbody").append(trStr);
			});
		},
		error: function(xhr, status, error){
			console.log("Status: " + status);
			console.log("Error: " + error);
			$('#resultmessage').html('출입체크 오류!\n다시 시도해주시기 바랍니다.');
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
<script>

function connectWebSocket() {
    $.ajax({
    	url:"${pageContext.request.contextPath}/unilock/check.do",
    	type: "GET",
        success: function(response) {
            // 서버로부터의 응답이 WebSocket 연결 가능 상태를 나타내면
            if(response === "available") {
            	var svgElement = document.querySelector('.wsLockerState #wsLockerStateIcon');
            	if (svgElement) {
            	    svgElement.classList.remove("text-primary", "text-danger", "text-secondary");
            	    svgElement.classList.add("text-primary");
            	}

    			$(".wsLockerState #wsLockerStateText")
    							.removeClass("badge-phoenix-primary badge-phoenix-danger badge-phoenix-secondary")
    							.addClass("badge-phoenix-primary")
    							.text("사용가능");
            } else {
            	var svgElement = document.querySelector('.wsLockerState #wsLockerStateIcon');
            	if (svgElement) {
            	    svgElement.classList.remove("text-primary", "text-danger", "text-secondary");
            	    svgElement.classList.add("text-danger");
            	}

    			$(".wsLockerState #wsLockerStateText")
				    			.removeClass("badge-phoenix-primary badge-phoenix-danger badge-phoenix-secondary")
				    			.addClass("badge-phoenix-danger")
				    			.text("사용불가");
            }
        },
        error: function() {
        	var svgElement = document.querySelector('.wsLockerState #wsLockerStateIcon');
        	if (svgElement) {
        	    svgElement.classList.remove("text-primary", "text-danger", "text-secondary");
        	    svgElement.classList.add("text-secondary");
        	}

			$(".wsLockerState #wsLockerStateText")
							.removeClass("badge-phoenix-primary badge-phoenix-danger badge-phoenix-secondary")
							.addClass("badge-phoenix-secondary")
							.text("사용안함");
        }
    });
}

let lastTime = 0; <%--// 마지막으로 함수가 실행된 시간을 추적하기 위한 변수--%>
const interval = 5000; <%--// 함수 실행 간격 (5초 = 5000ms)--%>

function animate(timestamp) {
    if (timestamp - lastTime >= interval) { <%--// 현재 시간과 마지막 실행 시간의 차이가 interval 이상이면 함수 실행--%>
    	fetchData();
    	connectWebSocket();
        lastTime = timestamp; <%--// 마지막 실행 시간 업데이트--%>
    }

    requestAnimationFrame(animate); <%--// 다음 프레임을 위해 animate 함수 재귀 호출--%>
}

requestAnimationFrame(animate); <%--// 애니메이션 시작--%>

function classState(state,isChange){
	var str = "";
	switch(state){
	case "A": str = "현재원";
		break;
	case "A+": str = "반변경";
		break;
	case "B": str = "만기";
		break;
	case "C": str = "휴회중";
		break;
	case "D": str = "휴회";
		break;
	case "E": str = "환불대기";
		break;
	case "F0": str = "환불";
		break;
	case "G": str = "현재원";
		break;
	case "G+": str = "반변경(+)";
		break;
	case "H-": str = "반변경(-)";
		break;
	case "Y": str = "휴회복귀";
		break;
	}
	if(isChange){
		str = str+"-";
	}
	return str;
}

function setCategory(select){
	if(select.value.split('|').length > 1){
		$("#Lng_Locker_Condition").val(select.value.split('|')[0]);
		$("#Lng_Locker_ManAddNum").val(select.value.split('|')[1]);
		$("#Lng_Locker_WoManAddNum").val(select.value.split('|')[2]);
	}
}

function playAudio(file){
	var audioElement = document.getElementById('audioPlayer');
    audioElement.src = "${pageContext.request.contextPath}/file/Sound/"+file;
    audioElement.load();
    audioElement.play();
}
</script>
</html>