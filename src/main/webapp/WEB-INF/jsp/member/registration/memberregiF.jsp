<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../include/AdminTop.jsp" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/js/exeDaumPostCode.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <%-- <link href="${pageContext.request.contextPath}/new_lib/vendors/fullcalendar/main.min.css" rel="stylesheet"> --%>
    <link href="${pageContext.request.contextPath}/new_lib/vendors/flatpickr/flatpickr.min.css" rel="stylesheet">
    <script type="text/javascript">
        $(document).ready(function() {
            var originalName = $('.nameview').text(); // 초기 텍스트 저장
            var originalSite = $('#SiteCode').val();
            var originalbirthDay = $('#birthDay').val();
            var originalage = $('#age').val();
            var originalgender = $('#gender').val();
            var originalcellPhone = $('#cellPhone').val();
            var originalhomePhone = $('#homePhone').val();
            var originalemgPhone = $('#emgPhone').val();
            var originalMLevel = $('#MLevel').val();
            var originaltype = $('#type').val();
            var originalDCDS = $('#DCDS').val();
            var originalWebID = $('#webID').val();
            var originalBarCode = $('#barCode').val();
            var originalZipCode = $('#ZipCode').val();
            var originalSCCCardNo = $('#SCCCardNo').val();
            var originalAddress = $('#Address').val();
            var originalSubAddress = $('#SubAddress').val();
            var originalinliveText = $('#inliveText').val();
            var originalinlive = $('#inlive').val();
            var originalCarNo = $('#carNo').val();
            var originalYoungestBirthday = $('#youngestBirthday').val();
            var originalDCID = $('#piscCd').val();
            var originalEmail = $('#email').val();
            var originalBankName = $('#bankName').val();
            var originalBankAccount = $('#bankAccount').val();
            var originalBankAccountNo = $('#bankAccountNo').val();
            var originalnote = $('#note').val();

            $('#updatebutton').click(function() {
                var nameField = $('#name');
                var h3Element = $('.nameview');
                var siteField = $('#SiteCode');
                var birthDayField = $('#birthDay');
                var ageField = $('#age');
                var genderField = $('#gender');
                var cellPhoneField = $('#cellPhone');
                var homePhoneField = $('#homePhone');
                var emgPhonecheck = $('#emgPhonecheck');
                var emgPhoneField = $('#emgPhone');
                var MLevelField = $('#MLevel');
                var typeField = $('#type');

                var DCDSField = $('#DCDS');
                var WebIDField = $('#webID');
                var webIDField = $('#webID');
                var barCodeField = $('#barCode');
                var zipCodeField = $('#ZipCode');
                var ZipCodespan = $('#ZipCodespan');
                var SCCCardNoField = $('#SCCCardNo');
                var addressField = $('#Address');
                var subAddressField = $('#SubAddress');
                var inliveField = $('#inlive');
                var inliveCheck = $('#inliveCheck');
                var carNoField = $('#carNo');
                var youngestBirthdayField = $('#youngestBirthday');
                var DCIDField = $('#piscCd');
                var DCIDcheck = $('#DCIDcheck');
                var emailField = $('#email');
                var bankNameField = $('#bankName');
                var bankAccountField = $('#bankAccount');
                var bankAccountNoField = $('#bankAccountNo');
                var noteField = $('#note');


                var saveButton = $('.btn-success'); // Save 버튼 선택
                var editButton = $(this);

                if (nameField.attr('type') === 'hidden') {
                    // 수정 모드로 변경
                    nameField.attr('type', 'text');
                    nameField.val(originalName); // 원래 텍스트로 복구
                    h3Element.hide(); // 텍스트 숨기기
                    editButton.text('취소');

                    // Save 버튼의 disabled 속성 제거하고 텍스트 변경
                    saveButton.removeAttr('disabled').text('저장(F4)');

                    siteField.removeAttr('disabled');

                    birthDayField.removeAttr('readonly');

                    ageField.removeAttr('readonly');

                    genderField.removeAttr('disabled');

                    cellPhoneField.removeAttr('readonly');

                    homePhoneField.removeAttr('readonly');

                    emgPhonecheck.removeAttr('disabled');

                    emgPhoneField.removeAttr('readonly');

                    MLevelField.removeAttr('disabled');
                    typeField.removeAttr('disabled');
                    DCDSField.removeAttr('disabled');
                    WebIDField.removeAttr('readonly');
                    barCodeField.removeAttr('readonly');
                    SCCCardNoField.removeAttr('readonly');
                    ZipCodespan.attr('onclick', 'execDaumPostcode()');
                    subAddressField.removeAttr('readonly');
                    inliveField.removeAttr('disabled');
                    inliveCheck.removeAttr('disabled');
                    carNoField.removeAttr('readonly');
                    youngestBirthdayField.removeAttr('readonly');
                    DCIDField.removeAttr('disabled');
                    DCIDcheck.removeAttr('disabled');

                    emailField.removeAttr('readonly');
                    bankNameField.removeAttr('readonly');
                    bankAccountField.removeAttr('readonly');
                    bankAccountNoField.removeAttr('readonly');
                    noteField.removeAttr('readonly');

                } else {
                    // 취소 시 초기 텍스트로 복구 및 수정 상태 취소
                    nameField.attr('type', 'hidden');
                    nameField.val(originalName);
                    h3Element.text(originalName); // 초기 텍스트로 변경
                    h3Element.show(); // 텍스트 표시
                    editButton.text('수정(F3)');

                    // Save 버튼의 disabled 속성 추가하고 텍스트 변경
                    saveButton.attr('disabled', 'disabled').text('저장(F4)');
                    siteField.attr('disabled', 'disabled').val(originalSite);
                    birthDayField.attr('readonly', 'readonly').val(originalbirthDay);
                    ageField.attr('readonly', 'readonly').val(originalage);
                    genderField.attr('disabled', 'disabled').val(originalgender);
                    cellPhoneField.attr('readonly', 'readonly').val(originalcellPhone);
                    homePhoneField.attr('readonly', 'readonly').val(originalhomePhone);
                    emgPhonecheck.attr('disabled', 'disabled').prop("checked", false);

                    emgPhoneField.attr('readonly', 'readonly').val(originalemgPhone);

                    MLevelField.attr('disabled', 'disabled').val(originalMLevel);

                    typeField.attr('disabled', 'disabled').val(originaltype);

                    DCDSField.attr('disabled', 'disabled').val(originalDCDS);

                    DCDSField.attr('disabled', 'disabled').prop("checked", false);

                    WebIDField.attr('readonly', 'readonly').val(originalWebID);

                    barCodeField.attr('readonly', 'readonly').val(originalBarCode);

                    ZipCodespan.removeAttr('onclick');

                    zipCodeField.val(originalZipCode);

                    SCCCardNoField.attr('readonly', 'readonly').val(originalSCCCardNo);

                    addressField.val(originalAddress);

                    subAddressField.attr('readonly', 'readonly').val(originalSubAddress);

                    inliveField.attr('disabled', 'disabled').val(originalinlive);

                    inliveCheck.attr('disabled', 'disabled').prop("checked", false);

                    carNoField.attr('readonly', 'readonly').val(originalCarNo);

                    youngestBirthdayField.attr('readonly', 'readonly').val(originalYoungestBirthday);

                    DCIDField.attr('disabled', 'disabled').val(originalDCID);

                    DCIDcheck.attr('disabled', 'disabled').prop("checked", false);

                    emailField.attr('readonly', 'readonly').val(originalEmail);

                    bankNameField.attr('readonly', 'readonly').val(originalBankName);

                    bankAccountField.attr('readonly', 'readonly').val(originalBankAccount);

                    bankAccountNoField.attr('readonly', 'readonly').val(originalBankAccountNo);

                    noteField.attr('readonly', 'readonly').val(originalnote);


                }
            });

            // 텍스트 입력 시 수정된 텍스트 저장
            $('#name').on('input', function() {
                var editedText = $(this).val();
                $('.nameview').text(editedText);
            });
        });
    </script>
</head>

<body>
    <div class="mb-9">
        <form action="membershipUpdate" method="get" accept-charset="UTF-8" id="myForm">
            <div class="row align-items-center justify-content-between g-3 mb-4">
                <div class="row g-3">
                    <h2 class="mb-0" style="width: 210px;">회원등록관리</h2>
                    <div class="col-sm-6 col-md-2">
                        <div class="input-group">
                            <div class="input-group-text" id="basic-addon2">회원조회</div>
                            <input class="form-control" id="memberfind" type="text" placeholder="검색어" aria-describedby="basic-addon2" onkeydown="handleKeyPress(event)"/>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-1" style="margin-top: -1px;">
                        <h6 class="text-primary" style="width: 360px;">카드번호 : 회원성명/전화번호4자리/차량 끝 4자리로 조회가능</h6>
                        <select class="form-select" id="memberfindcategory" style="width: 110px;">
                            <option selected="selected" value="0">회원번호</option>
                            <option value="1">카드번호</option>
                        </select>
                    </div>
                    <div class="col-auto">
                        <button class="btn btn-outline-info me-1 mb-1" type="button" id="findbutton">조회</button>
                    </div>
                    <script type="text/javascript">
                    function handleKeyPress(event) {
                    	  if (event.key === "Enter") {
                    	    $('#findbutton').trigger('click');
                    	  }
                    	}
                    
                        $('#findbutton').click(function() {
                            findvalue = document.getElementById('memberfind').value;
                            findcategory = document.getElementById('memberfindcategory').value;

                            if (findcategory === '1') {
                                // 숫자만일때
                                if (/^\d{4}$/.test(findvalue)) {
                                    findcategory = 2;
                                    //문자도 섞일때
                                } else if (/^[0-9a-zA-Z]+$/.test(findvalue)) {

                                    findcategory = 3;
                                }
                            }
                            $.ajax({
                                type: "POST", // 또는 "POST", 서버 설정에 따라 다름
                                url: "memberfind", // 실제 엔드포인트로 교체해야 합니다
                                dataType: 'json',
                                data: {
                                    findvalue: findvalue,
                                    findcategory: findcategory
                                },
                                success: function(data) {
                                    if (data === '-1') {
                                        var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                                        $('#resultmessage').text('회원번호검색은 숫자6자리,전화번호검색은 끝에 4자리를 숫자형식으로 입력하십시오.');
                                        $('body').append(buttonHTML);
                                        $('#modalButton').click();
                                    }
                                    if (data === '0') {
                                        var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                                        $('#resultmessage').text('검색어를 입력해주세요.');
                                        $('body').append(buttonHTML);
                                        $('#modalButton').click();
                                    } else if (data === '1') {
                                        var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                                        $('#resultmessage').text('검색결과가 없습니다.');
                                        $('body').append(buttonHTML);
                                        $('#modalButton').click();
                                    } else if (data === '2') {
                                        location.href = 'memberfindone?findvalue=' + findvalue + '&findcategory=' + findcategory;
                                    } else if (data === '3') {
                                        var url = "findlist?findvalue=" + findvalue + "&findcategory=" + findcategory;
                                        var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1000,height=500";
                                        window.open(url, "_blank", windowFeatures);
                                    }
                                },
                                error: function(xhr, status, error) {
                                    console.log("Status: " + status);
                                    console.log("Error: " + error);
                                }
                            });
                        });
                    </script>
                    <div class="col-auto">
                        <div class="row g-3" style="margin-left: 249px;">
                            <div class="col-auto">
                                <%-- <div class="btn-group  btn-group-sm mt-0 ml-1" role="group" aria-label="First group" style="left: -70px;">
									<button class="btn btn-secondary" type="button" onclick="location.href='membermove?movetype=minus&move=end'"><span data-feather="chevrons-left"></span></button>
									<button class="btn btn-secondary" type="button" onclick="location.href='membermove?MemberID='+${tblmember.memberID}+'&movetype=minus'"><span data-feather="chevron-left"></span></button>
					    			<button class="btn btn-secondary" type="button" onclick="location.href='membermove?MemberID='+${tblmember.memberID}+'&movetype=plus'"><span data-feather="chevron-right"></span></button>
					    			<button class="btn btn-secondary" type="button" onclick="location.href='membermove?movetype=plus&move=end'"><span data-feather="chevrons-right"></span></button>
				  				</div> --%>
                                <button class="btn btn-info" type="button" onclick="location.href='memberinsert'">신규(F2)</button>
                                <button class="btn btn-warning me-1 mb-1" type="button" id="updatebutton">수정(F3)</button>
                                <button class="btn btn-success me-1 mb-1" type="submit" disabled="disabled" id="savebutton">저장(F4)</button>
                                <button class="btn btn-danger me-1 mb-1" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" id="deletebutton"><span class="fa-solid fa-trash-can me-2"></span>탈회(F6)</button>
                                <button class="btn btn-secondary me-1 mb-1" type="button" onclick="membercard()"><span class="fa-solid far fa-address-card me-2"></span>카드발급(F7)</button>
                            </div>
                            <script type="text/javascript">
                                function membercard() {
                                    var memberid = document.getElementById('memberID').value;
                                    var url = 'membercard.do?memberID=' + memberid;
                                    var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=700,height=500";
                                    window.open(url, "_blank", windowFeatures);
                                }
                            </script>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-5">
                <div class="col-12 col-xxl-4" style="width: 28%;">
                    <div class="row g-3 g-xxl-0 h-100">
                        <div class="col-12 col-md-7 col-xxl-12 mb-xxl-3">
                            <div class="card h-100">
                                <div class="card-body d-flex flex-column justify-content-between pb-3">
                                    <div class="row align-items-center g-5 mb-3 text-center text-sm-start">
                                        <div class="col-12 col-sm-auto mb-sm-2">
                                            <div class="avatar avatar-5xl ms-3">
                                                <img class="rounded-circle" src="${pageContext.request.contextPath}/new_lib/assets/img/memberimage/imagesample.jpg" />
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-auto flex-1">
                                            <input class="form-control form-control-lg" id="name" type="hidden" value="${tblmember.name}" name="name" />
                                            <h3 class="nameview">${tblmember.name}</h3>
                                            <p class="text-800">
                                                ${tblmember.memberID}&emsp;
                                                <input class="form-check-input" id="isdeletecheck" type="checkbox" name="isdeletecheck" disabled="disabled" />
                                                <input type="hidden" value="${tblmember.memberID}" name="memberID" id="memberID">
                                                <label class="form-check-label text-9000" for="fragileCheck">대관팀</label>
                                            </p>
                                            <div class="col-auto">
											<div class="form-floating">
	                                            <c:choose>
	                                                <c:when test="${tblmember.siteCode eq '10001'}">
	                                                    <select class="form-select text-primary" id="SiteCode" name="SiteCode" disabled="disabled">
	                                                </c:when>
	                                                <c:when test="${tblmember.siteCode eq '10002'}">
	                                                    <select class="form-select text-danger" id="SiteCode" name="SiteCode" disabled="disabled">
	                                                </c:when>
	                                                <c:when test="${tblmember.siteCode eq '10003'}">
	                                                    <select class="form-select text-success" id="SiteCode" name="SiteCode" disabled="disabled">
	                                                </c:when>
	                                                <c:when test="${tblmember.siteCode eq '10004'}">
	                                                    <select class="form-select text-info" id="SiteCode" name="SiteCode" disabled="disabled">
	                                                </c:when>
	                                                <c:when test="${tblmember.siteCode eq '10005'}">
	                                                    <select class="form-select text-warning" id="SiteCode" name="SiteCode" disabled="disabled">
	                                                </c:when>
	                                                <c:when test="${tblmember.siteCode eq '10006'}">
	                                                    <select class="form-select text-secondary" id="SiteCode" name="SiteCode" disabled="disabled">
	                                                </c:when>
	                                                <c:otherwise>
	                                                    <select class="form-select text-secondary" id="SiteCode" name="SiteCode" disabled="disabled">
	                                                </c:otherwise>
	                                            </c:choose>
                          						<option value="${tblmember.siteCode}" selected="selected">
                                    				<c:forEach var="site" items="${sitelist}">
                                        				<c:if test="${tblmember.siteCode == site.siteCode}">
                                            				${site.siteName}
                                        				</c:if>
                                    				</c:forEach>
                           						</option>
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
                                        </div>
                                        
                                        <div class="row">
                                        	<div class="col-auto">
		                                        <div class="btn-group btn-group-sm mt-2" role="group" aria-label="...">
												  <button class="btn btn-secondary" type="button">촬영</button>
												  <button class="btn btn-secondary" type="button" onclick="">불러오기</button>
												  <button class="btn btn-secondary" type="button">삭제</button>
												</div>
										    </div>
										</div>
                                    </div>
                                    <div class="d-flex flex-between-center border-top border-dashed border-300 pt-4">
                                        <div class="col-sm-6 col-md-4">
                                            <h6 class="text-primary">생년월일</h6>
                                            <input class="form-control form-control-sm" id="birthDay" type="date" value="${tblmember.birthDay}" name="birthDay" readonly="readonly" />
                                        </div>
                                        <div class="col-sm-6 col-md-2">
                                            <h6 class="text-primary">나이(만)</h6>
                                            <input class="form-control form-control-sm" id="age" type="number" value="${tblmember.age}" name="age" readonly="readonly" min="0" />
                                        </div>
                                        <div class="col-sm-6 col-md-3">
                                            <h6 class="text-primary">성별</h6>
                                            <select class="form-select" id="gender" name="gender" disabled="disabled">
                                                <option value="${tblmember.gender}" selected="selected">${tblmember.genderText}</option>
                                                <option value="0">여자</option>
                                                <option value="1">남자</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-between-center border-top border-dashed border-300 pt-4">
                                        <div class="col-sm-6 col-md-4">
                                            <h6 class="text-primary">휴대전화</h6>
                                            <input class="form-control form-control-sm" id="cellPhone" type="text" value=" ${tblmember.cellPhone}" name="cellPhone" readonly="readonly" />
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <h6>일반전화</h6>
                                            <input class="form-control form-control-sm" id="homePhone" type="text" value=" ${tblmember.homePhone}" name="homePhone" readonly="readonly" />
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <h6 class="text-primary">비상연락처 <input class="form-check-input" id="emgPhonecheck" type="checkbox" name="emgPhonecheck" style="margin-top: -1px;" disabled="disabled" />
                                                <label class="form-check-label text-9000" for="emgPhonecheck">갱신</label></h6>
                                            <input class="form-control form-control-sm" id="emgPhone" type="text" value=" ${tblmember.emgPhone}" name="emgPhone" readonly="readonly" />
                                        </div>
                                    </div>
                                    <div class="d-flex flex-between-center border-top border-dashed border-300 pt-4">
                                        <div>
                                            <h6>회원등급</h6>
                                            <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="MLevel" id="MLevel" disabled="disabled">
                                                <option selected="selected" value="${tblmember.MLevel}">
                                                    <c:set var="foundDefaultValue" value="false" />
                                                    <c:forEach var="codevalue" items="${codelist}">
                                                        <c:if test="${codevalue.pkid == tblmember.MLevel}">
                                                            ${codevalue.codeName}
                                                            <c:set var="foundDefaultValue" value="true" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${not foundDefaultValue}">
                                                        ${tblmember.MLevel}
                                                    </c:if>
                                                </option>
                                                <c:forEach var="code" items="${codelist}">
                                                    <option value="${code.pkid}">${code.codeName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div>
                                            <h6>회원구분</h6>
                                            <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="type" id="type" disabled="disabled">
                                                <option selected="selected" value="${tblmember.type}">${tblmember.typeText}
                                                </option>
                                                <option value="12">어른</option>
                                                <option value="20">청소년</option>
                                                <option value="11">어린이</option>
                                                <option value="40">경로</option>
                                            </select>
                                        </div>
                                        <div>
                                            <h6>할인유형</h6>
                                            <select class="form-select form-select-sm" aria-label=".form-select-sm example" disabled="disabled" id="DCDS" name="DCDS">
                                                <option selected="selected" value="${tblmember.DCDS}">
                                                    <c:forEach var="dc" items="${dclist}">
                                                        <c:if test="${tblmember.DCDS == dc.dcid}">
                                                            ${dc.dcName}
                                                        </c:if>
                                                    </c:forEach>
                                                </option>
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
                                        <li class="nav-item"><a class="nav-link" id="note-tab" data-bs-toggle="tab" href="#tab-note" role="tab" aria-controls="tab-note" aria-selected="false">비고</a></li>
                                    </ul>
                                    <div class="tab-content mt-3" id="myTabContent">
                                        <div class="tab-pane fade show active" id="tab-home" role="tabpanel" aria-labelledby="home-tab">
                                            <br>
                                            <div class="row g-5 mb-6">
                                                <div class="col-sm-6 col-md-4">
                                                    <h5 class="text-800">웹아이디</h5>
                                                    <input class="form-control form-control-sm" id="webID" type="text" value=" ${tblmember.webID}" name="webID" readonly="readonly" />
                                                </div>
                                                <div class="col-sm-6 col-md-4">
                                                    <h5 class="text-800" style="margin-left: 2px;">카드번호</h5>
                                                    <input class="form-control form-control-sm" id="barCode" type="text" value=" ${tblmember.barCode}" name="barCode" readonly="readonly" />
                                                </div>
                                            </div>
                                            <div class="row g-5 mb-4">
                                                <div class="col-sm-6 col-md-5">
                                                    <h5 class="text-800">우편번호</h5>
                                                    <div class="input-group input-group-sm mb-3">
                                                        <input class="form-control" id="ZipCode" type="text" value=" ${tblmember.zipCode}" name="ZipCode" readonly="readonly" maxlength="8" aria-describedby="ZipCodespan" />
                                                        <span class="input-group-text" id="ZipCodespan" style="cursor: pointer;">검색</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-md-5">
                                                    <h5 class="text-800">서울시민카드</h5>
                                                    <input class="form-control form-control-sm" id="SCCCardNo" type="text" value=" ${tblmember.SCCCardNo}" name="SCCCardNo" readonly="readonly" />
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-md-9">
                                                <h5 class="text-800">주소</h5>
                                                <input class="form-control form-control-sm" id="Address" type="text" value=" ${tblmember.address}" name="Address" readonly="readonly" />
                                            </div>
                                            <div class="col-sm-6 col-md-5">
                                                <input class="form-control form-control-sm" id="SubAddress" type="text" value=" ${tblmember.subAddress}" name="SubAddress" readonly="readonly" />
                                            </div>
                                            <br>
                                            <div class="row g-5 mb-3">
                                                <div class="col-sm-6 col-md-3" style="width: 142px;">
                                                    <h5 class="text-800">거주구분<input class="form-check-input" id="inliveCheck" type="checkbox" name="inliveCheck" style="margin-top: -1px;" disabled="disabled" />
                                                        <label class="form-check-label text-9000" for="inliveCheck">갱신</label></h5>
                                                    <select class="form-select form-select-sm" aria-label=".form-select-sm example" disabled="disabled" id="inlive" name="inlive">
                                                        <%-- <option selected="selected" value="${tblmember.IFFlag}">${tblmember.IFFlagText}</option> --%>
                                                        <option value="Y" <c:if test="${tblmember.inlive eq 'Y' }">selected="selected"</c:if> >구민</option>
                                                        <option value="N" <c:if test="${tblmember.inlive ne 'Y' }">selected="selected"</c:if> >구외</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-6 col-md-4">
                                                    <h5 class="text-800">차량번호</h5>
                                                    <input class="form-control form-control-sm" id="carNo" type="text" value=" ${tblmember.carNo}" name="carNo" readonly="readonly" />
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-md-5">
                                                <h5 class="text-800">다자녀 막내생일</h5>
                                                <input class="form-control form-control-sm" id="youngestBirthday" type="date" value="${tblmember.youngestBirthday}" name="youngestBirthday" readonly="readonly" />
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab-profile" role="tabpanel" aria-labelledby="profile-tab">
                                            <br>
                                            <div class="col-sm-6 col-md-6">
                                                <h5 class="text-800">
                                                    할인유형 (<input class="form-check-input" id="DCIDcheck" type="checkbox" name="DCIDcheck" style="margin-top: -1px;" disabled="disabled" />
                                                    <label class="form-check-label text-900 fs-0" for="DCIDcheck">갱신</label>)
                                                </h5>
                                                <select class="form-select form-select-sm" aria-label=".form-select-sm example" disabled="disabled" id="piscCd" name="piscCd">
                                                	<option value=""></option>
                                                    <c:forEach var="pissdc" items="${pissdclist}">
                                                    <c:choose>
                                                    	<c:when test="${tblmember.piscCd eq pissdc.piscCD}">
                                                    		<option selected="selected" value="${pissdc.piscCD}">${pissdc.dcName}</option>
                                                    	</c:when>
                                                    	<c:otherwise>
                                                    		<option value="${pissdc.piscCD}">${pissdc.dcName}</option>
                                                    	</c:otherwise>
                                                    </c:choose>
                                                    </c:forEach>
                                                </select>
                                                <font color="red" size="1">
                                                    ※할인 미선택: 재등록 시 할인 적용 안됨
                                                </font>
                                            </div>
                                            <br>
                                            <div class="col-sm-6 col-md-6">
                                                <h5 class="text-800">E-Mail</h5>
                                                <input class="form-control form-control-sm" id="email" type="text" value=" ${tblmember.email}" name="email" readonly="readonly" />
                                            </div>
                                            <div>
                                                <input class="form-check-input" id="isdeletecheck" type="checkbox" name="isdeletecheck" />
                                                <label class="form-check-label text-9000" for="fragileCheck">재등록 및 입장제한</label>
                                            </div>
                                            <br>
                                            <div class="col-sm-6 col-md-6">
                                                <h5 class="text-800">은행명</h5>
                                                <input class="form-control form-control-sm" id="bankName" type="text" value=" ${tblmember.bankName}" name="bankName" readonly="readonly" />
                                            </div>
                                            <br>
                                            <div class="col-sm-6 col-md-6">
                                                <h5 class="text-800">예금주</h5>
                                                <input class="form-control form-control-sm" id="bankAccount" type="text" value=" ${tblmember.bankAccount}" name="bankAccount" readonly="readonly" />
                                            </div>
                                            <br>
                                            <div class="col-sm-6 col-md-6">
                                                <h5 class="text-800">계좌번호</h5>
                                                <input class="form-control form-control-sm" id="bankAccountNo" type="text" value=" ${tblmember.bankAccountNo}" name="bankAccountNo" readonly="readonly" />
                                            </div>
                                            <br>
                                            <br>
                                            <div style="margin-left: 230px;margin-top: -90px;">
                                                <input class="form-check-input" id="emailsend" type="checkbox" name="emailsend" disabled="disabled" />
                                                <label class="form-check-label text-9000" for="fragileCheck">E-mail 수신</label><br>
                                                <input class="form-check-input" id="smssend" type="checkbox" name="smssend" disabled="disabled" />
                                                <label class="form-check-label text-9000" for="fragileCheck">SMS 수신</label><br>
                                                <input class="form-check-input" id="dmsend" type="checkbox" name="dmsend" disabled="disabled" />
                                                <label class="form-check-label text-9000" for="fragileCheck">DM 수신</label><br>
                                            </div>
                                            <h5 class="text-800">본인인증</h5>
                                            <p>
                                                ${tblmember.ipinNumbertext}
                                            </p>
                                        </div>
                                        <div class="tab-pane fade" id="tab-note" role="tabpanel" aria-labelledby="note-tab">
                                            <div class="col-12">
                                                <h3 class="mb-4">비고</h3>
                                                <textarea class="form-control mb-3" rows="4" readonly="readonly" name="note" id="note">${tblmember.note}</textarea>
                                                <button class="btn btn-phoenix-primary w-100 mb-4">비고저장</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </form>
        <div class="col-12 col-xxl-8" style="width: 72%;">
            <div class="card h-100">
                <div class="card-body pb-3">
                    <button class="btn btn-soft-primary" type="button" onclick="miteminsertF(${tblmember.memberID})"><span data-feather="file-plus"></span>&nbsp;신규등록(F8)</button>
                    <button class="btn btn-soft-secondary" type="button" onclick="mitemreinsertF()"><span data-feather="file-text"></span>&nbsp;재등록(F9)</button>
                    <button class="btn btn-soft-success" type="button" onclick="mitemchange()"><span data-feather="repeat"></span>&nbsp;반변경(Z)</button>
                    <button class="btn btn-soft-danger" type="button" onclick="mitemrefund()"><span data-feather="trash"></span>&nbsp;환불(X)</button>
                    <button class="btn btn-soft-warning" type="button" onclick="mitemrestF()"><span data-feather="user-x"></span>&nbsp;휴회(shift+C)</button>
                    <button class="btn btn-soft-info" type="button" onclick="mLockerF()"><span data-feather="archive"></span>&nbsp;사물함 임대(shift+V)</button>
                    <button class="btn btn-soft-primary" type="button" onclick="etcPaidF()"><span data-feather="shopping-cart"></span>&nbsp;기타매출등록(Q)</button>
                    <script type="text/javascript">
                    var myPopup;
                    
                    //재등록시 필요한 saleno 저장
                    var remembersaleno = 0;
                    var rememberrtodate = '';
                    var remembergroupname = '';
                    var remembersubname = '';
                    var rememberweekname = '';
                    var rememberlevelname = '';
					var rememberstate = '';

                    function miteminsertF(memberID) {
                        var url = 'miteminsertF.do?MemberID=' + memberID;
                        var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1300,height=840";
                        if (myPopup === undefined || myPopup.closed) {
                            myPopup = window.open(url, "_blank", windowFeatures);
                        } else {
                        	myPopup.focus();
                        }
                        document.addEventListener('click', function() {
	                        if (myPopup && !myPopup.closed) {
	                            myPopup.focus();
	                        }
                      	});
                    }
                    
                    function mitemreinsertF() {
                    	if(remembersaleno == ''){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('수강을 선택해주세요.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	if(rememberstate == '반변경(-)'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('반 변경전 데이터는 [신규]버튼을 이용하여 해당 수강정보를 등록하십시오.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	if(rememberstate == '환불' || rememberstate == '환불대기'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('환불 처리 된 데이터입니다.<br>수정할 수 없습니다.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	if(rememberstate == '휴회'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('휴회 처리 된 데이터입니다.<br>휴회취소 후 등록해주세요.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	var url = 'mitemreinsertF.do?GroupSaleNo=' + remembersaleno+'&RToDate='+rememberrtodate;
                        var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1300,height=840";
                        if (myPopup === undefined || myPopup.closed) {
                            myPopup = window.open(url, "_blank", windowFeatures);
                        } else {
                        	myPopup.focus();
                        }
                        document.addEventListener('click', function() {
	                        if (myPopup && !myPopup.closed) {
	                            myPopup.focus();
	                        }
                      	});
					}
                    
                    function mitemselectF() {
                    	if(rememberstate == '반변경(-)'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('반변경처리된 데이터입니다.<br>수정할 수 없습니다.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	if(rememberstate == '환불' || rememberstate == '환불대기'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('환불 처리 된 데이터입니다.<br>수정할 수 없습니다.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	if(rememberstate == '휴회'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('휴회 처리 된 데이터입니다.<br>수정할 수 없습니다.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                        var url = 'mitemselectF.do?GroupSaleNo=' + remembersaleno;
                        var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1300,height=840";
                        if (myPopup === undefined || myPopup.closed) {
                            myPopup = window.open(url, "_blank", windowFeatures);
                        } else {
                        	myPopup.focus();
                        }
                        document.addEventListener('click', function() {
	                        if (myPopup && !myPopup.closed) {
	                            myPopup.focus();
	                        }
                      	});
                    }
                    
                    function mitemchange() {
                    	if(remembersaleno == ''){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('수강을 선택해주세요.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	
                    	if(rememberstate == '반변경(-)'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('반변경전 데이터는 변경대상이 아닙니다.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	
                    	if(rememberstate == '환불' || rememberstate == '환불대기'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('환불 처리 된 데이터입니다.<br>수정할 수 없습니다.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	if(rememberstate == '휴회'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('휴회 처리 된 데이터입니다.<br>수정할 수 없습니다.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	//var itemname = '['+remembergroupname+']'+remembersubname+' '+rememberweekname+' '+rememberlevelname;
                    	var SaleNo = previousRow.dataset.saleNo;
                    	var url = 'mitemchangeF.do?GroupSaleNo=' + remembersaleno+"&SaleNo="+SaleNo;
                        var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1290,height=740";
                        if (myPopup === undefined || myPopup.closed) {
                            myPopup = window.open(url, "_blank", windowFeatures);
                        } else {
                        	myPopup.focus();
                        }
                        document.addEventListener('click', function() {
	                        if (myPopup && !myPopup.closed) {
	                            myPopup.focus();
	                        }
                      	});
					}
                    
                    function mitemrefund() {
                    	if(remembersaleno == ''){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('수강을 선택해주세요.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	if(rememberstate == '반변경(-)'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('반변경전 데이터는 환불대상이 아닙니다.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	if(rememberstate == '휴회'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('휴회 처리 된 데이터입니다.<br>수정할 수 없습니다.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	//var itemname = '['+remembergroupname+']'+remembersubname+' '+rememberweekname+' '+rememberlevelname;
                    	var SaleNo = previousRow.dataset.saleNo;
                    	var url = 'mitemrefundF.do?GroupSaleNo=' + remembersaleno+"&SaleNo="+SaleNo;
                        var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1600,height=744";
                        if (myPopup === undefined || myPopup.closed) {
                            myPopup = window.open(url, "_blank", windowFeatures);
                        } else {
                        	myPopup.focus();
                        }
                        document.addEventListener('click', function() {
	                        if (myPopup && !myPopup.closed) {
	                            myPopup.focus();
	                        }
                      	});
					}
                    
                    function mitemrestF() {
                    	if(remembersaleno == ''){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('수강을 선택해주세요.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	if(rememberstate == '반변경(-)'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('반변경 처리 된 데이터입니다.<br>수정할 수 없습니다.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	if(rememberstate == '환불'){
                    		var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
                            $('#resultmessage').html('환불 처리 된 데이터입니다.<br>수정할 수 없습니다.');
                            $('body').append(buttonHTML);
                            $('#modalButton').click();
                            return false;
                    	}
                    	
                    	var url = 'mitemrestF.do?SaleNo='+remembersaleno;
                        var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1100,height=530";
                        if (myPopup === undefined || myPopup.closed) {
                            myPopup = window.open(url, "_blank", windowFeatures);
                        } else {
                        	myPopup.focus();
                        }
                        document.addEventListener('click', function() {
	                        if (myPopup && !myPopup.closed) {
	                            myPopup.focus();
	                        }
                      	});
					}
                    
                    function mLockerF() {
                    	var url = 'mLockerF.do?MemberID='+$('#memberID').val();
                        var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1300,height=805";
                        if (myPopup === undefined || myPopup.closed) {
                            myPopup = window.open(url, "_blank", windowFeatures);
                        } else {
                        	myPopup.focus();
                        }
                        document.addEventListener('click', function() {
	                        if (myPopup && !myPopup.closed) {
	                            myPopup.focus();
	                        }
                      	});
					}
                    
                    function mLockerDetailF() {
                    	var url = 'mLockerDetailF.do?PKID='+prevPKID;
                        var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1300,height=805";
                        if (myPopup === undefined || myPopup.closed) {
                            myPopup = window.open(url, "_blank", windowFeatures);
                        } else {
                        	myPopup.focus();
                        }
                        document.addEventListener('click', function() {
	                        if (myPopup && !myPopup.closed) {
	                            myPopup.focus();
	                        }
                      	});
					}
                    
                    function etcPaidF() {
						
					}
                    
                    function openpop(url,windowFeatures) {
                    	window.open(url, "_blank", windowFeatures);
					}
                    document.addEventListener('keydown', function(event) {
                    	if (event.keyCode === 113) {
                    		//f2
                    		location.href='memberinsert';
                        }
                    	if (event.keyCode === 114) {
                    		//f3
                    		$('#updatebutton').trigger('click');
                        }
                    	if (event.keyCode === 115) {
                    		//f4
                    		$('#savebutton').trigger('click');
                        }
                    	if (event.keyCode === 117) {
                    		//f6
                    		$('#deletebutton').trigger('click');
                        }
                    	if (event.keyCode === 118) {
                    		//f7
                    		membercard();
                        }
                        if (event.keyCode === 119) {
                        	//f8
                            miteminsertF(${tblmember.memberID});
                        }
                        if (event.keyCode === 120) {
                        	//f9
                        	mitemreinsertF();
                        }
                        if (event.ctrlKey && event.key === 'z') {
                            mitemchange();
                        }
                        if (event.ctrlKey && event.key === 'x') {
                        	mitemrefund();
                        }
                        if (event.shiftKey && event.key === 'C') {
                        	mitemrestF();
                        }
                        if (event.shiftKey && event.key === 'V') {
                        	mLockerF();
                        }
                        if (event.ctrlKey && event.key === 'q') {
                        	mitemrefund();
                        }
                    });
                    var previousRow = null;
					//행을 클릭했을때 데이터를 밑에 뿌려주는 함수
					function fmsc_s01onclick(rtodate,saleno,clickedRow,groupname,subname,weekname,levelname,state) {
						if (previousRow !== null) {
					    	$(previousRow).css('background-color', '');
					    }
						$(clickedRow).css('background-color', 'lightblue');
					    previousRow = clickedRow;
					    remembersaleno = saleno;
					    rememberrtodate = rtodate;
					    remembergroupname = groupname;
	                    remembersubname = subname;
	                    rememberweekname = weekname;
	                    rememberlevelname = levelname;
	                    rememberstate = state;
					}
					
					var lockerPrevRow = null;
					var prevPKID = 0;
					function useLockerOnclick(pkid,clickedRow) {
						if (lockerPrevRow !== null) {
					    	$(lockerPrevRow).css('background-color', '');
					    }
						$(clickedRow).css('background-color', 'lightblue');
						lockerPrevRow = clickedRow;
					    prevPKID = pkid;
					}
                    </script>
                    <ul class="nav nav-underline" id="myTab" role="tablist">
                        <li class="nav-item"><a class="nav-link active" id="learn-tab" data-bs-toggle="tab" href="#tab-learn" role="tab" aria-controls="tab-learn" aria-selected="true">수강 및 사물함 정보</a></li>
                        <li class="nav-item"><a class="nav-link" id="cost-tab" data-bs-toggle="tab" href="#tab-cost" role="tab" aria-controls="tab-cost" aria-selected="false">기타비용정보</a></li>
                        <li class="nav-item"><a class="nav-link" id="propose-tab" data-bs-toggle="tab" href="#tab-propose" role="tab" aria-controls="tab-propose" aria-selected="false">출석정보</a></li>
                        <li class="nav-item"><a class="nav-link" id="consulting-tab" data-bs-toggle="tab" href="#tab-consulting" role="tab" aria-controls="tab-consulting" aria-selected="false">회원상담</a></li>
                        <li class="nav-item"><a class="nav-link" id="otherlearn-tab" data-bs-toggle="tab" href="#tab-otherlearn" role="tab" aria-controls="tab-otherlearn" aria-selected="false">타사업장수강(1년)</a></li>
                        <li class="nav-item"><a class="nav-link" id="deposite-tab" data-bs-toggle="tab" href="#tab-deposite" role="tab" aria-controls="tab-deposite" aria-selected="false">보증금관리</a></li>
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
                                            <tbody class="list" id="learntbody">
                                                <c:forEach var="list" items="${fmsc_s01}">
                                                    <tr class="learntable" data-sale-no="${list.saleNo}" onclick="fmsc_s01onclick('${list.RToDate}',${list.groupSaleNo},this,'${list.groupName}','${list.subGroupName}','${list.weekName}','${list.levelName}','${list.state}')" ondblclick="mitemselectF()">
                                                        <td class="State align-middle white-space-nowrap text-1200 fs--2 text-start">
                                                            <c:choose>
                                                                <c:when test="${list.state eq '현재원' || list.state eq '반변경(+)' }">
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
                                                        <td class="Regmonth align-middle white-space-nowrap text-700 fs--1 text-center">${list.regmonth}</td>
                                                        <td class="RealPrice align-middle white-space-nowrap text-700 fs--1 text-end"><fmt:formatNumber value="${list.paidPrice}" pattern="#,###"/></td>
                                                        <td class="Note align-middle white-space-nowrap text-900 fs--1 text-start">${list.note}</td>
                                                        <td class="InType align-middle white-space-nowrap text-900 fs--1 text-start">${list.inType}</td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty fmsc_s01}">
                                                	<tr></tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                    <script type="text/javascript">
                                    $('#learntbody').children('tr:first').click();
                                    </script>
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
                                                    <th class="sort align-middle text-700" scope="col" data-sort="LockerName">사물함</th>
                                                    <th class="sort align-middle text-700" scope="col" data-sort="RegDate">신청일</th>
                                                    <th class="sort align-middle text-700" scope="col" data-sort="FromDate">시작일</th>
                                                    <th class="sort align-middle text-700" scope="col" data-sort="ToDate">종료일</th>
                                                    <th class="sort align-middle text-700" scope="col" data-sort="RegMonth">기간</th>
                                                    <th class="sort align-middle text-700" scope="col" data-sort="RealPrice">판매금액</th>
                                                    <th class="sort align-middle text-700" scope="col" data-sort="PaidPrice">결제금액</th>
                                                    <th class="sort align-middle text-700" scope="col" data-sort="Misu">미수금액</th>
                                                    <th class="sort align-middle text-end" scope="col" data-sort="IsFlag">반납</th>
                                                    <th class="sort align-middle text-end" scope="col" data-sort="ReturnDate">반납일</th>
                                                </tr>
                                            </thead>
                                            <tbody class="list" id="lockerBody">
                                                <c:forEach var="locker" items="${lockerlist}">
                                                    <tr class="hover-actions-trigger btn-reveal-trigger position-static" onclick="useLockerOnclick(${locker.PKID},this)" ondblclick="mLockerDetailF()">
                                                        <td class="LockerName align-middle white-space-nowrap fs--1 text-900">[${locker.PLockerGroupName}-${locker.PLockerLocation}] ${locker.PLockerNo}</td>
                                                        <td class="RegDate align-middle text-900 fs--1 fw-semi-bold text-start">${locker.regDate}</td>
                                                        <td class="FromDate align-middle fw-bold text-900">${locker.fromDate}</td>
                                                        <td class="ToDate align-middle fw-bold text-900">${locker.toDate}</td>
                                                        <td class="RegMonth align-middle fw-bold text-700">${locker.regMonth}개월</td>
                                                        <td class="RealPrice align-middle fw-bold text-md-center"><fmt:formatNumber value="${locker.realPrice}" pattern="#,###"/></td>
                                                        <td class="PaidPrice align-middle fw-bold text-md-center"><fmt:formatNumber value="${locker.paidPrice}" pattern="#,###"/></td>
                                                        <td class="Misu align-middle fw-bold text-md-center"><fmt:formatNumber value="${locker.misu}" pattern="#,###"/></td>
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
                                                        <td class="ReturnDate align-middle white-space-nowrap text-end">${locker.returnDate}</td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty lockerlist}">
                                                	<tr></tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                        <script type="text/javascript">
			                            	$('#lockerBody').children('tr:first').click();
			                            </script>
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
                                <div id="tablepaid" data-list='{"valueNames":["ExpenseGroupName","ExpenseName","InOut","SaleDate","Price","DefPrice","minabPrice"],"page":5,"pagination":true}'>
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

                            <div data-calendar="{&quot;events&quot;:[{&quot;title&quot;:&quot;Bootcamp&quot;,&quot;start&quot;:&quot;2023-06-19&quot;}]}" class="fc fc-media-screen fc-direction-ltr fc-theme-standard">
                                <div class="fc-header-toolbar fc-toolbar fc-toolbar-ltr">
                                    <div class="fc-toolbar-chunk">
                                        <div class="fc-button-group">
                                            <button type="button" title="Previous Month" aria-pressed="false" class="fc-prev-button fc-button fc-button-primary">
                                                <span class="fc-icon fc-icon-chevron-left"></span>
                                            </button>
                                            <button type="button" title="Next Month" aria-pressed="false" class="fc-next-button fc-button fc-button-primary">
                                                <span class="fc-icon fc-icon-chevron-right"></span>
                                            </button>
                                        </div>
                                        <button type="button" title="This Month" disabled="" aria-pressed="false" class="fc-today-button fc-button fc-button-primary">오늘날짜</button>
                                    </div>
                                    <div class="fc-toolbar-chunk">
                                        <h2 class="fc-toolbar-title" id="fc-dom-1">2023년 11월</h2>
                                    </div>
                                    <div class="fc-toolbar-chunk">
                                        <div class="fc-button-group">
                                            <button type="button" title="Month view" aria-pressed="true" class="fc-dayGridMonth-button fc-button fc-button-primary fc-button-active">월간</button>
                                            <button type="button" title="Week view" aria-pressed="false" class="fc-timeGridWeek-button fc-button fc-button-primary">주간</button>
                                            <button type="button" title="Day view" aria-pressed="false" class="fc-timeGridDay-button fc-button fc-button-primary">일간</button>
                                        </div>
                                    </div>
                                </div>
                                <div aria-labelledby="fc-dom-1" class="fc-view-harness fc-view-harness-active" style="height: 1125.19px;">
                                    <div class="fc-daygrid fc-dayGridMonth-view fc-view">
                                        <table role="grid" class="fc-scrollgrid  fc-scrollgrid-liquid">
                                            <thead role="rowgroup">
                                                <tr role="presentation" class="fc-scrollgrid-section fc-scrollgrid-section-header ">
                                                    <th role="presentation">
                                                        <div class="fc-scroller-harness">
                                                            <div class="fc-scroller" style="overflow: hidden;">
                                                                <table role="presentation" class="fc-col-header " style="width: 1516px;">
                                                                    <colgroup></colgroup>
                                                                    <thead role="presentation">
                                                                        <tr role="row">
                                                                            <th role="columnheader" class="fc-col-header-cell fc-day fc-day-sun">
                                                                                <div class="fc-scrollgrid-sync-inner">
                                                                                    <a aria-label="Sunday" class="fc-col-header-cell-cushion ">일요일</a>
                                                                                </div>
                                                                            </th>
                                                                            <th role="columnheader" class="fc-col-header-cell fc-day fc-day-mon">
                                                                                <div class="fc-scrollgrid-sync-inner">
                                                                                    <a aria-label="Monday" class="fc-col-header-cell-cushion ">월요일</a>
                                                                                </div>
                                                                            </th>
                                                                            <th role="columnheader" class="fc-col-header-cell fc-day fc-day-tue">
                                                                                <div class="fc-scrollgrid-sync-inner">
                                                                                    <a aria-label="Tuesday" class="fc-col-header-cell-cushion ">화요일</a>
                                                                                </div>
                                                                            </th>
                                                                            <th role="columnheader" class="fc-col-header-cell fc-day fc-day-wed">
                                                                                <div class="fc-scrollgrid-sync-inner">
                                                                                    <a aria-label="Wednesday" class="fc-col-header-cell-cushion ">수요일</a>
                                                                                </div>
                                                                            </th>
                                                                            <th role="columnheader" class="fc-col-header-cell fc-day fc-day-thu">
                                                                                <div class="fc-scrollgrid-sync-inner">
                                                                                    <a aria-label="Thursday" class="fc-col-header-cell-cushion ">목요일</a>
                                                                                </div>
                                                                            </th>
                                                                            <th role="columnheader" class="fc-col-header-cell fc-day fc-day-fri">
                                                                                <div class="fc-scrollgrid-sync-inner">
                                                                                    <a aria-label="Friday" class="fc-col-header-cell-cushion ">금요일</a>
                                                                                </div>
                                                                            </th>
                                                                            <th role="columnheader" class="fc-col-header-cell fc-day fc-day-sat">
                                                                                <div class="fc-scrollgrid-sync-inner">
                                                                                    <a aria-label="Saturday" class="fc-col-header-cell-cushion ">토요일</a>
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
                                                <tr role="presentation" class="fc-scrollgrid-section fc-scrollgrid-section-body  fc-scrollgrid-section-liquid">
                                                    <td role="presentation">
                                                        <div class="fc-scroller-harness fc-scroller-harness-liquid">
                                                            <div class="fc-scroller fc-scroller-liquid-absolute" style="overflow: hidden auto;">
                                                                <div class="fc-daygrid-body fc-daygrid-body-unbalanced " style="width: 1516px;">
                                                                    <table role="presentation" class="fc-scrollgrid-sync-table" style="width: 1516px; height: 1075px;">
                                                                        <colgroup></colgroup>
                                                                        <tbody role="presentation">
                                                                            <tr role="row">
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other" data-date="2023-10-29" aria-labelledby="fc-dom-2">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-2" class="fc-daygrid-day-number" aria-label="October 29, 2023">29</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-mon fc-day-past fc-day-other" data-date="2023-10-30" aria-labelledby="fc-dom-4">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-4" class="fc-daygrid-day-number" aria-label="October 30, 2023">30</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-tue fc-day-past fc-day-other" data-date="2023-10-31" aria-labelledby="fc-dom-6">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-6" class="fc-daygrid-day-number" aria-label="October 31, 2023">31</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-wed fc-day-past" data-date="2023-11-01" aria-labelledby="fc-dom-8">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-8" class="fc-daygrid-day-number" aria-label="November 1, 2023">1</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-thu fc-day-past" data-date="2023-11-02" aria-labelledby="fc-dom-10">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-10" class="fc-daygrid-day-number" aria-label="November 2, 2023">2</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-fri fc-day-past" data-date="2023-11-03" aria-labelledby="fc-dom-12">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-12" class="fc-daygrid-day-number" aria-label="November 3, 2023">3</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-sat fc-day-past" data-date="2023-11-04" aria-labelledby="fc-dom-14">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-14" class="fc-daygrid-day-number" aria-label="November 4, 2023">4</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr role="row">
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-sun fc-day-past" data-date="2023-11-05" aria-labelledby="fc-dom-16">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-16" class="fc-daygrid-day-number" aria-label="November 5, 2023">5</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-mon fc-day-past" data-date="2023-11-06" aria-labelledby="fc-dom-18">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-18" class="fc-daygrid-day-number" aria-label="November 6, 2023">6</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-tue fc-day-past" data-date="2023-11-07" aria-labelledby="fc-dom-20">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-20" class="fc-daygrid-day-number" aria-label="November 7, 2023">7</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-wed fc-day-past" data-date="2023-11-08" aria-labelledby="fc-dom-22">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-22" class="fc-daygrid-day-number" aria-label="November 8, 2023">8</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-thu fc-day-past" data-date="2023-11-09" aria-labelledby="fc-dom-24">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-24" class="fc-daygrid-day-number" aria-label="November 9, 2023">9</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-fri fc-day-past" data-date="2023-11-10" aria-labelledby="fc-dom-26">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-26" class="fc-daygrid-day-number" aria-label="November 10, 2023">10</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-sat fc-day-past" data-date="2023-11-11" aria-labelledby="fc-dom-28">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-28" class="fc-daygrid-day-number" aria-label="November 11, 2023">11</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr role="row">
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-sun fc-day-past" data-date="2023-11-12" aria-labelledby="fc-dom-30">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-30" class="fc-daygrid-day-number" aria-label="November 12, 2023">12</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-mon fc-day-past" data-date="2023-11-13" aria-labelledby="fc-dom-32">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-32" class="fc-daygrid-day-number" aria-label="November 13, 2023">13</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-tue fc-day-today " data-date="2023-11-14" aria-labelledby="fc-dom-34">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-34" class="fc-daygrid-day-number" aria-label="November 14, 2023">14</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2023-11-15" aria-labelledby="fc-dom-36">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-36" class="fc-daygrid-day-number" aria-label="November 15, 2023">15</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2023-11-16" aria-labelledby="fc-dom-38">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-38" class="fc-daygrid-day-number" aria-label="November 16, 2023">16</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-fri fc-day-future" data-date="2023-11-17" aria-labelledby="fc-dom-40">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-40" class="fc-daygrid-day-number" aria-label="November 17, 2023">17</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2023-11-18" aria-labelledby="fc-dom-42">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-42" class="fc-daygrid-day-number" aria-label="November 18, 2023">18</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr role="row">
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2023-11-19" aria-labelledby="fc-dom-44">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-44" class="fc-daygrid-day-number" aria-label="November 19, 2023">19</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2023-11-20" aria-labelledby="fc-dom-46">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-46" class="fc-daygrid-day-number" aria-label="November 20, 2023">20</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2023-11-21" aria-labelledby="fc-dom-48">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-48" class="fc-daygrid-day-number" aria-label="November 21, 2023">21</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2023-11-22" aria-labelledby="fc-dom-50">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-50" class="fc-daygrid-day-number" aria-label="November 22, 2023">22</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2023-11-23" aria-labelledby="fc-dom-52">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-52" class="fc-daygrid-day-number" aria-label="November 23, 2023">23</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-fri fc-day-future" data-date="2023-11-24" aria-labelledby="fc-dom-54">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-54" class="fc-daygrid-day-number" aria-label="November 24, 2023">24</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-sat fc-day-future" data-date="2023-11-25" aria-labelledby="fc-dom-56">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-56" class="fc-daygrid-day-number" aria-label="November 25, 2023">25</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr role="row">
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-sun fc-day-future" data-date="2023-11-26" aria-labelledby="fc-dom-58">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-58" class="fc-daygrid-day-number" aria-label="November 26, 2023">26</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-mon fc-day-future" data-date="2023-11-27" aria-labelledby="fc-dom-60">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-60" class="fc-daygrid-day-number" aria-label="November 27, 2023">27</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-tue fc-day-future" data-date="2023-11-28" aria-labelledby="fc-dom-62">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-62" class="fc-daygrid-day-number" aria-label="November 28, 2023">28</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-wed fc-day-future" data-date="2023-11-29" aria-labelledby="fc-dom-64">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-64" class="fc-daygrid-day-number" aria-label="November 29, 2023">29</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-thu fc-day-future" data-date="2023-11-30" aria-labelledby="fc-dom-66">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-66" class="fc-daygrid-day-number" aria-label="November 30, 2023">30</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other" data-date="2023-12-01" aria-labelledby="fc-dom-68">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-68" class="fc-daygrid-day-number" aria-label="December 1, 2023">1</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other" data-date="2023-12-02" aria-labelledby="fc-dom-70">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-70" class="fc-daygrid-day-number" aria-label="December 2, 2023">2</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr role="row">
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-sun fc-day-future fc-day-other" data-date="2023-12-03" aria-labelledby="fc-dom-72">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-72" class="fc-daygrid-day-number" aria-label="December 3, 2023">3</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-mon fc-day-future fc-day-other" data-date="2023-12-04" aria-labelledby="fc-dom-74">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-74" class="fc-daygrid-day-number" aria-label="December 4, 2023">4</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-tue fc-day-future fc-day-other" data-date="2023-12-05" aria-labelledby="fc-dom-76">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-76" class="fc-daygrid-day-number" aria-label="December 5, 2023">5</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-wed fc-day-future fc-day-other" data-date="2023-12-06" aria-labelledby="fc-dom-78">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-78" class="fc-daygrid-day-number" aria-label="December 6, 2023">6</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-thu fc-day-future fc-day-other" data-date="2023-12-07" aria-labelledby="fc-dom-80">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-80" class="fc-daygrid-day-number" aria-label="December 7, 2023">7</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-fri fc-day-future fc-day-other" data-date="2023-12-08" aria-labelledby="fc-dom-82">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-82" class="fc-daygrid-day-number" aria-label="December 8, 2023">8</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td role="gridcell" class="fc-daygrid-day fc-day fc-day-sat fc-day-future fc-day-other" data-date="2023-12-09" aria-labelledby="fc-dom-84">
                                                                                    <div class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
                                                                                        <div class="fc-daygrid-day-top">
                                                                                            <a id="fc-dom-84" class="fc-daygrid-day-number" aria-label="December 9, 2023">9</a>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-events">
                                                                                            <div class="fc-daygrid-day-bottom" style="margin-top: 0px;"></div>
                                                                                        </div>
                                                                                        <div class="fc-daygrid-day-bg"></div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
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
                                <div id="tabletalk" data-list='{"valueNames":["TalkDate","UserName","TalkText","FllowUpText"],"page":5,"pagination":true}'>
                                    <div class="table-responsive scrollbar">
                                        <table class="table fs--1 mb-0">
                                            <thead>
                                                <tr>
                                                    <th class="sort align-middle" scope="col" data-sort="TalkDate" style="width:15%;">상담일자</th>
                                                    <th class="sort align-middle text-start" scope="col" data-sort="UserName" style="width:30%;">상담자</th>
                                                    <th class="sort align-middle text-start" scope="col" data-sort="TalkText" style="width:20%;">상담내용</th>
                                                    <th class="sort align-middle text-end" scope="col" data-sort="FllowUpText" style="width:15%;">조치사항</th>
                                                </tr>
                                            </thead>
                                            <tbody class="list" id="customer-wishlist-table-body">
                                                <c:forEach var="talk" items="${talklist}">
                                                    <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                                                        <td class="TalkDate align-middle white-space-nowrap fs--1 text-900">${talk.talkDate}</td>
                                                        <td class="UserName align-middle text-900 fs--1 fw-semi-bold text-900">${talk.userName}</td>
                                                        <td class="TalkText align-middle fw-bold text-1000 text-900">${talk.talkText}</td>
                                                        <td class="FllowUpText align-middle fw-bold text-1000 text-end">${talk.fllowUpText}</td>
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
                        <div class="tab-pane fade" id="tab-deposite" role="tabpanel" aria-labelledby="deposite-tab">
                            <div class="mb-6">
                                <h3 class="mb-4" style="padding-top: 3px;">보증금 관리</h3>
                            </div>
                        </div>
                    </div>
                </div><!-- 여기가 그것 -->
            </div>
        </div>
    </div>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">회원삭제</h5>
                </div>
                <div class="modal-body">
                    <p class="text-700 lh-lg mb-0">
                        오늘 날짜는 <font class="current_date" id="current_date" style="color: blue;"></font> 입니다.
                        <br>만약 날짜가 틀리다면 문제가 될수 있으니 컴퓨터의 날짜를
                        <br>확인 및 수정 후 진행하세요.
                        <br>
                        <br>
                        <font color="red">탈회</font>를 진행하시겠습니까?
                    </p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-outline-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal2">확인</button>
                    <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        date = new Date();

        year = date.getFullYear();
        month = date.getMonth() + 1;
        day = date.getDate();
        document.getElementById("current_date").innerHTML = year + '-' + month + '-' + day;

        function deletesubmit() {
            var form = document.getElementById('myForm');
            form.setAttribute('action', 'membershipDelete'); // Change 'newURL' to your desired URL
            form.setAttribute('method', 'POST');

            form.submit();
        }
    </script>
    <!-- 모달 1개 -->
    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">회원삭제</h5>
                </div>
                <div class="modal-body">
                    <p class="text-700 lh-lg mb-0">
                        회원 번호: <font color="blue">${tblmember.memberID}</font> 회원 성명 : <font color="blue">${tblmember.name}</font> 님을 탈회 시키겠습니까?
                        <br><br>회원데이터는 삭제되며 복원되지 않습니다.
                        <br>모든 현황창에 매출데이터의 회원이름은 탈회로 표시됩니다.
                        <br><br>그래도 <font color="red">탈회</font>시키겠습니까?
                    </p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-outline-primary" type="button" onclick="deletesubmit()">확인</button>
                    <button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 모달 2개 -->

    <div class="modal fade" id="verticallyCentered" tabindex="-1" aria-labelledby="verticallyCenteredModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="verticallyCenteredModalLabel">Uspot</h5>
                    <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1"></span></button>
                </div>
                <div class="modal-body">
                    <p class="text-700 lh-lg mb-0" id="resultmessage">검색결과가 없습니다.</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" data-bs-dismiss="modal">나가기</button>
                </div>
            </div>
        </div>
    </div>
	
    <!-- 모달 3개 -->
</body>

</html>