<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사물함코드 등록 및 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f4f4f4;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	background-color: #fff;
	color: #000;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.container h2 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 24px;
	background-color: #00a2ff;
	color: #fff;
	padding: 10px;
	border-radius: 5px 5px 0 0;
	margin: 0;
}

form {
	margin: 20px 0;
}

form div {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 15px 0;
}

form label, form input, form select {
	flex: 1;
}

form input, form select {
	padding: 10px;
	width: 30%;
}

button {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
}
</style>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<h2>사물함코드 등록 및 변경</h2>
		<form action="lockercodeinsert.do" method="post">
			<div>
				<label for="plockergroupname" style="font-size: 16px;">사물함
					분류</label> 
					<select id="plockergroupname" name=pLockerGroupID style="margin-top: 10px;" onchange="plockernovalue()">
					<c:forEach var="list" items="${list}">
						<option value="${list.PLockerGroupID}">${list.PLockerGroupName}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<label for="pLockerNO" style="font-size: 16px;">사물함 번호</label> 
				<input type="number" name="pLockerNO" style="margin-top: 10px;" id="plockerno">
			</div>
			<div>
				<label for="sortOrder" style="font-size: 16px;">순서</label> 
				<input type="number" name="sortOrder" style="margin-top: 10px;" value="${sortorder}">
			</div>
			<div>
				<label for="state" style="font-size: 16px;">상태</label> 
				<select id="state" name="state" style="margin-top: 10px;" onchange="handleStateChange()">
					<option value="1">빈락커</option>
					<option value="2">사용중</option>
					<option value="3">고장</option>
					<option value="4">사용가능</option>
					<option value="5">사용불가</option>
				</select>
			</div>
			<div>
				<label for="repairID" style="font-size: 16px;">고장사유</label> 
				<select id="repairID" name="repairID" style="margin-top: 10px;" disabled>
					<option value="0"></option>
					<option value="803">키뭉치 파손</option>
					<option value="804">키분실</option>
				</select>
			</div>
			<!--  <nav style="padding-right: 160px; margin-top: -10px;">
  		<input type="checkbox" id="isdelete" name="isdelete">
  		<label for="isdelete">삭제</label>
  		</nav> -->
			<button type="submit" style="margin-top: 20px;">저장</button>
		</form>
	</div>
	<script>
	
	  var PLockergroupid = document.getElementById("plockergroupname").value;
	
	  var selectElement = document.getElementById("plockergroupname");
	  var selectedIndex = selectElement.selectedIndex;
	  var plockergroupname = selectElement.options[selectedIndex].text;
	
	
	$.ajax({
		type : 'POST',
		url : 'plockernovalue',
		data : {
			PLockerGroupName : plockergroupname
		},
		success : function(data) {
			console.log(data);
				document.getElementById("plockerno").value = Number(data)+1;
		},
		error : function(request, status, error) {
			$("#errorMessage").text("오류 발생");
		}
	});
	
		function plockernovalue(){
			
			  var selectElement = document.getElementById("plockergroupname");
			  var selectedIndex = selectElement.selectedIndex;
			  var plockergroupname = selectElement.options[selectedIndex].text;
			
			$.ajax({
				type : 'POST',
				url : 'plockernovalue',
				data : {
					PLockerGroupName : plockergroupname
				},
				success : function(data) {
					console.log(data);
						document.getElementById("plockerno").value = Number(data)+1;
				},
				error : function(request, status, error) {
					$("#errorMessage").text("오류 발생");
				}
			});
		}
		
		if (state.value === '3') {
			// "고장"이 "상태" 드롭다운에서 선택된 경우 "고장 원인" 드롭다운을 활성화합니다.
			repairid.disabled = false;
		}
	
		function handleStateChange() {
			const state = document.getElementById('state');
			const repairid = document.getElementById('repairID');

			if (state.value === '3') {
				// "고장"이 "상태" 드롭다운에서 선택된 경우 "고장 원인" 드롭다운을 활성화합니다.
				repairid.disabled = false;
			} else {
				// "고장" 이외의 다른 옵션을 "상태" 드롭다운에서 선택한 경우 "고장 원인" 드롭다운을 재설정하고 비활성화합니다.
				repairid.value = '0';
				repairid.disabled = true;
			}
		}
	</script>
</body>
</html>
