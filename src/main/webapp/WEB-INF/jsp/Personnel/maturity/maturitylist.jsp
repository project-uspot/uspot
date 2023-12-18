<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<div class="p-0">
   <div class="mb-9 col-lg-14">
      <div class="row g-2 mb-4">
          <div class="col-auto">
            <h2 class="mb-0">만기현황</h2>
          </div>
          <div class="col-auto">
    			<button class="btn btn-outline-info me-1 mb-1" type="button" onclick="maturitylist()">조회</button>
  			</div>
      </div>
      <div class="mb-1">
      	<div class="row g-2">
	      	<div class="card h-75 col-md-2">
               <div class="card-body h-75">
				<div class="d-grid gap-2 ">
				<h6 class="text-700 h-25">만기일자</h6>
					<div class="p-2">
						<input class="form-control" type="date" id="startday" name="startday"/>
					</div>
					<div class="p-2">
						<input class="form-control" type="date" id="endday" name="endday"/>
					</div>
				</div>
               </div>
             </div>
             <div class="card h-100 col-md-7">
               <div class="card-body">
               		<div class="row g-3">
               		<h6 class="text-700 h-25">강좌</h6>
						<div class="d-grid gap-2 col-md-4">
							<div class="input-group input-group mb-4">
								<h6 class="col-md-3 pt-3">사업장:</h6>
								<input class="form-control col-md-1" id="sitename" type="text" name="sitename" readonly="readonly" maxlength="8" aria-describedby="SiteCodespan" value="${sitename}"/>
								<span class="input-group-text" id="SiteCodespan" style="cursor: pointer;" onclick="execDaumPostcode()"><span data-feather="search"></span></span> 
							</div> 
							<div class="input-group input-group">
								<h6 class="col-md-3 pt-3">요일:</h6>
								<input class="form-control col-md-1" id="sitename" type="text" name="sitename" readonly="readonly" maxlength="8" aria-describedby="SiteCodespan" value="${sitename}"/>
								<span class="input-group-text" id="SiteCodespan" style="cursor: pointer;" onclick="execDaumPostcode()"><span data-feather="search"></span></span> 
							</div> 
						</div>
						<div class="d-grid gap-2 col-md-4">
							<div class="input-group input-group mb-4">
								<h6 class="col-md-3 pt-3">종목:</h6>
								<input class="form-control" id="ZipCode" type="text" name="ZipCode" readonly="readonly" maxlength="8" aria-describedby="ZipCodespan"/>
								<span class="input-group-text" id="ZipCodespan" style="cursor: pointer;" onclick="item01list()"><span data-feather="search"></span></span> 
							</div> 
							<div class="input-group input-group">
								<h6 class="col-md-3 pt-3">시간:</h6>
								<input class="form-control col-md-1" id="sitename" type="text" name="sitename" readonly="readonly" maxlength="8" aria-describedby="SiteCodespan" value="${sitename}"/>
								<span class="input-group-text" id="SiteCodespan" style="cursor: pointer;" onclick="execDaumPostcode()"><span data-feather="search"></span></span> 
							</div> 
						</div>
						<div class="d-grid gap-2 col-md-4">
							<div class="input-group input-group mb-4">
								<h6 class="col-md-3 pt-3">반명:</h6>
								<input class="form-control col-md-1" id="sitename" type="text" name="sitename" readonly="readonly" maxlength="8" aria-describedby="SiteCodespan" value="${sitename}"/>
								<span class="input-group-text" id="SiteCodespan" style="cursor: pointer;" onclick="execDaumPostcode()"><span data-feather="search"></span></span> 
							</div> 
							<div class="input-group input-group">
								<h6 class="col-md-3 pt-3">단계:</h6>
								<input class="form-control col-md-1" id="sitename" type="text" name="sitename" readonly="readonly" maxlength="8" aria-describedby="SiteCodespan" value="${sitename}"/>
								<span class="input-group-text" id="SiteCodespan" style="cursor: pointer;" onclick="execDaumPostcode()"><span data-feather="search"></span></span> 
							</div> 
						</div>
					</div>
               </div>
             </div>
             <div class="card h-75 col-md-2">
               <div class="card-body h-75">
				<div class="d-grid gap-2 ">
				<h6 class="text-700 h-25">회원정보</h6>
					<div class="p-2">
						<select class="form-select" id="SiteCode" name="SiteCode">
							<option value="">전체</option>
							<option value="">회원성명</option>
							<option value="">회원번호</option>
						</select>
					</div>
					<div class="p-2">
						<input class="form-control" id="cellPhone" type="text" name="cellPhone"/>
					</div>
				</div>
               </div>
             </div>
	  	  </div>
      </div>  
      <div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1" >
         <div class="table-responsive scrollbar-overlay mx-n1 px-1">
            <table class="table table-sm fs--1 mb-1 table-hover table-bordered" id="itemTable">
               <thead class="itemcodelist">
                  <tr>
                     <th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >번호</th>
                     <th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >사업장명</th>
                     <th colspan="5" class="sort align-middle pe-1 text-center" scope="col">강좌정보</th>
                     <th colspan="7" class="sort align-middle pe-1 text-center" scope="col">수강정보</th>
                     <th colspan="9" class="sort align-middle pe-1 text-center" scope="col">회원정보</th>
                  </tr>
                  <tr>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">분류</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">강좌명</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">요일</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">시간</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">단계</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">등록일</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">상태</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">등록구분</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">등록개월</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">시작일</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">종료일</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">회원번호</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">회원성명</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">성별</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">구분</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">일반전화</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">휴대전화</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">비상전화</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">우편번호</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">주소</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">세부주소</th>
                  </tr>                  
               </thead>
               <tbody class="list" id="tbody">
               </tbody>
            </table>
         </div>
      </div> 
   </div>
</div>
<script type="text/javascript">
var startday = document.querySelector('input[name="startday"]');
var endday = document.querySelector('input[name="endday"]');
document.getElementById('startday').value = new Date().toISOString().substring(0, 10);
document.getElementById('endday').value = new Date().toISOString().substring(0, 10);

function item01list() {
	var url = "item01list.do";
	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=400,height=700";
    window.open(url, "_blank", windowFeatures);
}


function maturitylist() {
	$.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "maturitylist", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'json',
        data: { 
        	FromDate: startday.value,
        	ToDate : endday.value,
        },
        success: function(data) {	
        	var list = data.list;
            var tbody = $('#tbody'); // tbody 요소에 대한 참조
            
            // 기존 tbody 내용 지우기
            tbody.empty();
			if(list == ''){
				var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
        		$('#resultmessage').text('검색결과가 없습니다.');
                $('body').append(buttonHTML);
                $('#modalButton').click();
			}
            // 받은 데이터를 반복하며 테이블 로우 구성하기
            list.forEach(function(item, index) {
                var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center">';
                row += '<td class="align-middle py-3">' + (index + 1) + '</td>';

                if (index === 0) {
                    row += '<td class="align-middle py-3" rowspan="' + list.length + '">${sitename}</td>';
                }

                // 데이터를 테이블 셀에 추가하기
                var keys = [
                    'categoryname', 'jungname', 'dayname', 'fromtime', 'levelname', 'saledate', 
                    'state', 'isrereg', 'regmonth', 'fromdate', 'todate', 'custcode', 
                    'custName', 'custGender', 'typename', 'homephone', 'cellphone','emgphone','zipcode', 
                    'address', 'subaddress'
                ];

                keys.forEach(function(key) {
                    var value = item[key] ?? ''; // 값이 null이면 빈 문자열로 대체
                    row += '<td class="align-middle py-3">' + value + '</td>';
                });

                row += '</tr>';
                // tbody에 각 로우 추가하기
                tbody.append(row);        	
                });
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
            console.log("Error: " + error);
        }
	});
}
</script>

<!-- 모달 -->

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