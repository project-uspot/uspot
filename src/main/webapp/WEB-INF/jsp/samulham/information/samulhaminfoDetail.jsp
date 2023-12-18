<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/new_lib/vendors/simplebar/simplebar.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
<link href="${pageContext.request.contextPath}/new_lib/assets/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl">
<link href="${pageContext.request.contextPath}/new_lib/assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
<c:set var="menu_idx" value="10"></c:set>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/lib/js/exeDaumPostCode.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<body style="margin-left: 20px; overflow: hidden;">
<h2 class="mb-4" style="margin-top: 22px; background-color: skyblue; margin-left: -20px;">사물함 분류정보 등록</h2>
<div class="row" >
		<div class="col-sm-6 col-md-4">
           	<div class="form-floating">
              <input class="form-control" id="lockergroupname" name="lockergroupname" type="text" placeholder="사업장명" value="${vo.PLockergroupname}"/>
              <label for="SiteName">분류 </label>
           	</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="form-floating">
				<input class="form-control" id="lockerlocation" name="lockerlocation" type="text" value="${vo.PLockerlocation}"/>
				<label for="SawonNo">위치</label>
			</div>
		</div>
		<br>
		<br>
		<br>
		<div class="col-sm-6 col-md-4" style="margin-left: 1px;">
			<div class="form-floating">
				<select class="form-select" id="lockertype" name="lockertype" value="${vo.PLockertype}">
					<option value="0">일반락커</option>
					<option value="1">옷장</option>
				</select>
				<label for="SawonName">구분</label>
			</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="form-floating">
				<input class="form-control" id="UserID" name="UserID" type="text" value="${vo.sortorder}"/>
				<label for="UserID">순위</label>
			</div>
		</div>
		<br>
		<br>
		<br>
		<div class="col-sm-6 col-md-4">
           	<div class="form-floating">
              <input class="form-control" id="UserPWD" name="UserPWD" type="number" placeholder="비밀번호" value=""/>
              <label for="UserPWD">보증금</label>
           	</div>
		</div>
		<div class="col-sm-6 col-md-4">
			<div class="form-floating">
              <input class="form-control" id="member_pw_confirm" name="member_pw_confirm" type="text" placeholder="비밀번호확인" value="${user.userPWD }" />
              <label for="member_pw_confirm">사용료</label>
			</div>
		</div>
		<div style="margin-left: 531px; margin-top: -21px;"><input type="checkbox" name="color" value="blue"><h1 style="font-size: 10px; margin-left: 15px; margin-top: -11px;">부가세 포함</h1></div>
		<br>
		<br>
		<div class="col-sm-6 col-md-4" style="margin-left: 1px; margin-top: 20px;">
			<div class="form-floating">
					<select class="form-select">
					<option value="${vo.PLockermonth}">${vo.PLockermonth}</option>
						<c:forEach var="cnt" begin="1" end="12">
							<option value="${cnt}">${cnt}</option>
						</c:forEach>
					</select>	
				<label for="ZipCode">기준개월</label>
 				</div>
 			</div>
		<div class="col-sm-6 col-md-4" style="margin-left: 1px; margin-top: 20px;">
			<div class="form-floating">
					<select class="form-select">
					<option value="${vo.dancnt}">${vo.dancnt}</option>
						<c:forEach var="cnt" begin="1" end="10">
							<option value="${cnt}">${cnt}</option>
						</c:forEach>
					</select>	
				<label for="ZipCode">단수량</label>
 				</div>
 			</div>
		<br>
		<br>
		<br>
		<br>
		<div style="margin-left: 9px; margin-top: 305px; position: absolute;"><input type="checkbox" name="color" value="blue">
		<h1 style="font-size: 10px; margin-left: 14px; margin-top: -11px;">신규:</h1></div>
		<div class="col-sm-2 col-md-3" style="margin-left:68px;">
			<div class="form-floating">
				<input class="form-control" id="SubAddress" name="SubAddress" type="date" value="${user.subAddress }" placeholder="상세주소" />
			</div>
		</div>
		<div class="col-sm-6 col-md-2">
			<div class="form-floating">
				<input class="form-control" id="time" name="SubAddress" type="text" value="${user.subAddress }" placeholder="상세주소" />
			</div>
		</div>
		<h2 style="margin-left: 400;position: absolute;margin-top: 295px;">-</h2>
				<div class="col-sm-2 col-md-3" style="margin-left:16px;">
			<div class="form-floating">
				<input class="form-control" id="SubAddress" name="SubAddress" type="date" value="${user.subAddress }" placeholder="상세주소" />
			</div>
		</div>
		<div class="col-sm-6 col-md-2">
			<div class="form-floating">
				<input class="form-control" id="time" name="SubAddress" type="text" value="${user.subAddress }" placeholder="상세주소" />
			</div>
		</div>
		<br>
		<br>
		<br>
		<div style="margin-left: 9px; margin-top: 378px; position: absolute;"><input type="checkbox" name="color" value="blue">
		<h1 style="font-size: 10px; margin-left: 14px; margin-top: -11px;">재등록:</h1></div>
		<div class="col-sm-2 col-md-3" style="margin-left:68px;">
			<div class="form-floating">
				<input class="form-control" id="SubAddress" name="SubAddress" type="date" value="${user.subAddress }" placeholder="상세주소" />
			</div>
		</div>
		<div class="col-sm-6 col-md-2">
			<div class="form-floating">
				<input class="form-control" id="time" name="SubAddress" type="text" value="${user.subAddress }" placeholder="상세주소" />
			</div>
		</div>
		<h2 style="margin-left: 400;position: absolute;margin-top: 367px;">-</h2>
				<div class="col-sm-2 col-md-3" style="margin-left:16px;">
			<div class="form-floating">
				<input class="form-control" id="SubAddress" name="SubAddress" type="date" value="${user.subAddress }" placeholder="상세주소" />
			</div>
		</div>
		<div class="col-sm-6 col-md-2">
			<div class="form-floating">
				<input class="form-control" id="time" name="SubAddress" type="text" value="${user.subAddress }" placeholder="상세주소" />
			</div>
		</div>
		<br>
		<br>
		<br>
		<div style="margin-left: 9px; margin-top: 446px; position: absolute;"><input type="checkbox" name="color" value="blue">
		<h1 style="font-size: 10px; margin-left: 14px; margin-top: -11px;">강습기간:</h1></div>
		<div class="col-sm-2 col-md-3" style="margin-left:68px;">
			<div class="form-floating">
				<input class="form-control" id="SubAddress" name="SubAddress" type="date" value="${user.subAddress }" placeholder="상세주소" />
			</div>
		</div>
		<div class="col-sm-6 col-md-2">
			<div class="form-floating">
				<input class="form-control" id="time" name="SubAddress" type="time" value="" readonly="readonly"/>
			</div>
		</div>
		<h2 style="margin-left: 400;position: absolute;margin-top: 439px;">-</h2>
				<div class="col-sm-2 col-md-3" style="margin-left:16px;">
			<div class="form-floating">
				<input class="form-control" id="SubAddress" name="SubAddress" type="date" value="${user.subAddress }" placeholder="상세주소"/>
			</div>
		</div>
		<div class="col-sm-6 col-md-2">
			<div class="form-floating">
				 <input type="number" min="0" max="23" placeholder="23" class="form-control"><h1>:</h1><input type="number" min="0" max="59" placeholder="00" class="form-control">
			</div>
		</div>
		</div>
</body>