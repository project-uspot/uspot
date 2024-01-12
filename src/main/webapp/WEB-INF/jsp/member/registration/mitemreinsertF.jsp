<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>수강정보 등록 및 변경</title>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    <link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet/leaflet.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/MarkerCluster.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/MarkerCluster.Default.css" rel="stylesheet">
</head>
<body style="overflow: hidden;">
    <div class="card h-100 mb-1">
        <div class="card-body pb-3">
            <div class="col-12 col-xxl-8">
                <div>
                    <div class="row g-3">
                        <h3 class="mb-3 w-25 pt-2">수강정보 등록 및 변경</h3>
                    </div>
					<div class="row">
						<div class="col-auto ms-n3">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text me-3" id="basic-addon1">강습반</span>
							<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
								<input class="form-check-input" id="indexradio1" type="radio" name="index" value="1" aria-describedby="basic-addon1" checked="checked"/>
								<label class="form-check-label" for="indexradio1">일반</label>
							</div>
							<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
								<input class="form-check-input" id="indexradio2" type="radio" name="index" value="2" aria-describedby="basic-addon1"/>
								<label class="form-check-label" for="indexradio2">복합</label>
							</div>
						</div>
					</div>
	                    <div class="col-sm-6 col-md-2">
	                    	<div class="input-group">
							  <input class="form-control" type="text" aria-label="Recipient's username" aria-describedby="basic-addon2" name="findstring" id="findstring" onkeydown="handleKeyPress(event)"/>
							  <span class="input-group-text" id="basic-addon2" onclick="finditem()" style="cursor: pointer;">찾기</span>
							</div>
	                    </div>
	                    <div class="col-auto mt-1">
                            <p style="background-color: lightblue;">[${member.memberID}]${member.name}(${member.genderText})${member.typeText} / ${mleveltext} / ${dcname}</p>
                            <input type="hidden" name="memberid" id="memberid" value="${member.memberID}">
						</div>
						<div class="col-auto position-absolute" style="margin-left:1000px;">
                            <button class="btn btn-success" type="button" onclick="save()" >저장(S)</button>
                        </div>
                        <div class="col-auto position-absolute" style="margin-left:1104px;">
                            <button class="btn btn-danger" type="button" onclick="alldelete()">삭제(D)</button>
                    	</div>
                    </div>
                    <div class="border-top border-bottom border-200" id="customerOrdersTable" style="width:1200px; height: 150px;overflow-y: scroll;"
                    data-list='{"valueNames":["code","category","item","name","day","time","level","member","teacher","date","price","dc","sort","dccode","dcpercent","max","enter","remain"],"page":6,"pagination":true}'>
                        <div class="table-responsive scrollbar">
                            <table class="table table-sm fs--1 mb-0 table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th class="sort align-middle" scope="col" data-sort="code">코드</th>
                                        <th class="sort align-middle" scope="col" data-sort="category">구분</th>
                                        <th class="sort align-middle" scope="col" data-sort="item">종목</th>
                                        <th class="sort align-middle" scope="col" data-sort="name">강습반명</th>
                                        <th class="sort align-middle" scope="col" data-sort="day">요일</th>
                                        <th class="sort align-middle" scope="col" data-sort="time">시간</th>
                                        <th class="sort align-middle" scope="col" data-sort="level">단계</th>
                                        <th class="sort align-middle" scope="col" data-sort="member">대상</th>
                                        <th class="sort align-middle" scope="col" data-sort="teacher">강사</th>
                                        <th class="sort align-middle" scope="col" data-sort="date">수강기간</th>
                                        <th class="sort align-middle" scope="col" data-sort="price">회비</th>
                                        <th class="sort align-middle" scope="col" data-sort="dc">할인</th>
                                        <th class="sort align-middle" scope="col" data-sort="sort">소계</th>
                                        <th class="sort align-middle" scope="col" data-sort="dccode">할인코드</th>
                                        <th class="sort align-middle" scope="col" data-sort="dcpercent">할인율</th>
                                        <th class="sort align-middle" scope="col" data-sort="max">정원</th>
                                        <th class="sort align-middle" scope="col" data-sort="enter">등록</th>
                                        <th class="sort align-middle" scope="col" data-sort="remain">잔여</th>
                                    </tr>
                                </thead>
                                <tbody class="list" id="itemtbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
	    <div class="card w-60" style="height: 250px;">
	    	<div class="card-body">
		        <div class="row mt-n3">
		        	<div class="col-auto">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text" id="basic-addon1">매출일자</span>
							<input class="form-control" type="date" aria-describedby="basic-addon1" id="saledate" name="saledate"/>
						</div>
					</div>
					<div class="col-auto ms-n4">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text me-3" id="basic-addon1">영수증인쇄</span>
							<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
								<input class="form-check-input" id="inlineRadio1" type="radio" name="inlineRadioOptions" value="option1" aria-describedby="basic-addon1"/>
								<label class="form-check-label" for="inlineRadio1">2장</label>
							</div>
							<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
								<input class="form-check-input" id="inlineRadio2" type="radio" name="inlineRadioOptions" value="option2" aria-describedby="basic-addon1"/>
								<label class="form-check-label" for="inlineRadio2">1장</label>
							</div>
							<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
								<input class="form-check-input" id="inlineRadio3" type="radio" name="inlineRadioOptions" value="option3" aria-describedby="basic-addon1" checked="checked"/>
								<label class="form-check-label" for="inlineRadio3">0장</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
		        	<div class="col-auto">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text" id="basic-addon1">강습료</span>
							<select class="form-select" aria-label="Default select example" id="price" aria-describedby="basic-addon1" style="width: 152px; text-align: right;">
								<option selected="selected" value="0">0</option>
							</select>
						</div>
					</div>
					<div class="col-auto">
						<div class="input-group input-group-sm mb-3 ms-1">
							<span class="input-group-text" id="basic-addon1">등록개월</span>
							<input class="form-control" type="number" aria-describedby="basic-addon1" min="1" style="width: 60px;" name="regmonth" id="regmonth"/>
						</div>
					</div>
					<div class="col-md-5 ms-n2" style="width: 327px;">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text" id="basic-addon1">할인유형</span>
							<select class="form-select" id="dcds" aria-label="Default select example" aria-describedby="basic-addon1">
								<option selected="selected" value="0" id="0"></option>
								<c:forEach var="dc" items="${dclist}">
									<option id="${dc.rate}" value="${dc.dcid}">${dc.dcName}</option>
                                </c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-auto">
						<div class="input-group mb-3 input-group-sm">
							<span class="input-group-text" id="basic-addon1">강습기간</span>
							<input class="form-control" type="date" aria-describedby="basic-addon1" id="fromdate" name="fromdate"/>
						</div>
					</div>
					<div class="col-auto mt-1 mx-n4">
						~
					</div>
					<div class="col-auto ms-n1">
						<div class="input-group mb-3 input-group-sm">
							<input class="form-control" type="date" id="todate" name="todate"/>
						</div>
					</div>
					<div class="col-auto">
						<div class="input-group mb-3 input-group-sm">
							<span class="input-group-text" id="basic-addon1">할인율/금액</span>
							<input class="form-control" type="number" id="dcper" name="dcper" aria-describedby="basic-addon1" min="1" readonly="readonly" style="width: 65px;"/>
						</div>
					</div>
					<div class="col-auto mt-1 mx-n3">
						%
					</div>
					<div class="col-auto ms-n2">
						<div class="input-group mb-3 w-auto input-group-sm">
							<input class="form-control" type="text" id="dcpri" name="dcpri" readonly="readonly" style="width: 99px;"/>
						</div>
					</div>
				</div>
		        <div class="row">
		        	<div class="col-md-7">
		        		<div class="input-group mb-3 input-group-sm">
							<span class="input-group-text" id="basic-addon1">비고</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" />
						</div>
		        	</div>
		        	<div class="col-md-5" style="width: 312px;">
		        		<div class="input-group mb-3 ms-n3 input-group-sm">
							<span class="input-group-text" id="basic-addon1">합계</span>
							<input class="form-control" type="number" id="sortpri" name="sortpri" aria-describedby="basic-addon1" style="text-align: right;" readonly="readonly"/>
						</div>
		        	</div>
		        </div>
		        <div class="row">
		        	<div class="col-md-7">
		        		<div class="input-group mb-3 input-group-sm">
							<span class="input-group-text" id="basic-addon1">잔여개월</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" />
						</div>
		        	</div>
					<div class="col-auto mt-2">
						<div class="row">
							<div class="col-auto">
							만나이 : 
							</div>
							<div class="col-auto ms-n3">
							<p id="age">${member.age}</p>
							</div>
						</div>
		        	</div>
		        	<div class="col-auto mt-2">
						<div class="row">
							<div class="col-auto">
							연나이 : 
							</div>
							<div class="col-auto ms-n3">
							<p id="yearage">${yearage}</p>
							</div>
						</div>
		        	</div>
		        </div>
	  		</div>
	    </div>
	    <div class="card w-31 ms-1" style="width: 509px; height: 350px;">
	    	<div class="card-body">
				<div class="col-md-5 mt-n3" style="width: 332px;">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text" id="basic-addon1">합계절사구분</span>
						<select class="form-select" aria-label="Default select example" aria-describedby="basic-addon1">
						  <option value="1">원단위 반올림 / 내림</option>
						  <option value="2" selected="selected">원단위 절삭</option>
						  <option value="3">원단위 절상</option>
						</select>
					</div>
				</div>
				<div class="col-auto mb-3">
					<div class="card border border-primary">
				    	<div class="card-body my-n3">
				      		<div class="col-auto">
                        		<div class="row">
                           			<div class="col-auto">
										<h4 class="card-title">결제내역</h4>
										<div class="row">
											<div class="col-auto">
												<div class="input-group mb-3 input-group-sm">
													<span class="input-group-text" id="basic-addon1">총매출금액</span>
													<input class="form-control" type="text" id="totalprice" name="totalprice" aria-describedby="basic-addon1" style="width: 134px;" readonly="readonly"/>
												</div>
											</div>
											<div class="col-auto">
												<div class="input-group mb-3 input-group-sm">
													<span class="input-group-text" id="basic-addon1">정원</span>
													<input class="form-control" type="text" id="max" name="max" aria-describedby="basic-addon1" style="width: 57px;" readonly="readonly"/>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-auto">
												<div class="input-group mb-3 input-group-sm">
													<span class="input-group-text" id="basic-addon1">총결제금액</span>
													<input class="form-control" type="text" id="tpaidprice" name="tpaidprice" aria-describedby="basic-addon1" style="width: 134px;" readonly="readonly"/>
												</div>
											</div>
											<div class="col-auto">
												<div class="input-group mb-3 input-group-sm">
													<span class="input-group-text" id="basic-addon1">등록</span>
													<input class="form-control" type="text" id="enter" name="enter" aria-describedby="basic-addon1" style="width: 57px;" readonly="readonly"/>
												</div>
											</div>
										</div>
										<div class="row mb-n3">
											<div class="col-auto">
												<div class="input-group mb-3 input-group-sm">
													<span class="input-group-text" id="basic-addon1">총미납금액</span>
													<input class="form-control" type="text" id="tremainprice" name="tremainprice" aria-describedby="basic-addon1" style="width: 134px;" readonly="readonly"/>
												</div>
											</div>
											<div class="col-auto">
												<div class="input-group mb-3 input-group-sm">
													<span class="input-group-text" id="basic-addon1">잔여</span>
													<input class="form-control" type="text" id="remain" name="remain" aria-describedby="basic-addon1" style="width: 57px;" readonly="readonly"/>
												</div>
											</div>
										</div>
                           			</div>
								</div>
							</div>
				    	</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="input-group mb-3 input-group-sm">
							<span class="input-group-text">총일수</span>
							<input class="form-control" type="number" id="totalday" name="totalday" aria-label="Amount (to the nearest dollar)" min="0"/>
							<span class="input-group-text">일</span>
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group mb-3 input-group-sm">
							<span class="input-group-text">사용일수</span>
							<input class="form-control" type="number" id="useday" name="useday" aria-label="Amount (to the nearest dollar)" min="0"/>
							<span class="input-group-text">일</span>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">강습료</span>
						<input class="form-control" type="number" id="learnprice" name="learnprice" aria-label="Amount (to the nearest dollar)" min="0" readonly="readonly" style="text-align: right;"/>
					</div>
				</div>
		    </div>
		</div>
	    <div class="card w-60 mt-n12 h-50">
	    	<div class="card-body my-n3">
	    		<div class="border-top border-bottom border-200" id="customerOrdersTable" style="overflow-y: scroll; height: 210px;"
                    data-list='{"valueNames":["paiddate","paidcategory","paidprice","paidassignType","paidmapsa",""paidcardtype"","paidassignN","paidcardN","POS","signpad","OID","PayKind"],"page":6,"pagination":true}'>
                	<div class="table-responsive scrollbar">
                    	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
                        	<thead>
	                        	<tr>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paiddate">결제일자</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidcategory">결제유형</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidprice">결제금액</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidassignType">승인구분</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidmapsa">매입사</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidcardtype">카드종류</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidassignN">승인번호</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidcardN">카드번호</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="POS">POS</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="signpad">사인패드</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="OID">OID</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="PayKind">PayKind</th>
	                            </tr>
                        	</thead>
                        	<tbody class="list" id="paidbody">
                        	</tbody>
                    	</table>
                    </div>
            	</div>
	    	</div>
	    </div>
	    <div class="card w-35 ms-1" style="width: 509px; height: 132px;">
	    	<div class="card-body my-n3">
	    		<div class="col-auto">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">받은금액</span>
						<input class="form-control" type="number" aria-label="Amount (to the nearest dollar)" min="0"/>
					</div>
				</div>
				<div class="btn-group btn-group-sm mt-n2" role="group" style="width: 431px;">
  					<button class="btn btn-phoenix-primary" type="button" id="pay-cash" name="pay-cash" onclick="paycash()">현금</button>
  					<button class="btn btn-phoenix-secondary" type="button">현금영수증(간편결제)</button>
					<button class="btn btn-phoenix-success" type="button">현금(제로페이)</button>
					<button class="btn btn-phoenix-info" type="button">현.영발행</button>
				</div>
				<div class="btn-group btn-group-sm" role="group" style="width: 431px;">
  					<button class="btn btn-soft-primary" type="button">신용카드</button>
  					<button class="btn btn-soft-secondary" type="button">계좌입금</button>
  					<button class="btn btn-soft-success" type="button">영수증재발행</button>
  					<button class="btn btn-soft-danger" type="button">결제취소</button>
  					<button class="btn btn-soft-info" type="button">행삭제</button>
				</div>
	    	</div>
	    </div>
	</div>
</body>
<script type="text/javascript">
test(${fmsc_s01.itemPKID},'${selectedDate}','${nextDate}');
$('#dcds').val(${fmsc_s01.DCID});

//숨겨진 모달 버튼
var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
$('body').append(buttonHTML);

//어른 어린이 등을 저장하는 변수 생성
var codelist;

//엔터시에 검색하는 기능
document.getElementById('saledate').value = new Date().toISOString().substring(0, 10);;
function handleKeyPress(event) {
	if (event.key === "Enter") {
		finditem();
 	}
}
	
var modalcheck = false;
document.addEventListener('keydown', function(event) {
	if (event.key === 'Escape' && !modalcheck) {
		if($('#itemtbody tr').length > 0){
			$('#resultmessage').html('강습정보가 존재합니다.<br>정말 나가시겠습니까?');
			$('.modal-footer').empty();
			var okaybutton = '<button class="btn btn-primary" type="button" onclick="window.close();">확인</button>';
			var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			$('.modal-footer').append(okaybutton);
			$('.modal-footer').append(cancelbutton);
		    $('#modalButton').click();
		    modalcheck = true;
		} else{
			window.close();
		}
   	}
   	else if (event.key === 'Escape' && modalcheck) {
   		setTimeout(() => {
   	    	modalcheck = false;
   	    }, 500);
   	}
});
	
//검색하고 검색결과를 팝업으로 여는 함수
function finditem() {
	var findstring = document.getElementById('findstring').value;
	if(findstring == '' || findstring == null){
   		$('#resultmessage').text('검색어를 입력해주세요.');
   		$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
        $('#modalButton').click();
        modalcheck = true;
		return false;
	}
	var url = "mitemfindlist?findstring=" + findstring;
    var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1000,height=500";
    window.open(url, "_blank", windowFeatures);
}
	
// 검색 하고나서 선택된 값을 테이블에 추가하는 함수
function test(ItemID,selectedDate,nextDate) {
	
	//이미 들어간 수강인지 확인하는 함수
	var alreadycheck =false;
	$('#itemtbody tr').each(function() {
    	var itemIDValue = $(this).find('input[name="ItemID"]').val();
        if (parseInt(itemIDValue) === parseInt(ItemID)) {
        	alreadycheck = true;
    		$('#resultmessage').text('이미 등록한 수강입니다.');
    		$('.modal-footer').empty();
    	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
    	  	$('.modal-footer').append(cancelbutton);
            $('#modalButton').click();
            modalcheck = true;
            return false;
            
        }
    });
	
	if(alreadycheck == true){
		return false;
	}else{
		$.ajax({
	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
	        url: "mitemfindbyid", // 실제 엔드포인트로 교체해야 합니다
	        dataType : 'json',
	        data: { 
	        	AddDate: ItemID,
	        	UpdDate: selectedDate
	        },
	        success: function(list) {
	        	var tableBody = $('#itemtbody'); // Get the table body element
	        	if(document.querySelector('input[name="index"]:checked').value == 1){
	        		tableBody.empty();
	        	}
	        	var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static"></tr>').on('click', function() {
	        	    itemtbodyclick(this); // Call the itemtbodyclick function when the row is clicked
	        	});
                newRow.append('<td class="code align-middle white-space-nowrap text-center fw-bold">' + list.ItemCode + '<input type="hidden" id="ItemID" name="ItemID" value="'+list.ItemID+'"></td>');
                var type = '';
                if(list.Type == 'G'){
                	type = '일반'
                }
                else if(list.Type == 'S'){
                	type = '특강'
                }
                newRow.append('<td class="category align-middle white-space-nowrap text-center">' + type + '</td>');
                newRow.append('<td class="item align-middle white-space-nowrap text-start fw-bold text-700">' + list.CategoryName + '</td>');
                newRow.append('<td class="name align-middle white-space-nowrap text-900 fs--1 text-start">' + list.JungName + '</td>');
                newRow.append('<td class="day align-middle white-space-nowrap text-center">' + list.DayName + '</td>');
                newRow.append('<td class="time align-middle white-space-nowrap text-start">' + list.FromTime + '</td>');
                newRow.append('<td class="level align-middle white-space-nowrap text-start">' + list.LevelName + '</td>');
                newRow.append('<td class="member align-middle white-space-nowrap text-start">' + list.DaesangName + '</td>');
                newRow.append('<td class="teacher align-middle white-space-nowrap text-start">' + list.SawonName + '</td>');
                newRow.append('<td class="date py-2 align-middle white-space-nowrap">' + selectedDate+'~'+nextDate+'('+list.itemmonth+')'+'</td>');
                newRow.append('<td class="price py-2 align-middle white-space-nowrap">' + list.DefPrice + '</td>');
                newRow.append('<td class="dc py-2 align-middle white-space-nowrap">' + 0 + '</td>');
                newRow.append('<td class="sort py-2 align-middle white-space-nowrap" id="N">' + list.DefPrice + '</td>');
                newRow.append('<td class="dccode py-2 align-middle white-space-nowrap">' + 0 + '</td>');
                newRow.append('<td class="dcpercent py-2 align-middle white-space-nowrap">' + 0 + '</td>');
                newRow.append('<td class="max py-2 align-middle white-space-nowrap">' + (list.OffMax + list.OnMax) + '</td>');
                newRow.append('<td class="enter py-2 align-middle white-space-nowrap">' + (list.RegCnt+list.RegCnt2) + '</td>');
                newRow.append('<td class="remain py-2 align-middle white-space-nowrap">' + (list.OffMax + list.OnMax - (list.RegCnt + list.RegCnt2)) + '</td>');
                newRow.append('<input type="hidden" value="30" name="totalnum" id="totalnum">');
                newRow.append('<input type="hidden" value="30" name="usenum" id="usenum">');
                newRow.append('<input type="hidden" value="'+list.SawonNo+'" name="EmpCode" id="EmpCode">');
                tableBody.append(newRow);
                $('#itemtbody').children('tr:last').click();
	        },
	        error: function(xhr, status, error) {
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
	        }
		});
	}
}
	
function alldelete(){
	$('#itemtbody').empty();
	$('#paidbody').empty();
	$('#price').empty();
	$('#price').append('<option selected="selected" value="0">0</option>');
	$('#regmonth').val('');
	$('#dcds').val(0);
	$('#fromdate').val('');
	$('#todate').val('');
	$('#dcper').val('');
	$('#dcpri').val('');
	$('#dcpri').val('');
	$('#sortpri').val('');
	$('#max').val('');
	$('#enter').val('');
	$('#remain').val('');
	$('#totalprice').val('');
	$('#tpaidprice').val('');
	$('#tremainprice').val('');
	$('#learnprice').val('');
	$('#totalday').val('');
	$('#useday').val('');
	
	test(${fmsc_s01.itemPKID},'${selectedDate}','${nextDate}');
}

//과거에 선택했던 행
var previousRow = null;

//과거에 선택했던 행의 itemid
var clickeditemid;

//행을 클릭했을때 데이터를 밑에 뿌려주는 함수
  function itemtbodyclick(clickedRow) {
      if (previousRow !== null) {
          $(previousRow).css('background-color', ''); // Unselect the previous row
      }

      $(clickedRow).css('background-color', 'lightblue'); // Highlight the clicked row
      previousRow = clickedRow; // Update the previousRow variable with the clicked row
      var date = $(clickedRow).find('.date').text();
      const result = parseString(date);
      document.getElementById('fromdate').value = result[0];
      document.getElementById('todate').value = result[1];
      document.getElementById('regmonth').value = result[2];
      var price = $(clickedRow).find('.price').text();
      var itemid = $(clickedRow).find('#ItemID').val();
      clickeditemid = itemid;
      $.ajax({
       type: "POST", // 또는 "POST", 서버 설정에 따라 다름
       url: "mitemfindbyid", // 실제 엔드포인트로 교체해야 합니다
       dataType : 'json',
       data: { 
       	AddDate: itemid,
       	UpdDate: result[0]
       },
       success: function(list) {
       	var priceoptionlist = $('#price');
       	priceoptionlist.empty();
       	$.ajax({
   	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
   	        url: "tblcodelist", // 실제 엔드포인트로 교체해야 합니다
   	        dataType : 'json',
   	        success: function(codelist) {
   	        	if(list.DefPrice != 0 && list.DefPrice != '' && list.DefPrice != null){
   	        		priceoptionlist.append($('<option>', {
   	        			id: list.DefPrice,
   		                value: codelist[0]+list.DefPrice,
   		                text: codelist[0]+list.DefPrice
   		            }));
   	        	}
   	        	if (list.Price1 != 0 && list.Price1 != '' && list.Price1 != null) {
   	        	    var option = $('<option>', {
   	        	    	id: list.Price1,
   	        	        value: codelist[1] + list.Price1,
   	        	        text: codelist[1] + list.Price1
   	        	    });

   	        	    priceoptionlist.append(option);

   	        	    if ($('#yearage').text() > 13 && $('#yearage').text() < 19) {
   	        	        option.attr('selected', 'selected');
   	        	     	$(clickedRow).find('.price').text(list.Price1);
   	        	     	sortchange(clickedRow);
   	        	    }
   	        	}
   	        	if (list.Price2 != 0 && list.Price2 != '' && list.Price2 != null) {
   	        	    var option = $('<option>', {
   	        	    	id: list.Price2,
   	        	        value: codelist[2] + list.Price2,
   	        	        text: codelist[2] + list.Price2
   	        	    });

   	        	    priceoptionlist.append(option);

   	        	    if ($('#yearage').text() >= 0 && $('#yearage').text() < 14) {
   	        	        option.attr('selected', 'selected');
   	        	     	$(clickedRow).find('.price').text(list.Price2);
   	        	     	sortchange(clickedRow);
   	        	    }
   	        	}
   	        	if (list.Price3 != 0 && list.Price3 != '' && list.Price3 != null) {
   	        	    var option = $('<option>', {
   	        	    	id: list.Price3,
   	        	    	value: codelist[3]+list.Price3,
   		                text: codelist[3]+list.Price3
   	        	    });
   	        	    priceoptionlist.append(option);
   	        	    if ($('#yearage').text() > 64) {
   	        	        option.attr('selected', 'selected');
   	        	     	$(clickedRow).find('.price').text(list.Price3);
   	        	     	sortchange(clickedRow);
   	        	    }
   	        	}
   	        	if(list.Price4 != 0 && list.Price4 != '' && list.Price4 != null){
   	        		priceoptionlist.append($('<option>', {
   	        			id: list.Price4,
   		                value: codelist[4]+list.Price4,
   		                text: codelist[4]+list.Price4
   		            }));
   	        	}
   	        	if(list.Price5 != 0 && list.Price5 != '' && list.Price5 != null){
   	        		priceoptionlist.append($('<option>', {
   	        			id: list.Price5,
   		                value: codelist[5]+list.Price5,
   		                text: codelist[5]+list.Price5
   		            }));
   	        	}
   	        	
   	        	//만약 강습료를 바꾸면 다른행을 선택했다가 와도 바꾼 강습료로 선택되게하는 기능
   	        	if ($('#price option[value="' + $('#'+clickeditemid+'pricecodechange').val() + '"]').length > 0) {
   	        	    $('#price').val($('#'+clickeditemid+'pricecodechange').val());
   	        	 	$(clickedRow).find('.price').text($('#price option:selected').attr('id'));
   	        	 	sortchange(clickedRow);
   	        	}
   	        	
   	        	//바뀐 강습료를 저장하기 위한 인풋 생성
   	        	var newHiddenInput = $('<input>').attr({
                       type: 'hidden',
                       id: itemid+'pricecodechange',
                       name: 'pricecodechange'
                   });
   	        	
   	        	$(clickedRow).append(newHiddenInput);
   	        	//행 전환시 할인유형 바꾸기
   	        	$('#dcds').val($(clickedRow).find('.dccode').text());
   	        	//행 전환시 할인율 바꾸기
   	        	$('#dcper').val($(clickedRow).find('.dcpercent').text());
   	        	//행 전환시 할인금액 바꾸기
   	        	$('#dcpri').val($(clickedRow).find('.dc').text());
   	        	//행 전환시 합계 바꾸기
   	        	$('#sortpri').val($(clickedRow).find('.sort').text());
   	        	//행 전환시 정원 바꾸기
   	        	$('#max').val($(clickedRow).find('.max').text());
   	        	//행 전환시 등록 바꾸기
   	        	$('#enter').val($(clickedRow).find('.enter').text());
   	        	//행 전환시 잔여 바꾸기
   	        	$('#remain').val($(clickedRow).find('.remain').text());
   	        	//행 전환시 강습료 바꾸기
   	        	$('#learnprice').val($(clickedRow).find('.price').text());
   	        	//행 전환시 총일수 바꾸기
   	        	$('#totalday').val($(clickedRow).find('input[name="totalnum"]').val());
   	       		//행 전환시 사용일수 바꾸기
   	        	$('#useday').val($(clickedRow).find('input[name="usenum"]').val());
   	        	//총 금액 설정
   	        	totalchange();
   	        },
   	        error: function(xhr, status, error) {
   	       	 console.log("Status: " + status);
   	         console.log("Error: " + error);
   	        }
   		});
       },
       error: function(xhr, status, error) {
      	 console.log("Status: " + status);
        console.log("Error: " + error);
       }
	});
  }
  
   //강습료를 수정할때 바뀐 강습료의 값을 저장하는 함수
   $('#price').on('change', function() {
       // 선택된 옵션의 값 가져오기
       var selectedValue = $('#price').val();
       var selectedprice = $('#price').find('option:selected').attr('id');
       $('#itemtbody tr').each(function() {
    	var itemIDValue = $(this).find('input[name="ItemID"]').val();
        if (itemIDValue === clickeditemid) {
            // 해당 행을 찾았을 때 선택된 값으로 'price' 클래스를 가진 td에 내용을 넣어줍니다.
            $(this).find('.price').text(selectedprice);
            sortchange(this);
            return false; // 원하는 행을 찾았으므로 each 루프를 종료합니다.
        }
    });
       $('#learnprice').val(selectedprice);
       // 숨겨진(hidden) input의 값을 선택된 값으로 변경
       $('#'+clickeditemid+'pricecodechange').val(selectedValue);
   });
   
   //할인유형을 선택하면 그 행의 할인코드 칸을 바꾸는 함수
   $('#dcds').on('change', function() {
    var selectedID = $(this).val(); // 선택된 값 가져오기
    var selectedpercent = $(this).find('option:selected').attr('id'); // 선택된 옵션의 id 값을 가져오기
    // '#itemtbody' 내의 tr 요소들을 순회하며 특정 조건을 검사합니다.
    $('#itemtbody tr').each(function() {
    	var itemIDValue = $(this).find('input[name="ItemID"]').val();
        if (itemIDValue === clickeditemid) {
            // 해당 행을 찾았을 때 선택된 값으로 'dccode' 클래스를 가진 td에 내용을 넣어줍니다.
            $(this).find('.dccode').text(selectedID);
            // 선택된 값으로 'dcpercent' 클래스를 가진 td에 내용을 넣어줍니다.
            $(this).find('.dcpercent').text(selectedpercent);
            
            $('#dcper').val(selectedpercent);
            sortchange(this);
            return false; // 원하는 행을 찾았으므로 each 루프를 종료합니다.
        }
    });
});
   
   $('#regmonth').on('change', function() {
       // 선택된 옵션의 값 가져오기
       var selectedValue = $('#regmonth').val();
       $('#itemtbody tr').each(function() {
    	var itemIDValue = $(this).find('input[name="ItemID"]').val();
        if (itemIDValue === clickeditemid) {
            // 해당 행을 찾았을 때 선택된 값으로 'dccode' 클래스를 가진 td에 내용을 넣어줍니다.
            const result = parseString($(this).find('.date').text());
            
            const formattedDate = new Date(result[0]);
            var monthsToAdd = parseInt(selectedValue);
            formattedDate.setMonth(formattedDate.getMonth() + monthsToAdd);
            formattedDate.setDate(formattedDate.getDate()-1);
            const formattedDateString = formatDate(formattedDate);
            $('#todate').val(formattedDateString);
            
          	const revalue = result[0]+'~'+formattedDateString+'('+selectedValue+')';
       		
          	$(this).find('.date').text(revalue);
          	sortchange(this);
            return false; // 원하는 행을 찾았으므로 each 루프를 종료합니다.
        }
    });
   });
   
   $('#fromdate').on('change', function() {
       // 선택된 옵션의 값 가져오기
       var selectedValue = $('#fromdate').val();
       $('#itemtbody tr').each(function() {
    	var itemIDValue = $(this).find('input[name="ItemID"]').val();
        if (itemIDValue === clickeditemid) {
            // 해당 행을 찾았을 때 선택된 값으로 'dccode' 클래스를 가진 td에 내용을 넣어줍니다.
            const result = parseString($(this).find('.date').text());
            
            const formattedDate = new Date(selectedValue);
            var monthsToAdd = parseInt(result[2], 10);
            formattedDate.setMonth(formattedDate.getMonth() + monthsToAdd);
            formattedDate.setDate(formattedDate.getDate()-1);
            const formattedDateString = formatDate(formattedDate);
            $('#todate').val(formattedDateString);
            
          	const revalue = selectedValue+'~'+formattedDateString+'('+result[2]+')';
          	$(this).find('.date').text(revalue);
            return false; // 원하는 행을 찾았으므로 each 루프를 종료합니다.
        }
    });
   });
   
   $('#todate').on('change', function() {
       // 선택된 옵션의 값 가져오기
       var selectedValue = $('#todate').val();
       $('#itemtbody tr').each(function() {
    	var itemIDValue = $(this).find('input[name="ItemID"]').val();
        if (itemIDValue === clickeditemid) {
            // 해당 행을 찾았을 때 선택된 값으로 'dccode' 클래스를 가진 td에 내용을 넣어줍니다.
            const result = parseString($(this).find('.date').text());
            
          	const revalue = result[0]+'~'+selectedValue+'('+result[2]+')';
          	$(this).find('.date').text(revalue);
            return false; // 원하는 행을 찾았으므로 each 루프를 종료합니다.
        }
    });
   });
   
   //소계바꾸는 함수
   function sortchange(selectrow){
   	var price = $(selectrow).find('.price').text();
   	var dcpercent = parseInt($(selectrow).find('.dcpercent').text());
   	const result = parseString($(selectrow).find('.date').text());
   	var dcprice = price*(dcpercent*0.01);
   	var afterdcprice = price-dcprice;
   	$(selectrow).find('.dc').text(dcprice*result[2]);
   	$(selectrow).find('.sort').text(afterdcprice*result[2]);
   	$('#dcpri').val(dcprice*result[2]);
   	$('#sortpri').val(afterdcprice*result[2]);
   	totalchange();
   }
   
   //결제 내역에 있는 총 금액 변경 함수
   function totalchange(){
   	
   	var totalprice = 0;
   	var tpaidprice = 0;
   	var tremainprice = 0;
   	
   	$('#itemtbody tr').each(function() {
   		totalprice += parseInt($(this).find('.sort').text());
   		
   		var onetpaidprice = parseInt($(this).find('.sort#Y').text());
   		if(isNaN(onetpaidprice)){
   			onetpaidprice = 0;
   		}
   		tpaidprice += onetpaidprice;
   		
   		var onetremainprice = parseInt($(this).find('.sort#N').text());
   		if(isNaN(onetremainprice)){
   			onetremainprice = 0;
   		}
   		tremainprice += onetremainprice;
    });
   	$('#totalprice').val(totalprice);
   	if(isNaN(tpaidprice)){
   		tpaidprice = 0;
   	}
   	$('#tpaidprice').val(tpaidprice);
   	if(isNaN(tremainprice)){
   		tremainprice = 0;
   	}
   	$('#tremainprice').val(tremainprice);
   }
   
   //날짜를 테이블에서 가지고와서 잘라서 보내는 함수
   function parseString(inputString) {
   	const regex = /(\d{4}-\d{2}-\d{2})~(\d{4}-\d{2}-\d{2})\((\d+)\)/;
   	const matches = inputString.match(regex);

   	if (!matches || matches.length !== 4) {
   		return null; // 입력 형식이 잘못된 경우 처리
   	}
   	const startDate = matches[1];
   	const endDate = matches[2];
   	const numberOfMonths = parseInt(matches[3], 10);

   	return [startDate, endDate, numberOfMonths.toString()];
   }
   
   //date 형식을 YYYY-MM-DD 형식으로 바궈주는 함수
function formatDate(date) {
	const yyyy = date.getFullYear();
	const mm = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 2자리 숫자로 표시
	const dd = String(date.getDate()).padStart(2, '0'); // 일자를 2자리 숫자로 표시
	return yyyy+'-'+mm+'-'+dd;
}

function save() {
	if($('#totalprice').val()==''){
		$('#resultmessage').html('수강 할 강좌를 선택해 주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	if($('#tremainprice').val() > 0){
		$('#resultmessage').html('미납금액이 존재합니다.<br>미납금액정산 없이 저장하시겠습니까?');
		$('.modal-footer').empty();
		var okaybutton = '<button class="btn btn-primary" type="button" onclick="fmsc_01save()">확인</button>';
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(okaybutton);
		$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}else{
		fmsc_01save();	
	}
}

function fmsc_01save() {
	//총 tr갯수
	var totalRows = $('#itemtbody tr').length;
	//paidbody 의 행의 index 를 확인하기 위한 수
	var iteration = 0;
	//복합인지 아닌지 체크 하기 위한 부분
	var numberOfTR = $('#itemtbody tr').length;
	var IsPackagecheck = 0;
	if(numberOfTR > 1){
		IsPackagecheck = 1;
	}
	$('#itemtbody tr').each(function() {
		var misuprice = parseInt($(this).find('.sort#N').text());
		if(isNaN(misuprice)){
			misuprice = 0;
		}
		const result = parseString($(this).find('.date').text());
		const yearmonth = extractYearMonth(result[0]);
		$.ajax({
	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
	        url: "fmsc_01insert", // 실제 엔드포인트로 교체해야 합니다
	        dataType : 'json',
	        data: { 
	        	SaleDate : $('#saledate').val(),
	        	ItemPeriod : yearmonth,
	        	CustCode : $('#memberid').val(),
	        	FromDate : result[0],
	        	ToDate : result[1],
	        	RFromDate : result[0],
	        	RToDate : result[1],
	        	RegMonth : result[2],
	        	DCID : $(this).find('.dccode').text(),
	        	DiscountRate : $(this).find('.dcpercent').text(),
	        	DCPrice : $(this).find('.dc').text(),
	        	ItemPrice : $(this).find('.price').text(),
	        	RealPrice : $(this).find('.sort').text(),
	        	Misu : misuprice,
	        	EmpCode : $(this).find('input[name="EmpCode"]').val(),
	        	IsReReg : 1,
	        	State : 'A',
	        	ItemPKID : $(this).find('input[name="ItemID"]').val(),
	        	InType : '재등록',
	        	prevInType : '재등록',
	        	CurState : 1,
	        	IsPackage : IsPackagecheck,
	        	PaidPrice : 0
	        },
	        success: function(data) {	
	        	var paidprice = $('#paidbody tr').eq(iteration).find('.paidprice').text();
	        	var paiddate = $('#paidbody tr').eq(iteration).find('.paiddate').text();
	        	if(paidprice != ''){
		            $.ajax({
		    	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
		    	        url: "tblpaidinsert", // 실제 엔드포인트로 교체해야 합니다
		    	        dataType : 'json',
		    	        data: { 
		    	        	FPKID: data,
		    	        	SaleDate : paiddate.substr(0,10),
		    	        	RealSaleDate : paiddate,
		    	        	SaleType : '등록',
		    	        	PayType : $('#paidbody tr').eq(iteration).find('.paidcategory').text(),
		    	        	Price : paidprice,
		    	        	AssignType : $('#paidbody tr').eq(iteration).find('.paidassignType').text(),
		    	        	PaidGroupSaleNo : data
		    	        }
		    		});
	        	}
	            // 순차적으로 행을 넣기위한 ++
	            iteration++;
	            if (iteration === totalRows) {
	                // If all Ajax requests have completed successfully, then execute window-related statements
	                window.opener.location.reload();
	                window.close();
	            }
	        },
	        error: function(xhr, status, error) {
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
	        }
		}); 
	});
	
}  

//itemperiod 를 위한 날짜 포맷 함수
function extractYearMonth(dateString) {
  
	const [year, month] = dateString.split('-');
  
	const yearMonth = year + month;
	
    return yearMonth;
}
  
//현금 결제
function paycash() {
	if($('#tremainprice').val() < 1 || $('#tremainprice').val() == ''){
	  	$('#resultmessage').html('받을 금액이 0원입니다.<br>확인 후 결제해 주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	$('#itemtbody tr').find('.sort#N').each(function() {
		var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static"></tr>');
		newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
		newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">현금</td>');
		newRow.append('<td class="paidprice align-middle white-space-nowrap text-start fw-bold text-700">' + parseInt($(this).text()) + '</td>');
		newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + '</td>');
		newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + '</td>');
		newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' +  '</td>');
		newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + '</td>');
		newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
		newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + '</td>');
		newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '</td>');
		newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '</td>');
		newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
		
		// Get the tbody element with ID 'paidbody' and append the new row
		var tableBody = $('#paidbody');
		tableBody.append(newRow);
		$(this).attr('id', 'Y');
	});
	totalchange();
}

//paid 의 결제 일자를 넣기 위한 현재날짜 포맷
function getCurrentDateTime() {
	var today = new Date();

	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var hours = ('0' + today.getHours()).slice(-2); 
	var minutes = ('0' + today.getMinutes()).slice(-2);
	var seconds = ('0' + today.getSeconds()).slice(-2); 
	var datestring = year + '-' + month  + '-' + day +' '+ hours + ':' + minutes  + ':' + seconds; 
	return datestring;
}
</script>
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

<div class="modal fade" id="verticallyCentered" tabindex="-1" aria-labelledby="verticallyCenteredModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="verticallyCenteredModalLabel">Uspot</h5>
        <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1"></span></button>
      </div>
      <div class="modal-body">
        <p class="text-700 lh-lg mb-0" id="resultmessage"></p>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

</html>