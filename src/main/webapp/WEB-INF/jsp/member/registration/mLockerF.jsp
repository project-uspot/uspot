<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사물함임대정보 등록 및 변경</title>
    <script type="text/javascript">
    <!--처음 사물함 클릭하는 함수-->
    document.addEventListener("DOMContentLoaded", function() {
        var firstLi = document.querySelector('.nav-item:first-child');

        var firstLinkId = firstLi.querySelector('a').id;
        firstLi.querySelector('a').click();
    });
    </script>
</head>
<body style="overflow: hidden;">
    <div class="card h-100 mb-1">
        <div class="card-body mb-n4 mt-n3">
            <div class="col-auto">
        		<div class="row justify-content-between">
        			<div class="col-auto">
						<h3 class="mb-3 pt-2">사물함임대정보 등록</h3>
            		</div>
            		<div class="col-auto">
						<button class="btn btn-success" type="button" onclick="save()">저장</button>
						<!-- <button class="btn btn-secondary" type="button" onclick="lockerReturn()">반납</button>
						<button class="btn btn-danger" type="button">삭제</button>
						<button class="btn btn-soft-danger" type="button">영수증</button>
						<button class="btn btn-soft-info" type="button" onclick="lockerChange()">변경</button> -->
            		</div>
        		</div>
        	</div>
        </div>
    </div>
    <div class="row">
	    <div class="card h-100 mb-1 ms-3 me-1" style="width: 673px;">
	        <div class="card-body mb-n5 mt-n3 me-3 mx-n3" style="height: 525px;">
	        	<div class="col-auto mt-2">
					<div class="card border border-primary mt-2">
				    	<div class="card-body my-n3">
				        	<div class="row">
				        		<div class="col-md-6">
									<div class="input-group input-group-sm">
										<span class="input-group-text" id="basic-addon1">회원번호</span>
										<input class="form-control" type="text" aria-describedby="basic-addon1" id="memberid" name="memberid" value="${member.memberID}" readonly="readonly"/>
										<input type="hidden" id="sitecode" value="${member.siteCode}">
										<input type="hidden" id="GroupSaleNo">
									</div>
								</div>
								<div class="col-md-6">
									<div class="input-group input-group-sm">
										<span class="input-group-text" id="basic-addon1">회원성명</span>
										<input class="form-control" type="text" aria-describedby="basic-addon1" id="name" name="name" value="${member.name}" readonly="readonly"/>
									</div>
								</div>
				        	</div>
				        	<div class="row">
				        		<div class="col-md-6">
									<div class="input-group input-group-sm">
										<span class="input-group-text" id="basic-addon1" style="width: 85px;">성별</span>
										<input class="form-control" type="text" aria-describedby="basic-addon1" id="gendertext" name="gendertext" value="${member.genderText}" readonly="readonly"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="input-group input-group-sm">
										<span class="input-group-text" id="basic-addon1">회원구분</span>
										<input class="form-control" type="text" aria-describedby="basic-addon1" id="type" name="type" value="${member.typeText}" readonly="readonly"/>
									</div>
								</div>
				        	</div>
				        	<div class="row">
				        		<div class="col-md-6">
									<div class="input-group input-group-sm">
										<span class="input-group-text" id="basic-addon1">회원종류</span>
										<input class="form-control" type="text" aria-describedby="basic-addon1" id="mlevel" name="mlevel" value="${mleveltext}" readonly="readonly"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="input-group input-group-sm">
										<span class="input-group-text" id="basic-addon1" style="width: 85px;">최초등록일</span>
										<input class="form-control" type="text" aria-describedby="basic-addon1" id="mregdate" name="mregdate" value="${member.regdate}" readonly="readonly"/>
									</div>
								</div>
				        	</div>
				        	<div class="row">
				        		<div class="col-md-6">
									<div class="input-group input-group-sm">
										<span class="input-group-text" id="basic-addon1">휴대전화</span>
										<input class="form-control" type="text" aria-describedby="basic-addon1" id="cellphone" name="cellphone" value="${member.cellPhone}" readonly="readonly"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="input-group input-group-sm">
										<span class="input-group-text" id="basic-addon1">일반전화</span>
										<input class="form-control" type="text" aria-describedby="basic-addon1" id="homephone" name="homephone" value="${member.homePhone}" readonly="readonly"/>
									</div>
								</div>
				        	</div>
							<div class="col-auto">
								<div class="input-group input-group-sm">
									<span class="input-group-text" id="basic-addon1" style="width: 85px;">비고</span>
									<input class="form-control" type="text" aria-describedby="basic-addon1" id="mnote" name="mnote" value="${member.note}" readonly="readonly"/>
								</div>
							</div>
				    	</div>
					</div>
				</div>
				<div class="cal-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" style="width: 85px;">사물함</span>
						<input class="form-control" type="text" readonly="readonly" id="PLockerGroupName" name="PLockerGroupName" style="text-align: center;font-weight: 900;"/>
						<input class="form-control" type="text" readonly="readonly" id="PLockerLocation" name="PLockerLocation" style="text-align: center;font-weight: 900;"/>
						<input class="form-control" type="text" readonly="readonly" id="PLockerNo" name="PLockerNo" style="text-align: right;font-weight: 900;"/>
					</div>
				</div>
				<div class="row">
	        		<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1" style="width: 85px;">보증금</span>
							<input class="form-control" type="text" id="PLockerDeposite" name="PLockerDeposite" style="text-align: right;" readonly="readonly"/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1" style="width: 85px;">임대료</span>
							<input class="form-control" type="text" id="PLockerPrice" name="PLockerPrice" style="text-align: right;" readonly="readonly"/>
						</div>
					</div>
	        	</div>
	        	<div class="row">
					<div class="col-auto">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">사용기간</span>
							<input class="form-control" type="date" aria-describedby="basic-addon1" id="fromdate" name="fromdate" style="width: 130px;font-weight: 900;"/>
						</div>
					</div>
					<div class="col-auto mt-1 mx-n4">
						~
					</div>
					<div class="col-auto ms-n1">
						<div class="input-group input-group-sm">
							<input class="form-control" type="date" id="todate" name="todate" style="width: 130px;font-weight: 900;"/>
						</div>
					</div>
					<div class="col-auto ms-n3">
						<div class="input-group input-group-sm">
							<input class="form-control" type="number" id="regmonth" name="regmonth" style="width: 64px;font-weight: 900;" min="1"/>
						</div>
					</div>
					<div class="col-auto ms-n3 mt-2">
						개월
					</div>
				</div>
			<!--<div class="row" > 할인유형 적용안함
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
					<div class="col-auto ms-n3 me-n5">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">할인율/금액</span>
							<input class="form-control" type="number" id="dcper" name="dcper" style="width: 72px;" readonly="readonly"/>
						</div>
					</div>
					<div class="col-auto mt-1">
						%
					</div>
					<div class="col-auto mx-n5">
						<div class="input-group input-group-sm">
							<input class="form-control" type="text" id="dcprice" name="dcprice" style="width: 97px;text-align: right;" readonly="readonly"/>
						</div>
					</div>
				</div>-->
				<div class="row">
					<div class="col-auto">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">판매일자</span>
							<input class="form-control" type="date" aria-describedby="basic-addon1" id="regdate" name="regdate" style="width: 130px;"/>
						</div>
					</div>
					<div class="col-md">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1" style="width: 85px;">비고</span>
							<input class="form-control" type="text" id="note" name="note" maxlength="100"/>
						</div>
					</div>
	        	</div>
				<div class="row">
					<div class="col-auto">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">총임대료</span>
							<input class="form-control" type="text" id="totalPLockerPrice" name="totalPLockerPrice" style="width: 100px; text-align: right;" readonly="readonly"/>
						</div>
					</div>
					<div class="col-auto ms-n5">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">임대료미납</span>
							<input class="form-control" type="text" id="misuPLockerPrice" name="misuPLockerPrice" style="width: 100px; text-align: right;" readonly="readonly"/>
						</div>
					</div>
					<div class="col-auto me-n2">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">입대료결제금</span>
							<input class="form-control" type="text" id="paidPLockerPrice" name="paidPLockerPrice" style="width: 100px; text-align: right;" readonly="readonly"/>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-auto">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">총보증금</span>
							<input class="form-control" type="text" id="totalPLockerDeposite" name="totalPLockerDeposite" style="width: 100px; text-align: right;" readonly="readonly"/>
						</div>
					</div>
					<div class="col-auto ms-n5">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">보증금미납</span>
							<input class="form-control" type="text" id="misuPLockerDeposite" name="misuPLockerDeposite" style="width: 100px; text-align: right;" readonly="readonly"/>
						</div>
					</div>
					<div class="col-auto me-n2">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">보증금결제금</span>
							<input class="form-control" type="text" id="paidPLockerDeposite" name="paidPLockerDeposite" style="width: 100px; text-align: right;" readonly="readonly"/>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-auto">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">총매출금</span>
							<input class="form-control" type="text" id="RealPrice" name="RealPrice" style="width: 100px; text-align: right;" readonly="readonly"/>
						</div>
					</div>
					<div class="col-auto ms-n5">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">총미납금액</span>
							<input class="form-control" type="text" id="Misu" name="Misu" style="width: 100px; text-align: right;" readonly="readonly"/>
						</div>
					</div>
					<div class="col-auto me-n2">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">총결제금액&emsp;</span>
							<input class="form-control" type="text" id="PaidPrice" name="PaidPrice" style="width: 100px; text-align: right;" readonly="readonly"/>
						</div>
					</div>
				</div>
				<div class="row">
					<!--<div class="col-auto">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">총일수</span>
							<input class="form-control" type="number" id="note" name="note" value="${fmsc_s01.fromDate}" style="width: 72px;"/>
						</div>
					</div>
					<div class="col-auto ms-n5">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">사용일수</span>
							<input class="form-control" type="text" id="note" name="note" value="${fmsc_s01.fromDate}" style="width: 72px;"/>
						</div>
					</div>-->
					<div class="col-auto">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text me-3" id="basic-addon1" style="width: 85px;">영수증인쇄</span>
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
	        </div>
		</div>
	    <div class="card h-100 mb-1 me-1" style="width: 622px;">
	        <div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 525px;">
	        	<ul class="nav nav-underline" id="myTab" role="tablist">
	        		<c:forEach var="lockergroup" items="${lockergrouplist}">
	        			<li class="nav-item"><a class="nav-link" id="${lockergroup.PLockerGroupID}-tab" data-bs-toggle="tab" href="#tab-${lockergroup.PLockerGroupID}" role="tab" itemid="${lockergroup.PLockerGroupID}" title="${lockergroup.danCnt}">${lockergroup.PLockerGroupName}/${lockergroup.PLockerLocation}</a></li>
	        		</c:forEach>
				</ul>
				<div class="tab-content mt-3" id="myTabContent" style="overflow: auto;height:415px;">
					<c:forEach var="lockergroup" items="${lockergrouplist}">
	        			<div class="tab-pane fade" id="tab-${lockergroup.PLockerGroupID}">
	        			</div>
	        		</c:forEach>
				</div>
	        </div>
	    </div>
	</div>
    <div class="row">
	    <div class="card w-60 h-50">
	    	<div class="card-body my-n3">
	    		<div class="border-top border-bottom border-200" id="customerOrdersTable" style="overflow-y: scroll; height: 236px;"
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
	    <div class="card w-35 h-100 mb-1 me-1" style="width: 515px; ">
	    	<div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 300px;">
	    		<div class="col-auto">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">받을금액</span>
						<input class="form-control" type="text" id="payprice" name="payprice" style="text-align: right;font-weight: 900;" oninput="onlyNumber(this)"/>
					</div>
				</div>
				<div class="row mb-1">
					<div class="col-auto">
						<button class="btn btn-phoenix-primary" type="button" id="pay-cash" name="pay-cash" onclick="payCash()" style="width:113px;">현금</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-soft-primary" type="button"  onclick="paycredit()" style="width:128px;">신용카드</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-soft-secondary" type="button" style="width:117px;" onclick="payAccount()">계좌입금</button>
					</div>
				</div>
				<div class="row mb-1">
					<div class="col-auto">
						<button class="btn btn-soft-danger" type="button" onclick="payCancel()" style="width:113px;">결제취소</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-phoenix-success" type="button">영수증재발행</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-soft-success" type="button">현.영재발행</button>
					</div>
				</div>
				<div class="row">
					<div class="col-auto">
						<!-- <button class="btn btn-soft-info" type="button" onclick="deleteRow()" style="width:128px;">행삭제</button> -->
					</div>
				</div>
				<div class="col-auto ms-n2 mt-2">
					<div class="card border border-primary mt-2">
				    	<div class="card-body my-n3">
				      		<div class="col-auto ms-n3">
		                   		<div class="row">
		                      		<div class="col-auto">
		                      			<button class="btn btn-soft-success" type="button" onclick="payDeposite()">보증금결제</button>
									</div>
									<div class="col-auto">
										<button class="btn btn-soft-danger" type="button" style="width:128px;">보증금환불</button>
									</div>
								</div>
							</div>
				    	</div>
					</div>
				</div>
	    	</div>
	    </div>
	</div>
</body>
<script type="text/javascript">
//숨겨진 모달 버튼
var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
$('body').append(buttonHTML);

var myPopup;

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
	
function alldelete(){
	window.location.reload();
}

$('#fromdate,#todate,#regdate').val(getCurrentDate());


$(document).ready(function() {
    $('#paidbody').on('click', 'tr', function() {
        paidbodyclick(this);
	});
});

var previousRow = null;
function paidbodyclick(clickedRow){
	if (previousRow !== null) {
    	$(previousRow).css('background-color', '');
    }
	$(clickedRow).css('background-color', 'lightblue');
    previousRow = clickedRow;
}


var DBregmonth;
$('.nav-item').on('click', function() {
	var tab_id = $(this).find('a').attr('href');
	
	var plockergroupid = $(this).find('a').attr('itemid');
	
	var dancnt = $(this).find('a').attr('title');
	
	$.ajax({
        type: "POST",
        url: "plockerByGroupID",
        dataType : 'json',
        data: { 
        	PLockerGroupID : plockergroupid
        },
        success: function(data) {
        	var contentHtml = '<table>';
            var n = Number(dancnt);

            for (var i = 0; i < n; i++) {
                contentHtml += '<tr>';

                for (var j = i; j < data.length; j += n) {
                	if(data[j].State == 1){
                		
                		if(data[j].ClickTime != null){
                			
                			const clickTime = new Date(data[j].ClickTime);

                			const currentTime = new Date();

                			const timeDifferenceInMilliseconds = currentTime - clickTime;
                			const timeDifferenceInMinutes = Math.floor(timeDifferenceInMilliseconds / (1000 * 60));
							
                			if(timeDifferenceInMinutes<11){
                				if(PrevPLockerID == data[j].PLockerID){
                        			contentHtml += '<td><button class="btn btn-outline-success" style="background-color: chartreuse;" type="button" onclick="StartBooking('+data[j].PLockerID+',this)" id="PrevClick">'+
            	                    '<div style="display: flex;" class="mx-n2"><span class="uil-ellipsis-h fs-1"></span>&ensp;<div class="mt-1" style="width: 24px;">' + data[j].PLockerNo + '</div></div></button></td>';
                        		}else{
                        			contentHtml += '<td><button class="btn btn-outline-success" type="button" onclick="StartBooking('+data[j].PLockerID+',this)">'+
            	                    '<div style="display: flex;" class="mx-n2"><span class="uil-ellipsis-h fs-1"></span>&ensp;<div class="mt-1" style="width: 24px;">' + data[j].PLockerNo + '</div></div></button></td>';
                        		}
                			}else{
                				if(PrevPLockerID == data[j].PLockerID){
                        			contentHtml += '<td><button class="btn btn-outline-primary" style="background-color: chartreuse;" type="button" onclick="StartBooking('+data[j].PLockerID+',this)" id="PrevClick">'+
            	                    '<div style="display: flex;" class="mx-n2"><span class="uil-key-skeleton fs-1"></span>&ensp;<div class="mt-1" style="width: 24px;">' + data[j].PLockerNo + '</div></div></button></td>';
                        		}else{
                        			contentHtml += '<td><button class="btn btn-outline-primary" type="button" onclick="StartBooking('+data[j].PLockerID+',this)">'+
            	                    '<div style="display: flex;" class="mx-n2"><span class="uil-key-skeleton fs-1"></span>&ensp;<div class="mt-1" style="width: 24px;">' + data[j].PLockerNo + '</div></div></button></td>';
                        		}
                			}
                		}else{
                			if(PrevPLockerID == data[j].PLockerID){
                    			contentHtml += '<td><button class="btn btn-outline-primary" style="background-color: chartreuse;" type="button" onclick="StartBooking('+data[j].PLockerID+',this)" id="PrevClick">'+
        	                    '<div style="display: flex;" class="mx-n2"><span class="uil-key-skeleton fs-1"></span>&ensp;<div class="mt-1" style="width: 24px;">' + data[j].PLockerNo + '</div></div></button></td>';
                    		}else{
                    			contentHtml += '<td><button class="btn btn-outline-primary" type="button" onclick="StartBooking('+data[j].PLockerID+',this)">'+
        	                    '<div style="display: flex;" class="mx-n2"><span class="uil-key-skeleton fs-1"></span>&ensp;<div class="mt-1" style="width: 24px;">' + data[j].PLockerNo + '</div></div></button></td>';
                    		}
                		}
                	}
                	else if(data[j].State == 2){
                		contentHtml += '<td><button type="button" onclick="NoBooking('+data[j].State+')" id="" class="btn btn-outline-secondary" data-bs-toggle="tooltip" data-bs-placement="left" '+
                		'title="<b>회원번호 :</b><em>'+data[j].MemberID+'</em><br>'+
                		'<b>회원명 :</b><em>'+data[j].Name+'</em><br>'+
                		'<b>시작일 :</b><em>'+data[j].FromDate+'</em><br>'+
                		'<b>종료일 :</b><em>'+data[j].ToDate+'</em><br>"'+
                		'data-bs-html="true">'+
	                    '<div style="display: flex;" class="mx-n2" id="'+data[j].PLockerID+'content"><span class="uil-lock-alt fs-1"></span>&ensp;<div class="mt-1" style="width: 24px;">' + data[j].PLockerNo + '</div></div></button></td>';
                	}
                	else if(data[j].State == 3){
                		contentHtml += '<td><button type="button" onclick="NoBooking('+data[j].State+')" id="" class="btn btn-outline-danger">'+
	                    '<div style="display: flex;" class="mx-n2"><span class="uil-wrench fs-1"></span>&ensp;<div class="mt-1" style="width: 24px;">' + data[j].PLockerNo + '</div></div></button></td>';
                	}
                	else if(data[j].State == 4){
                		contentHtml += '<td><button type="button" onclick="NoBooking('+data[j].State+')" id="" class="btn btn-outline-warning">'+
	                    '<div style="display: flex;" class="mx-n2"><span class="uil-lock-slash fs-1"></span>&ensp;<div class="mt-1" style="width: 24px;">' + data[j].PLockerNo + '</div></div></button></td>';
                	}
                    
                }

                contentHtml += '</tr>';
            }

            contentHtml += '</table>';
            $(tab_id).html(contentHtml);
            
            $(function(){
                $('[data-bs-toggle="tooltip"]').tooltip();
            });
            
            var PrevClick = document.getElementById('PrevClick');
            PrevButton = PrevClick;
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
         console.log("Error: " + error);
        }
	});
});


function NoBooking(message) {
	var reason = '';
	if(message == 2){
		reason = '사용중';
	}else if(message == 3){
		reason = '고장';
	}else if(message == 4){
		reason = '사용불가';
	}
	$('#resultmessage').html('선택하신 사물함은 임대할 수 없습니다.<br>임대불가사유 : '+reason);
	$('.modal-footer').empty();
	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	$('.modal-footer').append(cancelbutton);
    $('#modalButton').click();
    modalcheck = true;
}

var PrevPLockerID = 0;
var PrevButton = null;
function StartBooking(plockerid,NowButton) {
	$.ajax({
        type: "POST", 
        url: "StartBooking", 
        dataType : 'json',
        data: { 
        	PLockerID: plockerid,
        	PrevPLockerID : PrevPLockerID
        },
        success: function(data) {
        	if(data.fail == 'fail'){
        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
        		window.opener.location.reload();
                window.close();	
        	}else if(data.already == 'already'){
        		$('#resultmessage').html('이미 등록진행중인 사물함 입니다.');
				$('.modal-footer').empty();
				var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				$('.modal-footer').append(cancelbutton);
			    $('#modalButton').click();
			    modalcheck = true;
        		
        		return false;
        	}else{
        		PrevPLockerID = plockerid;
        		if (PrevButton !== null) {
			    	$(PrevButton).css('background-color', '');
			    	$(PrevButton).removeClass('btn-outline-success');
			    	$(PrevButton).addClass('btn-outline-primary');
			    	$('button').filter(function() {
			            return $(this).css('background-color') === 'chartreuse';
			        }).css('background-color', '');
			    }
        		$(NowButton).css('background-color', 'chartreuse');
        		PrevButton = NowButton;
        		
	        	$('#PLockerGroupName').val(data.PLockerGroupName);
	        	$('#PLockerLocation').val(data.PLockerLocation);
	        	$('#PLockerNo').val(data.PLockerNo);
	        	$('#PLockerDeposite').val(formatNumberWithCommas(data.PLockerDeposite));
	        	$('#PLockerPrice').val(formatNumberWithCommas(data.PLockerPrice));
	        	$('#regmonth').val(data.PLockerMonth);
	        	DBregmonth = data.PLockerMonth;
	        	DBPLockerPrice = data.PLockerPrice;
	        	dateChange();
	        	PLockerDepositeChange();
        	}	    	        	
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
         console.log("Error: " + error);
        }
	});
}

$('#regmonth, #fromdate').on('change', function() {
	dateChange();
});
   
function dateChange() {
	var selectedValue = $('#regmonth').val();
    var fromdate = $('#fromdate').val();
    
    const formattedDate = new Date(fromdate);
    var monthsToAdd = parseInt(selectedValue);
    
    formattedDate.setMonth(formattedDate.getMonth() + monthsToAdd);
    formattedDate.setDate(formattedDate.getDate()-1);
    
    const formattedDateString = TformatDate(formattedDate);
    
    $('#todate').val(formattedDateString);
    
    PLockerPriceChange();
}   
function PLockerPriceChange(){
   	var totalPLockerPrice;
   	
   	if(DBregmonth>1){
   		totalPLockerPrice = DBPLockerPrice;
	}else{
		var regmonth = $('#regmonth').val();
		totalPLockerPrice = regmonth * DBPLockerPrice;
	}
   	$('#PLockerPrice').val(formatNumberWithCommas(totalPLockerPrice));
   	$('#totalPLockerPrice').val(formatNumberWithCommas(totalPLockerPrice));
   	
   	var paidPLockerPrice = 0;
   	
   	$('#paidbody tr#PLockerPrice').each(function() {
   		var paidPrice = removeCommasFromNumber($(this).find('td.paidprice').text());
   		paidPLockerPrice += paidPrice;
   		
   		if(isNaN(paidPLockerPrice)){
   			paidPLockerPrice = 0;
   		}
    });
   	$('#paidPLockerPrice').val(formatNumberWithCommas(paidPLockerPrice));
   	
   	var misuPLockerPrice = totalPLockerPrice-paidPLockerPrice;
   	
   	$('#misuPLockerPrice').val(formatNumberWithCommas(misuPLockerPrice));
   	
   	totalChange1();
}

function PLockerDepositeChange() {
	var PLockerDeposite = removeCommasFromNumber($('#PLockerDeposite').val());
	
	$('#totalPLockerDeposite').val(formatNumberWithCommas(PLockerDeposite));
	
	var paidPLockerDeposite = 0;
   	
   	$('#paidbody tr#Deposite').each(function() {
   		var paidPrice = removeCommasFromNumber($(this).find('td.paidprice').text());
   		paidPLockerDeposite += paidPrice;
   		
   		if(isNaN(paidPLockerDeposite)){
   			paidPLockerDeposite = 0;
   		}
    });
   	$('#paidPLockerDeposite').val(formatNumberWithCommas(paidPLockerDeposite));
   	
   	var misuPLockerDeposite = PLockerDeposite-paidPLockerDeposite;
   	
   	$('#misuPLockerDeposite').val(formatNumberWithCommas(misuPLockerDeposite));
	
	totalChange1();
}

function totalChange1() {
	
	var totalPLockerPrice = removeCommasFromNumber($('#totalPLockerPrice').val());
	var totalPLockerDeposite = removeCommasFromNumber($('#totalPLockerDeposite').val());
	
	var RealPrice = totalPLockerPrice+totalPLockerDeposite;
	
	$('#RealPrice').val(formatNumberWithCommas(RealPrice));
	
	var misuPLockerPrice = removeCommasFromNumber($('#misuPLockerPrice').val());
	var misuPLockerDeposite = removeCommasFromNumber($('#misuPLockerDeposite').val());
	
	var Misu = misuPLockerPrice+misuPLockerDeposite;
	
	$('#Misu').val(formatNumberWithCommas(Misu));
	
	var paidPLockerPrice = removeCommasFromNumber($('#paidPLockerPrice').val());
	var paidPLockerDeposite = removeCommasFromNumber($('#paidPLockerDeposite').val());
	
	var PaidPrice = paidPLockerPrice+paidPLockerDeposite;
	
	$('#PaidPrice').val(formatNumberWithCommas(PaidPrice));
	
	$('#payprice').val(formatNumberWithCommas(misuPLockerPrice));
}

function save() {
	if(PrevPLockerID == 0){
		$('#resultmessage').html('사물함을 선택해주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}else{
		$.ajax({
	        type: "POST", 
	        url: "useLockerInsert",
	        dataType : 'json',
	        data: { 
	        	LockerID : PrevPLockerID,
	        	PLockerNo : $('#PLockerNo').val(),
	        	MemberID : $('#memberid').val(),
	        	RegDate : $('#regdate').val(),
	        	FromDate : $('#fromdate').val(),
	        	ToDate : $('#todate').val(),
	        	RegMonth : $('#regmonth').val(),
	        	Deposite : removeCommasFromNumber($('#PLockerDeposite').val()),
	        	UsePrice : removeCommasFromNumber($('#totalPLockerPrice').val()),
	        	TotalPrice : removeCommasFromNumber($('#RealPrice').val()),
	        	RealPrice : removeCommasFromNumber($('#RealPrice').val()),
				PaidPrice : removeCommasFromNumber($('#PaidPrice').val()),
				Misu : removeCommasFromNumber($('#Misu').val()),
				IsReturn : 'N',
				IsFlag : 0,
				Note : $('#note').val(),
				IsDelete : 'N'
	        },
	        success: function(data) {
	        	if(data == 0){
	        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
	        		window.opener.location.reload();
	                window.close();	
	        	}else if(data == -1){
	        		alert("이미 등록된 사물함입니다.");
	                window.location.reload();
	        	}else if(data == -2){
	        		alert("이미 등록중인 사물함입니다.");
	                window.location.reload();
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
}


//itemperiod 를 위한 날짜 포맷 함수
function extractYearMonth(dateString) {
  
	const [year, month] = dateString.split('-');
  
	const yearMonth = year + month;
	
    return yearMonth;
}
  
//현금 결제
function payCash() {
	if($('#misuPLockerPrice').val() == 0 || $('#misuPLockerPrice').val() == ''){
	  	$('#resultmessage').html('받을 임대료가 0원입니다.<br>확인 후 결제해 주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	
	var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id = "PLockerPrice"></tr>');
	newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
	newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">현금</td>');
	newRow.append('<td class="paidprice align-right white-space-nowrap text-start fw-bold text-end">' + $('#payprice').val() + '</td>');
	newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + '</td>');
	newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + '</td>');
	newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' +  '</td>');
	newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + '</td>');
	newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
	newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + '</td>');
	newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '</td>');
	newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '</td>');
	newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
	
	var tableBody = $('#paidbody');
	tableBody.append(newRow);
	PLockerPriceChange();
	
	$.ajax({
        type: "POST", 
        url: "useLockerInsert",
        dataType : 'json',
        data: { 
        	LockerID : PrevPLockerID,
        	PLockerNo : $('#PLockerNo').val(),
        	MemberID : $('#memberid').val(),
        	RegDate : $('#regdate').val(),
        	FromDate : $('#fromdate').val(),
        	ToDate : $('#todate').val(),
        	RegMonth : $('#regmonth').val(),
        	Deposite : removeCommasFromNumber($('#PLockerDeposite').val()),
        	UsePrice : removeCommasFromNumber($('#totalPLockerPrice').val()),
        	TotalPrice : removeCommasFromNumber($('#RealPrice').val()),
        	RealPrice : removeCommasFromNumber($('#RealPrice').val()),
			PaidPrice : removeCommasFromNumber($('#PaidPrice').val()),
			Misu : removeCommasFromNumber($('#Misu').val()),
			IsReturn : 'N',
			IsFlag : 0,
			Note : $('#note').val(),
			IsDelete : 'N'
        },
        success: function(data) {
        	if(data == 0){
        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
        		window.opener.location.reload();
                window.close();	
        	}else if(data == -1){
        		alert("이미 등록된 사물함입니다.");
                window.location.reload();
        	}else if(data == -2){
        		alert("이미 등록중인 사물함입니다.");
                window.location.reload();
        	}else{
        		$.ajax({
        	        type: "POST", 
        	        url: "tblpaidinsert", 
        	        dataType : 'json',
        	        data: { 
        	        	FPKID : data,
        	        	SiteCode : $('#sitecode').val(),
        	        	SaleDate : $('#regdate').val(),
        	        	RealSaleDate : $('#paidbody tr').find('.paiddate').text(),
        	        	SaleType : '사물함',
        	        	PayType : $('#paidbody tr').find('.paidcategory').text(),
        	        	Price : removeCommasFromNumber($('#paidbody tr').find('.paidprice').text()),
        	        	PaidGroupSaleNo : data
        	        },
        	        success: function(success) {	
        	        	window.opener.location.reload();
        	       	 	window.location.href = 'mLockerDetailF.do?PKID='+data;
        	        },
        	        error: function(xhr, status, error) {
        	       	 console.log("Status: " + status);
        	         console.log("Error: " + error);
        	        }
        		});
        	}
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
         console.log("Error: " + error);
        }
	});
}


function payDeposite() {
	if($('#misuPLockerDeposite').val() == 0 || $('#misuPLockerDeposite').val() == ''){
	  	$('#resultmessage').html('받을 보증금이 0원입니다.<br>확인 후 결제해 주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id = "Deposite"></tr>');
	newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
	newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">보증금</td>');
	newRow.append('<td class="paidprice align-middle white-space-nowrap fw-bold text-end">' + $('#totalPLockerDeposite').val() + '</td>');
	newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + '</td>');
	newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + '</td>');
	newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' +  '</td>');
	newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + '</td>');
	newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
	newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + '</td>');
	newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '</td>');
	newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '</td>');
	newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
	
	var tableBody = $('#paidbody');
	tableBody.append(newRow);
	PLockerDepositeChange();
	
	$.ajax({
        type: "POST", 
        url: "useLockerInsert",
        dataType : 'json',
        data: { 
        	LockerID : PrevPLockerID,
        	PLockerNo : $('#PLockerNo').val(),
        	MemberID : $('#memberid').val(),
        	RegDate : $('#regdate').val(),
        	FromDate : $('#fromdate').val(),
        	ToDate : $('#todate').val(),
        	RegMonth : $('#regmonth').val(),
        	Deposite : removeCommasFromNumber($('#PLockerDeposite').val()),
        	UsePrice : removeCommasFromNumber($('#totalPLockerPrice').val()),
        	TotalPrice : removeCommasFromNumber($('#RealPrice').val()),
        	RealPrice : removeCommasFromNumber($('#RealPrice').val()),
			PaidPrice : removeCommasFromNumber($('#PaidPrice').val()),
			Misu : removeCommasFromNumber($('#Misu').val()),
			IsReturn : 'N',
			IsFlag : 0,
			Note : $('#note').val(),
			IsDelete : 'N'
        },
        success: function(data) {
        	if(data == 0){
        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
        		window.opener.location.reload();
                window.close();	
        	}else if(data == -1){
        		alert("이미 등록된 사물함입니다.");
                window.location.reload();
        	}else if(data == -2){
        		alert("이미 등록중인 사물함입니다.");
                window.location.reload();
        	}else{
        		$.ajax({
        	        type: "POST", 
        	        url: "tbldepositeinsert", 
        	        dataType : 'json',
        	        data: { 
        	        	SaleDate : getCurrentDate(),
        	        	RealSaleDate : $('#paidbody tr').find('.paiddate').text(),
        	        	LockerID : PrevPLockerID,
        	        	MemberID : $('#memberid').val(),
        	        	Deposite : removeCommasFromNumber($('#PLockerDeposite').val())
        	        },
        	        success: function(success) {	
        	        	window.opener.location.reload();
        	       	 	window.location.href = 'mLockerDetailF.do?PKID='+data;
        	        },
        	        error: function(xhr, status, error) {
        	       	 console.log("Status: " + status);
        	         console.log("Error: " + error);
        	        }
        		});
        	}
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
         console.log("Error: " + error);
        }
	});
}

<%-- 신용카드 결제 --%>
function paycredit() {
	if($('#misuPLockerPrice').val() == 0 || $('#misuPLockerPrice').val() == ''){
	  	$('#resultmessage').html('받을 임대료가 0원입니다.<br>확인 후 결제해 주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}

	var url = "${pageContext.request.contextPath}/locker/CreditCard.do?payprice=" + $("#payprice").val() +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+PrevPLockerID;
	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600";
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

function totalchange() {
	$('#paidbody tr#new').attr('id','PLockerPrice');
	PLockerPriceChange();
	
	if($('#GroupSaleNo').val() == ''){
		accountChange();
	}else{
		$.ajax({
	        type: "POST", 
	        url: "UpduseLocker", 
	        dataType : 'json',
	        data: { 
	        	PKID : $('#GroupSaleNo').val(),
	        	LockerID : PrevPLockerID,
	        	RegDate : $('#regdate').val(),
	        	FromDate : $('#fromdate').val(),
	        	ToDate : $('#todate').val(),
	        	RegMonth : $('#regmonth').val(),
	        	MemberID : $('#memberid').val(),
	        	Deposite : removeCommasFromNumber($('#PLockerDeposite').val()),
	        	UsePrice : removeCommasFromNumber($('#PLockerPrice').val()),
	        	TotalPrice : removeCommasFromNumber($('#RealPrice').val()),
	        	RealPrice : removeCommasFromNumber($('#RealPrice').val()),
				PaidPrice : removeCommasFromNumber($('#PaidPrice').val()),
				Misu : removeCommasFromNumber($('#Misu').val()),
				Note : $('#note').val(),
	        },
	        success: function(data) {	
	        	if(data == '0'){
	        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
	        		window.opener.location.reload();
	                window.close();
	        	}else{
	        		window.opener.location.reload();
	        		window.location.href = 'mLockerDetailF.do?PKID='+$('#GroupSaleNo').val();
	        	}
	        },
	        error: function(xhr, status, error) {
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
	        }
		});
	}
}

<%-- 계좌입금 --%>
function payAccount(){
	if($('#misuPLockerPrice').val() == 0 || $('#misuPLockerPrice').val() == ''){
	  	$('#resultmessage').html('받을 임대료가 0원입니다.<br>확인 후 결제해 주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
 	
	var url = "${pageContext.request.contextPath}/locker/Account.do?payprice=" + $("#payprice").val() +"&MemberID="+$('#memberid').val();
	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600";
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

function accountChange() {
	$('#paidbody tr#new').attr('id','PLockerPrice');
	PLockerPriceChange();
	
	$.ajax({
        type: "POST", 
        url: "useLockerInsert",
        dataType : 'json',
        data: { 
        	LockerID : PrevPLockerID,
        	PLockerNo : $('#PLockerNo').val(),
        	MemberID : $('#memberid').val(),
        	RegDate : $('#regdate').val(),
        	FromDate : $('#fromdate').val(),
        	ToDate : $('#todate').val(),
        	RegMonth : $('#regmonth').val(),
        	Deposite : removeCommasFromNumber($('#PLockerDeposite').val()),
        	UsePrice : removeCommasFromNumber($('#totalPLockerPrice').val()),
        	TotalPrice : removeCommasFromNumber($('#RealPrice').val()),
        	RealPrice : removeCommasFromNumber($('#RealPrice').val()),
			PaidPrice : removeCommasFromNumber($('#PaidPrice').val()),
			Misu : removeCommasFromNumber($('#Misu').val()),
			IsReturn : 'N',
			IsFlag : 0,
			Note : $('#note').val(),
			IsDelete : 'N'
        },
        success: function(data) {
        	if(data == 0){
        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
        		window.opener.location.reload();
                window.close();	
        	}else if(data == -1){
        		alert("이미 등록된 사물함입니다.");
                window.location.reload();
        	}else if(data == -2){
        		alert("이미 등록중인 사물함입니다.");
                window.location.reload();
        	}else{
        		$.ajax({
        	        type: "POST", 
        	        url: "tblpaidinsert", 
        	        dataType : 'json',
        	        data: { 
        	        	FPKID : data,
        	        	SiteCode : $('#sitecode').val(),
        	        	SaleDate : $('#regdate').val(),
        	        	RealSaleDate : $('#paidbody tr').find('.paiddate').text(),
        	        	SaleType : '사물함',
        	        	PayType : $('#paidbody tr').find('.paidcategory').text(),
        	        	Price : removeCommasFromNumber($('#paidbody tr').find('.paidprice').text()),
        	        	AssignType : $('#paidbody tr').find('.paidassignType').text(), 
        	        	Maeipsa : $('#paidbody tr').find('.paidmapsa').text(), 
        	        	CardName : $('#paidbody tr').find('.paidcardtype').text(),
    					AssignNo : $('#paidbody tr').find('.paidassignN').text(),
    					Pos : $('#paidbody tr').find('.POS').text(),
    					SignPad : $('#paidbody tr').find('.signpad').text(),
    					Halbu : $('#paidbody tr').find('.Halbu').text(),
    					SaleTime : $('#paidbody tr').find('.SaleTime').text(),
        	        	PaidGroupSaleNo : data,
        	        	OID : $('#paidbody tr').find('.OID').text(),
    					TID : $('#paidbody tr').find('.TID').text()
        	        },
        	        success: function(success) {	
        	        	window.opener.location.reload();
        	       	 	window.location.href = 'mLockerDetailF.do?PKID='+data;
        	        },
        	        error: function(xhr, status, error) {
        	       	 console.log("Status: " + status);
        	         console.log("Error: " + error);
        	        }
        		});
        	}
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
         console.log("Error: " + error);
        }
	});
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

function deleteRow() {
    if (previousRow !== null) {
    	
    	var rowToDelete = $(previousRow).closest('tr');
        
    	var prevRow = rowToDelete.prev('tr');
    	
    	rowToDelete.remove();

    	if (prevRow.length > 0) {
            paidbodyclick(prevRow);
        } else {
            previousRow = null;
        }
        
        PLockerPriceChange();
        PLockerDepositeChange();
    }
}

function payCancel() {
    if (previousRow !== null) {
        // Find the row with the class 'paidprice' within the previousRow
        var paidPriceText = $(previousRow).find('.paidprice').text();

        // Display the text in an alert window
        alert('Paid Price: ' + paidPriceText);
    } else {
        alert('No row selected.');
    }
}
</script>
</html>
<%@ include file="../../include/foot.jsp" %>