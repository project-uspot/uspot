<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사물함코드 등록 및 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/js/theme/flatpickr.js"></script>
<link href="${pageContext.request.contextPath}/new_lib/vendors/flatpickr/flatpickr.min.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="modal-header bg-primary">
		<h5 class="modal-title text-white" id="insertModalLabel">강습반 정보 등록</h5>
		<button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1 text-white"></span></button>
	</div>
	<div class="modal-body">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<form method="post" id="frm"  name="frm" action="${pageContext.request.contextPath}/insertClassInfo.do" class="row g-3 mb-6">
						<input type="hidden" id="check_id_result" value=""><!-- 아이디 중복체크 결과 -->
						<ul class="nav nav-underline" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="learn-tab" data-bs-toggle="tab" href="#tab-learn"
								role="tab" aria-controls="tab-learn" aria-selected="true">기본정보</a></li>
							<li class="nav-item"><a class="nav-link" id="cost-tab"
								data-bs-toggle="tab" href="#tab-cost" role="tab"
								aria-controls="tab-cost" aria-selected="false">강좌세부내용</a></li>
							<li class="nav-item"><a class="nav-link" id="propose-tab"
								data-bs-toggle="tab" href="#tab-propose" role="tab"
								aria-controls="tab-propose" aria-selected="false">이미지등록</a></li>
							<li class="nav-item"><a class="nav-link"
								id="consulting-tab" data-bs-toggle="tab"
								href="#tab-consulting" role="tab"
								aria-controls="tab-consulting" aria-selected="false">첨부파일</a></li>
							<li class="nav-item"><a class="nav-link"
								id="otherlearn-tab" data-bs-toggle="tab"
								href="#tab-otherlearn" role="tab"
								aria-controls="tab-otherlearn" aria-selected="false">메모</a></li>
						</ul>
						<div class="tab-content mt-3" id="myTabContent">
							<div class=" tab-pane fade show active" id="tab-learn" role="tabpanel" aria-labelledby="learn-tab">
								<div class="card-group">
									<div class="card p-3" >
										<div class="card-body">
											<div class="row g-3 mb-6">
												<div class="col-sm-5 col-md-7">
													<div class="form-floating input-group">
														<input class="form-control" id="ItemCode" name="ItemCode" type="text" placeholder="강습반코드" value="${ItemCode}" />
														<label for="ItemCode">강습반코드</label>
														<button class="btn btn-danger me-1 mb-1" type="button" onclick="noCheck_to_srk()">중복확인</button><br>
													</div>
													<span id="Code_no_text"></span>
												</div>
												<div class="col-sm-6 col-md-5 mb-2" >
													<div class="form-floating">
														<select class="form-select" id="Type" name="Type">
															<option value="G">일반</option>
															<option value="S">특강</option>
														</select>
														<label for="Type">구분</label>
													</div>
												</div>
												<div class="col-sm-6 col-md-6 mb-2">
													<div class="form-floating">
														<select class="form-select" id="GroupID" name="GroupID">
															<c:forEach items="${item01}" var="list01">
																<option value="${list01.groupID }" >${list01.groupName }</option>
															</c:forEach>
														</select>
														<label for="GroupID">종목</label>
													</div>
												</div>
												<div class="col-sm-6 col-md-6 mb-2">
													<div class="form-floating">
														<select class="form-select" id="SubGroupID" name="SubGroupID">
															<c:forEach items="${item02}" var="list02">
																<option value="${list02.subGroupID }" >${list02.subGroupName }</option>
															</c:forEach>
														</select>
														<label for="SubGroupID">강습반명</label>
													</div>
												</div>
												<div class="col-sm-6 col-md-6 mb-2">
													<div class="form-floating">
														<select class="form-select" id="LevelID" name="LevelID">
															<c:forEach items="${item03}" var="list03">
																<option value="${list03.levelID }"  >${list03.levelName }</option>
															</c:forEach>
														</select>
														<label for="LevelID">단계</label>
													</div>
												</div>
												<div class="col-sm-6 col-md-6 mb-2">
													<div class="form-floating">
														<select class="form-select" id="DaeSangID" name="DaeSangID">
															<c:forEach items="${tblcode}" var="listcode">
																<option value="${listcode.pkid }"  >${listcode.codeName }</option>
															</c:forEach>
														</select>
														<label for="DaeSangID">대상</label>
													</div>
												</div>
												<div class="col-sm-6 col-md-4 mb-2">
													<input class="form-check-input" id="fromChk" type="checkbox" onchange="fromTime()"  />
													<label class="form-label" for="FromTime">강습 시작시간</label>
													<input class="form-control datetimepicker" id="FromTime" name="FromTime" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
												</div>
												<div class="col-sm-6 col-md-4 mb-2">
													<input class="form-check-input" id="flexCheckChecked" type="checkbox" onchange="toTime()" />
													<label class="form-label" for="ToTime">강습 종료시간</label>
													<input class="form-control datetimepicker" id="ToTime" name="ToTime" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
												</div>
												<div class="col-sm-6 col-md-4 mb-2" style="margin-top: 30px;">
													<div class="form-floating">
														<select class="form-select" id="ClassCnt" name="ClassCnt">
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
															<option value="6">6</option>
															<option value="7">7</option>
														</select>
														<label for="ClassCnt">강습 횟수</label>
													</div>
												</div>
												<div class="card">
													<div class="card-body" >
														<div class="row">
															<div class="col-sm-6 col-md-6 mb-2">
																<input class="form-check-input" name="Mon" id="MonChk" value="Y" type="checkbox" onchange="moChk()" />
																<label class="form-label" for="MonChk">월요일</label>
																<div class="input-group mb-3" style="width: 160px;">
																	<div class="input-group-text">
																		<input class="form-check-input"  id="m" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																	</div>
																	<input class="form-control datetimepicker" aria-label="Text input with checkbox" id="Mon" name="MonIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																</div>
															</div>
															<div class="col-sm-6 col-md-6 mb-2">
																<input class="form-check-input" name="Tues" id="TuesChk" value="Y" type="checkbox" onchange="TueChk()" />
																<label class="form-label" for="TuesChk">화요일</label>
																<div class="input-group mb-3" style="width: 160px;">
																	<div class="input-group-text">
																		<input class="form-check-input" id="tu" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																	</div>
																	<input class="form-control datetimepicker" aria-label="Text input with checkbox" id="Tues" name="TuesIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																</div>
															</div>
															<div class="col-sm-6 col-md-6 mb-2">
																<input class="form-check-input"  name="Wednes" id="WednesChk" value="Y" type="checkbox" onchange="WedChk()" />
																<label class="form-label" for="WednesChk">수요일</label>
																<div class="input-group mb-3" style="width: 160px;">
																	<div class="input-group-text">
																		<input class="form-check-input" id="w" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																	</div>
																	<input class="form-control datetimepicker" aria-label="Text input with checkbox" id="Wednes" name="WednesIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																</div>
															</div>
															<div class="col-sm-6 col-md-6 mb-2">
																<input class="form-check-input" name="Thurs" id="ThursChk" value="Y" type="checkbox" onchange="ThuChk()" />
																<label class="form-label" for="Thurs">목요일</label>
																<div class="input-group mb-3" style="width: 160px;">
																	<div class="input-group-text">
																		<input class="form-check-input"  id="th" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																	</div>
																	<input class="form-control datetimepicker" aria-label="Text input with checkbox" id="Thurs" name="ThursIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																</div>
															</div>
															<div class="col-sm-6 col-md-6 mb-2">
																<input class="form-check-input" name="Fri" id="FriChk" value="Y" type="checkbox" onchange="FrChk()" />
																<label class="form-label" for="Thurs">금요일</label>
																<div class="input-group mb-3" style="width: 160px;">
																	<div class="input-group-text">
																		<input class="form-check-input"  id="f" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																	</div>
																	<input class="form-control datetimepicker" aria-label="Text input with checkbox" id="Fri" name="FriIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																</div>
															</div>
															<div class="col-sm-6 col-md-6 mb-2">
																<input class="form-check-input" name="Satur" id="SaturChk" value="Y" type="checkbox" onchange="SaChk()" />
																<label class="form-label" for="Thurs">토요일</label>
																<div class="input-group mb-3" style="width: 160px;">
																	<div class="input-group-text">
																		<input class="form-check-input"  id="sa" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																	</div>
																	<input class="form-control datetimepicker" aria-label="Text input with checkbox" id="Satur" name="SaturIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																</div>
															</div>
															<div class="col-sm-6 col-md-6 mb-2">
																<input class="form-check-input" name="Sun" id="SunChk" value="Y" type="checkbox" onchange="SuChk()" />
																<label class="form-label" for="Thurs">일요일</label>
																<div class="input-group mb-3" style="width: 160px;">
																	<div class="input-group-text">
																		<input class="form-check-input"  id="su" type="checkbox" disabled value="Y"  aria-label="Checkbox for following text input" />
																	</div>
																	<input class="form-control datetimepicker" aria-label="Text input with checkbox" id="Sun" name="SunIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																</div>
															</div>
															<div class="col-sm-6 col-md-6 mb-2">
																<input class="form-check-input" name="Holy" id="HolyChk" value="Y" type="checkbox" onchange="HoChk()" />
																<label class="form-label" for="Thurs">공휴일</label>
																<div class="input-group mb-3" style="width: 160px;">
																	<div class="input-group-text">
																		<input class="form-check-input"  id="h" type="checkbox" disabled value="Y" aria-label="Checkbox for following text input" />
																	</div>
																	<input class="form-control datetimepicker" aria-label="Text input with checkbox" id="Holy" name="HolyIn" type="text" disabled placeholder="hour : minute" data-options='{"enableTime":true,"noCalendar":true,"dateFormat":"H:i","disableMobile":true}' />
																</div>
															</div>
														</div>
													</div> 
												</div>
												<div class="col-sm-5 col-md-6">
													<div class="form-floating input-group">
														<input class="form-control" id="OffMax" name="OffMax" value="0" type="number" placeholder="오프라인정원" />
														<label for="OffMax">오프라인정원</label>
													</div>
												</div>
												<div class="col-sm-6 col-md-6">
													<div class="input-group mb-3">
														<div class="input-group-text">
															<input class="form-check-input" type="checkbox" id="onChk" value="" aria-label="Checkbox for following text input" onchange="OnMaxdis()" />
														</div>
														<input class="form-control" aria-label="Text input with checkbox" value="0" disabled id="OnMax"  name="OnMax" type="number" placeholder="온라인정원" />
													</div>
												</div>
												<div class="col-sm-5 col-md-6">
													<div class="form-floating input-group">
														<input class="form-control" id="ItemMonth" name="ItemMonth" type="number" value="0" placeholder="기본개월수" />
														<label for="ItemMonth">기본개월수</label>
													</div>
												</div>
												<div class="col-sm-5 col-md-6">
													<div class="form-floating input-group">
														<input class="form-control" id="InCnt" name="InCnt" type="number" value="0" placeholder="일일출입가능횟수" />
														<label for="InCnt">일일출입가능횟수</label>
													</div>
												</div>
												<div class="col-sm-6 col-md-6 mb-2">
													<div class="form-floating">
														<select class="form-select" id=DamDangUserPKID name="DamDangUserPKID">
															<c:forEach items="${User}" var="userlist">
																<option value="${userlist.userPKID }" >[${userlist.sawonNo}],${userlist.sawonName}</option>
															</c:forEach>
														</select>
														<label for="DamDangUserPKID">담당강사</label>
													</div>
												</div>
												<div class="col-sm-6 col-md-6">
													<div class="form-floating input-group">
														<input class="form-control" id="YakChing" name="YakChing" type="text" placeholder="강습반코드" />
														<label for="ItemCode">강습반약칭</label>
													</div>
												</div>
												<div class="col-sm-5 col-md-9">
													<div class="input-group">
														<div class="form-check ">
															<input class="SalaryType form-check-input" name="SalaryType" value="U" id="SalaryType1" type="radio" name="flexRadioDefault" checked  />
															<label class="form-check-label" for="flexRadioDefault1">정액</label>
														</div>
														<div class="form-check ms-1">
															<input class="SalaryType form-check-input" name="SalaryType" value="D" id="SalaryType2" type="radio" name="flexRadioDefault"  />
															<label class="form-check-label" for="flexRadioDefault2">비율</label>
														</div>
														<span class="input-group-text ms-1">강사료</span>
														<input class="form-control" name="CompanyPer" id="CompanyPer"  value="0" type="number" disabled aria-label="First name" />
														<input class="form-control" name="SawonPer" id="SawonPer" value="0" type="number" disabled aria-label="Last name" />
													</div>
												</div>
												<div class="col-sm-6 col-md-10 mb-2">
													<input class="form-check-input" name="chkPeriod" id="chkPeriod" value="Y" type="checkbox" onchange="dateChk()" />
													<label class="form-label" for="Tues">기간설정</label>
													<div class="input-group mb-3">
														<div class="input-group-text">
															<input class="form-check-input" type="checkbox"  id="da" disabled value="Y" aria-label="Checkbox for following text input" />
														</div>
														<input class="form-control datetimepicker" id="FromDate" name="FromDate" disabled type="text" placeholder="y-m-d" required="required" data-options='{"disableMobile":true,"allowInput":true}' />
														~
														<input class="form-control datetimepicker" id="ToDate" name="ToDate" disabled type="text" placeholder="y-m-d" required="required" data-options='{"disableMobile":true,"allowInput":true}' />
													</div>
												</div>
												<div class="col-sm-6 col-md-10 mb-2">
													<div class="card">
														<div class="card-header">
															할인정책
														</div>
														<div class="card-body">
															<div class="form-check">
																<input class="form-check-input" name="DcNoChk" id="DcNoChk" type="checkbox" value="Y" /> 
																<!-- Y는 불가 / N은 가능 -->
																<label class="form-check-label" for="DcNoChk">온라인 자동 할인불가(모든 감면 안됨)</label>
															</div>
															<div class="form-check">
																<input class="form-check-input" name="OldAgeDCNoGbn" id="OldAgeDCNoGbn" type="checkbox" value="Y" /> 
																<!-- Y는 불가 / N은 가능 -->
																<label class="form-check-label" for="OldAgeDCNoGbn">고령자 할인 불가</label>
															</div>
															<div class="form-check">
																<input class="form-check-input" name="DcNo3MonthChk" id="DcNo3MonthChk" type="checkbox" value="Y" /> 
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
																	<input class="form-check-input" name="nvat" id="nvat" type="checkbox" value="Y" /> 
																	<!-- Y는 불가 / N은 가능 -->
																	<label class="form-check-label" for="nvat">부가세포함</label>
																</div>
																<div class="col-sm-6 col-md-6 mb-2">
																	<div class="form-floating input-group">
																		<input class="form-control" id="DefPrice" name="DefPrice" value="0" type="text" placeholder="강습반코드" />
																		<label for="DefPrice">어른</label>
																	</div>
																</div>
																<div class="col-sm-6 col-md-6 mb-2">
																	<div class="form-floating input-group">
																		<input class="form-control" id="Price1" name="Price1" value="0" type="text" placeholder="강습반코드" />
																		<label for="Price1">청소년</label>
																	</div>
																</div>
																<div class="col-sm-6 col-md-6 mb-2">
																	<div class="form-floating input-group">
																		<input class="form-control" id="Price2" name="Price2" value="0" type="text" placeholder="강습반코드" />
																		<label for="Price2">어린이</label>
																	</div>
																</div>
																<div class="col-sm-6 col-md-6 mb-2">
																	<div class="form-floating input-group">
																		<input class="form-control" id="Price3" name="Price3" value="0" type="text" placeholder="강습반코드" />
																		<label for="Price3">경로</label>
																	</div>
																</div>
																<div class="col-sm-6 col-md-6 mb-2">
																	<div class="form-floating input-group">
																		<input class="form-control" id="Price4" name="Price4" value="0" type="text" placeholder="강습반코드" />
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
																<input class="SalaryType form-check-input" name="IsUse" value="Y" id="IsUse1" type="radio"  checked  />
																<label class="form-check-label" for="flexRadioDefault1">사용</label>
															</div>
															<div class="form-check ms-1">
																<input class="SalaryType form-check-input" name="IsUse" value="N" id="IsUse2" type="radio"  />
																<label class="form-check-label" for="flexRadioDefault2">사용안함</label>
															</div>
														</div>
														<div class="input-group">
															<p class="text-justify text-800 me-2">웹수강 여부 :</p>
															<div class="form-check ">
																<input class="SalaryType form-check-input" name="WebYN" value="N" id="WebYN1" type="radio"checked  />
																<label class="form-check-label" for="flexRadioDefault1">사용</label>
															</div>
															<div class="form-check ms-1">
																<input class="SalaryType form-check-input" name="WebYN" value="Y" id="WebYN2" type="radio"  />
																<label class="form-check-label" for="flexRadioDefault2">사용안함</label>
															</div>
														</div>
													</div>
													<div class="col-sm-6 col-md-6 mb-2" >
														<div class="form-check">
															<input class="form-check-input" name="WebEnd" id="webEnd" type="checkbox" value="Y" />
															<label class="form-check-label" for="flexCheckDefault">신규(접수마감)</label>
														</div>
													</div>
													<div class="col-sm-6 col-md-6 mb-2" >
														<div class="form-floating">
															<select class="form-select" id="ParkingTime" name="ParkingTime">
																<option value="0">해당업음</option>
																<option value="61">30분</option>
																<option value="62">1시간</option>
																<option value="63">1시간30분</option>
																<option value="64">2시간</option>
																<option value="65">2시간30분</option>
																<option value="66">3시간</option>
																<option value="67">3시간30분</option>
																<option value="68">4시간</option>
																<option value="69">4시간30분</option>
																<option value="70">5시간</option>
																<option value="71">5시간30분</option>
																<option value="72">6시간</option>
																<option value="73">6시간30분</option>
																<option value="74">7시간</option>
																<option value="75">7시간30분</option>
																<option value="76">8시간</option>
																<option value="77">8시간30분</option>
																<option value="78">9시간</option>
																<option value="79">9시간30분</option>
																<option value="80">10시간</option>
															</select>
															<label for="ParkingTime">주차시간</label>
														</div>
													</div>
													<div class="col-sm-6 col-md-9 mb-2">
														<div class="form-floating input-group">
															<p class="text-800">나이설정(신규접수) : (0 ~ 0 : 제한없음)</p>
															<input class="form-control" id="ageStart" name="ageStart" value="0" type="text" />
															<p class="align-middle mx-2">~</p>
															<input class="form-control" id="ageEnd" name="ageEnd" value="0" type="text"  />
														</div>
													</div>
													<div class="col-sm-6 col-md-10 mb-2">
														<div class="card">
															<div class="card-body">
																<div class="form-check">
																	<input class="form-check-input" name="AgeYearGbn" id="AgeYearGbn" type="checkbox" value="Y" /> 
																	<!-- Y는 불가 / N은 가능 -->
																	<label class="form-check-label" for="AgeYearGbn">연도나이(신규접수)<br>(접수가능나이 : 올해 - 생년 + 1)</label>
																</div>
																<div class="form-check">
																	<input class="form-check-input" name="LotteryGbn" id="LotteryGbn" type="checkbox" value="Y" /> 
																	<!-- Y는 불가 / N은 가능 -->
																	<label class="form-check-label" for="LotteryGbn">추첨접수</label>
																</div>
																<div class="form-check">
																	<input class="form-check-input" name="RecommendGbn" id="RecommendGbn" type="checkbox" value="Y" /> 
																	<!-- Y는 불가 / N은 가능 -->
																	<label class="form-check-label" for="RecommendGbn">추천강좌</label>
																</div>
																<div class="form-check">
																	<input class="form-check-input" name="inliveRegster" id="inliveRegster" type="checkbox" value="Y" /> 
																	<!-- Y는 불가 / N은 가능 -->
																	<label class="form-check-label" for="inliveRegster">구민접수(구민접수기간과 무관)</label>
																</div>
																<div class="form-check">
																	<input class="form-check-input" name="IsDelete" id="IsDelete" type="checkbox" value="N" /> 
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
		                					<textarea class="tinymce" id="Intro" name="Intro" data-tinymce='{"height":"13rem","placeholder":"Write a description here..."}'></textarea>
                						</div>
                					</div>
								</div>
								<div class="col-sm-6 col-md-10 mb-2">
									<div class="card">
										<div class="card-body">
											<h4 class="mb-3">세부내용</h4>
		                					<textarea class="tinymce" id="Detail" name="Detail" data-tinymce='{"height":"13rem","placeholder":"Write a description here..."}'></textarea>
                						</div>
                					</div>
								</div>
								<div class="col-sm-6 col-md-10 mb-2">
									<div class="card">
										<div class="card-body">
											<h4 class="mb-3">비고</h4>
		                					<textarea class="tinymce" id="Note" name="Note" data-tinymce='{"height":"13rem","placeholder":"Write a description here..."}'></textarea>
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
			                					<textarea class="tinymce" id="Bigo" name="Bigo" data-tinymce='{"height":"13rem","placeholder":"Write a description here..."}'></textarea>
	                						</div>
	                					</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button class="btn btn-primary" type="submit" id="submit" >Okay</button>
		<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">Cancel</button>
	</div>
	<script>
		$(function(){
			$("#ItemCode").on("change", function(){
				$("#check_id_result").val("N");
				$("#Code_no_text").text("중복체크를 해주시기 바랍니다.");
			});
		});
		function noCheck_to_srk(){

			var noReg = /^[0-9]{1,29}$/g;
			if( !noReg.test( $("#ItemCode").val() ) ){
				$("#check_id_result").val("Y");
				$("#Code_no_text").text("사용할 수 없는 코드번호 입니다.");
				return ;
			}
		 
			$.ajax({
				 type : 'GET'
				,url  : "${pageContext.request.contextPath}/itemCode_check.do"
				,data : {Item_Code : $("#ItemCode").val()}
				,success:function(data){
					if(data == 'true'){
						$("#check_no_result").val("N");
						$("#Code_no_text").text("사용가능한 코드번호 입니다.");
					}else{//사용불가
						$("#check_no_result").val("Y");
						$("#Code_no_text").text("사용할 수 없는 코드번호 입니다.");
					}
				}
				,error : function(){
					alert("조회실패");
				}
			});
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
		
		function OnMaxdis() {
		    var checkbox = document.getElementById("onChk");
		    var OnMax = document.getElementById("OnMax");
	
		    if (checkbox.checked) {
		    	OnMax.disabled = false;
		    } else {
		    	OnMax.disabled = true;
		    }
		};
		
		
		$(document).ready(function() {
		    $('input[type="radio"][name="SalaryType"]').on('click', function() {
		        var price = $('input[type=radio][name="SalaryType"]:checked').val();

		        if (price == 'U') {
		            $('[id="CompanyPer"]').prop('disabled', true);
		            $('[id="SawonPer"]').prop('disabled', true);
		        } else {
		            $('[id="CompanyPer"]').prop('disabled', false);
		            $('[id="SawonPer"]').prop('disabled', false);
		        }
		    });
		});
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

		
	
		$(document).ready(function() {
			$("#submit").click(function() {
				if($("#check_id_result").val()!="N"){
					alert("아이디 중복체크를 해주십시오.");
					return false;
				}
				var datas = $("#frm").serialize();
		        var MonChk = $("#MonChk").is(":checked");
		        var TuesChk = $("#TuesChk").is(":checked");
		        var WednesChk = $("#WednesChk").is(":checked");
		        var ThursChk = $("#ThursChk").is(":checked");
		        var FriChk = $("#FriChk").is(":checked");
		        var SaturChk = $("#SaturChk").is(":checked");
		        var SunChk = $("#SunChk").is(":checked");
		        var HolyChk = $("#HolyChk").is(":checked");
		        var chkPeriod = $("#chkPeriod").is(":checked");
		        var DcNoChk = $("#DcNoChk").is(":checked");
		        var OldAgeDCNoGbn = $("#OldAgeDCNoGbn").is(":checked");
		        var DcNo3MonthChk = $("#DcNo3MonthChk").is(":checked");
		        var nvat = $("#nvat").is(":checked");
		        var WebEnd = $("#WebEnd").is(":checked");
		        var AgeYearGbn = $("#AgeYearGbn").is(":checked");
		        var LotteryGbn = $("#LotteryGbn").is(":checked");
		        var RecommendGbn = $("#RecommendGbn").is(":checked");
		        var inliveRegster = $("#inliveRegster").is(":checked");
		        var IsDelete = $("#IsDelete").is(":checked");
		        var IsDelete = $("#IsDelete").is(":checked");
		        var OnMax1 = document.getElementById("OnMax").value;
		        var OnMax2 = $("#OnMax").val();
		        var OnMax;
		        /* if(OnMax1 === null || OnMax1 === "" || OnMax1 === undefined) {
		        	OnMax = 0;
		        } else {
		        	OnMax = OnMax1;
		        }
		        alert(OnMax);
		        var CompanyPer1 = $("CompanyPer").val();
		        var CompanyPer;
		        if(CompanyPer1 === null || CompanyPer1 === "" || CompanyPer1 === undefined) {
		        	CompanyPer = 0;
		        } else {
		        	CompanyPer = CompanyPer1;
		        }
		        var SawonPer1 = $("#SawonPer").val();
		        var SawonPer;
		        if(SawonPer1 === null || SawonPer1 === "" || SawonPer === undefined) {
		        	SawonPer = 0;
		        } else {
		        	SawonPer = SawonPer1;
		        } */
		        
		        var Mon = MonChk ? "Y" : "N";
		        var Tues = TuesChk ? "Y" : "N";
		        var Wednes = WednesChk ? "Y" : "N";
		        var Thurs = ThursChk ? "Y" : "N";
		        var Fri = FriChk ? "Y" : "N";
		        var Satur = SaturChk ? "Y" : "N";
		        var Sun = SunChk ? "Y" : "N";
		        var Holy = HolyChk ? "Y" : "N";
		        var chkPeriod = chkPeriod ? "Y" : "N";
		        var DcNoChk = DcNoChk ? "Y" : "N";
		        var OldAgeDCNoGbn = OldAgeDCNoGbn ? "Y" : "N";
		        var DcNo3MonthChk = DcNo3MonthChk ? "Y" : "N";
		        var nvat = nvat ? "Y" : "N";
		        var WebEnd = WebEnd ? "Y" : "N";
		        var RecommendGbn = RecommendGbn ? "Y" : "N";
		        var inliveRegster = inliveRegster ? "Y" : "N";
		        var IsDelete = IsDelete ? "Y" : "N";
		        var AgeYearGbn = AgeYearGbn ? "Y" : "N";
		        var LotteryGbn = LotteryGbn ? "Y" : "N";

		        datas += "&Mon=" + Mon;
		        datas += "&Tues=" + Tues;
		        datas += "&Wednes=" + Wednes;
		        datas += "&Thurs=" + Thurs;
		        datas += "&Fri=" + Fri;
		        datas += "&Satur=" + Satur;
		        datas += "&Sun=" + Sun;
		        datas += "&Holy=" + Holy;
		        datas += "&chkPeriod=" + chkPeriod;
		        datas += "&DcNoChk=" + DcNoChk;
		        datas += "&OldAgeDCNoGbn=" + OldAgeDCNoGbn;
		        datas += "&DcNo3MonthChk=" + DcNo3MonthChk;
		        datas += "&nvat=" + nvat;
		        datas += "&WebEnd=" + WebEnd;
		        datas += "&RecommendGbn=" + RecommendGbn;
		        datas += "&inliveRegster=" + inliveRegster;
		        /* datas += "&OnMax=" + OnMax;
		        datas += "&CompanyPer=" + CompanyPer;
		        datas += "&SawonPer=" + SawonPer; */
		        datas += "&IsDelete=" + IsDelete;
		        datas += "&AgeYearGbn=" + AgeYearGbn;
		        datas += "&LotteryGbn=" + LotteryGbn;
				
				$.ajax({
					type : "post", 
                    url : "insertClassInfo.do",
                    data : datas, 
                    success : function() {
                    	location.href = "classinfo.do";
                    },
                    error : function(xhr, status, error) {
            			console.log("Status: " + status);
                        console.log("Error: " + error);
            		}
				})
			})
		});
		
		
		function onlyNumber(obj) {
		    $(obj).keyup(function(){
		         $(this).val($(this).val().replace(/[^0-9]/g,""));
		    }); 
		}
		
	</script>
</body>
</html>
