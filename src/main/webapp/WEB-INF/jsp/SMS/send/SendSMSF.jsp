<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMS</title>
</head>
<body style="overflow: hidden;">
    <div class="card h-100 mb-1">
        <div class="card-body mb-n4 mt-n3">
            <div class="col-auto">
        		<div class="row justify-content-between">
        			<div class="col-auto">
						<h3 class="mb-3 pt-2">SMS</h3>
            		</div>
            		<div class="col-auto">
						<button class="btn btn-success" type="button" onclick="etcsave()">저장</button>
						<button class="btn btn-soft-danger" type="button">영수증</button>
            		</div>
        		</div>
        	</div>
        </div>
    </div>
    <div class="row">
	    <div class="card h-100 mb-1 w-20 ms-3 me-1" style="width: 673px;">
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
		<div class="card h-100 mb-1 w-20 me-1" style="width: 570px;">
        	<div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 264px;">
        		<div class="col-md-5">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">분류항목</span>
						<select class="form-select" id="expensegroupid" aria-describedby="basic-addon1">
							<option value="0"></option>
							<c:forEach var="group" items="${grouplist}">
								<option value="${group.expenseGroupID}">${group.expenseGroupName}</option>
                        	</c:forEach>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5" style="width: 255px;">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">항&emsp;&emsp;목</span>
							<select class="form-select" id="expenseid" aria-describedby="basic-addon1">
							</select>
						</div>
					</div>
					<div class="col-auto mt-1 mx-n4">
						X
					</div>
					<div class="col-auto">
						<div class="input-group input-group-sm">
							<input class="form-control form-control-sm" type="number" id="expcnt" name="expcnt" min="1" value="1" style="width: 71px;text-align:right;"/>
							<span class="input-group-text" id="basic-addon2">건</span>
						</div>
					</div>
				</div>
				<div class="col-auto mt-n2">
					<div class="input-group input-group-sm">
						<span class="input-group-text me-3 align-self-xl-end" id="basic-addon1" style="width: 85px;">영수증인쇄</span>
						<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
							<input class="form-check-input" id="expensetype1" type="radio" name="expensetype" value="I" checked="checked" onclick="return(false);"/>
							<label class="form-check-label" for="inlineRadio1">수입</label>
						</div>
						<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
							<input class="form-check-input" id="expensetype2" type="radio" name="expensetype" value="O" onclick="return(false);"/>
							<label class="form-check-label" for="inlineRadio2">지출</label>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">매출일자</span>
						<input class="form-control" type="date" aria-describedby="basic-addon1" id="saledate" name="saledate" style="width: 130px;"/>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5" style="width: 255px;">
						<div class="input-group input-group-sm">
							<span class="input-group-text">금&emsp;&emsp;액</span>
							<input class="form-control" type="text" id="defprice" name="defprice" style="text-align: right;" readonly="readonly"/>
							<input type="hidden" id="totalprice" name="totalprice">
							<input type="hidden" id="misu" name="misu">
							<input type="hidden" id="paidprice" name="paidprice">
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
						<input class="form-control" type="text" id="note" name="note" maxlength="100"/>
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
                        	</tbody>
                    	</table>
                    </div>
            	</div>
	    	</div>
	    </div>
	    <div class="card w-35 h-100 mb-1 w-20 me-1" style="width: 491px; ">
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
	    	</div>
	    </div>
	</div>
</body>
</html>
<%@ include file="../../include/foot.jsp" %>