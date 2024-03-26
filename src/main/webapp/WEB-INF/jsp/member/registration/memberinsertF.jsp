<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/AdminTop.jsp" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/lib/js/exeDaumPostCode.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                          				<div class="avatar avatar-5xl"><img class="rounded-circle" id="memberimage" src="${pageContext.request.contextPath}/files/member/uspot.jpg"/></div>
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
						<div class="tab-content mt-3" id="myTabContent">
							<div class="tab-pane fade show active" id="tab-learn" role="tabpanel" aria-labelledby="learn-tab">
							</div>
	      	 			</div>
	        		</div><!-- 여기가 그것 -->
	      		</div>
	     	</div>
	   	</div>
	</body>
</html>