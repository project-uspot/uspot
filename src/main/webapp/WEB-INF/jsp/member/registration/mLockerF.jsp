<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>사물함임대정보 등록 및 변경</title>
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
    <link rel="preconnect" href="https://fonts.gstatic.com">
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
        <div class="card-body mb-n4 mt-n3">
            <div class="col-auto">
        		<div class="row justify-content-between">
        			<div class="col-auto">
						<h3 class="mb-3 pt-2">사물함임대정보 등록 및 변경</h3>
            		</div>
            		<div class="col-auto">
						<button class="btn btn-success" type="button" onclick="save()">저장</button>
						<button class="btn btn-secondary" type="button" onclick="lockerReturn()">반납</button>
						<button class="btn btn-danger" type="button">삭제</button>
						<button class="btn btn-soft-danger" type="button">영수증</button>
						<button class="btn btn-soft-info" type="button" onclick="lockerChange()">변경</button>
            		</div>
        		</div>
        	</div>
        </div>
    </div>
    <div class="row">
	    <div class="card h-100 mb-1 w-20 ms-3 me-1" style="width: 480px;">
	        <div class="card-body mb-n5 mt-n3 me-3 mx-n3" style="height: 500px;">
	        	<div class="row">
	        		<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">회원번호</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" id="memberid" name="memberid" value="${member.memberID}" readonly="readonly"/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">회원성명</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" id="name" name="name" value="${member.name}"/>
						</div>
					</div>
	        	</div>
	        	<div class="row">
	        		<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">성별</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" id="gendertext" name="gendertext" value="${member.genderText}"/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">회원구분</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" id="type" name="type" value="${member.typeText}"/>
						</div>
					</div>
	        	</div>
	        	<div class="row">
	        		<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">회원종류</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" id="mlevel" name="mlevel" value="${mleveltext}"/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">최초등록일</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" id="type" name="type" value="${member.typeText}"/>
						</div>
					</div>
	        	</div>
	        	<div class="row">
	        		<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">휴대전화</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" id="cellphone" name="cellphone" value="${member.cellPhone}"/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">일반전화</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" id="homephone" name="homephone" value="${member.homePhone}"/>
						</div>
					</div>
	        	</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">비고</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="note" name="note" value="${member.note}"/>
					</div>
				</div>
				<div class="cal-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text">사물함</span>
						<input class="form-control" type="text" />
						<input class="form-control" type="text" />
						<input class="form-control" type="text" />
					</div>
				</div>
				<div class="row">
	        		<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">보증금</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" id="cellphone" name="cellphone" value="${member.cellPhone}"/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">임대료</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" id="homephone" name="homephone" value="${member.homePhone}"/>
						</div>
					</div>
	        	</div>
	        	<div class="row">
					<div class="col-auto">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">강습기간</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" id="fromdate" name="fromdate" style="width: 110px;" value="${fmsc_s01.fromDate}" readonly="readonly"/>
						</div>
					</div>
					<div class="col-auto mt-1 mx-n4">
						~
					</div>
					<div class="col-auto ms-n1">
						<div class="input-group input-group-sm">
							<input class="form-control" type="text" id="todate" name="todate" style="width: 115px;" value="${fmsc_s01.toDate}" readonly="readonly"/>
						</div>
					</div>
					<div class="col-auto ms-n3">
						<div class="input-group input-group-sm">
							<input class="form-control" type="text" id="regmonth" name="regmonth" style="width: 50px;" value="${fmsc_s01.regMonth}" readonly="readonly"/>
						</div>
					</div>
					<div class="col-auto ms-n2 mt-2">
						개월
					</div>
				</div>
				<div class="row">
					<div class="col-auto">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">할인유형</span>
							<select class="form-select" id="dcds" name="dcds" style="width: 152px; text-align: right;">
								<option selected="selected" id="0" value="0"></option>
								<c:forEach var="dc" items="${dclist}">
									<option id="${dc.rate}" value="${dc.dcid}">${dc.dcName}</option>
                               	</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-auto">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">할인율/금액</span>
							<input class="form-control" type="number" id="dcper" name="dcper" style="width: 72px;" readonly="readonly"/>
						</div>
					</div>
					<div class="col-auto mt-1 mx-n4">
						%
					</div>
					<div class="col-auto">
						<div class="input-group input-group-sm">
							<input class="form-control" type="text" id="dcprice" name="dcprice" style="width: 97px;text-align: right;" readonly="readonly"/>
						</div>
					</div>
				</div>
	        </div>
		</div>
	    <div class="card h-100 mb-1 w-20 me-1" style="width: 562px;">
	        <div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 330px;">
	            <div class="col-md-10">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">강습반조회</span>
						<input class="form-control" type="text" aria-label="Recipient's username" aria-describedby="basic-addon2" name="findstring" id="findstring" onkeydown="handleKeyPress(event)"/>
						<span class="input-group-text" id="basic-addon2" onclick="finditem()" style="cursor: pointer;">찾기</span>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">변경강습반</span>
						<input class="form-control" type="text" id="itemname" name="itemname" readonly="readonly"/>
						<input type="hidden" name="itemid" id="itemid">
						<input type="hidden" name="empcode" id="empcode">
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">강습료</span>
								<select class="form-select" id="price" name="price" style="width: 152px; text-align: right;">
									<option selected="selected" value="0">0</option>
								</select>
							</div>
						</div>
						<div class="col-md-6 ms-n2">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">등록개월</span>
								<input class="form-control" type="number" id="regmonth" name="regmonth"/>
								<span class="input-group-text" id="basic-addon1">개월</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">강습기간</span>
								<input class="form-control" type="date" aria-describedby="basic-addon1" id="fromdate" name="fromdate"/>
							</div>
						</div>
						<div class="col-auto mt-1 mx-n4">
							~
						</div>
						<div class="col-auto ms-n1">
							<div class="input-group input-group-sm">
								<input class="form-control" type="date" id="todate" name="todate"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">할인유형</span>
								<select class="form-select" id="dcds" name="dcds" style="width: 152px; text-align: right;">
									<option selected="selected" id="0" value="0"></option>
									<c:forEach var="dc" items="${dclist}">
										<option id="${dc.rate}" value="${dc.dcid}">${dc.dcName}</option>
                                	</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-auto" style="margin-left: 41px;">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">총매출금액</span>
								<input class="form-control" type="text" id="totalprice" name="totalprice" style="width: 120px;text-align: right;" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">할인율/금액</span>
								<input class="form-control" type="number" id="dcper" name="dcper" style="width: 72px;" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto mt-1 mx-n4">
							%
						</div>
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="dcprice" name="dcprice" style="width: 97px;text-align: right;" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">총결제금액</span>
								<input class="form-control" type="text" id="tpaidprice" name="tpaidprice" style="width: 120px;text-align: right;" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">합계</span>
								<input class="form-control" type="text" id="sortprice" name="sortprice" style="width: 120px;text-align: right;" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto" style="margin-left: 98px;">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">총미납금액</span>
								<input class="form-control" type="text" id="tremainprice" name="tremainprice" style="width: 120px;text-align: right;" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">변경사유</span>
						<input class="form-control" type="text" id="note" name="note"/>
					</div>
				</div>
	        </div>
	    </div>
	</div>
    <div class="row">
	    <div class="card w-60 h-50">
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
                        		<c:forEach var="paid" items="${paidlist}">
	                        		<tr class="hover-actions-trigger btn-reveal-trigger position-static">
									    <td class="paiddate align-middle white-space-nowrap text-center fw-bold">${paid.realSaleDate}</td>
									    <td class="paidcategory align-middle white-space-nowrap text-center">${paid.payType}</td>
									    <fmt:parseNumber var="paidprice" integerOnly="true" value="${paid.price}"/>
									    <td class="paidprice align-middle white-space-nowrap text-start fw-bold text-700"><fmt:formatNumber value="${paidprice}" pattern="#,###"/></td>
									    <td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">${paid.assignType}</td>
									    <td class="paidmapsa align-middle white-space-nowrap text-center">${paid.maeipsa}</td>
									    <td class="paidcardtype align-middle white-space-nowrap text-start">${paid.cardName}</td>
									    <td class="paidassignN align-middle white-space-nowrap text-start">${paid.assignNo}</td>
									    <td class="paidcardN align-middle white-space-nowrap text-start">${paid.cardNo}</td>
									    <td class="POS align-middle white-space-nowrap text-start">${paid.pos}</td>
									    <td class="signpad py-2 align-middle white-space-nowrap">${paid.signPad}</td>
									    <td class="OID py-2 align-middle white-space-nowrap">${paid.OID}</td>
									    <td class="PayKind py-2 align-middle white-space-nowrap"></td>
									</tr>
								</c:forEach>
                        	</tbody>
                    	</table>
                    </div>
            	</div>
	    	</div>
	    </div>
	    <div class="card w-35 h-100 mb-1 w-20 me-1" style="width: 497px; ">
	    	<div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 273px;">
	    		<div class="col-auto">
	    			<div class="row">
	    				<div class="col-auto">
	    					<div class="input-group mb-3 input-group-sm">
								<span class="input-group-text">변경일자</span>
								<input class="form-control" type="date" id="saledate" name="saledate"/>
							</div>
	    				</div>
	    				<div class="col-auto ms-n3">
	    					<div class="input-group mb-3 input-group-sm">
								<span class="input-group-text">변경차액</span>
								<input class="form-control" type="text" style="width: 137px;text-align: right;font-weight: 900;" id="changeprice" name="changeprice" readonly="readonly"/>
							</div>
	    				</div>
	    			</div>
				</div>
	    		<div class="col-auto">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">금액</span>
						<input class="form-control" type="text" id="payprice" name="payprice" readonly="readonly" style="text-align: right;font-weight: 900;"/>
					</div>
				</div>
				<div class="btn-group btn-group-sm mt-n2" role="group" style="width: 431px;">
  					<button class="btn btn-phoenix-primary" type="button" id="pay-cash" name="pay-cash" onclick="paycash()">현금</button>
  					<button class="btn btn-phoenix-secondary" type="button">현금영수증(간편결제)</button>
					<button class="btn btn-phoenix-info" type="button">현.영발행</button>
					<button class="btn btn-soft-secondary" type="button">계좌입금</button>
				</div>
				<div class="btn-group btn-group-sm" role="group" style="width: 431px;">
  					<button class="btn btn-soft-primary" type="button">신용카드</button>
  					<button class="btn btn-soft-success" type="button">영수증재발행</button>
  					<button class="btn btn-soft-danger" type="button">결제취소</button>
  					<button class="btn btn-soft-info" type="button">행삭제</button>
				</div>
	    	</div>
	    </div>
	</div>
</body>
<script type="text/javascript">
//숨겨진 모달 버튼
var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
$('body').append(buttonHTML);

// Get today's date
var today = new Date();

// Format the date as "YYYY-MM-DD" which is the required format for the date input
var formattedDate = today.toISOString().split('T')[0];

// Set the value of the input field to today's date
document.getElementById('saledate').value = formattedDate;

//어른 어린이 등을 저장하는 변수 생성
var codelist;

//엔터시에 검색하는 기능
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
	var oldfromdate = document.getElementById('oldfromdate').value;
	if(findstring == '' || findstring == null){
   		$('#resultmessage').text('검색어를 입력해주세요.');
   		$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
        $('#modalButton').click();
        modalcheck = true;
		return false;
	}
	var url = "mitemfindlist?findstring=" + findstring+"&finddate="+ oldfromdate;
    var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1000,height=500";
    window.open(url, "_blank", windowFeatures);
}
	
// 검색 하고나서 선택된 값을 테이블에 추가하는 함수
function test(ItemID,selectedDate,nextDate) {
	$.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "mitemfindbyid", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'json',
        data: { 
        	AddDate: ItemID,
        	UpdDate: selectedDate
        },
        success: function(list) {
        		var olddcid = $('#olddcname').attr('name');
				$('#itemname').val('['+list.CategoryName+']'+list.JungName+' '+list.DayName+' '+list.LevelName);
				$('#empcode').val(list.DamDangUserPKID);
		       	$('#itemid').val(list.ItemID);
				
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
		   		                text: codelist[0]+formatNumberWithCommas(list.DefPrice)
		   		            }));
		   	        	}
		   	        	if (list.Price1 != 0 && list.Price1 != '' && list.Price1 != null) {
		   	        	    var option = $('<option>', {
		   	        	    	id: list.Price1,
		   	        	        value: codelist[1] + list.Price1,
		   	        	        text: codelist[1]+formatNumberWithCommas(list.Price1)
		   	        	    });

		   	        	    priceoptionlist.append(option);

		   	        	    if ($('#yearage').val() > 13 && $('#yearage').val() < 19) {
		   	        	        option.attr('selected', 'selected');
		   	        	    }
		   	        	}
		   	        	if (list.Price2 != 0 && list.Price2 != '' && list.Price2 != null) {
		   	        	    var option = $('<option>', {
		   	        	    	id: list.Price2,
		   	        	        value: codelist[2] + list.Price2,
		   	        	        text: codelist[2]+formatNumberWithCommas(list.Price2)
		   	        	    });

		   	        	    priceoptionlist.append(option);

		   	        	    if ($('#yearage').val() >= 0 && $('#yearage').val() < 14) {
		   	        	        option.attr('selected', 'selected');
		   	        	    }
		   	        	}
		   	        	if (list.Price3 != 0 && list.Price3 != '' && list.Price3 != null) {
		   	        	    var option = $('<option>', {
		   	        	    	id: list.Price3,
		   	        	    	value: codelist[3]+list.Price3,
		   		                text: codelist[3]+formatNumberWithCommas(list.Price3)
		   	        	    });
		   	        	    priceoptionlist.append(option);
		   	        	    if ($('#yearage').val() > 64) {
		   	        	        option.attr('selected', 'selected');
		   	        	    }
		   	        	}
		   	        	if(list.Price4 != 0 && list.Price4 != '' && list.Price4 != null){
		   	        		priceoptionlist.append($('<option>', {
		   	        			id: list.Price4,
		   		                value: codelist[4]+list.Price4,
		   		                text: codelist[4]+formatNumberWithCommas(list.Price4)
		   		            }));
		   	        	}
		   	        	if(list.Price5 != 0 && list.Price5 != '' && list.Price5 != null){
		   	        		priceoptionlist.append($('<option>', {
		   	        			id: list.Price5,
		   		                value: codelist[5]+list.Price5,
		   		                text: codelist[5]+formatNumberWithCommas(list.Price5)
		   		            }));
		   	        	}
		   	        	
		   	        	$('#dcds option').each(function() {
		   	             // Check if the current option's value is equal to olddcpriceValue
							if ($(this).val() === olddcid) {
								// If it matches, set the 'selected' attribute
    							$(this).attr('selected', 'selected');
    							$('#dcper').val($(this).attr('id'));
							}
		   	         	});
		   	        	
		   	        	sortchange();
		   	        },
		   	        error: function(xhr, status, error) {
		   	       	 console.log("Status: " + status);
		   	         console.log("Error: " + error);
		   	        }
		   		});
				
		       	$('#regmonth').val($('#oldregmonth').val());
		       	if($('#oldfromdate').val()< formattedDate){
		       		$('#fromdate').val(formattedDate);
		       	}else{
		       		$('#fromdate').val($('#oldfromdate').val());
		       	}		       	
		       	$('#todate').val($('#oldtodate').val());
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
         console.log("Error: " + error);
        }
	});
}
	
function alldelete(){
	window.location.reload();
}
  
//강습료를 수정할때 바뀐 강습료의 값을 저장하는 함수
$('#price').on('change', function() {
	sortchange();	
});
   
   //할인유형을 선택하면 그 행의 할인코드 칸을 바꾸는 함수
$('#dcds').on('change', function() {
    var selectedpercent = $('#dcds').find('option:selected').attr('id'); // 선택된 옵션의 id 값을 가져오기
    $('#dcper').val(selectedpercent);
    sortchange();
});

$('#regmonth, #fromdate').on('change', function() {
  
    var selectedValue = $('#regmonth').val();
    var fromdate = $('#fromdate').val();
    
    const formattedDate = new Date(fromdate);
    var monthsToAdd = parseInt(selectedValue);
    
    formattedDate.setMonth(formattedDate.getMonth() + monthsToAdd);
    formattedDate.setDate(formattedDate.getDate()-1);
    
    const formattedDateString = formatDate(formattedDate);
    
    $('#todate').val(formattedDateString);
});
   
//소계바꾸는 함수
function sortchange(){
	var regmonth = $('#regmonth').val();
	var price = $('#price option:selected').attr('id');
   	var dcper = $('#dcds').find('option:selected').attr('id');
   	var dcprice = (price*dcper/100)*regmonth;
   	var sortprice = (price*regmonth)-dcprice;
   	
   	$('#dcprice').val(formatNumberWithCommas(dcprice));
   	$('#sortprice').val(formatNumberWithCommas(sortprice));
   	
   	totalchange();
}
   
//결제 내역에 있는 총 금액 변경 함수
function totalchange(){
	var totalprice = removeCommasFromNumber($('#sortprice').val());	
	
	var tpaidprice = 0;
	
	$('#paidbody tr').each(function() {
		tpaidprice += parseInt(removeCommasFromNumber($(this).find('.paidprice').text()));
 	});
	
	$('#totalprice').val(formatNumberWithCommas(totalprice));
	$('#tpaidprice').val(formatNumberWithCommas(tpaidprice));
	$('#tremainprice').val(formatNumberWithCommas(totalprice-tpaidprice));	
	$('#changeprice').val(formatNumberWithCommas(removeCommasFromNumber($('#sortprice').val())-removeCommasFromNumber($('#oldprice').val())));
	$('#payprice').val(formatNumberWithCommas(totalprice-tpaidprice));	
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
	if($('#itemname').val()==''){
		$('#resultmessage').html('변경 할 강좌를 선택해주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	if(removeCommasFromNumber($('#tremainprice').val()) != 0){
		$('#resultmessage').html('반변경 차액을 결제해 주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}else{
		fmsc_01save();	
	}
}

function fmsc_01save() {
		var iteration = 0;
		const yearmonth = extractYearMonth($('#fromdate').val());
		$.ajax({
	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
	        url: "classchange", // 실제 엔드포인트로 교체해야 합니다
	        dataType : 'json',
	        data: { 
	        	SaleNo : $('#saleno').val(),
	        	SaleDate : $('#saledate').val(),
	        	ItemPeriod : yearmonth,
	        	CustCode : $('#memberid').val(),
	        	FromDate : $('#fromdate').val(),
	        	ToDate : $('#todate').val(),
	        	RFromDate : $('#fromdate').val(),
	        	RToDate : $('#todate').val(),
	        	RegMonth : $('#regmonth').val(),
	        	DCID : $('#dcds').val(),
	        	DiscountRate : $('#dcper').val(),
	        	DCPrice : removeCommasFromNumber($('#dcprice').val()),
	        	ItemPrice : $('#price option:selected').attr('id'),
	        	RealPrice : removeCommasFromNumber($('#sortprice').val()),
	        	Misu : removeCommasFromNumber($('#tremainprice').val()),
	        	EmpCode : $('#empcode').val(),
	        	IsReReg : '0',
	        	State : 'G+',
	        	ItemPKID : $('#itemid').val(),
	        	InType : '반변경',
	        	prevInType : '등록',
	        	CurState : 1,
	        	PaidPrice : 0
	        },
	        success: function(data) {	
	        	var numberOfTR = $('#paidbody tr#new').length;
	        	if(numberOfTR>0){
	        		$('#paidbody tr#new').each(function() {
		        		$.ajax({
			    	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
			    	        url: "tblpaidinsert", // 실제 엔드포인트로 교체해야 합니다
			    	        dataType : 'text',
			    	        data: { 
			    	        	FPKID: data,
			    	        	SaleDate : $(this).find('.paiddate').text().substr(0,10),
			    	        	RealSaleDate : $(this).find('.paiddate').text(),
			    	        	SaleType : '반변경',
			    	        	PayType : $(this).find('.paidcategory').text(),
			    	        	Price : removeCommasFromNumber($(this).find('.paidprice').text()),
			    	        	AssignType : $(this).find('.paidassignType').text(),
			    	        	PaidGroupSaleNo : data
			    	        },
			    	        success: function(data){
			    	        	iteration++;
			    	        	if(iteration === numberOfTR){
			    	        		window.opener.location.reload();
			    	                window.close();
			    	        	}
			    	        }
			    		});
		        	});
	        	}else{
	        		window.opener.location.reload();
	                window.close();
	        	}
	        },
	        error: function(xhr, status, error) {
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
	        }
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
	if($('#tremainprice').val() == 0 || $('#tremainprice').val() == ''){
	  	$('#resultmessage').html('받을 금액이 0원입니다.<br>확인 후 결제해 주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id = "new"></tr>');
	newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
	newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">현금</td>');
	newRow.append('<td class="paidprice align-middle white-space-nowrap text-start fw-bold text-700">' + $('#payprice').val() + '</td>');
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

//금액에 , 를 붙혀서 return 해주는 함수
function formatNumberWithCommas(amount) {
    // Check if the input is a valid number
    if (isNaN(amount)) {
        return "Invalid input";
    }

    // Convert the number to a string
    let amountStr = amount.toString();

    // Split the string into integer and decimal parts
    let parts = amountStr.split('.');

    // Add commas to the integer part
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ',');

    // Join the integer and decimal parts back together
    let formattedAmount = parts.join('.');

    return formattedAmount;
}

//금액에 붙은 , 를 지워주는 함수
function removeCommasFromNumber(formattedNumber) {
    // Remove commas from the string
    let numberWithoutCommas = formattedNumber.replace(/,/g, '');

    // Convert the string to a number
    let numericValue = parseFloat(numberWithoutCommas);

    // Check if the conversion was successful
    if (isNaN(numericValue)) {
        return "Invalid input";
    }

    return numericValue;
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