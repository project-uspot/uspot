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
		      <h2 class="mb-0">기간결산</h2>
		    </div>
		</div>
		<div class="mb-1">
			<div class="row g-6">
				<div class="card h-100 col-md-7">
					<div class="card-body">
						<div class="row g-3">
							<!-- <h6 class="text-700 h-25">강좌</h6> -->
							<div class="gap-2 col-md-4 ">
								<div class="input-group input-group mb-4" style="margin-top: 35px;">
									<h6 class="col-md-3 pt-3">사업장:</h6>
									<input class="form-control col-md-1" id="sitename" type="text"
										name="sitename" readonly="readonly" maxlength="8"
										aria-describedby="SiteCodespan" value="${sitename}" /> <span
										class="input-group-text" id="SiteCodespan"
										style="cursor: pointer;" onclick="execDaumPostcode()"><span
										data-feather="search"></span></span>
								</div>
							</div>
							<div class="d-grid gap-2 col-md-4">
								<h6 class="text-700 h-25">만기일자</h6>
								<div class="p-2">
									<input class="form-control" id="autoSizingInput" type="date"/>
								</div>
								<div class="p-2">
									<input class="form-control" id="autoSizingInput" type="date"/>
								</div>
							</div>
							<div class="d-grid gap-2 col-md-4">
								<div class="form-check">
									<input class="form-check-input" id="refund" type="checkbox" value="" />
									<label class="form-check-label" for="refund">강습 환불정보 포함</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="card" type="checkbox" value="" />
									<label class="form-check-label" for="card">신용카드 포함</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="cash" type="checkbox" value="" />
									<label class="form-check-label" for="cash">현금 포함</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="col-sm-6 col-md-3 mb-2">
	               <div class="form-check" style="padding-top: 15px;">
	                  <input class="form-check-input" id="isdeletecheck" type="checkbox" name="isdeletecheck"/>
	                  <label class="form-check-label text-900 fs-0" for="fragileCheck">삭제데이터보기</label>
	                  <input type="hidden" name="IsDelete" id="isdelete">
	               </div>
	            </div> -->
	            <div class="col-auto">
	               <button class="btn btn-outline-info" type="button" >조회</button>
	               <!-- <button class="btn btn-success" type="button" data-bs-toggle="modal" id="modal" name="modify" data-bs-target="#updateModal" >수정</button> -->
	            </div>
			</div>
		</div>
     	<div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1" >
       		<div class="table-responsive scrollbar-overlay mx-n1 px-1">
				<table class="table table-sm fs--1 mb-1 table-hover table-bordered" id="itemTable">
					<thead class="itemcodelist">
						<tr>
							<th rowspan="3" class="sort align-middle pe-1 text-center" scope="col" >사업장명</th>
							<th rowspan="3" class="sort align-middle pe-1 text-center" scope="col">분류</th>
							<th rowspan="3" class="sort align-middle pe-1 text-center" scope="col">강좌명</th>
							<th rowspan="3" class="sort align-middle pe-1 text-center" scope="col">단가</th>
							<th colspan="16" class="sort align-middle pe-1 text-center" scope="col">내역</th>
						</tr>
						<tr>
							<th colspan="4" class="sort board border-github align-middle pe-1 text-center" scope="col">현금</th>
							<th colspan="4" class="sort board border-github align-middle pe-1 text-center" scope="col">계좌</th>
							<th colspan="4" class="sort board border-github align-middle pe-1 text-center" scope="col">카드</th>
							<th colspan="4" class="sort board border-github align-middle pe-1 text-center" scope="col">총계</th>
						</tr>
						<tr>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">건수</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">공급가액</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">부과세</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">금액</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">건수</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">공급가액</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">부과세</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">금액</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">건수</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">공급가액</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">부과세</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">금액</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">건수</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">공급가액</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">부과세</th>
							<th class="sort board border-github align-middle pe-1 text-center" scope="col">금액</th>
						</tr>
					</thead>
					<tbody class="list" id="tbody">
						<c:forEach items="${list}" var="list">
							<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" data-bs-toggle="modal"
							data-bs-target="#updateModal" id="updateTR01" style="cursor:pointer;"  >
								<td class="groupName align-middle py-3 " id="GroupName" data-item-id=${list.groupID } >
									<c:out value="${list.groupName} "/>
								</td>
								<td class="jsType align-middle white-space-nowrap ">
									<c:choose>
										<c:when test="${list.jsType == '0'}">정시접수</c:when>
										<c:when test="${list.jsType == '1'}">수시접수</c:when>
										<c:when test="${list.jsType == '2'}">기간지정</c:when>
									</c:choose>
								</td> 
								<td class="pkid align-middle py-3 ">
									<c:out value="${list.fromDate }"/> ~ <c:out value="${list.toDate }"/>
								</td>
								<td class="pkid align-middle py-3 ">
									<c:out value="${fn:substring(list.jungSi1,0,10)}"/> <c:out value="${list.jungSi1STime }"/>
										~ 
									<c:out value="${fn:substring(list.jungSi1,11,21)}"/> <c:out value="${list.jungSi1ETime }"/> 
								</td>
								<td class="pkid align-middle py-3 ">
									<c:out value="${fn:substring(list.jungSi2,0,10)}"/> <c:out value="${list.jungSi2STime }"/>
									~ 
									<c:out value="${fn:substring(list.jungSi2,11,21)}"/> <c:out value="${list.jungSi2ETime }"/> 
								</td>
								<td class="pkid align-middle py-3 ">
									<c:out value="${fn:substring(list.jungSi3,0,10)}"/> ~ <c:out value="${fn:substring(list.jungSi3,11,21)}"/> 
								</td>
								<td class="jungSi1Inlive align-middle py-3 ">
									<c:out value="${list.jungSi1Inlive}"/> 
								</td>
								<td class="sortOrder align-middle py-3 ">
									<c:out value="${list.sortOrder}"/> 
								</td>
								<td class="pkid align-middle py-3 ">
									<c:out value="${list.againMonth}"/> 
								</td>
								<td class="pkid align-middle py-3 ">
									<c:out value="${list.webYN}"/> 
								</td>
								<td class="pkid align-middle py-3 ">
									<c:out value="${list.itemRejectCnt}"/> 
								</td>
								<td class="pkid align-middle py-3 ">
									<c:out value="${list.monthSelNo}"/> 
								</td>
								<td class="pkid align-middle py-3 ">
									<c:out value="${list.jungSiLotteryFromDate}"/> ~ <c:out value="${list.jungSiLotteryToDate}"/> 
								</td>
								<td class="pkid align-middle py-3 ">
									<c:out value="${list.jungSiLotteryDate}"/> 
								</td>
								<td class="pkid align-middle py-3 ">
									<c:out value="${list.jungSiLotteryPayFromDate}"/> ~ <c:out value="${list.jungSiLotteryPayToDate}"/> 
								</td>
								<td class="pkid align-middle py-3 ">
									<c:out value="${list.jungSiLotteryAddFromDate}"/> ~ <c:out value="${list.jungSiLotteryAddToDate}"/> 
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div> 
	</div>
</div>

<script>
    document.getElementById('refund').addEventListener('change', function() {
        var cardCheckbox = document.getElementById('card');
        var cashCheckbox = document.getElementById('cash');

        if (this.checked) {
            cardCheckbox.disabled = true;
            cashCheckbox.disabled = true;
        } else {
            cardCheckbox.disabled = false;
            cashCheckbox.disabled = false;
        }
    });
</script>