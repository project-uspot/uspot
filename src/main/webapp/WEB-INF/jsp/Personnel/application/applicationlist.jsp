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
            <h2 class="mb-0">접수현황</h2>
          </div>
      </div>
      <div class="mb-1">
      	  <div class="row gy-2 gx-3 align-items-center">
  		 	<div class="col-md-1 mb-1">
				<div class="form-floating">
					<select class="form-select form-select-sm" id="isrereg" name="isrereg">
						<option value="">전체</option>
						<option value="0">신규</option>
						<option value="1">재등록</option>
					</select>
					<label for="state">등록구분</label>
				</div>
			</div>
			<div class="col-auto">
    			<button class="btn btn-outline-info me-1 mb-1" type="button" onclick="applicationlist()">조회</button>
  			</div>
		 </div>
         <div class="row gy-2 gx-3 align-items-center mb-1">
  			<div class="col-auto">
    			<div class="form-check">
      				<input class="form-check-input" id="jupsuday" type="checkbox" name="jupsuday" checked/>
      				<label class="form-check-label mb-0" for="autoSizingCheck">접수일자&emsp;</label>
    			</div>
  			</div>
  		 	<div class="col-auto">
				<input class="form-control" type="date" id="startday" name="startday"/>
			</div>
			<div class="col-auto">
				<h6>사업장:</h6>
			</div>
			<div class="col-sm-6 col-md-2">
				<div class="input-group input-group ">
					<input class="form-control" id="sitename" type="text" name="sitename" readonly="readonly" maxlength="8" aria-describedby="SiteCodespan" value="${sitename}"/>
					<span class="input-group-text" id="SiteCodespan" style="cursor: pointer;" onclick="execDaumPostcode()"><span data-feather="search"></span></span> 
				</div> 
			</div>
			<div class="col-auto">
				<h6>종목:</h6>
			</div>
			<div class="col-sm-6 col-md-2">
				<div class="input-group input-group ">
					<input class="form-control" id="pgmgrouptext" type="text" name="pgmgrouptext" readonly="readonly" maxlength="8" aria-describedby="pgmgrouptext" value="전체"/>
					<input id="pgmgroup" type="hidden" name="pgmgroup" value="전체"/>
					<span class="input-group-text" id="pgmgrouptext" style="cursor: pointer;" onclick="item01list()"><span data-feather="search"></span></span> 
				</div> 
			</div>
			<div class="col-auto">
				<h6>반명:</h6>
			</div>
			<div class="col-sm-6 col-md-2">
				<div class="input-group input-group ">
					<input class="form-control" id="pgmtext" type="text" name="pgmtext" readonly="readonly" maxlength="8" aria-describedby="pgmtext" value="전체"/>
					<input id="pgm" type="hidden" name="pgm" value="전체"/>
					<span class="input-group-text" id="pgmtext" style="cursor: pointer;" onclick="item02list()"><span data-feather="search"></span></span> 
				</div> 
			</div>
			<div class="col-auto">
				<h6>&emsp;처리자:</h6>
			</div>
			<div class="col-sm-6 col-md-2">
				<div class="input-group input-group ">
					<input class="form-control" id="usertext" type="text" name="usertext" readonly="readonly" maxlength="8" aria-describedby="usertext" value="전체"/>
					<input id="user" type="hidden" name="user" value="전체"/>
					<span class="input-group-text" id="usertext" style="cursor: pointer;" onclick="userlist()"><span data-feather="search"></span></span> 
				</div> 
			</div>
		</div>
		<div class="row gy-2 gx-3 align-items-center">
  			<div class="col-auto">
    			<div class="form-check mb-0">
      				<input class="form-check-input" id="startday" type="checkbox" name="learnstartday"/>
      				<label class="form-check-label mb-0" for="autoSizingCheck">강좌시작일</label>
    			</div>
  			</div>
  		 	<div class="col-auto">
				<input class="form-control" type="date" id="endday" name="endday"/>
			</div>
  			<div class="col-auto">
				<h6>요일:&emsp;</h6>
			</div>
			<div class="col-sm-6 col-md-2">
				<div class="input-group input-group ">
					<input class="form-control" id="day" type="text" name="day" readonly="readonly" maxlength="8" aria-describedby="day" value="전체"/>
					<span class="input-group-text" id="day" style="cursor: pointer;" onclick="daylist()"><span data-feather="search"></span></span> 
				</div> 
			</div>
			<div class="col-auto">
				<h6>시간:</h6>
			</div>
			<div class="col-sm-6 col-md-2">
				<div class="input-group input-group ">
					<input class="form-control" id="time" type="text" name="time" readonly="readonly" maxlength="8" aria-describedby="time" value="전체"/>
					<span class="input-group-text" id="time" style="cursor: pointer;" onclick="timelist()"><span data-feather="search"></span></span> 
				</div> 
			</div>
			<div class="col-auto">
				<h6>단계:</h6>
			</div>
			<div class="col-sm-6 col-md-2">
				<div class="input-group input-group ">
					<input class="form-control" id="leveltext" type="text" name="leveltext" readonly="readonly" maxlength="8" aria-describedby="leveltext" value="전체"/>
					<input id="level" type="hidden" name="level" value="전체"/>
					<span class="input-group-text" id="leveltext" style="cursor: pointer;" onclick="item03list()"><span data-feather="search"></span></span> 
				</div> 
			</div>
			<div class="col-auto">
				<h6>회원정보:</h6>
			</div>
			<div class="col-md-1">
				<select class="form-select form-select-sm" id="membercategory" name="membercategory">
					<option value="">전체</option>
					<option value="회원성명">회원성명</option>
					<option value="회원번호">회원번호</option>
				</select>
        	</div>
        	<div class="col-sm-6 col-md-1">
                <input class="form-control" id="membertext" type="text" name="membertext"/>
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
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">접수일자</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">상태</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">등록구분</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">등록개월</th>
                      <th class="sort board border-github align-middle pe-1 text-center" scope="col">결제금액</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">시작일</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">종료일</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">회원번호</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">회원성명</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">성별</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">구분</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">일반전화</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">휴대전화</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">우편번호</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">주소</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">세부주소</th>
                  </tr>                  
               </thead>
               <tbody class="list" id="tbody">	
				<c:forEach var="lists" items="${list}" varStatus="status">
						<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center">
						<td class="align-middle py-3 ">${status.index+1}</td>
						<c:if test="${status.index == 0}">
							<td class="align-middle py-3 " rowspan="${fn:length(list)+1}">${sitename}</td>
						</c:if>
                        <td class="align-middle py-3 ">${lists.CATEGORYNAME}</td>
                        <td class="align-middle py-3 ">${lists.JUNGNAME}</td>
                        <td class="align-middle py-3 ">${lists.DAYNAME}</td>
                        <td class="align-middle py-3 ">${lists.FROMTIME}</td>
                        <td class="align-middle py-3 ">${lists.LEVELNAME}</td>
                        <td class="align-middle py-3 ">${lists.SALEDATE}</td>
                        <td class="align-middle py-3 ">${lists.STATE}</td>
                        <td class="align-middle py-3 ">${lists.isrereg}</td>
                        <td class="align-middle py-3 ">${lists.REGMONTH}</td>
                        <td class="align-middle py-3 ">${lists.REALPRICE}</td>
                        <td class="align-middle py-3 ">${lists.FROMDATE}</td>
                        <td class="align-middle py-3 ">${lists.TODATE}</td>
                        <td class="align-middle py-3 ">${lists.CUSTCODE}</td>
                        <td class="align-middle py-3 ">${lists.custName}</td>
                        <td class="align-middle py-3 ">${lists.custGender}</td>
                        <td class="align-middle py-3 ">${lists.TYPENAME}</td>
                        <td class="align-middle py-3 ">${lists.HOMEPHONE}</td>
                        <td class="align-middle py-3 ">${lists.CELLPHONE}</td>
                        <td class="align-middle py-3 ">${lists.custZipcode}</td>
                        <td class="align-middle py-3 ">${lists.custAddress}</td>
                        <td class="align-middle py-3 ">${lists.subAddress}</td>
                     </tr>
                     </c:forEach>
               </tbody>
            </table>
         </div>
      </div> 
   </div>
</div>
<script type="text/javascript">
//Selecting the checkboxes
var isrereg = document.getElementById('isrereg');
const jupsudayCheckbox = document.querySelector('input[name="jupsuday"]');
const learnstartdayCheckbox = document.querySelector('input[name="learnstartday"]');
var startday = document.querySelector('input[name="startday"]');
var endday = document.querySelector('input[name="endday"]');
document.getElementById('startday').value = new Date().toISOString().substring(0, 10);
document.getElementById('endday').value = new Date().toISOString().substring(0, 10);
var pgmgroup = document.getElementById('pgmgroup');
var day = document.getElementById('day');
var pgm = document.getElementById('pgm');
var level = document.getElementById('level');
var time = document.getElementById('time');
var user = document.getElementById('user');
var membercategory = document.getElementById('membercategory');
var membertext = document.getElementById('membertext');


// Adding click event listeners to handle checkbox states
jupsudayCheckbox.addEventListener('click', function() {
  if (this.checked) {
	  learnstartdayCheckbox.checked = false;
  }
});

learnstartdayCheckbox.addEventListener('click', function() {
  if (this.checked) {
    jupsudayCheckbox.checked = false;
  }
});

function applicationlist() {
	
	if(jupsudayCheckbox.checked == false && learnstartdayCheckbox.checked == false){
		alert('기준 날짜를 정해주세요');
		return false;
	}
	
	
	$.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "applicationlist", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'json',
        data: { 
        	IsReReg : isrereg.value,
        	FromDate: startday.value,
        	ToDate : endday.value,
        	jubsuday :  jupsudayCheckbox.checked,
        	learnstartday : learnstartdayCheckbox.checked,
        	pgmgroup : pgmgroup.value,
        	day : day.value,
        	pgm : pgm.value,
        	level : level.value,
        	time : time.value,
        	user : user.value,
        	membercategory : membercategory.value,
        	membertext : membertext.value
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
                    'state', 'isrereg', 'regmonth', 'realprice', 'fromdate', 'todate', 'custcode', 
                    'custName', 'custGender', 'typename', 'homephone', 'cellphone', 'custZipcode', 
                    'custAddress', 'subAddress'
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

function item01list() {
	var url = "item01list.do";
	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=500,height=600";
    window.open(url, "_blank", windowFeatures);
}

function item02list() {
	if(pgmgroup.value == '전체'){
		return false;
	}
	var url = "item02list.do?pgmgroup="+pgmgroup.value;
	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=500,height=600";
    window.open(url, "_blank", windowFeatures);
}

function item03list() {
	if(pgmgroup.value == '전체'){
		return false;
	}
	var url = "item03list.do"
	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=500,height=600";
    window.open(url, "_blank", windowFeatures);
}

function daylist() {
	var url = "daylist.do";
	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=500,height=600";
    window.open(url, "_blank", windowFeatures);
}

function timelist() {
	var url = "timelist.do";
	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=500,height=600";
    window.open(url, "_blank", windowFeatures);
}

function userlist() {
	var url = "userlist.do";
	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=500,height=600";
    window.open(url, "_blank", windowFeatures);
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