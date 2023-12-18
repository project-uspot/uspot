<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../include/AdminTop.jsp" %>
<c:set var="menu_idx" value="10"></c:set>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>회원명부조회</title>
    </head>
        <nav class="mb-2" aria-label="breadcrumb">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="#!">회원관리</a></li>
            <li class="breadcrumb-item active">회원명부조회</li>
          </ol>
        </nav>
        <div class="mb-9">
          <div class="row g-2 mb-4">
            <div class="col-auto">
              <h2 class="mb-0">회원명부조회</h2>
            </div>
          </div>
          <div id="products" data-list='{"valueNames":["customer","email","total-orders","total-spent","city","last-seen","last-order"],"page":10,"pagination":true}'>
            <div class="mb-4">
              <div class="row g-3">
                <div class="col-auto overflow-hidden-y flex-grow-1">
                  <div class="row g-6">
				<div class="col-sm-6 col-md-2 mb-2">
					<div class="form-floating">
						<select class="form-select" id="gender" name="gender">
							<option value="-1">전체</option>
							<option value="1">남자</option>
							<option value="0">여자</option>
						</select>
						<label for="PLockergroupid">회원성별</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-2 mb-2">
					<div class="form-floating">
						<select class="form-select" id="mlevel" name="mlevel">
							<option value="-1">전체</option>
							<option value="0">일반</option>
							<option value="1">지역주민</option>
							<option value="2">직원가족</option>
						</select>
						<label for="PLockergroupid">회원등급</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-2 mb-2">
					<div class="form-floating">
						<select class="form-select" id="type" name="type">
							<option value="-1">전체</option>
							<option value="12">어른</option>
							<option value="20">청소년</option>
							<option value="11">어린이</option>
							<option value="40">경로</option>
						</select>
						<label for="PLockergroupid">회원구분</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-2 mb-2">
					<div class="form-floating">
						<select class="form-select" id="PLockergroupid" name="PLockergroupid">
							<option value="-1">전체</option>
							<option value="1">일반</option>
							<option value="2">지역주민</option>
							<option value="3">국가유공자</option>
							<option value="4">공무원가족</option>
						</select>
						<label for="PLockergroupid">감면대상</label>
					</div>
				</div>
				<div class="col-sm-6 col-md-2 mb-2">
					<div class="form-floating">
						<select class="form-select" id="PLockergroupid" name="PLockergroupid">
							<option value="all">전체</option>
							<c:forEach items="${sitecodelist}" var="sitecodelist">
							<option value="${sitecodelist.siteCode}">${sitecodelist.siteName}</option>
							</c:forEach>
						</select>
						<label for="PLockergroupid">이용사업장</label>
					</div>
				</div>
				<div class="col-auto">
                	<button class="btn btn-primary">엑셀로 저장</button>
                </div>
                <div class="col-auto">
                  <div class="search-box">
                      <input class="form-control search-input search" type="search" placeholder="회원 검색" aria-label="Search" />
                      <span class="fas fa-search search-box-icon"></span>
                  </div>
                </div>
				<div class="col-sm-6 col-md-3 mb-2">
					<div class="form-floating">
						<div class="form-check" style="padding-top: 6px;">
							<input class="form-check-input" id="isdeletecheck" type="checkbox" name="isdeletecheck"/>
							<label class="form-check-label text-900" for="fragileCheck">가입기간</label>
							<label class="form-label" for="timepicker2">Select Time Range</label>
							<input class="form-control datetimepicker flatpickr-input" id="timepicker2" type="text" placeholder="d/m/y to d/m/y" data-options="{&quot;mode&quot;:&quot;range&quot;,&quot;dateFormat&quot;:&quot;d/m/y&quot;,&quot;disableMobile&quot;:true}" readonly="readonly">
					<script type="text/javascript">
				flatpickr("#timepicker2", {
					  mode: "range",
					  dateFormat: "d/m/y",
					  disableMobile: true,
					  locale: "ko", // 언어를 한국어로 설정
					  i18n: {
					    // 한글 언어 파일 사용
					    weekdays: {
					      shorthand: ["일", "월", "화", "수", "목", "금", "토"],
					      longhand: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"]
					    },
					    months: {
					      shorthand: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
					      longhand: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
					    }
					  }
					});
				</script>
						
						</div>
					</div>
				</div>

                </div>
              </div>
            </div>
            <div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1">
              <div class="table-responsive scrollbar-overlay mx-n1 px-1">
                <table class="table table-sm fs--1 mb-0">
                  <thead>
                    <tr>
                      <th class="white-space-nowrap fs--1 align-middle ps-0">
                        <div class="form-check mb-0 fs-0">
                          <input class="form-check-input" id="checkbox-bulk-customers-select" type="checkbox" data-bulk-select='{"body":"customers-table-body"}' />
                        </div>
                      </th>
                      <th class="sort align-middle ps-7" scope="col" data-sort="customer" >회원이름</th>
                      <th class="sort align-middle pe-5" scope="col" data-sort="email" >회원번호</th>
                      <th class="sort align-middle text-end" scope="col" data-sort="total-orders">가입일</th>
                      <th class="sort align-middle text-end" scope="col" data-sort="total-spent">성별</th>
                      <th class="sort align-middle ps-5" scope="col" data-sort="city">등급</th>
                      <th class="sort align-middle text-end" scope="col" data-sort="last-seen">감면</th>
                      <th class="sort align-middle text-end" scope="col" data-sort="last-order">휴대전화</th>
                      <th class="sort align-middle text-end" data-sort="product">생년월일</th>
                      <th class="sort align-middle ps-7" scope="col" data-sort="last-seen">이메일</th>
                      <th class="sort align-middle ps-7" scope="col" data-sort="last-seen">우편번호</th>
                      <th class="sort align-middle ps-7" scope="col" data-sort="last-seen">주소</th>
                    </tr>
                  </thead>
                  <tbody class="list" id="customers-table-body">
                  <c:forEach items="${list}" var="list">
                    <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                      <td class="fs--1 align-middle ps-0 py-3">
                        <div class="form-check mb-0 fs-0">
                          <input class="form-check-input" type="checkbox"/>
                        </div>
                      </td>
                      <td class="customer align-middle white-space-nowrap pe-5"><a class="d-flex align-items-center text-1100" href="../../../apps/e-commerce/landing/profile.html">
                          <div class="avatar avatar-m"><img class="rounded-circle" src="${pageContext.request.contextPath}/new_lib/assets/img/team/32.webp" alt="" />
                          </div>
                          <p class="mb-0 ms-3 text-1100 fw-bold">${list.name}</p>
                        </a></td>
                      <td class="email align-middle white-space-nowrap pe-5">${list.memberID}</td>
                       <td class="total-orders align-middle white-space-nowrap fw-semi-bold text-end text-1000">${list.regDate}</td>
                      <td class="total-spent align-middle white-space-nowrap fw-bold text-end ps-3 text-1100">
                      <c:if test="${list.gender == 0}">
                      	여자
                      </c:if>
                      <c:if test="${list.gender == 1}">
                      	남자
                      </c:if>
                      </td>
                      <td class="city align-middle white-space-nowrap text-1000 ps-5">
                      <c:choose>
                      	<c:when test="${list.MLevel == 0 ||list.MLevel == null}">
                      		일반
                      	</c:when>
                      	<c:otherwise>
                      		${list.MLevel}
                      	</c:otherwise>
                      </c:choose>
                      </td>
                      <td class="last-seen align-middle white-space-nowrap text-700 text-end">
                      <c:choose>
                      	<c:when test="${list.DCDS == 0 || list.DCDS == null}">
                      		일반
                      	</c:when>
                      	<c:otherwise>
                      		${list.DCDS}
                      	</c:otherwise>
                      </c:choose>
                      </td>
                      <td class="last-order align-middle white-space-nowrap text-700 text-end">${list.cellPhone}</td>
                      <td class="product align-middle white-space-nowrap text-2000 text-end">${list.birthDay}</td>
                      <td class="email align-middle white-space-nowrap pe-1"><a class="fw-semi-bold" href="mailto:annac34@gmail.com">${list.email}</a></td>
                      <td class="city align-middle white-space-nowrap text-1000 ps-7">${list.address}</td>
                      <td class="city align-middle white-space-nowrap text-1000 ps-7">${list.subAddress}</td> 
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
    </main>
  </body>
<script type="text/javascript">
$("#gender,#mlevel,#type").change(function() {
	var tableBody = $(".list");
    tableBody.empty(); // 기존 내용을 지웁니다
    var gender = $('#gender').val();
    var mlevel = $('#mlevel').val();
    var type = $('#type').val();

    $.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "memberlistfind.do", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'json',
        data: { 
         Gender: gender,
         MLevel : mlevel,
         Type : type
        },
        success: function(data) {	
       	 var commentList = data.commentlist;
       	 console.log(commentList);
       	 commentList.forEach(function(list) {
                // 데이터를 기반으로 HTML 로우를 만듭니다.
                var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static">';
                row += '<td class="fs--1 align-middle ps-0 py-3">';
                row += '<div class="form-check mb-0 fs-0">';
                row += '<input class="form-check-input" type="checkbox"/></div></td>';
				row +='<td class="customer align-middle white-space-nowrap pe-5"><a class="d-flex align-items-center text-1100" href="../../../apps/e-commerce/landing/profile.html">';
				row +='<div class="avatar avatar-m"><img class="rounded-circle" src="${pageContext.request.contextPath}/new_lib/assets/img/team/32.webp" alt="" /></div>';
		        row +='<p class="mb-0 ms-3 text-1100 fw-bold">'+ list.name +'</p></a></td>';
                row +='<td class="email align-middle white-space-nowrap pe-5">'+ list.memberID + '</td>';
				row +='<td class="total-orders align-middle white-space-nowrap fw-semi-bold text-end text-1000">'+list.regDate+'</td>';
                var genderText = '';
                if (list.gender == 0) {
                	genderText = '여자';
                } else if (list.gender == 1) {
                    stateText = '남자';
                }				
                row +='<td class="total-spent align-middle white-space-nowrap fw-bold text-end ps-3 text-1100">'+genderText+'</td>';
                var mlevelText = '';
                if (list.MLevel == 0 ||list.MLevel == null) {
                	mlevelText = '일반';
                } else {
                	mlevelText = list.MLevel;
                }	
				row +='<td class="city align-middle white-space-nowrap text-1000 ps-5">'+mlevelText+'</td>';
                var DCDSText = '';
                if (list.DCDS == 0 ||list.DCDS == null) {
                	DCDSText = '일반';
                } else {
                	DCDSText = list.DCDS;
                }	
				row +='<td class="last-seen align-middle white-space-nowrap text-700 text-end">'+DCDSText+'</td>';
				row +='<td class="last-order align-middle white-space-nowrap text-700 text-end">'+list.cellPhone+'</td>';
				row +='<td class="product align-middle white-space-nowrap text-2000 text-end">'+list.birthDay+'</td>';
				row +='<td class="email align-middle white-space-nowrap pe-1"><a class="fw-semi-bold" href="mailto:annac34@gmail.com">'+list.email+'</td>';
				row +='<td class="city align-middle white-space-nowrap text-1000 ps-7">'+list.address+'</td>';
				row +='<td class="city align-middle white-space-nowrap text-1000 ps-7">'+list.subAddress+'</td>'; 
                row += '</tr>';
                tableBody.append(row);
            });
        },
        error: function(xhr, status, error) {
            console.log("Status: " + status);
            console.log("Error: " + error);
        }
    }); 
});
</script>
</html>