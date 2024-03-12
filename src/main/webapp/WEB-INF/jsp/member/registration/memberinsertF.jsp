<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../include/AdminTop.jsp" %>
<%@page import="java.util.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head><head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/lib/js/exeDaumPostCode.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <link href="${pageContext.request.contextPath}/new_lib/vendors/fullcalendar/main.min.css" rel="stylesheet">
 <link href="${pageContext.request.contextPath}/new_lib/vendors/flatpickr/flatpickr.min.css" rel="stylesheet">
</head>
<body>
        <div class="mb-9">
        <form action="memberinsertP" method="POST" accept-charset="UTF-8" id="myForm">
			<div class="row align-items-center justify-content-between g-3 mb-4">
				<div class="col-auto">
					<h2 class="mb-0">회원등록관리</h2>
				</div>
            <div class="col-auto">
              <div class="row g-3">
                <div class="col-auto">
                	<button class="btn btn-success me-1 mb-1" type="submit">저장</button>
                	<button class="btn btn-danger me-1 mb-1" type="button" onclick="history.back(-1);">취소</button>
                </div>
              </div>
            </div>
          </div>
          <div class="row g-5">
            <div class="col-12 col-xxl-4">
              <div class="row g-3 g-xxl-0 h-100">
                <div class="col-12 col-md-7 col-xxl-12 mb-xxl-3">
                  <div class="card h-100">
                    <div class="card-body d-flex flex-column justify-content-between pb-3">
                      <div class="row align-items-center g-5 mb-5 text-center text-sm-start">
                        <div class="col-12 col-sm-auto mb-sm-2">
                          <div class="avatar avatar-5xl"><img class="rounded-circle" src="${pageContext.request.contextPath}/new_lib/assets/img/team/15.webp"/></div>
                        </div>
                        <div class="col-12 col-sm-auto flex-1">
                        	<h6 class="text-primary">회원성명</h6>
                        	 <input class="form-control form-control-lg" id="name" type="text" value="${tblmember.name}" name="name"/> 
                        	 <input type="hidden" id="regdate" name="regdate">
                          <p class="text-800">
					  	  	${memberid}&emsp;<input class="form-check-input" id="isdeletecheck" type="checkbox" name="isdeletecheck" disabled="disabled"/>
					  	  	<input type="hidden" value="${memberid}" name="memberID" id="memberID">
					 	  	<label class="form-check-label text-9000" for="fragileCheck">대관팀</label>
					  	</p>
					  	
                        </div>
                      </div>
                 <div class="col-sm-6 col-md-3 mb-2" style="padding-left: 170px; margin-top: -70px; width: 350px;">
					<div class="form-floating">

							<select class="form-select" id="SiteCode" name="SiteCode">
							<c:forEach var="sitevalue" items="${sitelist}">
								<c:choose>
									<c:when test="${sitevalue.siteCode eq '10001'}">
										<option value="${sitevalue.siteCode}" class="text-primary">${sitevalue.siteName}</option>
									</c:when>
									<c:when test="${sitevalue.siteCode eq '10002'}">
										<option value="${sitevalue.siteCode}" class="text-danger">${sitevalue.siteName}</option>
									</c:when>
									<c:when test="${sitevalue.siteCode eq '10003'}">
										<option value="${sitevalue.siteCode}" class="text-success">${sitevalue.siteName}</option>
									</c:when>
									<c:when test="${sitevalue.siteCode eq '10004'}">
										<option value="${sitevalue.siteCode}" class="text-info">${sitevalue.siteName}</option>
									</c:when>
									<c:when test="${sitevalue.siteCode eq '10005'}">
										<option value="${sitevalue.siteCode}" class="text-warning">${sitevalue.siteName}</option>
									</c:when>
									<c:when test="${sitevalue.siteCode eq '10006'}">
										<option value="${sitevalue.siteCode}" class="text-secondary">${sitevalue.siteName}</option>
									</c:when>
									<c:otherwise>
										<option value="${sitevalue.siteCode}" class="text-secondary">${sitevalue.siteName}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
						<label for="state">주 이용시설</label>
					</div>
				</div>
                      <div class="d-flex flex-between-center border-top border-dashed border-300 pt-4">
                          <div class="col-sm-6 col-md-4">
                          	<h6 class="text-primary">생년월일</h6>
                          	<input class="form-control form-control-sm" id="birthDay" type="date" name="birthDay"/>
                        </div>
                        <div class="col-sm-6 col-md-2">
                          <h6 class="text-primary">나이(만)</h6>
                         <input class="form-control form-control-sm" id="age" type="number" name="age" value="0" min="0"/>
                        </div>
                        <script type="text/javascript">
                     // Get the input fields
                        const birthDayInput = document.getElementById('birthDay');
                        const ageInput = document.getElementById('age');

                        // Calculate age based on the birthdate
                        birthDayInput.addEventListener('change', function() {
                            const birthDate = new Date(birthDayInput.value);
                            const today = new Date();

                            let age = today.getFullYear() - birthDate.getFullYear();
                            const monthDiff = today.getMonth() - birthDate.getMonth();

                            if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
                                age--;
                            }

                            ageInput.value = age;
                        });
                        
                        document.addEventListener('keydown', function(event) {
					          if (event.key === 'Escape') {
					        	  history.back(-1);
					          }
						    });
                     // Get the current date
                        var currentDate = new Date();

                        // Format the date as yyyy-mm-dd
                        var formattedDate = currentDate.getFullYear() + '-' + ('0' + (currentDate.getMonth() + 1)).slice(-2) + '-' + ('0' + currentDate.getDate()).slice(-2);

                        // Set the formatted date as the value of the hidden input
                        document.getElementById('regdate').value = formattedDate;
                        </script>
                        <div class="col-sm-6 col-md-3">
                          <h6 class="text-primary">성별</h6>
                          <select class="form-select" id="gender" name="gender">
                          	<option value="0">여자</option>
                          	<option value="1">남자</option>
                          </select>
                        </div>
                      </div>
                      <div class="d-flex flex-between-center border-top border-dashed border-300 pt-4">
                        <div class="col-sm-6 col-md-4">
                          <h6 class="text-primary">휴대전화</h6>
                          <input class="form-control form-control-sm" id="cellPhone" type="tel" name="cellPhone" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" oninput="oninputPhone(this)"/>
                        </div>
                        <script type="text/javascript">
                        function oninputPhone(target) {
                            target.value = target.value
                                .replace(/[^0-9]/g, '')
                                .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
                        }
                        </script>
                        <div class="col-sm-6 col-md-4">
                          <h6>일반전화</h6>
                          <input class="form-control form-control-sm" id="homePhone" type="tel" name="homePhone" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" oninput="oninputPhone(this)" />
                        </div>
                        <div class="col-sm-6 col-md-4">
                          <h6 class="text-primary">비상연락처 <input class="form-check-input" id="emgPhonecheck" type="checkbox" name="emgPhonecheck" style="margin-top: -1px;"/>
					 	  <label class="form-check-label text-9000" for="emgPhonecheck">갱신</label></h6>
                          <input class="form-control form-control-sm" id="emgPhone" type="tel" name="emgPhone" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" oninput="oninputPhone(this)" />
                        </div>
                      </div>
                      <div class="d-flex flex-between-center border-top border-dashed border-300 pt-4">
                        <div>
                          <h6>회원등급</h6>
                          <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="MLevel" id="MLevel">
                          	  <option value="0"></option>
							  <c:forEach var="code" items="${codelist}">
							  <option value="${code.pkid}">${code.codeName}</option>
							  </c:forEach>
						  </select>
                        </div>
                        <div>
                          <h6>회원구분</h6>
                          <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="type" id="type">
                          <option value="12">어른</option>
                          <option value="20">청소년</option>
                          <option value="11">어린이</option>
                          <option value="40">경로</option>
                          </select>
                        </div>
                        <div>
                          <h6>할인유형</h6>
                          <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="DCDS" name="DCDS" >
                          	<option value="0"></option>
                          	<c:forEach var="dc" items="${dclist}">
                          		<option value="${dc.dcid}">${dc.dcName}</option>
                          	</c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-md-5 col-xxl-12 mb-xxl-3">
                  <div class="card h-100">
                    <div class="card-body pb-3">
						<ul class="nav nav-underline" id="myTab" role="tablist">
  							<li class="nav-item"><a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#tab-home" role="tab" aria-controls="tab-home" aria-selected="true">기본정보</a></li>
  							<li class="nav-item"><a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#tab-profile" role="tab" aria-controls="tab-profile" aria-selected="false">추가정보</a></li>
						</ul>
					<div class="tab-content mt-3" id="myTabContent">
					  <div class="tab-pane fade show active" id="tab-home" role="tabpanel" aria-labelledby="home-tab">
					  <br>
					  <div class="row g-5 mb-6">
					  <div class="col-sm-6 col-md-4">
					  <h5 class="text-800">웹아이디</h5>
					  <input class="form-control form-control-sm" id="webID" type="text" name="webID"/>
					  </div>
					  <div class="col-sm-6 col-md-4">
					  	<h5 class="text-800" style="margin-left: 2px;">카드번호</h5>
					  	<input class="form-control form-control-sm" id="barCode" type="text" name="barCode"/>
					  </div>
					  </div>
					  <div class="row g-5 mb-4">
					  <div class="col-sm-6 col-md-5">
					  <h5 class="text-800">우편번호</h5>
					   <div class="input-group input-group-sm mb-3">
					  <input class="form-control" id="ZipCode" type="text" name="ZipCode" readonly="readonly" maxlength="8" aria-describedby="ZipCodespan" />
						 <span class="input-group-text" id="ZipCodespan" style="cursor: pointer;" onclick="execDaumPostcode()">검색</span> 
					   </div> 
					 </div>
					  <div class="col-sm-6 col-md-5">
					  	<h5 class="text-800">서울시민카드</h5>
					  	<input class="form-control form-control-sm" id="SCCCardNo" type="text" name="SCCCardNo" />
					  </div>
					  </div>
					  <div class="col-sm-6 col-md-9">
					  <h5 class="text-800">주소</h5>
					  <input class="form-control form-control-sm" id="Address" type="text" name="Address" readonly="readonly"/>
					  </div>
					  <div class="col-sm-6 col-md-5">
					  <input class="form-control form-control-sm" id="SubAddress" type="text" name="SubAddress" />
                      </div>
                      <br>
                      <div class="row g-5 mb-3">
                      <div class="col-sm-6 col-md-3" style="width: 142px;">
                      <h5 class="text-800">거주구분<input class="form-check-input" id="IFFlagcheck" type="checkbox" name="IFFlagcheck" style="margin-top: -1px;" />
					 	  <label class="form-check-label text-9000" for="IFFlagcheck">갱신</label></h5>
                      <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="IFFlag" name="IFFlag">
                     	<option value="0"></option>
						<option value="Y">구민</option>
						<option value="N">구외</option>
                      </select>
                      </div>
					  <div class="col-sm-6 col-md-4">
					  	<h5 class="text-800">차량번호</h5>
					  	<input class="form-control form-control-sm" id="carNo" type="text" name="carNo"/>
					  </div>
					  </div>
					   <div class="col-sm-6 col-md-5">
					  <h5 class="text-800">다자녀 막내생일</h5>
					  <input class="form-control form-control-sm" id="youngestBirthday" type="date" name="youngestBirthday"/>
					  </div>
					  </div>
					  <div class="tab-pane fade" id="tab-profile" role="tabpanel" aria-labelledby="profile-tab">
					  <br>
					  <div class="col-sm-6 col-md-6">
						  <h5 class="text-800">
						    할인유형 (<input class="form-check-input" id="DCIDcheck" type="checkbox" name="DCIDcheck" style="margin-top: -1px;"/>
						  <label class="form-check-label text-900 fs-0" for="DCIDcheck">갱신</label>)
						  </h5>
						  <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="DCID" name="DCID">
						  	<option value="0"></option>
	                      	<c:forEach var="pissdc" items="${pissdclist}">
	                      		<option value="${pissdc.dcid}">${pissdc.dcName}</option>
	                      	</c:forEach>
	                      </select>
						  <font color="red" size="1">
						 	 ※할인 미선택: 재등록 시 할인 적용 안됨
						  </font>
					  </div>
					  <br>
					  <div class="col-sm-6 col-md-6">
						  <h5 class="text-800">E-Mail</h5>
						  <input class="form-control form-control-sm" id="email" type="text" name="email"/>
					  </div>
					   <div>
					  <input class="form-check-input" id="rejectgbncheck" type="checkbox" name="rejectgbncheck"/>
					  <label class="form-check-label text-9000" for="rejectgbncheck">재등록 및 입장제한</label>
					  </div>	
					  <br>
					  <div class="col-sm-6 col-md-6">
					  	<h5 class="text-800">은행명</h5>
					  	<input class="form-control form-control-sm" id="bankName" type="text" name="bankName"/>
					  </div>
					  <br>
					  <div class="col-sm-6 col-md-6">
						  <h5 class="text-800">예금주</h5>
						  <input class="form-control form-control-sm" id="bankAccount" type="text" name="bankAccount"/>
					  </div>
					  <br>
					  <div class="col-sm-6 col-md-6">
						  <h5 class="text-800">계좌번호</h5>
						  <input class="form-control form-control-sm" id="bankAccountNo" type="text" name="bankAccountNo"/>
					  </div>
					  <br>
					  <br>
					  <div style="margin-left: 230px;margin-top: -90px;">
					   <input class="form-check-input" id="emailsend" type="checkbox" name="remailcheck"/>
					  <label class="form-check-label text-9000" for="emailsend">E-mail 수신</label><br>
					   <input class="form-check-input" id="smssend" type="checkbox" name="rsmscheck"/>
					  <label class="form-check-label text-9000" for="smssend">SMS 수신</label><br>
					   <input class="form-check-input" id="dmsend" type="checkbox" name="rdmcheck"/>
					  <label class="form-check-label text-9000" for="dmsend">DM 수신</label><br>
					  </div>
					  <h5 class="text-800">본인인증</h5>
					  <p>
					  	${tblmember.ipinNumbertext}
					  </p>
					  </div>
					</div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="card h-100">
                    <div class="card-body">
                      <h3 class="mb-4">비고</h3>
                      <textarea class="form-control mb-3" rows="4" name="note" id="note" readonly="readonly">${tblmember.note}</textarea>
                      <button class="btn btn-phoenix-primary w-100 mb-4">비고저장</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </form>
            <div class="col-12 col-xxl-8">
            <div class="card h-100">
            <div class="card-body pb-3">
      		<ul class="nav nav-underline" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="learn-tab" data-bs-toggle="tab" href="#tab-learn" role="tab" aria-controls="tab-learn" aria-selected="true">수강 및 사물함 정보</a></li>
				<li class="nav-item"><a class="nav-link" id="cost-tab" data-bs-toggle="tab" href="#tab-cost" role="tab" aria-controls="tab-cost" aria-selected="false">기타비용정보</a></li>
				<li class="nav-item"><a class="nav-link" id="propose-tab" data-bs-toggle="tab" href="#tab-propose" role="tab" aria-controls="tab-propose" aria-selected="false">출석정보</a></li>
				<li class="nav-item"><a class="nav-link" id="consulting-tab" data-bs-toggle="tab" href="#tab-consulting" role="tab" aria-controls="tab-consulting" aria-selected="false">회원상담</a></li>
				<li class="nav-item"><a class="nav-link" id="otherlearn-tab" data-bs-toggle="tab" href="#tab-otherlearn" role="tab" aria-controls="tab-otherlearn" aria-selected="false">타사업장수강(1년)</a></li>
			</ul>
			<div class="tab-content mt-3" id="myTabContent">
			<div class="tab-pane fade show active" id="tab-learn" role="tabpanel" aria-labelledby="learn-tab">
              <div class="mb-6">
                <h3 class="mb-4" style="padding-top: 3px;">수강 정보</h3>
                <div id="learntable" data-list='{"valueNames":["State","SaleDate","GroupName","SubGroupName","WeekName","Time","LevelName","Date","Regmonth","RealPrice","Note","InType"],"page":6,"pagination":true}'>
                  <div class="table-responsive scrollbar">
                    <table class="table table-sm fs--1 mb-0">
                      <thead>
                        <tr>
                          <th class="sort white-space-nowrap align-middle ps-0 pe-3" scope="col" data-sort="State" style="width:10%;">상태</th>
                          <th class="sort align-middle text-end pe-7" scope="col" data-sort="SaleDate" style="width:20%;">접수일자</th>
                          <th class="sort align-middle white-space-nowrap pe-3" scope="col" data-sort="GroupName" style="width:15%;">종목</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="SubGroupName" style="width:20%;">강좌명</th>
                          <th class="sort align-middle white-space-nowrap text-start" scope="col" data-sort="WeekName" style="width:30%;">요일</th>
                          <th class="sort align-middle text-end pe-0" scope="col" data-sort="Time">시간</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="LevelName" style="width:20%;">단계</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="Date" style="width:20%;">수강기간</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="Regmonth" style="width:20%;">등록개월</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="RealPrice" style="width:20%;">결제금액</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="Note" style="width:20%;">비고</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="InType" style="width:20%;">등록구분</th>
                        </tr>
                      </thead>
                      <tbody class="list" id="customer-order-table-body">
                      	<c:forEach var="list" items="${fmsc_s01}">
                        <tr class="learntable">
                          <td class="State align-middle white-space-nowrap text-1200 fs--2 text-start">
                          <c:choose>
                          <c:when test="${list.state eq '현재원'}">
                            <span class="badge badge-phoenix fs--2 badge-phoenix-success">${list.state}<span class="ms-1" data-feather="check" style="height:12.8px;width:12.8px;"></span></span>
                          </c:when>
                          <c:when test="${list.state eq '환불'}">
                            <span class="badge badge-phoenix fs--2 badge-phoenix-danger">${list.state}<span class="ms-3" data-feather="x" style="height:12.8px;width:12.8px;"></span></span>
                          </c:when>
                          <c:otherwise>
                            <span class="badge badge-phoenix fs--2 badge-phoenix-secondary">${list.state}<span class="ms-2" data-feather="info" style="height:12.8px;width:12.8px;"></span></span>
                          </c:otherwise>
                          </c:choose>
                          </td>
                          <td class="SaleDate align-middle white-space-nowrap text-900 fs--1 text-start">${list.saleDate}</td>
                          <td class="GroupName align-middle white-space-nowrap text-900 fs--1 text-start">${list.groupName}</td>
                          <td class="SubGroupName align-middle white-space-nowrap text-900 fs--1 text-start">${list.subGroupName}</td>
                          <td class="WeekName align-middle white-space-nowrap text-900 fs--1 text-start">${list.weekName}</td>
                          <td class="Time align-middle white-space-nowrap text-900 fs--1 text-start">${list.fromTime} ~ ${list.toTime}</td>
                          <td class="LevelName align-middle white-space-nowrap text-900 fs--1 text-start">${list.levelName}</td>
                          <td class="Date align-middle white-space-nowrap text-900 fs--1 text-start">${list.RFromDate} ~ ${list.RToDate}</td>
                          <td class="Regmonth align-middle white-space-nowrap text-700 fs--1 text-end">${list.regmonth}</td>
                          <td class="RealPrice align-middle white-space-nowrap text-700 fs--1 text-start">${list.realPrice}</td>
                          <td class="Note align-middle white-space-nowrap text-900 fs--1 text-start">${list.note}</td>
                          <td class="InType align-middle white-space-nowrap text-900 fs--1 text-start">${list.inType}</td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                  <div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
                    <div class="col-auto d-flex">
                      <p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
                    </div>
                    <div class="col-auto d-flex">
                      <button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                      <ul class="mb-0 pagination"></ul>
                      <button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="mb-6">
                <h3 class="mb-4">사물함 정보</h3>	
                <div id="tableLocker" data-list='{"valueNames":["LockerName","RegDate","FromDate","ToDate","RegMonth","RealPrice","PaidPrice","Misu","IsFlag","ReturnDate"],"page":5,"pagination":true}'>
                  <div class="table-responsive scrollbar">
                    <table class="table table-sm fs--1 mb-0">
                      <thead>
                        <tr>
                          <th class="sort align-middle text-700" scope="col" data-sort="LockerName" style="width:15%;">사물함</th>
                          <th class="sort align-middle text-700" scope="col" data-sort="RegDate" style="width:15%;">신청일</th>
                          <th class="sort align-middle text-700" scope="col" data-sort="FromDate" style="width:20%;">시작일</th>
                          <th class="sort align-middle text-700" scope="col" data-sort="ToDate" style="width:15%;">종료일</th>
                          <th class="sort align-middle text-700" scope="col" data-sort="RegMonth" style="width:15%;">기간</th>
                          <th class="sort align-middle text-700" scope="col" data-sort="RealPrice" style="width:15%;">판매금액</th>
                          <th class="sort align-middle text-700" scope="col" data-sort="PaidPrice" style="width:15%;">결제금액</th>
                          <th class="sort align-middle text-700" scope="col" data-sort="Misu" style="width:15%;">미수금액</th>
                          <th class="sort align-middle text-end" scope="col" data-sort="IsFlag" style="width:15%;">반납</th>
                          <th class="sort align-middle text-end" scope="col" data-sort="ReturnDate" style="width:20%;">반납일</th>
                        </tr>
                      </thead>
                      <tbody class="list" id="customer-wishlist-table-body">
                      	<c:forEach var="locker" items="${lockerlist}">
                        <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                          <td class="LockerName align-middle white-space-nowrap fs--1 text-900">[${locker.PLockerGroupName}-${locker.PLockerLocation}] ${locker.PLockerNo}</td>
                          <td class="RegDate align-middle text-900 fs--1 fw-semi-bold text-start">${locker.regDate}</td>
                          <td class="FromDate align-middle fw-bold text-900">${locker.fromDate}</td>
                          <td class="ToDate align-middle fw-bold text-900">${locker.toDate}</td>
                          <td class="RegMonth align-middle fw-bold text-700">${locker.regMonth}개월</td>
                          <td class="RealPrice align-middle fw-bold text-700">${locker.realPrice}</td>
                          <td class="PaidPrice align-middle fw-bold text-700">${locker.paidPrice}</td>
                          <td class="Misu align-middle fw-bold text-700">${locker.misu}</td>
                          <td class="IsFlag align-middle fw-bold text-1000 text-end">
                          <c:choose>
                          <c:when test="${locker.isFlagText eq '반납'}">
                          	<span class="badge badge-phoenix fs--2 badge-phoenix-secondary">${locker.isFlagText}</span>
                          </c:when>
                          <c:when test="${locker.isFlagText eq '취소'}">
                          	<span class="badge badge-phoenix fs--2 badge-phoenix-warning">${locker.isFlagText}</span>
                          </c:when>
                          <c:when test="${locker.isFlagText eq '환불'}">
                          	<span class="badge badge-phoenix fs--2 badge-phoenix-danger">${locker.isFlagText}</span>
                          </c:when>
                          <c:otherwise>
                          	${locker.isFlagText}
                          </c:otherwise>
                          </c:choose>
                          </td>
                          <td class="ReturnDate align-middle white-space-nowrap text-start">${locker.returnDate}</td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                  <div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
                    <div class="col-auto d-flex">
                      <p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
                    </div>
                    <div class="col-auto d-flex">
                      <button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                      <ul class="mb-0 pagination"></ul>
                      <button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
                    </div>
                  </div>
                </div>
              </div>
               </div>
               <div class="tab-pane fade" id="tab-cost" role="tabpanel" aria-labelledby="cost-tab">
                <div class="mb-6">
                <h3 class="mb-4">기타비용정보</h3>
                <div  id="tablepaid" data-list='{"valueNames":["ExpenseGroupName","ExpenseName","InOut","SaleDate","Price","DefPrice","minabPrice"],"page":5,"pagination":true}'>
                  <div class="table-responsive scrollbar">
                    <table class="table fs--1 mb-0">
                      <thead>
                        <tr>
                          <th class="sort align-middle" scope="col" data-sort="ExpenseGroupName" style="width:15%;">분류</th>
                          <th class="sort align-middle text-start" scope="col" data-sort="ExpenseName" style="width:30%;">항목</th>
                          <th class="sort align-middle text-start" scope="col" data-sort="InOut" style="width:20%;">지출구분</th>
                          <th class="sort align-middle text-end" scope="col" data-sort="SaleDate" style="width:15%;">매출일자</th>
                          <th class="sort align-middle text-end" scope="col" data-sort="Price" style="width:15%;">판매금액</th>
                          <th class="sort align-middle text-end" scope="col" data-sort="DefPrice" style="width:15%;">결제금액</th>
                          <th class="sort align-middle text-end" scope="col" data-sort="minabPrice" style="width:15%;">미납금액</th>
                        </tr>
                      </thead>
                      <tbody class="list" id="customer-wishlist-table-body">
                      	<c:forEach var="paid" items="${paidlist}">
                        <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                          <td class="LockerName align-middle white-space-nowrap fs--1 text-900">${paid.expenseGroupName}</td>
                          <td class="RegDate align-middle text-900 fs--1 text-900">${paid.expenseName}</td>
                          <td class="FromDate align-middle text-1000 text-900">${paid.inOut}</td>
                          <td class="ToDate align-middle text-1000 text-end">${paid.saleDate}</td>
                          <td class="RegMonth align-middle text-1000 text-end">${paid.price}</td>
                          <td class="RealPrice align-middle text-1000 text-end">${paid.defPrice}</td>
                          <td class="PaidPrice align-middle text-1000 text-end">${paid.minabPrice}</td>
                        </tr>
                        </c:forEach> 
                      </tbody>
                    </table>
                  </div>
                  <div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
                    <div class="col-auto d-flex">
                      <p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p><a class="fw-semi-bold" href="#!" data-list-view="*">View all<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a><a class="fw-semi-bold d-none" href="#!" data-list-view="less">View Less<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a>
                    </div>
                    <div class="col-auto d-flex">
                      <button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                      <ul class="mb-0 pagination"></ul>
                      <button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
                    </div>
                  </div>
                </div>
              </div>
           </div>
           <div class="tab-pane fade" id="tab-propose" role="tabpanel" aria-labelledby="propose-tab">
               <h3 class="mb-4">출석정보</h3>

								<div
									data-calendar="{&quot;events&quot;:[{&quot;title&quot;:&quot;Bootcamp&quot;,&quot;start&quot;:&quot;2023-06-19&quot;}]}"
									class="fc fc-media-screen fc-direction-ltr fc-theme-standard">
									<div class="fc-header-toolbar fc-toolbar fc-toolbar-ltr">
										<div class="fc-toolbar-chunk">
											<div class="fc-button-group">
												<button type="button" title="Previous Month"
													aria-pressed="false"
													class="fc-prev-button fc-button fc-button-primary">
													<span class="fc-icon fc-icon-chevron-left"></span>
												</button>
												<button type="button" title="Next Month"
													aria-pressed="false"
													class="fc-next-button fc-button fc-button-primary">
													<span class="fc-icon fc-icon-chevron-right"></span>
												</button>
											</div>
											<button type="button" title="This Month" disabled=""
												aria-pressed="false"
												class="fc-today-button fc-button fc-button-primary">오늘날짜</button>
										</div>
										<div class="fc-toolbar-chunk">
											<h2 class="fc-toolbar-title" id="fc-dom-1">2023년 11월</h2>
										</div>
										<div class="fc-toolbar-chunk">
											<div class="fc-button-group">
												<button type="button" title="Month view" aria-pressed="true"
													class="fc-dayGridMonth-button fc-button fc-button-primary fc-button-active">월간</button>
												<button type="button" title="Week view" aria-pressed="false"
													class="fc-timeGridWeek-button fc-button fc-button-primary">주간</button>
												<button type="button" title="Day view" aria-pressed="false"
													class="fc-timeGridDay-button fc-button fc-button-primary">일간</button>
											</div>
										</div>
									</div>
									<div aria-labelledby="fc-dom-1"
										class="fc-view-harness fc-view-harness-active"
										style="height: 1125.19px;">
										<div class="fc-daygrid fc-dayGridMonth-view fc-view">
											<table role="grid"
												class="fc-scrollgrid  fc-scrollgrid-liquid">
												<thead role="rowgroup">
													<tr role="presentation"
														class="fc-scrollgrid-section fc-scrollgrid-section-header ">
														<th role="presentation"><div
																class="fc-scroller-harness">
																<div class="fc-scroller" style="overflow: hidden;">
																	<table role="presentation" class="fc-col-header "
																		style="width: 1516px;">
																		<colgroup></colgroup>
																		<thead role="presentation">
																			<tr role="row">
																				<th role="columnheader"
																					class="fc-col-header-cell fc-day fc-day-sun"><div
																						class="fc-scrollgrid-sync-inner">
																						<a aria-label="Sunday"
																							class="fc-col-header-cell-cushion ">일요일</a>
																					</div></th>
																				<th role="columnheader"
																					class="fc-col-header-cell fc-day fc-day-mon"><div
																						class="fc-scrollgrid-sync-inner">
																						<a aria-label="Monday"
																							class="fc-col-header-cell-cushion ">월요일</a>
																					</div></th>
																				<th role="columnheader"
																					class="fc-col-header-cell fc-day fc-day-tue"><div
																						class="fc-scrollgrid-sync-inner">
																						<a aria-label="Tuesday"
																							class="fc-col-header-cell-cushion ">화요일</a>
																					</div></th>
																				<th role="columnheader"
																					class="fc-col-header-cell fc-day fc-day-wed"><div
																						class="fc-scrollgrid-sync-inner">
																						<a aria-label="Wednesday"
																							class="fc-col-header-cell-cushion ">수요일</a>
																					</div></th>
																				<th role="columnheader"
																					class="fc-col-header-cell fc-day fc-day-thu"><div
																						class="fc-scrollgrid-sync-inner">
																						<a aria-label="Thursday"
																							class="fc-col-header-cell-cushion ">목요일</a>
																					</div></th>
																				<th role="columnheader"
																					class="fc-col-header-cell fc-day fc-day-fri"><div
																						class="fc-scrollgrid-sync-inner">
																						<a aria-label="Friday"
																							class="fc-col-header-cell-cushion ">금요일</a>
																					</div></th>
																				<th role="columnheader"
																					class="fc-col-header-cell fc-day fc-day-sat"><div
																						class="fc-scrollgrid-sync-inner">
																						<a aria-label="Saturday"
																							class="fc-col-header-cell-cushion ">토요일</a>
																					</div>
																				</th>
																			</tr>
																		</thead>
																	</table>
																</div>
															</div>
														</th>
													</tr>
												</thead>
												<tbody role="rowgroup">
													<tr role="presentation"
														class="fc-scrollgrid-section fc-scrollgrid-section-body  fc-scrollgrid-section-liquid">
														<td role="presentation"><div
																class="fc-scroller-harness fc-scroller-harness-liquid">
																<div class="fc-scroller fc-scroller-liquid-absolute"
																	style="overflow: hidden auto;">
																	<div
																		class="fc-daygrid-body fc-daygrid-body-unbalanced "
																		style="width: 1516px;">
																		<table role="presentation"
																			class="fc-scrollgrid-sync-table"
																			style="width: 1516px; height: 1075px;">
																			<colgroup></colgroup>
																			<tbody role="presentation">
																				<tr role="row">
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other"
																						data-date="2023-10-29" aria-labelledby="fc-dom-2"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-2" class="fc-daygrid-day-number"
																									aria-label="October 29, 2023">29</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-mon fc-day-past fc-day-other"
																						data-date="2023-10-30" aria-labelledby="fc-dom-4"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-4" class="fc-daygrid-day-number"
																									aria-label="October 30, 2023">30</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-tue fc-day-past fc-day-other"
																						data-date="2023-10-31" aria-labelledby="fc-dom-6"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-6" class="fc-daygrid-day-number"
																									aria-label="October 31, 2023">31</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
																						data-date="2023-11-01" aria-labelledby="fc-dom-8"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-8" class="fc-daygrid-day-number"
																									aria-label="November 1, 2023">1</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
																						data-date="2023-11-02" aria-labelledby="fc-dom-10"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-10" class="fc-daygrid-day-number"
																									aria-label="November 2, 2023">2</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
																						data-date="2023-11-03" aria-labelledby="fc-dom-12"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-12" class="fc-daygrid-day-number"
																									aria-label="November 3, 2023">3</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
																						data-date="2023-11-04" aria-labelledby="fc-dom-14"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-14" class="fc-daygrid-day-number"
																									aria-label="November 4, 2023">4</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																				</tr>
																				<tr role="row">
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
																						data-date="2023-11-05" aria-labelledby="fc-dom-16"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-16" class="fc-daygrid-day-number"
																									aria-label="November 5, 2023">5</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
																						data-date="2023-11-06" aria-labelledby="fc-dom-18"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-18" class="fc-daygrid-day-number"
																									aria-label="November 6, 2023">6</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
																						data-date="2023-11-07" aria-labelledby="fc-dom-20"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-20" class="fc-daygrid-day-number"
																									aria-label="November 7, 2023">7</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
																						data-date="2023-11-08" aria-labelledby="fc-dom-22"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-22" class="fc-daygrid-day-number"
																									aria-label="November 8, 2023">8</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
																						data-date="2023-11-09" aria-labelledby="fc-dom-24"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-24" class="fc-daygrid-day-number"
																									aria-label="November 9, 2023">9</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
																						data-date="2023-11-10" aria-labelledby="fc-dom-26"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-26" class="fc-daygrid-day-number"
																									aria-label="November 10, 2023">10</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
																						data-date="2023-11-11" aria-labelledby="fc-dom-28"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-28" class="fc-daygrid-day-number"
																									aria-label="November 11, 2023">11</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																				</tr>
																				<tr role="row">
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
																						data-date="2023-11-12" aria-labelledby="fc-dom-30"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-30" class="fc-daygrid-day-number"
																									aria-label="November 12, 2023">12</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
																						data-date="2023-11-13" aria-labelledby="fc-dom-32"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-32" class="fc-daygrid-day-number"
																									aria-label="November 13, 2023">13</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-tue fc-day-today "
																						data-date="2023-11-14" aria-labelledby="fc-dom-34"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-34" class="fc-daygrid-day-number"
																									aria-label="November 14, 2023">14</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-wed fc-day-future"
																						data-date="2023-11-15" aria-labelledby="fc-dom-36"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-36" class="fc-daygrid-day-number"
																									aria-label="November 15, 2023">15</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-thu fc-day-future"
																						data-date="2023-11-16" aria-labelledby="fc-dom-38"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-38" class="fc-daygrid-day-number"
																									aria-label="November 16, 2023">16</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-fri fc-day-future"
																						data-date="2023-11-17" aria-labelledby="fc-dom-40"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-40" class="fc-daygrid-day-number"
																									aria-label="November 17, 2023">17</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-sat fc-day-future"
																						data-date="2023-11-18" aria-labelledby="fc-dom-42"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-42" class="fc-daygrid-day-number"
																									aria-label="November 18, 2023">18</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																				</tr>
																				<tr role="row">
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-sun fc-day-future"
																						data-date="2023-11-19" aria-labelledby="fc-dom-44"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-44" class="fc-daygrid-day-number"
																									aria-label="November 19, 2023">19</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-mon fc-day-future"
																						data-date="2023-11-20" aria-labelledby="fc-dom-46"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-46" class="fc-daygrid-day-number"
																									aria-label="November 20, 2023">20</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-tue fc-day-future"
																						data-date="2023-11-21" aria-labelledby="fc-dom-48"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-48" class="fc-daygrid-day-number"
																									aria-label="November 21, 2023">21</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-wed fc-day-future"
																						data-date="2023-11-22" aria-labelledby="fc-dom-50"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-50" class="fc-daygrid-day-number"
																									aria-label="November 22, 2023">22</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-thu fc-day-future"
																						data-date="2023-11-23" aria-labelledby="fc-dom-52"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-52" class="fc-daygrid-day-number"
																									aria-label="November 23, 2023">23</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-fri fc-day-future"
																						data-date="2023-11-24" aria-labelledby="fc-dom-54"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-54" class="fc-daygrid-day-number"
																									aria-label="November 24, 2023">24</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-sat fc-day-future"
																						data-date="2023-11-25" aria-labelledby="fc-dom-56"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-56" class="fc-daygrid-day-number"
																									aria-label="November 25, 2023">25</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																				</tr>
																				<tr role="row">
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-sun fc-day-future"
																						data-date="2023-11-26" aria-labelledby="fc-dom-58"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-58" class="fc-daygrid-day-number"
																									aria-label="November 26, 2023">26</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-mon fc-day-future"
																						data-date="2023-11-27" aria-labelledby="fc-dom-60"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-60" class="fc-daygrid-day-number"
																									aria-label="November 27, 2023">27</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-tue fc-day-future"
																						data-date="2023-11-28" aria-labelledby="fc-dom-62"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-62" class="fc-daygrid-day-number"
																									aria-label="November 28, 2023">28</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-wed fc-day-future"
																						data-date="2023-11-29" aria-labelledby="fc-dom-64"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-64" class="fc-daygrid-day-number"
																									aria-label="November 29, 2023">29</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-thu fc-day-future"
																						data-date="2023-11-30" aria-labelledby="fc-dom-66"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-66" class="fc-daygrid-day-number"
																									aria-label="November 30, 2023">30</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other"
																						data-date="2023-12-01" aria-labelledby="fc-dom-68"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-68" class="fc-daygrid-day-number"
																									aria-label="December 1, 2023">1</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other"
																						data-date="2023-12-02" aria-labelledby="fc-dom-70"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-70" class="fc-daygrid-day-number"
																									aria-label="December 2, 2023">2</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																				</tr>
																				<tr role="row">
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-sun fc-day-future fc-day-other"
																						data-date="2023-12-03" aria-labelledby="fc-dom-72"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-72" class="fc-daygrid-day-number"
																									aria-label="December 3, 2023">3</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-mon fc-day-future fc-day-other"
																						data-date="2023-12-04" aria-labelledby="fc-dom-74"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-74" class="fc-daygrid-day-number"
																									aria-label="December 4, 2023">4</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-tue fc-day-future fc-day-other"
																						data-date="2023-12-05" aria-labelledby="fc-dom-76"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-76" class="fc-daygrid-day-number"
																									aria-label="December 5, 2023">5</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-wed fc-day-future fc-day-other"
																						data-date="2023-12-06" aria-labelledby="fc-dom-78"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-78" class="fc-daygrid-day-number"
																									aria-label="December 6, 2023">6</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-thu fc-day-future fc-day-other"
																						data-date="2023-12-07" aria-labelledby="fc-dom-80"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-80" class="fc-daygrid-day-number"
																									aria-label="December 7, 2023">7</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other"
																						data-date="2023-12-08" aria-labelledby="fc-dom-82"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-82" class="fc-daygrid-day-number"
																									aria-label="December 8, 2023">8</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																					<td role="gridcell"
																						class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other"
																						data-date="2023-12-09" aria-labelledby="fc-dom-84"><div
																							class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																							<div class="fc-daygrid-day-top">
																								<a id="fc-dom-84" class="fc-daygrid-day-number"
																									aria-label="December 9, 2023">9</a>
																							</div>
																							<div class="fc-daygrid-day-events">
																								<div class="fc-daygrid-day-bottom"
																									style="margin-top: 0px;"></div>
																							</div>
																							<div class="fc-daygrid-day-bg"></div>
																						</div></td>
																				</tr>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>

							</div>
           <div class="tab-pane fade" id="tab-consulting" role="tabpanel" aria-labelledby="consulting-tab">
           		<div class="mb-6">
	                <h3 class="mb-4">회원상담관리</h3>
	                <div id="tabletalk" 
	                data-list='{"valueNames":["TalkDate","UserName","TalkText","FollowUpText"],"page":5,"pagination":true}'>
	                  <div class="table-responsive scrollbar">
	                    <table class="table fs--1 mb-0">
	                      <thead>
	                        <tr>
	                          <th class="sort align-middle" scope="col" data-sort="TalkDate" style="width:15%;">상담일자</th>
	                          <th class="sort align-middle text-start" scope="col" data-sort="UserName" style="width:30%;">상담자</th>
	                          <th class="sort align-middle text-start" scope="col" data-sort="TalkText" style="width:20%;">상담내용</th>
	                          <th class="sort align-middle text-end" scope="col" data-sort="FollowUpText" style="width:15%;">조치사항</th>
	                        </tr>
	                      </thead>
	                      <tbody class="list" id="customer-wishlist-table-body">
	                      	<c:forEach var="talk" items="${talklist}">
	                        <tr class="hover-actions-trigger btn-reveal-trigger position-static">
	                          <td class="TalkDate align-middle white-space-nowrap fs--1 text-900">${talk.talkDate}</td>
	                          <td class="UserName align-middle text-900 fs--1 fw-semi-bold text-900">${talk.userName}</td>
	                          <td class="TalkText align-middle fw-bold text-1000 text-900">${talk.talkText}</td>
	                          <td class="FollowUpText align-middle fw-bold text-1000 text-end">${talk.fllowUpText}</td>
	                        </tr>
	                        </c:forEach>
	                      </tbody>
	                    </table>
	                  </div>
	                  <div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
	                    <div class="col-auto d-flex">
	                      <p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p><a class="fw-semi-bold" href="#!" data-list-view="*">View all<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a><a class="fw-semi-bold d-none" href="#!" data-list-view="less">View Less<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a>
	                    </div>
	                    <div class="col-auto d-flex">
	                      <button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
	                      <ul class="mb-0 pagination"></ul>
	                      <button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
	                    </div>
	                  </div>
	                </div>
	              </div>
           	</div>
           <div class="tab-pane fade" id="tab-otherlearn" role="tabpanel" aria-labelledby="otherlearn-tab">
           			              <div class="mb-6">
                <h3 class="mb-4" style="padding-top: 3px;">타사업장수강 정보 (1년)</h3>
                <div id="tableotherlearn" data-list='{"valueNames":["State","SaleDate","GroupName","SubGroupName","WeekName","Time","LevelName","Date","Regmonth","RealPrice","Note","InType","SiteName"],"page":6,"pagination":true}'>
                  <div class="table-responsive scrollbar">
                    <table class="table table-sm fs--1 mb-0">
                      <thead>
                        <tr>
                          <th class="sort white-space-nowrap align-middle ps-0 pe-3" scope="col" data-sort="State" style="width:10%;">상태</th>
                          <th class="sort align-middle text-end pe-7" scope="col" data-sort="SaleDate" style="width:20%;">접수일자</th>
                          <th class="sort align-middle white-space-nowrap pe-3" scope="col" data-sort="GroupName" style="width:15%;">종목</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="SubGroupName" style="width:20%;">강좌명</th>
                          <th class="sort align-middle white-space-nowrap text-start" scope="col" data-sort="WeekName" style="width:30%;">요일</th>
                          <th class="sort align-middle text-end pe-0" scope="col" data-sort="Time">시간</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="LevelName" style="width:20%;">단계</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="Date" style="width:20%;">수강기간</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="Regmonth" style="width:20%;">등록개월</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="RealPrice" style="width:20%;">결제금액</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="Note" style="width:20%;">비고</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="InType" style="width:20%;">등록구분</th>
                          <th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="SiteName" style="width:20%;">사업장</th>
                        </tr>
                      </thead>
                      <tbody class="list" id="customer-order-table-body">
                      	<c:forEach var="anotherlist" items="${anotherlist}">
                        <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                          <td class="State align-middle white-space-nowrap text-900 fs--1 text-start">
                          	<c:choose>
                          		<c:when test="${anotherlist.state eq '현재원'}">
                          			<span class="badge badge-phoenix fs--2 badge-phoenix-success">${anotherlist.state}<span class="ms-1" data-feather="check" style="height:12.8px;width:12.8px;"></span></span>
                          		</c:when>
                          		 <c:when test="${anotherlist.state eq '환불'}">
                           			<span class="badge badge-phoenix fs--2 badge-phoenix-danger">${anotherlist.state}<span class="ms-3" data-feather="x" style="height:12.8px;width:12.8px;"></span></span>
                            	</c:when>
                            	<c:otherwise>
                            		<span class="badge badge-phoenix fs--2 badge-phoenix-secondary">${anotherlist.state}<span class="ms-2" data-feather="info" style="height:12.8px;width:12.8px;"></span></span>
                          		</c:otherwise>
                          	</c:choose>
                          </td>
                          <td class="SaleDate align-middle white-space-nowrap text-900 fs--1 text-start">${anotherlist.saleDate}</td>
                          <td class="GroupName align-middle white-space-nowrap text-900 fs--1 text-start">${anotherlist.groupName}</td>
                          <td class="SubGroupName align-middle white-space-nowrap text-900 fs--1 text-start">${anotherlist.subGroupName}</td>
                          <td class="WeekName align-middle white-space-nowrap text-900 fs--1 text-start">${anotherlist.weekName}</td>
                          <td class="Time align-middle white-space-nowrap text-900 fs--1 text-start">${anotherlist.fromTime} ~ ${anotherlist.toTime}</td>
                          <td class="LevelName align-middle white-space-nowrap text-900 fs--1 text-start">${anotherlist.levelName}</td>
                          <td class="Date align-middle white-space-nowrap text-900 fs--1 text-start">${anotherlist.RFromDate} ~ ${anotherlist.RToDate}</td>
                          <td class="Regmonth align-middle white-space-nowrap text-700 fs--1 text-end">${anotherlist.regmonth}</td>
                          <td class="RealPrice align-middle white-space-nowrap text-700 fs--1 text-start">${anotherlist.realPrice}</td>
                          <td class="Note align-middle white-space-nowrap text-900 fs--1 text-start">${anotherlist.note}</td>
                          <td class="InType align-middle white-space-nowrap text-900 fs--1 text-start">${anotherlist.inType}</td>
                          <td class="SiteName align-middle white-space-nowrap text-900 fs--1 text-start">${anotherlist.siteName}</td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                  <div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
                    <div class="col-auto d-flex">
                      <p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p><a class="fw-semi-bold" href="#!" data-list-view="*">View all<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a><a class="fw-semi-bold d-none" href="#!" data-list-view="less">View Less<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a>
                    </div>
                    <div class="col-auto d-flex">
                      <button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                      <ul class="mb-0 pagination"></ul>
                      <button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
                    </div>
                  </div>
                </div>
              </div>
	          </div>
	      	 </div>
	        </div><!-- 여기가 그것 -->
	      </div>
	     </div>
	   </div>
	 </div>
  </body>
</html>