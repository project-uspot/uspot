<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강습종목정보 변경</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/favicon-16x16.png">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/favicon.ico">
<link rel="manifest" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/manifest.json">
<meta name="msapplication-TileImage" content="${pageContext.request.contextPath}/new_lib/assets/img/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">
<meta name="robots" content="noindex">
<script src="${pageContext.request.contextPath}/new_lib/vendors/imagesloaded/imagesloaded.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/assets/js/config.js"></script>
<%-- <script src="${pageContext.request.contextPath}/new_lib/js/theme/flatpickr.js"></script> --%>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.js" integrity="sha512-K/oyQtMXpxI4+K0W7H25UopjM8pzq0yrVdFdG21Fh5dBe91I40pDd9A4lzNlHPHBIP2cwZuoxaUSX0GJSObvGA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>


<!-- ===============================================-->
<!--    Stylesheets-->
<!-- ===============================================-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/new_lib/vendors/simplebar/simplebar.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
<link href="${pageContext.request.contextPath}/new_lib/assets/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl">
<link href="${pageContext.request.contextPath}/new_lib/assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
<link href="${pageContext.request.contextPath}/new_lib/assets/css/user-rtl.min.css" type="text/css" rel="stylesheet" id="user-style-rtl">
<link href="${pageContext.request.contextPath}/new_lib/assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
<link href="${pageContext.request.contextPath}/new_lib/scss/theme/_navbar-vertical.scss" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/new_lib/vendors/dropzone/dropzone.min.css" rel="stylesheet" />
<%-- <link href="${pageContext.request.contextPath}/new_lib/vendors/flatpickr/flatpickr.min.css" rel="stylesheet" /> --%>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.css" integrity="sha512-MQXduO8IQnJVq1qmySpN87QQkiR1bZHtorbJBD0tzy7/0U9+YIC93QWHeGTEoojMVHWWNkoCp8V6OzVSYrX0oQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.css" integrity="sha512-EM9iXXndA8L72Sgf6i5hYHnfcGNchX5oDY6E/GNvb6CXyEXxyzXeSiXHK9UEpQw+cKD8C4ZU/Qn4HI0z8JPENg==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
</head>
<body>
	<div class="mb-2">
		<h2 class="mt-5 ml-3">강습종목정보 변경</h2>
		<div class="col-md-11">
				<form method="post" id="frm"  name="frm" action="updateItem01.do" class="g-3 mb-6">
					<input type="hidden" id="GroupID" name="GroupID" value="${item01.groupID }">
					<div class="row ml-1">
						<div class="col-auto gy-6">
							<label class="col-form-label" for="GroupName">강습종목 </label>
						</div>
						<div class="col-sm-5 gy-6">
							<input class="form-control" value="${item01.groupName }" id="GroupName" name="GroupName" type="text" placeholder="강습종목" />
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-auto mt-2">
							<label class="col-auto col-form-label">접수유형</label>
						</div>
						<div class="col-auto">
							<div class="row">
								<div class="col-auto mt-2">
									<div class="form-check form-check-inline">
										<input type="radio" class="jsType form-check-input" name="jsType" id="jsType0" value="0" <c:if test="${item01.jsType eq '0' }">checked</c:if>>
										<label class="form-check-label" for="jsType0">정시접수</label>                                        
									</div>                                                                                                    
								</div>
							</div>
							<div class="row">
								<div class="col-auto mt-2">
									<div class="form-check form-check-inline ">                                                               
										<input type="radio" class="jsType form-check-input" name="jsType" id="jsType1" value="1" checked="checked" <c:if test="${item01.jsType eq '1'}">checked</c:if>>
										<label class="form-check-label" for="jsType1">수시접수</label>      
									</div>
								</div>
								<div class="col-auto mt-2 ml-n5">
									<font>: 접수인원체크 : 당일기준, 강좌시작일 : 당일 + 0일, <br>강좌기간 :1개월(당월처리 체크시 등록일~당월 마지막일) </font>                                  
								</div> 
							</div>
							<div class="row">
								<div class="col-auto mt-2">
									<div class="form-check form-check-inline ">                                                               
										<input type="checkbox" class="jsType form-check-input" name="JungSiType1StopChk" id="JungSiType1Stop" value="Y" <c:if test="${item01.jungSiType1Stop eq 'Y' }">checked</c:if>>
										<label class="form-check-label" for="JungSiType1Stop">수시접수중지</label>      
									</div>
								</div>
								<div class="col-auto mt-2">
									<div class="form-check form-check-inline ">                                                               
										<input type="checkbox" class="jsType form-check-input" name="JungSi3MonthGbnChk" id="JungSi3MonthGbn" value="Y" <c:if test="${item01.jungSi3MonthGbn eq 'Y' }">checked</c:if>>
										<label class="form-check-label" for="JungSi3MonthGbn">수시접수 시 강습기간 당월 처리</label>      
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<div class="card">
								<div class="card-body" >
									<div class="card-header">추첨강좌 기간설정</div>
									<div class="row">
										<div class="form-check form-check-inline col-auto" style="margin:40px -20px 0px 23px;">
											<input type="checkbox" class="dcType form-check-input " id="lottery" value="Y">
											<label class="form-check-label" for="lottery">추첨접수 :</label>
										</div>
										<div class="col-auto gy-4 ">
											<label class="form-label" for="JungSiLotteryFromDate">Start Date</label>
											<input class="form-control" value="${item01.jungSiLotteryFromDate.split(' ')[0]}" id="JungSiLotteryFromDate" name="LotteryFromDate" type="date" disabled  />
										</div>
										<div class="col-auto gy-7 ml-n4">
											<input class="form-control timepicker" value="${item01.jungSiLotteryFromDate.split(' ')[1]}" id="JungSiLotteryFromTime" name="LotteryFromTime" type="text" style="width: 135px" disabled/>
										</div>
										<div class="col-auto gy-8 ms-n4">
										~
										</div>
										<div class="col-auto gy-4 ">
											<label class="form-label" for="JungSiLotteryToDate">End Date</label>
											<input class="form-control" value="${item01.jungSiLotteryToDate.split(' ')[0]}" id="JungSiLotteryToDate" name="LotteryToDate" type="date" disabled/>
										</div>
										<div class="col-auto gy-7 ml-n4">
											<input class="form-control timepicker" value="${item01.jungSiLotteryToDate.split(' ')[1]}" id="JungSiLotteryToTime" name="LotteryToTime" type="text" style="width: 135px" disabled/>
										</div>
									</div>
									<div class="row">
										<div class="col-auto gy-4 ">
											<label class="col-form-label" for="JungSiLotteryDate" style="margin: 0px -22px 0px 26px">추첨일</label>
										</div>
										<div class="col-auto gy-4">
											<input class="form-control" value="${item01.jungSiLotteryDate }" id="JungSiLotteryDate" name="JungSiLotteryDate" type="date" disabled/>
										</div>
									</div>
									<div class="row">
										<div class="form-check form-check-inline col-auto" style="margin:40px -20px 0px 23px;">
											<input type="checkbox" class="dcType form-check-input " id="lottrypay" maxlength="1" value="U">
											<label class="form-check-label" for="lottrypay">추첨결제 :</label>
										</div>
										<div class="col-auto gy-4 ">
											<label class="form-label" for="JungSiLotteryPayFromDate">Start Date</label>
											<input class="form-control" value="${item01.jungSiLotteryPayFromDate.split(' ')[0]}" id="JungSiLotteryPayFromDate" name="LotteryPayFromDate" type="date" disabled />
										</div>
										<div class="col-auto gy-7 ml-n4">
											<input class="form-control timepicker" value="${item01.jungSiLotteryPayFromDate.split(' ')[1]}" id="JungSiLotteryPayFromTime" name="LotteryPayFromTime" type="text" style="width: 135px" disabled/>
										</div>
										<div class="col-auto gy-8 ms-n4">
										~
										</div>
										<div class="col-auto gy-4 ">
											<label class="form-label" for="JungSiLotteryPayToDate">End Date</label>
											<input class="form-control" value="${item01.jungSiLotteryPayToDate.split(' ')[0]}" id="JungSiLotteryPayToDate" name="LotteryPayToDate" type="date" disabled />
										</div>
										<div class="col-auto gy-7 ml-n4">
											<input class="form-control timepicker" value="${item01.jungSiLotteryPayToDate.split(' ')[1]}" id="JungSiLotteryPayToTime" name="LotteryPayToTime" type="text" style="width: 135px" disabled/>
										</div>
									</div>
									<div class="row">
										<div class="form-check form-check-inline col-auto" style="margin:40px -20px 0px 23px;">
											<input type="checkbox" class="dcType form-check-input " id="lotteryadd" maxlength="1" value="U">
											<label class="form-check-label" for="lotteryadd">추첨강좌 :<br>(선착순)</label>
										</div>
										<div class="col-auto gy-4 ">
											<label class="form-label" for="JungSiLotteryAddFromDate">Start Date</label>
											<input class="form-control" value="${item01.jungSiLotteryAddFromDate.split(' ')[0]}" id="JungSiLotteryAddFromDate" name="LotteryAddFromDate" type="date" disabled/>
										</div>
										<div class="col-auto gy-7 ml-n4">
											<input class="form-control timepicker" value="${item01.jungSiLotteryAddFromDate.split(' ')[1]}" id="JungSiLotteryAddFromTime" name="LotteryAddFromTime" type="text" style="width: 135px" disabled/>
										</div>
										<div class="col-auto gy-8 ms-n4">
										~
										</div>
										<div class="col-auto gy-4 ">
											<label class="form-label" for="JungSiLotteryAddToDate">End Date</label>
											<input class="form-control" value="${item01.jungSiLotteryAddToDate.split(' ')[0]}" id="JungSiLotteryAddToDate" name="LotteryAddToDate" type="date" disabled/>
										</div>
										<div class="col-auto gy-7 ml-n4">
											<input class="form-control timepicker" value="${item01.jungSiLotteryAddToDate.split(' ')[0]}" id="JungSiLotteryAddToTime" name="LotteryAddToTime" type="text" style="width: 135px" disabled/>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-auto gy-4 ">
									<label class="col-auto col-form-label" for="JungSi1Inlive">구민신규 </label>
								</div>
								<div class="col-auto gy-4">
									<input class="form-control" value="${item01.jungSi1Inlive }" id="JungSi1Inlive" name="JungSi1Inlive" type="date"/>
								</div>
								<div class="col-auto gy-4">
									<label>구민신규 : 구민외엔 신규접수 불가</label>
								</div>
							</div>
							<div class="row">
								<div class="form-check form-check-inline col-sm-2" style="margin:40px -64px 0px 23px;">
									<input type="checkbox" class="dcType form-check-input "  id="jungsi1">
									<label class="form-check-label" for="dcType2">신규 :</label>
								</div>
								<div class="col-auto">
									<label class="form-label" for="JungSi1Start">Start Date</label>
									<input class="form-control" id="JungSi1Start" name="JungSi1Start" type="date" value="${item01.jungSi1.split('~')[0]}"/>
								</div>
								<div class="col-auto gy-4 ml-n4">
									<input class="form-control timepicker" id="JungSi1STime" name="JungSi1STime" type="text" value="${item01.jungSi1STime }" style="width: 135px"  />
								</div>
								<div class="col-auto gy-5 ms-n4">
								~
								</div>
								<div class="col-auto">
									<label class="form-label" for="JungSi1End">End Date</label>
									<input class="form-control" id="JungSi1End" name="JungSi1End" type="date" value="${item01.jungSi1.split('~')[1]}" />
								</div>
								<div class="col-auto gy-4 ml-n4">
									<input class="form-control timepicker" id="JungSi1ETime" name="JungSi1ETime" type="text" value="${item01.jungSi1ETime }" style="width: 135px" />
								</div>
								<font style="margin-left: 100px;">신규 : 구민(1일간 설정), 구외 : 말일까지 설정</font>
							</div>
							<div class="row">
								<div class="form-check form-check-inline col-sm-2" style="margin:40px -64px 0px 23px;">
									<input type="checkbox" class="dcType form-check-input "  id="jungsi2" >
									<label class="form-check-label" for="dcType2">재등록:</label>
								</div>
								<div class="col-auto">
									<label class="form-label" for="JungSi2Start">Start Date</label>
									<input class="form-control" id="JungSi2Start" name="JungSi2Start" type="date" value="${item01.jungSi2.split('~')[0]}" />
								</div>
								<div class="col-auto gy-4 ml-n4">
									<input class="form-control timepicker" id="JungSi2STime" name="JungSi2STime" type="text" value="${item01.jungSi2STime }" style="width: 135px" />
								</div>
								<div class="col-auto gy-5 ms-n4">
								~
								</div>
								<div class="col-auto">
									<label class="form-label" for="JungSi2End">End Date</label>
									<input class="form-control" id="JungSi2End" name="JungSi2End" type="date" value="${item01.jungSi2.split('~')[1]}"  />
								</div>
								<div class="col-auto gy-4 ml-n4">
									<input class="form-control timepicker" id="JungSi2ETime" name="JungSi2ETime" type="text" value="${item01.jungSi2ETime }" style="width: 135px" />
								</div>
							</div>
							<div class="row">
								<div class="form-check form-check-inline col-sm-2" style="margin:40px -64px 0px 23px;">
									<input type="checkbox" class="dcType form-check-input " id="jungsi3" >
									<label class="form-check-label" for="dcType2">강습기간:</label>
								</div>
								<div class="col-auto gy-3">
									<label class="form-label" for="JungSi3Start">Start Date</label>
									<input class="form-control" id="JungSi3Start" name="JungSi3Start" type="date" value="${item01.jungSi3.split('~')[0]}"   />
								</div>
								<div class="col-auto gy-7 ms-n4">
								~
								</div>
								<div class="col-auto gy-3">
									<label class="form-label" for="JungSi3End">Start Date</label>
									<input class="form-control" id="JungSi3End" name="JungSi3End" type="date" value="${item01.jungSi3.split('~')[1]}"  />
								</div>
							</div>
							<div class="col-md-9 gy-4 ">
								<div class="row my-3">
									<label class="col-sm-4 col-form-label" for="AgainMonth">재등록 이용가능 개월</label>
									<div class="col-sm-4">
										<select class="form-select" id="AgainMonth" name="AgainMonth">
											<option value="0" <c:if test="${item01.againMonth eq '0' }">selected</c:if>>0</option>
											<option value="1" <c:if test="${item01.againMonth eq '1' }">selected</c:if>>1</option>
											<option value="2" <c:if test="${item01.againMonth eq '2' }">selected</c:if>>2</option>
											<option value="3" <c:if test="${item01.againMonth eq '3' }">selected</c:if>>3</option>
											<option value="4" <c:if test="${item01.againMonth eq '4' }">selected</c:if>>4</option>
											<option value="5" <c:if test="${item01.againMonth eq '5' }">selected</c:if>>5</option>
											<option value="6" <c:if test="${item01.againMonth eq '6' }">selected</c:if>>6</option>
											<option value="7" <c:if test="${item01.againMonth eq '7' }">selected</c:if>>7</option>
											<option value="8" <c:if test="${item01.againMonth eq '8' }">selected</c:if>>8</option>
											<option value="9" <c:if test="${item01.againMonth eq '9' }">selected</c:if>>9</option>
											<option value="10" <c:if test="${item01.againMonth eq '10' }">selected</c:if>>10</option>
											<option value="11" <c:if test="${item01.againMonth eq '11' }">selected</c:if>>11</option>
											<option value="12" <c:if test="${item01.againMonth eq '12' }">selected</c:if>>12</option>
										</select>
									</div>
								</div>
							</div>
						
						</div>
					</div>
					<div class="row">
						<div class="col-auto gy-6">
							<div class="form-floating">
								<input class="form-control" id="SortOrder" name="SortOrder" type="text" placeholder="정렬순서" value="${item01.sortOrder }"/>
								<label for="SortOrder">정렬순서</label>
							</div>
						</div>
						<div class="col-auto gy-6">
							<div class="form-check form-check-inline">
								<input type="checkbox" class="MonthSelNo form-check-input" name="MonthSelNoChk" id="MonthSelNo" maxlength="1" value="Y" <c:if test="${item01.monthSelNo eq 'Y' }">checked</c:if>>
								<label class="form-check-label" for="MonthSelNo">다개월 선택 불가</label>
							</div>
						</div>
						<div class="col-auto gy-6">
							<div class="form-check form-check-inline ">
								<input type="checkbox" class="dcType form-check-input" name="WebYNChk" id="WebYN" maxlength="1" value="Y" <c:if test="${item01.webYN eq 'Y' }">checked</c:if>>
								<label class="form-check-label" for="WebYN">온라인 사용</label>
							</div>
						</div>
						<div class="col-auto gy-6">
							<div class="form-check form-check-inline ">
								<input type="checkbox" class="dcType form-check-input" name="IsDeleteChk" id="IsDelete" maxlength="1" value="Y" <c:if test="${item01.isDelete eq 'Y' }">checked</c:if>>
								<label class="form-check-label" for="IsDelete">삭제</label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 gy-6">
							<div class="form-floating">
								<select class="form-select" id="ItemRejectCnt" name="ItemRejectCnt">
									<option value="0"<c:if test="${item01.itemRejectCnt eq '0' }">selected</c:if>>0</option>
									<option value="1"<c:if test="${item01.itemRejectCnt eq '1' }">selected</c:if>>1</option>
									<option value="2"<c:if test="${item01.itemRejectCnt eq '2' }">selected</c:if>>2</option>
									<option value="3"<c:if test="${item01.itemRejectCnt eq '3' }">selected</c:if>>3</option>
								</select>
								<label for="ItemRejectCnt">1인</label>
							</div>
						</div>
						<div class="col-auto gy-6">
							<font>강좌등록 제한건수(0:제한없음)</font>
						</div>
					</div>
					<div class="row">
						<div class="col-auto gy-6">
							<div class="form-floating">
								<input class="form-control" id="PayDelayTime" name="PayDelayTime" type="text" value="${item01.payDelayTime }" placeholder="일일권 미결제 삭제시간" />
								<label for="PayDelayTime">일일권 미결제 삭제시간</label>
							</div>
						</div>
						<div class="col-auto gy-6">
							<font>(공백, 0: 삭제하지 않은)(온라인만 삭제) <br>"일일권강좌"등록시점 이후 입력시간 동안 미결제 시 삭제 처리</font>
						</div>
					</div>
				</form>
		</div>
	</div>
	<div class="modal-footer">
		<input type="button" class="btn btn-warning px-5"  value="수정" id="modify" onclick="valueChk();"/>
		<!-- <button class="btn btn-outline-primary px-5" type="button" data-bs-dismiss="modal">취소</button> -->
	</div>
	<script>
		$('.timepicker').timepicker({
		    timeFormat: 'HH:mm p',
		    interval: 05,
		    minTime: '00',
		    maxTime: '23:55',
		    startTime: '00:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
		
		function jsType1() {
		    var jsType = "${item01.jsType}";

		    // 기간설정 체크박스와 날짜 입력 필드 관리
		    if (jsType === '1') {
		    	$('#JungSi1Start').prop('disabled', true);
	            $('#JungSi1STime').prop('disabled', true);
	            $('#JungSi1End').prop('disabled', true);
	            $('#JungSi1ETime').prop('disabled', true);
	            $('#JungSi2Start').prop('disabled', true);
	            $('#JungSi2STime').prop('disabled', true);
	            $('#JungSi2End').prop('disabled', true);
	            $('#JungSi2ETime').prop('disabled', true);
	            $('#JungSi3Start').prop('disabled', true);
	            $('#JungSi3End').prop('disabled', true);
		    	
		    } else {
		    	$('#JungSi1Start').prop('disabled', false);
	            $('#JungSi1STime').prop('disabled', false);
	            $('#JungSi1End').prop('disabled', false);
	            $('#JungSi1ETime').prop('disabled', false);
	            $('#JungSi2Start').prop('disabled', false);
	            $('#JungSi2STime').prop('disabled', false);
	            $('#JungSi2End').prop('disabled', false);
	            $('#JungSi2ETime').prop('disabled', false);
	            $('#JungSi3Start').prop('disabled', false);
	            $('#JungSi3End').prop('disabled', false);
		    }
		}
		// 초기 설정을 위해 함수 호출
		jsType1();
		
		$(document).ready(function(){
		    // 체크박스 변경 시 실행되는 함수
		    $('#lottery').change(function(){
		        if($(this).is(':checked')) {
		            // 체크되었을 때 필드들을 활성화
		            $('#JungSiLotteryFromDate').prop('disabled', false);
		            $('#JungSiLotteryFromTime').prop('disabled', false);
		            $('#JungSiLotteryToDate').prop('disabled', false);
		            $('#JungSiLotteryToTime').prop('disabled', false);
		            $('#JungSiLotteryDate').prop('disabled', false);
		        } else {
		            // 체크가 해제되었을 때 필드들을 비활성화
		            $('#JungSiLotteryFromDate').prop('disabled', true).val('');
		            $('#JungSiLotteryFromTime').prop('disabled', true).val('');
		            $('#JungSiLotteryToDate').prop('disabled', true).val('');
		            $('#JungSiLotteryToTime').prop('disabled', true).val('');
		            $('#JungSiLotteryDate').prop('disabled', true).val('');
		        }
		    });
		    $('#lottrypay').change(function(){
		        if($(this).is(':checked')) {
		            // 체크되었을 때 필드들을 활성화
		            $('#JungSiLotteryPayFromDate').prop('disabled', false);
		            $('#JungSiLotteryPayFromTime').prop('disabled', false);
		            $('#JungSiLotteryPayToDate').prop('disabled', false);
		            $('#JungSiLotteryPayToTime').prop('disabled', false);
		        } else {
		            // 체크가 해제되었을 때 필드들을 비활성화
		            $('#JungSiLotteryPayFromDate').prop('disabled', true).val('');
		            $('#JungSiLotteryPayFromTime').prop('disabled', true).val('');
		            $('#JungSiLotteryPayToDate').prop('disabled', true).val('');
		            $('#JungSiLotteryPayToTime').prop('disabled', true).val('');
		        }
		    });
		    $('#lotteryadd').change(function(){
		        if($(this).is(':checked')) {
		            // 체크되었을 때 필드들을 활성화
		            $('#JungSiLotteryAddFromDate').prop('disabled', false);
		            $('#JungSiLotteryAddFromTime').prop('disabled', false);
		            $('#JungSiLotteryAddToDate').prop('disabled', false);
		            $('#JungSiLotteryAddToTime').prop('disabled', false);
		        } else {
		            // 체크가 해제되었을 때 필드들을 비활성화
		            $('#JungSiLotteryAddFromDate').prop('disabled', true).val('');
		            $('#JungSiLotteryPayFromTime').prop('disabled', true).val('');
		            $('#JungSiLotteryAddToDate').prop('disabled', true).val('');
		            $('#JungSiLotteryAddToTime').prop('disabled', true).val('');
		        }
		    });
		    $('#jungsi1').change(function(){
		        if($(this).is(':checked')) {
		            // 체크되었을 때 필드들을 활성화
		            $('#JungSi1Start').prop('disabled', false);
		            $('#JungSi1STime').prop('disabled', false);
		            $('#JungSi1End').prop('disabled', false);
		            $('#JungSi1ETime').prop('disabled', false);
		        } else {
		            // 체크가 해제되었을 때 필드들을 비활성화
		            $('#JungSi1Start').prop('disabled', true).val('');
		            $('#JungSi1STime').prop('disabled', true).val('');
		            $('#JungSi1End').prop('disabled', true).val('');
		            $('#JungSi1ETime').prop('disabled', true).val('');
		        }
		    });
		    $('#jungsi2').change(function(){
		        if($(this).is(':checked')) {
		            // 체크되었을 때 필드들을 활성화
		            $('#JungSi2Start').prop('disabled', false);
		            $('#JungSi2STime').prop('disabled', false);
		            $('#JungSi2End').prop('disabled', false);
		            $('#JungSi2ETime').prop('disabled', false);
		        } else {
		            // 체크가 해제되었을 때 필드들을 비활성화
		            $('#JungSi2Start').prop('disabled', true).val('');
		            $('#JungSi2STime').prop('disabled', true).val('');
		            $('#JungSi2End').prop('disabled', true).val('');
		            $('#JungSi2ETime').prop('disabled', true).val('');
		        }
		    });
		    $('#jungsi3').change(function(){
		        if($(this).is(':checked')) {
		            // 체크되었을 때 필드들을 활성화
		            $('#JungSi3Start').prop('disabled', false);
		            $('#JungSi3End').prop('disabled', false);
		        } else {
		            // 체크가 해제되었을 때 필드들을 비활성화
		            $('#JungSi3Start').prop('disabled', true).val('');
		            $('#JungSi3End').prop('disabled', true).val('');
		        }
		    });
		   

		    // 라디오 버튼 변경 시 실행되는 함수
		    $('input[name="jsType"]').change(function(){
		        var value = $(this).val();
		        // 첫 번째 라디오 버튼이 선택되면 아래의 요소들을 활성화하고, 나머지를 비활성화
		        if (value === '0') {
		            $('#jungsi1, #JungSi1Start, #JungSi1STime, #JungSi1End, #JungSi1ETime, #jungsi2, #JungSi2Start, #JungSi2STime, #JungSi2End, #JungSi2ETime, #jungsi3, #JungSi3Start, #JungSi3End').prop('disabled', false);
		        } else {
		        	$('#jungsi1, #JungSi1Start, #JungSi1STime, #JungSi1End, #JungSi1ETime, #jungsi2, #JungSi2Start, #JungSi2STime, #JungSi2End, #JungSi2ETime, #jungsi3, #JungSi3Start, #JungSi3End').prop('disabled', true);
		        }
		    });
		});
		
		function valueChk() {
			var frm = document.frm; 
	        
			if(confirm("수정하시겠습니까?")) {
				
				frm.submit();
			} else {
				return false;
			}
		}
		
				
		
		
	</script>
</body>
</html>