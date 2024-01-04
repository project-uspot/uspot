<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강습반 정보 변경</title>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.js" integrity="sha512-K/oyQtMXpxI4+K0W7H25UopjM8pzq0yrVdFdG21Fh5dBe91I40pDd9A4lzNlHPHBIP2cwZuoxaUSX0GJSObvGA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    




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
<link href="${pageContext.request.contextPath}/new_lib/vendors/flatpickr/flatpickr.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.css" integrity="sha512-MQXduO8IQnJVq1qmySpN87QQkiR1bZHtorbJBD0tzy7/0U9+YIC93QWHeGTEoojMVHWWNkoCp8V6OzVSYrX0oQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.css" integrity="sha512-EM9iXXndA8L72Sgf6i5hYHnfcGNchX5oDY6E/GNvb6CXyEXxyzXeSiXHK9UEpQw+cKD8C4ZU/Qn4HI0z8JPENg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">

</head>
<body>
	<div class="card h-100">
		<div class="card-body pb-3">
			<div class="col-12 col-xxl-8">
				<div class="mb-6">
					<div class="row g-3">
      					<h3 class="mb-4" style="padding-top: 5px; width: 265px;">강습종목정보 변경</h3>
						<div class="col-auto">
							<input type="button" class="btn btn-warning px-5"  value="수정(F3)" id="modify" onclick="valueChk();"/>
						</div>
          			</div>
					<div class="col-xl-12">
						<form action="updateItem.do" method="post" id="frm" name="frm">
							<input type="hidden" id="check_id_result" value=""><!-- 아이디 중복체크 결과 -->
							<input type="hidden" name="ItemID" value="${item.itemID}">
							<ul class="nav nav-underline" id="myTab" role="tablist">
								<li class="nav-item">
									<a class="nav-link active" id="learn-tab" data-bs-toggle="tab" href="#tab-learn" role="tab" aria-controls="tab-learn" aria-selected="true">기본정보</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="cost-tab" data-bs-toggle="tab" href="#tab-cost" role="tab" aria-controls="tab-cost" aria-selected="false">강좌세부내용</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="propose-tab" data-bs-toggle="tab" href="#tab-propose" role="tab" aria-controls="tab-propose" aria-selected="false">이미지등록</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="consulting-tab" data-bs-toggle="tab" href="#tab-consulting" role="tab" aria-controls="tab-consulting" aria-selected="false">첨부파일</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="otherlearn-tab" data-bs-toggle="tab" href="#tab-otherlearn" role="tab" aria-controls="tab-otherlearn" aria-selected="false">메모</a>
								</li>
							</ul>
							<div class="tab-content mt-3" id="myTabContent">
								<div class="tab-pane fade show active" id="tab-learn" role="tabpanel" aria-labelledby="learn-tab">
									<div class="card-group">
										<div class="card p-3" >
											<div class="card-body">
												<div class="row g-3 mb-6">
													<div class="col-sm-5 col-md-7">
														<div class="form-floating input-group">
															<input class="form-control" id="ItemCode" name="ItemCode" type="text" placeholder="강습반코드" value="${item.itemCode}" />
															<label for="ItemCode">강습반코드</label>
															<button class="btn btn-danger me-1 mb-1" type="button" onclick="noCheck_to_srk()">중복확인</button><br>
														</div>
														<span id="Code_no_text"></span>
													</div>
													<div class="col-sm-6 col-md-5 mb-2" >
														<div class="form-floating">
															<select class="form-select" id="Type" name="Type">
																<option value="G" <c:if test="${item.type eq 'G' }">selected</c:if>>일반</option>
																<option value="S" <c:if test="${item.type eq 'S' }">selected</c:if>>특강</option>
															</select>
															<label for="Type">구분</label>
														</div>
													</div>
													<div class="col-sm-6 col-md-6 mb-2">
														<div class="form-floating">
															<select class="form-select" id="GroupID" name="GroupID">
																<c:forEach items="${item01}" var="list01">
																	<option value="${list01.groupID }" <c:if test="${list01.groupID eq item.groupID}">selected</c:if>>${list01.groupName }</option>
																</c:forEach>
															</select>
															<label for="GroupID">종목</label>
														</div>
													</div>
													<div class="col-sm-6 col-md-6 mb-2">
														<div class="form-floating">
															<select class="form-select" id="SubGroupID" name="SubGroupID">
																<c:forEach items="${item02}" var="list02">
																	<option value="${list02.subGroupID }" <c:if test="${list02.subGroupID eq item.subGroupID}">selected</c:if>>${list02.subGroupName }</option>
																</c:forEach>
															</select>
															<label for="SubGroupID">강습반명</label>
														</div>
													</div>
													<div class="col-sm-6 col-md-6 mb-2">
														<div class="form-floating">
															<select class="form-select" id="LevelID" name="LevelID">
																<c:forEach items="${item03}" var="list03">
																	<option value="${list03.levelID }" <c:if test="${list03.levelID eq item.levelID}">selected</c:if> >${list03.levelName }</option>
																</c:forEach>
															</select>
															<label for="LevelID">단계</label>
														</div>
													</div>
													<div class="col-sm-6 col-md-6 mb-2">
														<div class="form-floating">
															<select class="form-select" id="DaeSangID" name="DaeSangID">
																<c:forEach items="${tblcode}" var="listcode">
																	<option value="${listcode.pkid }" >${listcode.codeName }</option>
																</c:forEach>
															</select>
															<label for="DaeSangID">대상</label>
														</div>
													</div>
													<div class="col-sm-6 col-md-4 mb-2">
														<input class="form-check-input" id="fromChk" type="checkbox" onchange="fromTime()"  />
														<label class="form-label" for="FromTime">강습 시작시간</label>
														<input class="form-control datetimepicker" value="${item.fromTime }" id="FromTime" name="FromTime" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
													</div>
													<div class="col-sm-6 col-md-4 mb-2">
														<input class="form-check-input" id="toChk" type="checkbox" onchange="toTime()" />
														<label class="form-label" for="ToTime">강습 종료시간</label>
														<input class="form-control datetimepicker" value="${item.toTime }" id="ToTime" name="ToTime" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
													</div>
													<div class="col-sm-6 col-md-4 mb-2" style="margin-top: 30px;">
														<div class="form-floating">
															<select class="form-select"  id="ClassCnt" name="ClassCnt">
																<option value="1" <c:if test="${item.classCnt eq '1' }">selected</c:if>>1</option>
																<option value="2" <c:if test="${item.classCnt eq '2' }">selected</c:if>>2</option>
																<option value="3" <c:if test="${item.classCnt eq '3' }">selected</c:if>>3</option>
																<option value="4" <c:if test="${item.classCnt eq '4' }">selected</c:if>>4</option>
																<option value="5" <c:if test="${item.classCnt eq '5' }">selected</c:if>>5</option>
																<option value="6" <c:if test="${item.classCnt eq '6' }">selected</c:if>>6</option>
																<option value="7" <c:if test="${item.classCnt eq '7' }">selected</c:if>>7</option>
															</select>
															<label for="ClassCnt">강습 횟수</label>
														</div>
													</div>
													<div class="card">
														<div class="card-body" >
															<div class="row">
																<div class="col-sm-6 col-md-6 mb-2">
																	<input class="form-check-input" name="Mon" id="MonChk" value="Y" <c:if test="${item.mon eq 'Y' }">checked</c:if> type="checkbox" onchange="moChk()" />
																	<label class="form-label" for="MonChk">월요일</label>
																	<div class="input-group mb-3" style="width: 160px;">
																		<div class="input-group-text">
																			<input class="form-check-input"  id="m" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																		</div>
																		<input class="form-control datetimepicker" aria-label="Text input with checkbox" value="${item.monIn }" id="Mon" name="MonIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																	</div>
																</div>
																<div class="col-sm-6 col-md-6 mb-2">
																	<input class="form-check-input" name="Tues" id="TuesChk" value="Y" <c:if test="${item.tues eq 'Y' }">checked</c:if> type="checkbox" onchange="TueChk()" />
																	<label class="form-label" for="TuesChk">화요일</label>
																	<div class="input-group mb-3" style="width: 160px;">
																		<div class="input-group-text">
																			<input class="form-check-input" id="tu" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																		</div>
																		<input class="form-control flatpickr" aria-label="Text input with checkbox" value="${item.tuesIn }" id="Tues" name="TuesIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																	</div>
																</div>
																<div class="col-sm-6 col-md-6 mb-2">
																	<input class="form-check-input"  name="Wednes" id="WednesChk" value="Y" <c:if test="${item.wednes eq 'Y' }">checked</c:if> type="checkbox" onchange="WedChk()" />
																	<label class="form-label" for="WednesChk">수요일</label>
																	<div class="input-group mb-3" style="width: 160px;">
																		<div class="input-group-text">
																			<input class="form-check-input" id="w" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																		</div>
																		<input class="form-control flatpickr" aria-label="Text input with checkbox" value="${item.wednesIn }" id="Wednes" name="WednesIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' readonly="readonly"/>
																	</div>
																</div>
																<div class="col-sm-6 col-md-6 mb-2">
																	<input class="form-check-input" name="Thurs" id="ThursChk" value="Y" <c:if test="${item.thurs eq 'Y' }">checked</c:if> type="checkbox" onchange="ThuChk()" />
																	<label class="form-label" for="Thurs">목요일</label>
																	<div class="input-group mb-3" style="width: 160px;">
																		<div class="input-group-text">
																			<input class="form-check-input"  id="th" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																		</div>
																		<input class="form-control datetimepicker" aria-label="Text input with checkbox" value="${item.thursIn }" id="Thurs" name="ThursIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																	</div>
																</div>
																<div class="col-sm-6 col-md-6 mb-2">
																	<input class="form-check-input" name="Fri" id="FriChk" value="Y" <c:if test="${item.fri eq 'Y' }">checked</c:if> type="checkbox" onchange="FrChk()" />
																	<label class="form-label" for="Thurs">금요일</label>
																	<div class="input-group mb-3" style="width: 160px;">
																		<div class="input-group-text">
																			<input class="form-check-input"  id="f" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																		</div>
																		<input class="form-control datetimepicker" aria-label="Text input with checkbox" value="${item.friIn }" id="Fri" name="FriIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																	</div>
																</div>
																<div class="col-sm-6 col-md-6 mb-2">
																	<input class="form-check-input" name="Satur" id="SaturChk" value="Y" <c:if test="${item.satur eq 'Y' }">checked</c:if> type="checkbox" onchange="SaChk()" />
																	<label class="form-label" for="Thurs">토요일</label>
																	<div class="input-group mb-3" style="width: 160px;">
																		<div class="input-group-text">
																			<input class="form-check-input"  id="sa" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																		</div>
																		<input class="form-control datetimepicker" aria-label="Text input with checkbox" value="${item.saturIn }" id="Satur" name="SaturIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																	</div>
																</div>
																<div class="col-sm-6 col-md-6 mb-2">
																	<input class="form-check-input" name="Sun" id="SunChk" value="Y" <c:if test="${item.sun eq 'Y' }">checked</c:if> type="checkbox" onchange="SuChk()" />
																	<label class="form-label" for="Thurs">일요일</label>
																	<div class="input-group mb-3" style="width: 160px;">
																		<div class="input-group-text">
																			<input class="form-check-input"  id="su" type="checkbox" disabled value="Y"  aria-label="Checkbox for following text input" />
																		</div>
																		<input class="form-control datetimepicker" aria-label="Text input with checkbox" value="${item.sunIn }" id="Sun" name="SunIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																	</div>
																</div>
																<div class="col-sm-6 col-md-6 mb-2">
																	<input class="form-check-input" name="Holy" id="HolyChk" value="Y" <c:if test="${item.holy eq 'Y' }">checked</c:if> type="checkbox" onchange="HoChk()" />
																	<label class="form-label" for="Thurs">공휴일</label>
																	<div class="input-group mb-3" style="width: 160px;">
																		<div class="input-group-text">
																			<input class="form-check-input"  id="h" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																		</div>
																		<input class="form-control datetimepicker" aria-label="Text input with checkbox" value="${item.holyIn }" id="Holy" name="HolyIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																	</div>
																</div>
															</div>
														</div> 
													</div>
													<div class="col-sm-5 col-md-6">
														<div class="form-floating input-group">
															<input class="form-control" id="OffMax" value="${item.offMax }"  name="OffMax"  type="number" placeholder="오프라인정원" />
															<label for="OffMax">오프라인정원</label>
														</div>
													</div>
													<div class="col-sm-6 col-md-6">
														<div class="input-group mb-3">
															<div class="input-group-text">
																<input class="form-check-input" type="checkbox" id="onChk" value="" aria-label="Checkbox for following text input" onchange="OnMaxdis()" />
															</div>
															<input class="form-control" aria-label="Text input with checkbox" disabled value="${item.onMax }" id="OnMax"  name="OnMax" type="number" placeholder="온라인정원" />
														</div>
													</div>
													<div class="col-sm-5 col-md-6">
														<div class="form-floating input-group">
															<input class="form-control" id="ItemMonth" name="ItemMonth" value="${item.itemMonth }" type="number"  placeholder="기본개월수" />
															<label for="ItemMonth">기본개월수</label>
														</div>
													</div>
													<div class="col-sm-5 col-md-6">
														<div class="form-floating input-group">
															<input class="form-control" id="InCnt" name="InCnt" value="${item.inCnt }" type="number"  placeholder="일일출입가능횟수" />
															<label for="InCnt">일일출입가능횟수</label>
														</div>
													</div>
													<div class="col-sm-6 col-md-6 mb-2">
														<div class="form-floating">
															<select class="form-select" id=DamDangUserPKID name="DamDangUserPKID">
																<c:forEach items="${User}" var="userlist">
																	<option value="${userlist.userPKID }" <c:if test="${userlist.userPKID eq item.damDangUserPKID}">selected</c:if> >[${userlist.sawonNo}],${userlist.sawonName}</option>
																</c:forEach>
															</select>
															<label for="DamDangUserPKID">담당강사</label>
														</div>
													</div>
													<div class="col-sm-6 col-md-6">
														<div class="form-floating input-group">
															<input class="form-control" id="YakChing" name="YakChing" value="${item.yakChing }" type="text" placeholder="강습반코드" />
															<label for="ItemCode">강습반약칭</label>
														</div>
													</div>
													<div class="col-sm-5 col-md-9">
														<div class="input-group">
															<div class="form-check ">
																<input class="SalaryType form-check-input" name="SalaryType" value="U" id="SalaryType1" <c:if test="${item.salaryType eq 'U' }">checked</c:if> type="radio" name="flexRadioDefault" checked  onchange="handleRadioChange('U')" />
																<label class="form-check-label" for="flexRadioDefault1">정액</label>
															</div>
															<div class="form-check ms-1">
																<input class="SalaryType form-check-input" name="SalaryType" value="D" id="SalaryType2" <c:if test="${item.salaryType eq 'D' }">checked</c:if> type="radio" name="flexRadioDefault" onchange="handleRadioChange('D')" />
																<label class="form-check-label" for="flexRadioDefault2">비율</label>
															</div>
															<span class="input-group-text ms-1">강사료</span>
															<input class="form-control" name="CompanyPer" id="CompanyPer" value="${item.companyPer }"  type="number" disabled aria-label="First name" />
															<input class="form-control" name="SawonPer" id="SawonPer" value="${item.sawonPer }" type="number" disabled aria-label="Last name" />
														</div>
													</div>
													<div class="col-sm-6 col-md-10 mb-2">
														<input class="form-check-input" name="chkPeriod" id="chkPeriod" <c:if test="${item.chkPeriod eq 'Y' }">checked</c:if> value="Y" type="checkbox" onchange="dateChk()" />
														<label class="form-label" for="Tues">기간설정</label>
														<div class="input-group mb-3">
															<div class="input-group-text">
																<input class="form-check-input" type="checkbox"  id="da" disabled value="Y" aria-label="Checkbox for following text input" />
															</div>
															<input class="form-control datetimepicker" id="FromDate" name="FromDate" value="${item.fromDate }" disabled type="text" placeholder="y-m-d" required="required" data-options='{"disableMobile":true,"allowInput":true}' />
															~
															<input class="form-control datetimepicker" id="ToDate" name="ToDate" value="${item.toDate }" disabled type="text" placeholder="y-m-d" required="required" data-options='{"disableMobile":true,"allowInput":true}' />
														</div>
													</div>
													<div class="col-sm-6 col-md-10 mb-2">
														<div class="card">
															<div class="card-header">
																할인정책
															</div>
															<div class="card-body">
																<div class="form-check">
																	<input class="form-check-input" name="DcNoChk" id="DcNoChk" <c:if test="${item.dcNoChk eq 'Y' }">checked</c:if> type="checkbox" value="Y" /> 
																	<!-- Y는 불가 / N은 가능 -->
																	<label class="form-check-label" for="DcNoChk">온라인 자동 할인불가(모든 감면 안됨)</label>
																</div>
																<div class="form-check">
																	<input class="form-check-input" name="OldAgeDCNoGbn" id="OldAgeDCNoGbn" <c:if test="${item.oldAgeDCNoGbn eq 'Y' }">checked</c:if> type="checkbox" value="Y" /> 
																	<!-- Y는 불가 / N은 가능 -->
																	<label class="form-check-label" for="OldAgeDCNoGbn">고령자 할인 불가</label>
																</div>
																<div class="form-check">
																	<input class="form-check-input" name="DcNo3MonthChk" id="DcNo3MonthChk" <c:if test="${item.dcNo3MonthChk eq 'Y' }">checked</c:if> type="checkbox" value="Y" /> 
																	<!-- Y는 불가 / N은 가능 -->
																	<label class="form-check-label" for="DcNo3MonthChk">3개월 자동 할인불가</label>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="card p-3" >
											<div class="card-body">
												<div class="row g-3 mb-6">
													<div class="col-sm-6 col-md-10 mb-2">
														<div class="card ">
															<div class="card-header">
																일반강습료
															</div>
															<div class="card-body ">
																<div class="row">
																	<div class="form-check">
																		<input class="form-check-input" name="nvat" id="nvat" <c:if test="${item.nvat eq 'Y' }">checked</c:if> type="checkbox" value="Y" value="Y" /> 
																		<!-- Y는 불가 / N은 가능 -->
																		<label class="form-check-label" for="nvat">부가세포함</label>
																	</div>
																	<div class="col-sm-6 col-md-6 mb-2">
																		<div class="form-floating input-group">
																			<input class="form-control" id="DefPrice" name="DefPrice" value="${item.defPrice }" type="text" value="0" placeholder="강습반코드" />
																			<label for="DefPrice">어른</label>
																		</div>
																	</div>
																	<div class="col-sm-6 col-md-6 mb-2">
																		<div class="form-floating input-group">
																			<input class="form-control" id="Price1" name="Price1" value="${item.price1 }" type="text" value="0" placeholder="강습반코드" />
																			<label for="Price1">청소년</label>
																		</div>
																	</div>
																	<div class="col-sm-6 col-md-6 mb-2">
																		<div class="form-floating input-group">
																			<input class="form-control" id="Price2" name="Price2" value="${item.price2 }" type="text" value="0" placeholder="강습반코드" />
																			<label for="Price2">어린이</label>
																		</div>
																	</div>
																	<div class="col-sm-6 col-md-6 mb-2">
																		<div class="form-floating input-group">
																			<input class="form-control" id="Price3" name="Price3" value="${item.price3 }" type="text" value="0" placeholder="강습반코드" />
																			<label for="Price3">경로</label>
																		</div>
																	</div>
																	<div class="col-sm-6 col-md-6 mb-2">
																		<div class="form-floating input-group">
																			<input class="form-control" id="Price4" name="Price4" value="${item.price4 }" type="text" value="0"  placeholder="강습반코드" />
																			<label for="Price4">기본금</label>
																		</div>
																	</div>
																	<p class="card-text">
																		온라인 연령별 금액 선택 기준(연나이)<br>
																		- 어른 : 19(20) ~ 64<br>
																		- 청소년 : 13(14) ~ 18(19)<br>
																		- 어린이 : 0 ~ 12(13)<br>
																		- 경로(어른) : 65이상<br>
																		* 강좌 시작월에 만나이 기준
																	</p>
																</div>
															</div>
														</div>
														<div class="col-sm-3 col-md-9">
															<div class="input-group mt-2">
																<p class="text-justify text-800 me-2">사용 여부 :</p>
																<div class="form-check ">
																	<input class="SalaryType form-check-input" name="IsUse" value="Y" <c:if test="${item.isUse eq 'Y' }">checked</c:if> id="IsUse1" type="radio" name="flexRadioDefault" checked  />
																	<label class="form-check-label" for="flexRadioDefault1">사용</label>
																</div>
																<div class="form-check ms-1">
																	<input class="SalaryType form-check-input" name="IsUse" value="N" <c:if test="${item.isUse eq 'N' }">checked</c:if> id="IsUse2" type="radio" name="flexRadioDefault"  />
																	<label class="form-check-label" for="flexRadioDefault2">사용안함</label>
																</div>
															</div>
															<div class="input-group">
																<p class="text-justify text-800 me-2">웹수강 여부 :</p>
																<div class="form-check ">
																	<input class="SalaryType form-check-input" name="WebYN" value="N" id="WebYN1" <c:if test="${item.webYN eq 'N' }">checked</c:if> type="radio" name="flexRadioDefault" checked  />
																	<label class="form-check-label" for="flexRadioDefault1">사용</label>
																</div>
																<div class="form-check ms-1">
																	<input class="SalaryType form-check-input" name="WebYN" value="Y" id="WebYN2" <c:if test="${item.webYN eq 'Y' }">checked</c:if> type="radio" name="flexRadioDefault"  />
																	<label class="form-check-label" for="flexRadioDefault2">사용안함</label>
																</div>
															</div>
														</div>
														<div class="col-sm-6 col-md-6 mb-2" >
															<div class="form-check">
																<input class="form-check-input" name="WebEnd" id="webEnd" <c:if test="${item.webEnd eq 'Y' }">checked</c:if> type="checkbox" value="Y" />
																<label class="form-check-label" for="flexCheckDefault">신규(접수마감)</label>
															</div>
														</div>
														<div class="col-sm-6 col-md-6 mb-2" >
															<div class="form-floating">
																<select class="form-select" id="ParkingTime" name="ParkingTime">
																	<option value="0"  <c:if test="${item.parkingTime eq '0' }">checked</c:if>>해당업음</option>
																	<option value="61" <c:if test="${item.parkingTime eq '61' }">checked</c:if>>30분</option>
																	<option value="62" <c:if test="${item.parkingTime eq '62' }">checked</c:if>>1시간</option>
																	<option value="63" <c:if test="${item.parkingTime eq '63' }">checked</c:if>>1시간30분</option>
																	<option value="64" <c:if test="${item.parkingTime eq '64' }">checked</c:if>>2시간</option>
																	<option value="65" <c:if test="${item.parkingTime eq '65' }">checked</c:if>>2시간30분</option>
																	<option value="66" <c:if test="${item.parkingTime eq '66' }">checked</c:if>>3시간</option>
																	<option value="67" <c:if test="${item.parkingTime eq '67' }">checked</c:if>>3시간30분</option>
																	<option value="68" <c:if test="${item.parkingTime eq '68' }">checked</c:if>>4시간</option>
																	<option value="69" <c:if test="${item.parkingTime eq '69' }">checked</c:if>>4시간30분</option>
																	<option value="70" <c:if test="${item.parkingTime eq '70' }">checked</c:if>>5시간</option>
																	<option value="71" <c:if test="${item.parkingTime eq '71' }">checked</c:if>>5시간30분</option>
																	<option value="72" <c:if test="${item.parkingTime eq '72' }">checked</c:if>>6시간</option>
																	<option value="73" <c:if test="${item.parkingTime eq '73' }">checked</c:if>>6시간30분</option>
																	<option value="74" <c:if test="${item.parkingTime eq '74' }">checked</c:if>>7시간</option>
																	<option value="75" <c:if test="${item.parkingTime eq '75' }">checked</c:if>>7시간30분</option>
																	<option value="76" <c:if test="${item.parkingTime eq '76' }">checked</c:if>>8시간</option>
																	<option value="77" <c:if test="${item.parkingTime eq '77' }">checked</c:if>>8시간30분</option>
																	<option value="78" <c:if test="${item.parkingTime eq '78' }">checked</c:if>>9시간</option>
																	<option value="79" <c:if test="${item.parkingTime eq '79' }">checked</c:if>>9시간30분</option>
																	<option value="80" <c:if test="${item.parkingTime eq '80' }">checked</c:if>>10시간</option>
																</select>
																<label for="ParkingTime">주차시간</label>
															</div>
														</div>
														<div class="col-sm-6 col-md-9 mb-2">
															<div class="form-floating input-group">
																<p class="text-800">나이설정(신규접수) : (0 ~ 0 : 제한없음)</p>
																<input class="form-control" value="${item.ageStart }" id="ageStart" name="ageStart" value="0" type="text" />
																<p class="align-middle mx-2">~</p>
																<input class="form-control" value="${item.ageEnd }" id="ageEnd" name="ageEnd" value="0" type="text"  />
															</div>
														</div>
														<div class="col-sm-6 col-md-10 mb-2">
															<div class="card">
																<div class="card-body">
																	<div class="form-check">
																		<input class="form-check-input"  <c:if test="${item.ageYearGbn eq 'Y' }">checked</c:if> name="AgeYearGbn" id="AgeYearGbn" type="checkbox" value="Y" /> 
																		<!-- Y는 불가 / N은 가능 -->
																		<label class="form-check-label" for="AgeYearGbn">연도나이(신규접수)<br>(접수가능나이 : 올해 - 생년 + 1)</label>
																	</div>
																	<div class="form-check">
																		<input class="form-check-input" <c:if test="${item.lotteryGbn eq 'Y' }">checked</c:if> name="LotteryGbn" id="LotteryGbn" type="checkbox" value="Y" /> 
																		<!-- Y는 불가 / N은 가능 -->
																		<label class="form-check-label" for="LotteryGbn">추첨접수</label>
																	</div>
																	<div class="form-check">
																		<input class="form-check-input" <c:if test="${item.recommendGbn eq 'Y' }">checked</c:if> name="RecommendGbn" id="RecommendGbn" type="checkbox" value="Y" /> 
																		<!-- Y는 불가 / N은 가능 -->
																		<label class="form-check-label" for="RecommendGbn">추천강좌</label>
																	</div>
																	<div class="form-check">
																		<input class="form-check-input"  <c:if test="${item.inliveRegster eq 'Y' }">checked</c:if> name="inliveRegster" id="inliveRegster" type="checkbox" value="Y" /> 
																		<!-- Y는 불가 / N은 가능 -->
																		<label class="form-check-label" for="inliveRegster">구민접수(구민접수기간과 무관)</label>
																	</div>
																	<div class="form-check">
																		<input class="form-check-input"  <c:if test="${item.isDelete eq 'Y' }">checked</c:if> name="IsDelete" id="IsDelete" type="checkbox" value="Y" /> 
																		<!-- Y는 불가 / N은 가능 -->
																		<label class="form-check-label" for="IsDelete">삭제</label>
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
								<div class="tab-pane fade" id="tab-cost" role="tabpanel" aria-labelledby="cost-tab">
									<div class="col-sm-6 col-md-10 mb-2">
										<div class="card">
											<div class="card-body">
												<h4 class="mb-3">강좌소개</h4>
				               					<textarea class="tinymce" id="Intro" name="Intro"  data-tinymce='{"height":"13rem","placeholder":"Write a description here..."}'><c:out value="${item.intro}" /></textarea>
				         					</div>
				         				</div>
									</div>
									<div class="col-sm-6 col-md-10 mb-2">
										<div class="card">
											<div class="card-body">
												<h4 class="mb-3">세부내용</h4>
				               					<textarea class="tinymce" id="Detail" name="Detail" data-tinymce='{"height":"13rem","placeholder":"Write a description here..."}'><c:out value="${item.detail}" /></textarea>
				             				</div>
				             			</div>
									</div>
									<div class="col-sm-6 col-md-10 mb-2">
										<div class="card">
											<div class="card-body">
												<h4 class="mb-3">비고</h4>
				               					<textarea class="tinymce" id="Note" name="Note" data-tinymce='{"height":"13rem","placeholder":"Write a description here..."}'><c:out value="${item.note}" /></textarea>
				             				</div>
				             			</div>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-propose" role="tabpanel" aria-labelledby="propose-tab">
									<div class="col-sm-6 col-md-10 mb-2">
										<h4 class="mb-3">이미지</h4>
										<div class="dropzone dropzone-multiple p-0 mb-5" id="my-awesome-dropzone" data-dropzone="data-dropzone">
											<div class="fallback">
												<input name="file" type="file"  />
											</div>
											<div class="dz-preview d-flex flex-wrap">
												<div class="border bg-white rounded-3 d-flex flex-center position-relative me-2 mb-2" ><img class="dz-image" src="${pageContext.request.contextPath}/new_lib/assets/img/products/23.png" alt="..." data-dz-thumbnail="data-dz-thumbnail" /><a class="dz-remove text-400" href="#!" data-dz-remove="data-dz-remove"><span data-feather="x"></span></a></div>
											</div>
											<div class="dz-message text-600" data-dz-message="data-dz-message">Drag your photo here<span class="text-800 px-1">or</span>
												<button class="btn btn-link p-0" type="button">Browse from device</button><br /><img class="mt-3 me-2" src="${pageContext.request.contextPath}/new_lib/assets/img/icons/image-icon.png" width="40" alt="" />
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-consulting" role="tabpanel" aria-labelledby="consulting-tab">
									<div class="col-sm-6 col-md-10 mb-2">
										<div class="dropzone dropzone-multiple p-0" id="dropzone" data-dropzone="data-dropzone" data-options='{"url":"valid/url","maxFiles":1,"dictDefaultMessage":"Choose or Drop a file here"}'>
											<div class="fallback">
												<input type="file" name="file" />
											</div>
											<div class="dz-message" data-dz-message="data-dz-message">
												<div class="dz-message-text">
													<img class="me-2" src="${pageContext.request.contextPath}/new_lib/assets/img/icons/cloud-upload.svg" width="25" alt="" />Drop your file here
												</div>
											</div>
											<div class="dz-preview dz-preview-multiple m-0 d-flex flex-column">
												<div class="d-flex pb-3 border-bottom media px-2">
													<div class="border border-300 p-2 rounded-2 me-2">
														<img class="rounded-2 dz-image" src="${pageContext.request.contextPath}/new_lib/assets/img/icons/file.png" alt="..." data-dz-thumbnail="data-dz-thumbnail" />
													</div>
													<div class="flex-1 d-flex flex-between-center">
														<div>
															<h6 data-dz-name="data-dz-name"></h6>
															<div class="d-flex align-items-center">
																<p class="mb-0 fs--1 text-400 lh-1" data-dz-size="data-dz-size"></p>
																<div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress=""></span></div>
															</div>
															<span class="fs--2 text-danger" data-dz-errormessage="data-dz-errormessage"></span>
														</div>
														<div class="dropdown font-sans-serif">
															<button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal dropdown-caret-none" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h"></span></button>
															<div class="dropdown-menu dropdown-menu-end border py-2">
																<a class="dropdown-item" href="#!" data-dz-remove="data-dz-remove">Remove File</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-otherlearn" role="tabpanel" aria-labelledby="otherlearn-tab">
									<div class="col-sm-6 col-md-10 mb-2">
										<div class="col-sm-6 col-md-10 mb-2">
											<div class="card">
												<div class="card-body">
													<h4 class="mb-3">메모(관리)</h4>
				                					<textarea class="tinymce" id="Bigo" name="Bigo" data-tinymce='{"height":"13rem","placeholder":"Write a description here..."}'><c:out value="${item.bigo}" /></textarea>
				              						</div>
				              					</div>
										</div>
									</div>
								</div>
							</div>
				  			
							<!-- <button type="submit" class="btn btn-warning px-5" style="margin-top: 20px;">수정</button> -->
							<!-- <input type="button" class="btn btn-warning px-5"  value="수정" id="modify" onclick="valueChk();"/> -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		document.addEventListener('keydown', function(event) {
	    	if (event.key === 'Escape') {
	      		window.close();
	    	}
	  	});
		
		document.addEventListener('keydown', function(event) {
		    if (event.key === 'Enter' || event.key === 'F3') {
		        var modifyButton = document.getElementById('modify');
		        if (modifyButton) {
		            modifyButton.click(); // 버튼 클릭
		        }
		    }
		});
	
		/* 강습 시작,종료시간 */ 
		// 체크박스 및 입력 필드 상태를 관리하는 함수
		function manageTimeFields() {
		    var fromTimeValue = "${item.fromTime}";
		    var toTimeValue = "${item.toTime}";

		    // 시작 시간과 관련된 체크박스와 입력 필드 관리
		    if (fromTimeValue !== null && fromTimeValue !== 0) {
		        document.getElementById("fromChk").checked = true;
		        document.getElementById("FromTime").disabled = false;
		    } else {
		        document.getElementById("fromChk").checked = false;
		        document.getElementById("FromTime").disabled = true;
		    }

		    // 종료 시간과 관련된 체크박스와 입력 필드 관리
		    if (toTimeValue !== null && toTimeValue !== 0) {
		        document.getElementById("toChk").checked = true;
		        document.getElementById("ToTime").disabled = false;
		    } else {
		        document.getElementById("toChk").checked = false;
		        document.getElementById("ToTime").disabled = true;
		    }
		}
		// 초기 설정을 위해 함수 호출
		manageTimeFields();
		
		/* 강습기간 */
		// 체크박스와 날짜 입력 필드 상태를 관리하는 함수
		function manageDateFields() {
		    var chkPeriodValue = "${item.chkPeriod}";

		    // 기간설정 체크박스와 날짜 입력 필드 관리
		    if (chkPeriodValue === 'Y') {
		        document.getElementById("chkPeriod").checked = true;
		        document.getElementById("FromDate").disabled = false;
		        document.getElementById("ToDate").disabled = false;
		    } else {
		        document.getElementById("chkPeriod").checked = false;
		        document.getElementById("FromDate").disabled = true;
		        document.getElementById("ToDate").disabled = true;
		    }
		}
		// 초기 설정을 위해 함수 호출
		manageDateFields();
		
		
		/* 강습기간 */
		// 체크박스와 날짜 입력 필드 상태를 관리하는 함수
		function salary() {
		    var chksalaryValue = "${item.salaryType}";

		    // 기간설정 체크박스와 날짜 입력 필드 관리
		    if (chksalaryValue === 'D') {
		        document.getElementById("CompanyPer").disabled = false;
		        document.getElementById("SawonPer").disabled = false;
		    } else {
		        document.getElementById("CompanyPer").disabled = true;
		        document.getElementById("SawonPer").disabled = true;
		    }
		}
		// 초기 설정을 위해 함수 호출
		salary();
		
		function onMaxValue() {
			var OnMax = "${item.onMax}";
			
			if(OnMax !== null && OnMax !== 0) {
				 document.getElementById("onChk").checked = true;
			     document.getElementById("OnMax").disabled = false;
			}else {
				document.getElementById("onChk").checked = false;
		        document.getElementById("OnMax").disabled = true;
			}
		}
		onMaxValue()
		
		
		function manageDateFields() {
		    var chkPeriodValue = "${item.chkPeriod}";

		    // 기간설정 체크박스와 날짜 입력 필드 관리
		    if (chkPeriodValue === 'Y') {
		        document.getElementById("chkPeriod").checked = true;
		        document.getElementById("FromDate").disabled = false;
		        document.getElementById("ToDate").disabled = false;
		    } else {
		        document.getElementById("chkPeriod").checked = false;
		        document.getElementById("FromDate").disabled = true;
		        document.getElementById("ToDate").disabled = true;
		    }
		}
		// 초기 설정을 위해 함수 호출
		manageDateFields();
		
		
		function handleRadioChange(salaryType) {
	        var companyPerInput = document.getElementById('CompanyPer');
	        var sawonPerInput = document.getElementById('SawonPer');

	        if (salaryType === 'U') {
	            companyPerInput.disabled = true;
	            sawonPerInput.disabled = true;
	        } else if (salaryType === 'D') {
	            companyPerInput.disabled = false;
	            sawonPerInput.disabled = false;
	        }
	    }
		
		function fromTime() {
		    var checkbox = document.getElementById("fromChk");
		    var FromTime = document.getElementById("FromTime");
	
		    if (checkbox.checked) {
		    	FromTime.disabled = false;
		    } else {
		    	FromTime.disabled = true;
		    }
		};
		function toTime() {
		    var checkbox = document.getElementById("flexCheckChecked");
		    var ToTime = document.getElementById("ToTime");
	
		    if (checkbox.checked) {
		    	ToTime.disabled = false;
		    } else {
		    	ToTime.disabled = true;
		    }
		};
		function moChk() {
		    var checkbox = document.getElementById("MonChk");
		    var innerCheckbox = document.getElementById("m");
		    var ToTime = document.getElementById("Mon");
	
		    if (checkbox.checked) {
		    	innerCheckbox.checked = true;
		        innerCheckbox.disabled = false;
		    	ToTime.disabled = false;
		    } else {
		    	innerCheckbox.checked = false;
		        innerCheckbox.disabled = true;
		    	ToTime.disabled = true;
		    }
		};
		
		function TueChk() {
		    var checkbox = document.getElementById("TuesChk");
		    var innerCheckbox = document.getElementById("tu");
		    var ToTime = document.getElementById("Tues");
	
		    if (checkbox.checked) {
		    	innerCheckbox.checked = true;
		        innerCheckbox.disabled = false;
		    	ToTime.disabled = false;
		    } else {
		    	innerCheckbox.checked = false;
		        innerCheckbox.disabled = true;
		    	ToTime.disabled = true;
		    }
		};
		function WedChk() {
		    var checkbox = document.getElementById("WednesChk");
		    var innerCheckbox = document.getElementById("w");
		    var ToTime = document.getElementById("Wednes");
	
		    if (checkbox.checked) {
		    	innerCheckbox.checked = true;
		        innerCheckbox.disabled = false;
		    	ToTime.disabled = false;
		    } else {
		    	innerCheckbox.checked = false;
		        innerCheckbox.disabled = true;
		    	ToTime.disabled = true;
		    }
		};
		function ThuChk() {
		    var checkbox = document.getElementById("ThursChk");
		    var innerCheckbox = document.getElementById("th");
		    var ToTime = document.getElementById("Thurs");
	
		    if (checkbox.checked) {
		    	innerCheckbox.checked = true;
		        innerCheckbox.disabled = false;
		    	ToTime.disabled = false;
		    } else {
		    	innerCheckbox.checked = false;
		        innerCheckbox.disabled = true;
		    	ToTime.disabled = true;
		    }
		};
		function FrChk() {
		    var checkbox = document.getElementById("FriChk");
		    var innerCheckbox = document.getElementById("f");
		    var ToTime = document.getElementById("Fri");
	
		    if (checkbox.checked) {
		    	innerCheckbox.checked = true;
		        innerCheckbox.disabled = false;
		    	ToTime.disabled = false;
		    } else {
		    	innerCheckbox.checked = false;
		        innerCheckbox.disabled = true;
		    	ToTime.disabled = true;
		    }
		};
		function SaChk() {
		    var checkbox = document.getElementById("SaturChk");
		    var innerCheckbox = document.getElementById("sa");
		    var ToTime = document.getElementById("Satur");
	
		    if (checkbox.checked) {
		    	innerCheckbox.checked = true;
		        innerCheckbox.disabled = false;
		    	ToTime.disabled = false;
		    } else {
		    	innerCheckbox.checked = false;
		        innerCheckbox.disabled = true;
		    	ToTime.disabled = true;
		    }
		};
		function SuChk() {
		    var checkbox = document.getElementById("SunChk");
		    var innerCheckbox = document.getElementById("su");
		    var ToTime = document.getElementById("Sun");
	
		    if (checkbox.checked) {
		    	innerCheckbox.checked = true;
		        innerCheckbox.disabled = false;
		    	ToTime.disabled = false;
		    } else {
		    	innerCheckbox.checked = false;
		        innerCheckbox.disabled = true;
		    	ToTime.disabled = true;
		    }
		};
		function HoChk() {
			var holyChk = document.getElementById("HolyChk");
		    var innerCheckbox = document.getElementById("h");
		    var innerInput = document.getElementById("Holy");
	
		    if (holyChk.checked) {
		        innerCheckbox.checked = true;
		        innerCheckbox.disabled = false;
		        innerInput.disabled = false;
		    } else {
		        innerCheckbox.checked = false;
		        innerCheckbox.disabled = true;
		        innerInput.disabled = true;
		    }
		};
		
		
		// 체크박스와 입력 필드 상태를 관리하는 함수
		function manageWeekdayFields() {
		    var monInValue = "${item.mon}";
			var tuesInValue = "${item.tues}";
			var wednesInValue = "${item.wednes}";
			var thursInValue = "${item.thurs }";
			var friInInValue = "${item.fri }";
			var saturInInValue = "${item.satur }";
			var sunInInValue = "${item.sun }";
			var holyInInValue = "${item.holy }";

		    // 월요일과 관련된 체크박스 및 입력 필드 관리
		    if (monInValue !== null && monInValue !== "N") {
		        document.getElementById("m").checked = true;
            	document.getElementById("m").disabled = false;
		        document.getElementById("Mon").disabled = false;
		    } else {
		        document.getElementById("m").checked = false;
            	document.getElementById("m").disabled = true;
		        document.getElementById("Mon").disabled = true;
		    }

		    // 화요일과 관련된 체크박스 및 입력 필드 관리
		    if (tuesInValue !== null && tuesInValue !== "N") {
		        document.getElementById("tu").checked = true;
		        document.getElementById("tu").disabled = false;
		        document.getElementById("Tues").disabled = false;
		    } else {
		        document.getElementById("tu").checked = false;
		        document.getElementById("tu").disabled = true;
		        document.getElementById("Tues").disabled = true;
		    }
		    // 수요일과 관련된 체크박스 및 입력 필드 관리
		    if (wednesInValue !== null && wednesInValue !== "N") {
		        document.getElementById("w").checked = true;
		        document.getElementById("w").disabled = false;
		        document.getElementById("Wednes").disabled = false;
		    } else {
		        document.getElementById("w").checked = false;
		        document.getElementById("w").disabled = true;
		        document.getElementById("Wednes").disabled = true;
		    }
		    // 목요일과 관련된 체크박스 및 입력 필드 관리
		    if (thursInValue !== null && thursInValue !== "N") {
		        document.getElementById("th").checked = true;
		        document.getElementById("th").disabled = false;
		        document.getElementById("Thurs").disabled = false;
		    } else {
		        document.getElementById("th").checked = false;
		        document.getElementById("th").disabled = true;
		        document.getElementById("Thurs").disabled = true;
		    }
		    // 금요일과 관련된 체크박스 및 입력 필드 관리
		    if (friInInValue !== null && friInInValue !== "N") {
		        document.getElementById("f").checked = true;
		        document.getElementById("f").disabled = false;
		        document.getElementById("Fri").disabled = false;
		    } else {
		        document.getElementById("f").checked = false;
		        document.getElementById("f").disabled = true;
		        document.getElementById("Fri").disabled = true;
		    }
		    // 토요일과 관련된 체크박스 및 입력 필드 관리
		    if (saturInInValue !== null && saturInInValue !== "N") {
		        document.getElementById("sa").checked = true;
		        document.getElementById("sa").disabled = false;
		        document.getElementById("Satur").disabled = false;
		    } else {
		        document.getElementById("sa").checked = false;
		        document.getElementById("sa").disabled = true;
		        document.getElementById("Satur").disabled = true;
		    }
		    // 일요일과 관련된 체크박스 및 입력 필드 관리
		    if (sunInInValue !== null && sunInInValue !== "N") {
		        document.getElementById("su").checked = true;
		        document.getElementById("su").disabled = false;
		        document.getElementById("SunIn").disabled = false;
		    } else {
		        document.getElementById("su").checked = false;
		        document.getElementById("su").disabled = true;
		        document.getElementById("SunIn").disabled = true;
		    }
		    // 공휴일과 관련된 체크박스 및 입력 필드 관리
		    if (holyInInValue !== null && holyInInValue !== "N") {
		        document.getElementById("h").checked = true;
		        document.getElementById("h").disabled = false;
		        document.getElementById("Thurs").disabled = false;
		    } else {
		        document.getElementById("h").checked = false;
		        document.getElementById("h").disabled = true;
		        document.getElementById("Holy").disabled = true;
		    }
		}

		// 초기 설정을 위해 함수 호출
		manageWeekdayFields();  
		
		
		function OnMaxdis() {
		    var checkbox = document.getElementById("onChk");
		    var OnMax = document.getElementById("OnMax");
	
		    if (checkbox.checked) {
		    	OnMax.disabled = false;
		    } else {
		    	OnMax.disabled = true;
		    }
		};
		
		function dateChk() {
			var holyChk = document.getElementById("chkPeriod");
		    var innerCheckbox = document.getElementById("da");
		    var FromDate = document.getElementById("FromDate");
		    var ToDate = document.getElementById("ToDate");
	
		    if (holyChk.checked) {
		        innerCheckbox.checked = true;
		        innerCheckbox.disabled = false;
		        FromDate.disabled = false;
		        ToDate.disabled = false;
		    } else {
		        innerCheckbox.checked = false;
		        innerCheckbox.disabled = true;
		        FromDate.disabled = true;
		        ToDate.disabled = true;
		    }
		};
	
		function valueChk() {
			var frm = document.frm; 
	        
			if(confirm("수정하시겠습니까?")) {
				
				frm.submit();
			} else {
				return false;
			}
			/* window.close(); */
		}
	
	
	</script>
</body>
<script src="${pageContext.request.contextPath}/new_lib/vendors/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/anchorjs/anchor.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/is/is.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/fontawesome/all.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/lodash/lodash.min.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/dayjs/dayjs.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/assets/js/phoenix.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/echarts/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/leaflet/leaflet.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/leaflet.markercluster.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/leaflet.tilelayer.colorfilter/leaflet-tilelayer-colorfilter.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/assets/js/ecommerce-dashboard.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/tinymce/tinymce.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/dropzone/dropzone.min.js"></script>
</html>