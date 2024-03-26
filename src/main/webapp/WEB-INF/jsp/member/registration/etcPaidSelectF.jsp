<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>기타매출 등록 및 변경</title>
</head>
<body style="overflow: hidden;">
    <div class="card h-100 mb-1">
        <div class="card-body mb-n4 mt-n3">
            <div class="col-auto">
        		<div class="row justify-content-between">
        			<div class="col-auto">
						<h3 class="mb-3 pt-2">기타매출 등록 및 변경</h3>
            		</div>
            		<div class="col-auto">
						<!-- <button class="btn btn-success" type="button" onclick="etcsave()">저장</button> -->
						<button class="btn btn-soft-danger" type="button" onclick="reReceipt()">영수증</button>
            		</div>
        		</div>
        	</div>
        </div>
    </div>
    <div class="row">
	    <div class="card h-100 mb-1 ms-3 me-1" style="width: 673px;">
	        <div class="card-body mb-n5 mt-n3 me-3 mx-n3" style="height: 264px;">
	        	<div class="col-auto mt-2">
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
		<div class="card h-100 mb-1 me-1" style="width: 570px;">
        	<div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 264px;">
        		<div class="col-md-5">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">분류항목</span>
						<select class="form-select" id="expensegroupid" aria-describedby="basic-addon1">
							<option value="${etcinfo.ExpenseGroupID}">${etcinfo.ExpenseGroupName}</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5" style="width: 255px;">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">항&emsp;&emsp;목</span>
							<select class="form-select" id="expenseid" aria-describedby="basic-addon1">
								<option value="${etcinfo.ExpenseID}">${etcinfo.ExpenseName}</option>
							</select>
						</div>
					</div>
					<div class="col-auto mt-1 mx-n4">
						X
					</div>
					<div class="col-auto">
						<div class="input-group input-group-sm">
							<input class="form-control form-control-sm" aria-describedby="basic-addon2" type="number" id="expcnt" name="expcnt" min="1" value="${etcinfo.ExpCnt}" style="width: 71px;text-align:right;" readonly="readonly"/>
							<span class="input-group-text" id="basic-addon2">건</span>
						</div>
					</div>
				</div>
				<div class="col-auto mt-n2">
					<div class="input-group input-group-sm">
						<span class="input-group-text me-3 align-self-xl-end" id="basic-addon1" style="width: 85px;">수입/지출</span>
						<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
							<input class="form-check-input" id="expensetype1" type="radio" name="expensetype" value="I" onclick="return(false);"/>
							<label class="form-check-label" for="inlineRadio1">수입</label>
						</div>
						<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
							<input class="form-check-input" id="expensetype2" type="radio" name="expensetype" value="O" onclick="return(false);"/>
							<label class="form-check-label" for="inlineRadio2">지출</label>
						</div>
					</div>
				</div>
				<input type="hidden" id="expensetype" value="${etcinfo.ExpenseType}">
				<div class="col-md-5">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">매출일자</span>
						<input class="form-control" type="date" aria-describedby="basic-addon1" id="saledate" name="saledate" style="width: 130px;" value="${etcinfo.SaleDate}" readonly="readonly"/>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5" style="width: 255px;">
						<div class="input-group input-group-sm">
							<span class="input-group-text">금&emsp;&emsp;액</span>
							<fmt:formatNumber value="${etcinfo.Price*etcinfo.ExpCnt}" pattern="#,###" var="Totalprice"/>
							<input class="form-control" type="text" id="defprice" name="defprice" style="text-align: right;" readonly="readonly" value="${Totalprice}"/>
							<input type="hidden" id="totalprice" name="totalprice" value="${etcinfo.TotalPrice}">
							<input type="hidden" id="misu" name="misu" value="${etcinfo.Misu}">
							<input type="hidden" id="paidprice" name="paidprice" value="${etcinfo.PaidPrice}">
							<input type="hidden" id="DBPKID" value="${etcinfo.PKID}">
							<input type="hidden" id="DBPrice" value="${etcinfo.Price}">
						</div>
					</div>
					<div class="col-auto mt-1">
						<div class="form-check form-check-inline">
							<input class="form-check-input" id="inlineCheckbox1" type="checkbox" value="option1" />
							<label class="form-check-label" for="inlineCheckbox1">영수증인쇄안함</label>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text">비&emsp;&emsp;고</span>
						<input class="form-control" type="text" id="note" name="note" maxlength="100" value="${etcinfo.Note}" readonly="readonly"/>
					</div>
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
                        		<c:forEach var="paid" items="${paidlist}">
	                        		<tr class="hover-actions-trigger btn-reveal-trigger position-static old" id="etcprice">
	                        			<td class="PKID" style="display: none;">${paid.PKID}</td>
									    <td class="paiddate align-middle white-space-nowrap text-center fw-bold">${paid.realSaleDate}</td>
									    <td class="paidcategory align-middle white-space-nowrap text-center">${paid.payType}</td>
									    <fmt:parseNumber var="paidprice" integerOnly="true" value="${paid.price}"/>
									    <td class="paidprice align-middle white-space-nowrap text-end fw-bold"><fmt:formatNumber value="${paidprice}" pattern="#,###"/></td>
									    <td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">${paid.assignType}</td>
									    <td class="paidmapsa align-middle white-space-nowrap text-center">${paid.maeipsa}</td>
									    <td class="paidcardtype align-middle white-space-nowrap text-start">${paid.cardName}</td>
									    <td class="paidassignN align-middle white-space-nowrap text-start">${paid.assignNo}</td>
									    <td class="paidcardN align-middle white-space-nowrap text-start">${paid.cardNo}</td>
									    <td class="POS align-middle white-space-nowrap text-start">${paid.pos}</td>
									    <td class="signpad py-2 align-middle white-space-nowrap">${paid.signPad}</td>
									    <td class="OID py-2 align-middle white-space-nowrap">${paid.OID}</td>
									    <td class="PayKind py-2 align-middle white-space-nowrap"></td>
									    <td class="TID py-2 align-middle white-space-nowrap" style="display:none;">${paid.TID}</td>
									    <td class="SaleTime py-2 align-middle white-space-nowrap" style="display:none;">${paid.saleTime}</td>
									</tr>
								</c:forEach>
                        	</tbody>
                    	</table>
                    </div>
            	</div>
	    	</div>
	    </div>
	    <div class="card w-35 h-100 mb-1 me-1" style="width: 491px; ">
	    	<div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 300px;">
	    		<div class="col-auto">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">받을금액</span>
						<fmt:formatNumber value="${etcinfo.Misu}" pattern="#,###" var="Misu"/>
						<input class="form-control" type="text" id="payprice" name="payprice" style="text-align: right;font-weight: 900;" oninput="onlyNumber(this)" value="${Misu}"/>
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
						<button class="btn btn-soft-danger" type="button" onclick="Cancel()" style="width:113px;">결제취소</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-phoenix-success" type="button" onclick="reReceipt()">영수증재발행</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-soft-success" type="button" onclick="cashReceiptChange()">현.영재발행</button>
					</div>
				</div>
				<div class="row">
					<div class="col-auto">
						<!-- <button class="btn btn-soft-info" type="button" onclick="deleteRow()" style="width:128px;">행삭제</button> -->
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

//$('#saledate').val(getCurrentDate());


$(document).ready(function() {
    $('#paidbody').on('click', 'tr', function() {
        paidbodyclick(this);
	});
    
	var firstTableRow = $('#paidbody').children('tr:first');
    
    if (firstTableRow.length > 0) {
        firstTableRow.click();
    }
});


var previousRow = null;
function paidbodyclick(clickedRow){
	if (previousRow !== null) {
    	$(previousRow).css('background-color', '');
    }
	$(clickedRow).css('background-color', 'lightblue');
    previousRow = clickedRow;
}

var expensetype = $('#expensetype').val();

if(expensetype == 'I'){
	$('#expensetype2').removeAttr('checked');
	$('#expensetype1').attr('checked','checked');	
}else{
	$('#expensetype1').removeAttr('checked');
	$('#expensetype2').attr('checked','checked');	
}

$('#expensegroupid').change(function() {
	$.ajax({
        type: "POST", 
        url: "ExpenseByGroupID", 
        dataType : 'json',
        data: { 
        	ExpenseGroupID : $(this).val()
        },
        success: function(data) {
        	$('#expenseid').empty();
        	$.each(data, function(index,expense) {
        		$('#expenseid').append('<option value="' + expense.expenseID + '" id="'+ parseInt(expense.defPrice) +'" NVAT="'+expense.nvat+'" ExpenseType = "'+expense.expenseType+'">'
        				+ expense.expenseName + '</option>');
            });
        	expenseidChange();
        },
        error: function(xhr, status, error) {
       	 console.log("Status: " + status);
         console.log("Error: " + error);
        }
	});
})

$('#expenseid,#expcnt').change(function() {
	expenseidChange();
});

function expenseidChange() {
	var expenseid = $('#expenseid').find('option:selected');
	
	$('#defprice').val(formatNumberWithCommas(expenseid.attr('id')*$('#expcnt').val()));
	
	if(expenseid.attr('id') == undefined){
		$('#defprice').val('');
	}
/* 	if(expenseid.attr('expensetype') == 'I'){
		$('#expensetype2').removeAttr('checked');
		$('#expensetype1').attr('checked','checked');	
	}else{
		$('#expensetype1').removeAttr('checked');
		$('#expensetype2').attr('checked','checked');	
	} */
	sortChange();
}

function sortChange() {
	var defprice = removeCommasFromNumber($('#defprice').val());
	$('#totalprice').val($('#defprice').val());
	var paidprice = 0;
	$('#paidbody tr#etcprice').each(function() {
   		var EtcpaidPrice = removeCommasFromNumber($(this).find('.paidprice').text());
   		paidprice += EtcpaidPrice;
   		
   		if(isNaN(paidprice)){
   			paidprice = 0;
   		}
    });
	var misu = formatNumberWithCommas(defprice-paidprice);
	$('#paidprice').val(paidprice);
	$('#misu').val(misu);
	$('#payprice').val(misu);
	if($('#defprice').val() == ''){
		$('#payprice').val('');
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
	if($('#misu').val() == 0 || $('#misu').val() == ''){
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
	newRow.append('<td class="paidcategory text-center">현금</td>');
	newRow.append('<td class="paidprice text-start fw-bold text-end">' + $('#payprice').val() + '</td>');
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
	
	$.ajax({
        type: "POST", 
        url: "tblpaidinsert", 
        dataType : 'json',
        data: { 
        	FPKID : $('#DBPKID').val(),
        	SiteCode : $('#sitecode').val(),
        	SaleDate : $('#saledate').val(),
        	RealSaleDate : $('#paidbody tr#new').find('.paiddate').text(),
        	SaleType : '기타비용',
        	PayType : $('#paidbody tr#new').find('.paidcategory').text(),
        	Price : removeCommasFromNumber($('#paidbody tr#new').find('.paidprice').text()),
        	PaidGroupSaleNo : $('#DBPKID').val()
        },
        success: function(success) {
        	$('#paidbody tr#new').attr('id','etcprice');
        	sortChange();
        	$.ajax({
        		type: "POST", 
        		url: "UpdExpenseSale", 
                dataType : 'json',
                data: { 
                	PKID : $('#DBPKID').val(),
                	ExpenseID : $('#expenseid').val(),
                	InOut : $('input[name=expensetype]:checked').val(),
                	SaleDate : $('#saledate').val(),
                	Price : $('#DBPrice').val(),
                	MemberID : $('#memberid').val(),
                	ExpCnt : $('#expcnt').val(),
                	TotalPrice : removeCommasFromNumber($('#totalprice').val()),
                	Misu : removeCommasFromNumber($('#misu').val()),
                	PaidPrice : removeCommasFromNumber($('#paidprice').val()),
                	Note : $('#note').val()
                },
                success: function(data) {
                	window.opener.location.reload();
               	 	window.location.href = 'etcPaidSelectF.do?PKID='+$('#DBPKID').val();  	
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

<%-- 신용카드 결제 --%>
function paycredit() {
	if($('#misu').val() == 0 || $('#misu').val() == ''){
	  	$('#resultmessage').html('받을 금액이 0원입니다.<br>확인 후 결제해 주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}

	var url = "${pageContext.request.contextPath}/etc/CreditCard.do?payprice=" + $("#payprice").val() +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+$('#expenseid').val()+"&pkid="+$('#DBPKID').val();
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
var prevbuttonText = '';
$("button").click(function() {
    var buttonText = $(this).text();
    prevbuttonText = buttonText;
});


function totalchange() {
	if($('#paidbody tr#new').find('.paidassignType').text() == '신용취소'){
		CancelInsert();
		return false;
	}
	
	if($('#paidbody tr#new').find('.paidcategory').text() == '현금영수증'){
		if($('#paidbody tr#new').find('.paidassignType').text() == '현금취소'){
			CancelInsert();
			return false;
		}else{
			if(prevbuttonText == '신용카드'){
				//accountChange('notaccount');
				//return false;
			}else{
				accountChange('account');
				return false;
			}
		}
	}
	
	$('#paidbody tr#new').attr('id','etcprice');
	sortChange();
	
	if($('#GroupSaleNo').val() == ''){
		accountChange('notaccount');
	}else{
		$.ajax({
	        type: "POST", 
	        url: "UpdExpenseSale", 
	        dataType : 'json',
	        data: { 
	        	PKID : $('#GroupSaleNo').val(),
	        	ExpenseID : $('#expenseid').val(),
	        	InOut : $('input[name=expensetype]').val(),
	        	SaleDate : $('#saledate').val(),
	        	Price : $('#DBPrice').val(),
	        	MemberID : $('#memberid').val(),
	        	ExpCnt : $('#expcnt').val(),
	        	TotalPrice : removeCommasFromNumber($('#totalprice').val()),
	        	Misu : removeCommasFromNumber($('#misu').val()),
	        	PaidPrice : removeCommasFromNumber($('#paidprice').val()),
	        	Note : $('#note').val()
	        },
	        success: function(data) {	
	        	if(data == '0'){
	        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
	        		window.opener.location.reload();
	                window.close();
	        	}else{
	        		window.opener.location.reload();
	        		window.location.href = 'etcPaidSelectF.do?PKID='+$('#GroupSaleNo').val();
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
	if($('#misu').val() == 0 || $('#misu').val() == ''){
	  	$('#resultmessage').html('받을 금액이 0원입니다.<br>확인 후 결제해 주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
 	
	var url = "${pageContext.request.contextPath}/etc/Account.do?payprice=" + $("#payprice").val() +"&MemberID="+$('#memberid').val();
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

function accountChange(option) {
	$.ajax({
        type: "POST", 
        url: "tblpaidinsert", 
        dataType : 'json',
        data: { 
        	FPKID : $('#DBPKID').val(),
        	SiteCode : $('#sitecode').val(),
        	SaleDate : $('#saledate').val(),
        	RealSaleDate : $('#paidbody tr#new').find('.paiddate').text(),
        	SaleType : '기타비용',
        	PayType : $('#paidbody tr#new').find('.paidcategory').text(),
        	Price : removeCommasFromNumber($('#paidbody tr#new').find('.paidprice').text()),
        	AssignType : $('#paidbody tr#new').find('.paidassignType').text(),
        	Maeipsa : $('#paidbody tr#new').find('.paidmapsa').text(),
        	CardName : $('#paidbody tr#new').find('.paidcardtype').text(),
			AssignNo : $('#paidbody tr#new').find('.paidassignN').text(),
			Pos : $('#paidbody tr#new').find('.POS').text(),
			SignPad : $('#paidbody tr#new').find('.signpad').text(),
			Halbu : $('#paidbody tr#new').find('.Halbu').text(),
			SaleTime : $('#paidbody tr#new').find('.SaleTime').text(),
        	PaidGroupSaleNo : $('#DBPKID').val(),
        	OID : $('#paidbody tr#new').find('.OID').text(),
			TID : $('#paidbody tr#new').find('.TID').text()
        },
        success: function(success) {	
        	
        	if(option == 'account'){
        		$.ajax({
        	        type: "POST", 
        	        url: "ReceiptInsert", 
        	        dataType : 'json',
        	        data: { 
        	        	PKID : $(previousRow).find('.PKID').text()
        	        },
        	        error: function(xhr, status, error) {
        	       	 console.log("Status: " + status);
        	         console.log("Error: " + error);
        	        }
        		});
        	}
        	
        	$('#paidbody tr#new').attr('id','etcprice');
        	sortChange();
        	
        	$.ajax({
        		type: "POST", 
        		url: "UpdExpenseSale", 
                dataType : 'json',
                data: { 
                	PKID : $('#DBPKID').val(),
                	ExpenseID : $('#expenseid').val(),
                	InOut : $('input[name=expensetype]:checked').val(),
                	SaleDate : $('#saledate').val(),
                	Price : $('#DBPrice').val(),
                	MemberID : $('#memberid').val(),
                	ExpCnt : $('#expcnt').val(),
                	TotalPrice : removeCommasFromNumber($('#totalprice').val()),
                	Misu : removeCommasFromNumber($('#misu').val()),
                	PaidPrice : removeCommasFromNumber($('#paidprice').val()),
                	Note : $('#note').val()
                },
                success: function(data) {
                	window.opener.location.reload();
                	window.location.href = 'etcPaidSelectF.do?PKID='+$('#DBPKID').val();
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

function CancelInsert() {
	$.ajax({
        type: "POST", 
        url: "tblpaidinsert", 
        dataType : 'json',
        data: { 
        	FPKID : $('#DBPKID').val(),
        	SiteCode : $('#sitecode').val(),
        	SaleDate : getCurrentDate(),
        	RealSaleDate : $('#paidbody tr#new').find('.paiddate').text(),
        	SaleType : '기타비용',
        	PayType : $('#paidbody tr#new').find('.paidcategory').text(),
        	Price : removeCommasFromNumber($('#paidbody tr#new').find('.paidprice').text()),
        	AssignType : $('#paidbody tr#new').find('.paidassignType').text(), 
        	Maeipsa : $('#paidbody tr#new').find('.paidmapsa').text(), 
        	CardName : $('#paidbody tr#new').find('.paidcardtype').text(),
			AssignNo : $('#paidbody tr#new').find('.paidassignN').text(),
			Pos : $('#paidbody tr#new').find('.POS').text(),
			SignPad : $('#paidbody tr#new').find('.signpad').text(),
			Halbu : $('#paidbody tr#new').find('.Halbu').text(),
			SaleTime : $('#paidbody tr#new').find('.SaleTime').text(),
        	PaidGroupSaleNo : $('#DBPKID').val(),
        	OID : $('#paidbody tr#new').find('.OID').text(),
			TID : $('#paidbody tr#new').find('.TID').text(),
			OriginPKID : $(previousRow).find('.PKID').text()
        },
        success: function(success) {	
        	
        	$('#paidbody tr#new').attr('id','etcprice');
        	sortChange();
        	
        	$.ajax({
        		type: "POST", 
        		url: "UpdExpenseSale", 
                dataType : 'json',
                data: { 
                	PKID : $('#DBPKID').val(),
                	ExpenseID : $('#expenseid').val(),
                	InOut : $('input[name=expensetype]:checked').val(),
                	SaleDate : $('#saledate').val(),
                	Price : $('#DBPrice').val(),
                	MemberID : $('#memberid').val(),
                	ExpCnt : $('#expcnt').val(),
                	TotalPrice : removeCommasFromNumber($('#totalprice').val()),
                	Misu : removeCommasFromNumber($('#misu').val()),
                	PaidPrice : removeCommasFromNumber($('#paidprice').val()),
                	Note : $('#note').val()
                },
                success: function(data) {
                	window.opener.location.reload();
                	window.location.href = 'etcPaidSelectF.do?PKID='+$('#DBPKID').val();
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

<%-- 현금 영수증 변환--%>
function cashReceiptChange(){
	var paidcategory = $(previousRow).find('.paidcategory').text();
	var paidprice = removeCommasFromNumber($(previousRow).find('.paidprice').text());
	var paidassignType = $(previousRow).find('.paidassignType').text();
	
	if(paidcategory == "현금"){
		if(paidassignType == ''){
			var url = "${pageContext.request.contextPath}/etc/ChangeReceipt.do?payprice=" + paidprice +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+$('#expenseid').val()+'&pkid='+$('#DBPKID').val();
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
		}else{
			$('#resultmessage').html('결제가 취소된 금액입니다.<br>확인해주세요.');
			$('.modal-footer').empty();
			var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			$('.modal-footer').append(cancelbutton);
			$('#modalButton').click();
			modalcheck = true;
			return false;
		}
	}else{
		$('#resultmessage').html('현금결제가 아닙니다.<br>확인해주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
		$('#modalButton').click();
		modalcheck = true;
		return false;
	}
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

function Cancel() {
	$('#resultmessage').html('결제 취소하시겠습니까?');
  	$('.modal-footer').empty();
  	var okaybutton = '<button class="btn btn-primary" type="button" data-bs-dismiss="modal" onclick="payCancel()">예</button>';
  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">아니오</button>';
  	$('.modal-footer').append(okaybutton);
  	$('.modal-footer').append(cancelbutton);
    $('#modalButton').click();
    modalcheck = true;
}

function payCancel() {
    if (previousRow !== null) {
    	
    	var PKID = $(previousRow).find('.PKID').text();
    	var paidcategory = $(previousRow).find('.paidcategory').text(); 
        var paidPriceText = removeCommasFromNumber($(previousRow).find('.paidprice').text());
        var paidassignType = '';
        var paidcardtype = $(previousRow).find('.paidcardtype').text();
        var paidmapsa = $(previousRow).find('.paidmapsa').text();
        var paidassignN = $(previousRow).find('.paidassignN').text();
        var SaleTime = $(previousRow).find('.SaleTime').text();
        var OID = $(previousRow).find('.OID').text();
        var TID = $(previousRow).find('.TID').text();
        if(paidcategory == '보증금'){
        	depositeRefund();	
        	return false;
        }
        
        if($(previousRow).find('.paidassignType').text().indexOf('취소') !== -1){
        	alert('이미 취소된 건입니다.');
    	    return false;
        }
        
        if($(previousRow).find('.paidassignType').text().indexOf('환불') !== -1){
        	$('#resultmessage').html('이미 환불된 건입니다.');
    	  	$('.modal-footer').empty();
    	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
    	  	$('.modal-footer').append(cancelbutton);
    	    $('#modalButton').click();
    	    modalcheck = true;
    	    return false;
        }
        
        $.ajax({
            type: "POST", 
            url: "OriginPKIDFind", 
            dataType : 'json',
            data: { 
            	OriginPKID : PKID
            },
            success: function(data) {	
            	if(data == '0'){
            		alert("세션이 만료되었습니다.다시 로그인해주세요.");
            		window.opener.location.reload();
                    window.close();
            	}else if(data == '-1'){
            		alert('이미 취소된 건입니다.');
            	    return false;
            	}else{
            		switch (paidcategory) {
            		case '현금': paidassignType = '현금취소';
            			break;
            		case '신용승인': paidassignType = '신용취소';
        				break;	
            		default:
            			break;
            		}
                    
            		if(paidcategory == "계좌이체"){
            			var url = "${pageContext.request.contextPath}/etc/AccountCancel.do?payprice=" +formatNumberWithCommas(paidPriceText)+"&CardName="+paidcardtype+"&Maeipsa="+paidmapsa+"&AssignNo="+paidassignN+"&paidCategory="+paidcategory+"&SaleTime=" +SaleTime+"&OID="+OID+"&TID="+TID+"&MemberID="+$('#memberid').val()+"&pkid="+PKID;
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
            		    
            		    return false;
            		}else if(paidcategory != '현금'){
            			var url = "${pageContext.request.contextPath}/etc/CancelPaid.do?payprice=" +formatNumberWithCommas(paidPriceText)+"&CardName="+paidcardtype+"&Maeipsa="+paidmapsa+"&AssignNo="+paidassignN+"&paidCategory="+paidcategory+"&SaleTime=" +SaleTime+"&OID="+OID+"&TID="+TID+"&MemberID="+$('#memberid').val()+"&pkid="+PKID;
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
            		    
            		    return false;
            		}
            		
                    if (paidPriceText > 0) {
                        paidPriceText = -paidPriceText;
                    } else if (paidPriceText < 0) {
                        paidPriceText = Math.abs(paidPriceText);
                    }
                    
            		var paidPrice = formatNumberWithCommas(paidPriceText);

                        	
                   	var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id="new"></tr>');
               		newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
               		newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">'+paidcategory+'</td>');
               		newRow.append('<td class="paidprice align-middle white-space-nowrap text-start fw-bold text-end">' + paidPrice + '</td>');
               		newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + paidassignType + '</td>');
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
               		sortChange();
               		CancelInsert();
            	}
            },
            error: function(xhr, status, error) {
           	 console.log("Status: " + status);
             console.log("Error: " + error);
            }
    	});
    } else {
    	alert('취소할 건을 선택해주세요');
    }
}

<%-- 영수증 재발행 --%>
function reReceipt(){
	var PKID = $(previousRow).find('.PKID').text();
	if(PKID == ''){
		$('#resultmessage').html('영수증을 출력할 행을 선택해주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	var myWindow = window.open("${pageContext.request.contextPath}/etc/ReReceipt.do?PKID="+PKID, "MsgWindow", "width=325,height=800");
	myWindow.print();
}
</script>
</html>
<%@ include file="../../include/foot.jsp" %>