<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>

<script type="text/javascript">


</script>

<div class="p-0">
	<div class="mb-9 ">
		<div class="row g-2 mb-4">
		    <div class="col-auto">
		      <h2 class="mb-0">할인 유형관리</h2>
		    </div>
		</div>
		<div class="mb-4">
			<div class="row g-3">
				<div class="col-auto">
					<div class="search-box">
						<form class="position-relative" data-bs-toggle="search" data-bs-display="static">
							<input class="form-control search-input search" type="search" placeholder="Search customers" aria-label="Search" />
							<span class="fas fa-search search-box-icon"></span>
						</form>
					</div>
				</div>
				<div class="col-auto scrollbar overflow-hidden-y flex-grow-1">
				</div>
				<div class="col-auto">
					<button class="btn btn-info px-5" onclick="location.href='insertDcType.do'" id="insert" title="신규">신규(F2)</button>
					<button class="btn btn-success" type="button" id="excelButton" onclick="fnExcelReport('myTable','할인 유형관리')"><span class="far fa-file-excel"></span>&emsp;엑셀로 저장</button>
					<script>
					if('${authyn.ins}' == 'N'){
						$('#insert').attr('disabled','disabled');
					}
					if('${authyn.excel}' == 'N'){
						$('#excelButton').attr('disabled','disabled');
					}
						// 키보드 이벤트 감지
						document.addEventListener('keydown', function(event) {
							if('${authyn.ins}' == 'N'){
								return false;
							}
							if (event.key === 'F2') { // F2 키를 눌렀을 때
								event.preventDefault(); // 기본 동작 방지
								location.href = 'insertDcType.do';
							}
						});
					</script>
				</div>
			</div>
		</div>
		<div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1">
			<div class="table-responsive scrollbar-overlay mx-n1 px-1">
				<table class="table table-sm fs--1 mb-1" id="myTable">
					<colgroup>
						<col style="width:25px">
						<col style="width:30px">
						<col style="width:30px">
						<col style="width:30px">
						<col style="width:30px">
						<col style="width:30px">
						<col style="width:30px">
						<col style="width:30px">
						<col style="width:50px">
						<col style="width:40px">
						<col style="width:60px">
					</colgroup>
					<thead>
						<tr>
							<th class="sort align-middle pe-1 text-center" scope="col">코드</th>
							<th class="sort align-middle pe-1 text-center" scope="col">할인명</th>
							<th class="sort align-middle pe-1 text-center" scope="col">구분</th>
							<th class="sort align-middle pe-1 text-center" scope="col">할인금액</th>
							<th class="sort align-middle pe-1 text-center" scope="col">할인율</th>
							<th class="sort align-middle pe-1 text-center" scope="col">할인대상</th>
							<th class="sort align-middle pe-1 text-center" scope="col">연관회원</th>
							<th class="sort align-middle pe-1 text-center" scope="col">정렬순서</th>
							<th class="sort align-middle pe-1 text-center" scope="col">재등록할인불가 여부</th>
							<th class="sort align-middle pe-1 text-center" scope="col">행정정보감면</th>
							<th class="sort align-middle pe-1 text-center" scope="col">재등록감면불가 제한일수</th>
						</tr>
					</thead>
					<tbody class="list">
						<c:forEach items="${list }" var="list">
							<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center">
								<td class="dcid align-middle py-3 ">
									<c:out value="${list.dcid }"/>
								</td>
								<td class="dcName align-middle white-space-nowrap ">
									<form action="<c:url value='/DCTypeUpd.do'/>" method="post">
										<input type="hidden" name ="SiteCode" value="${list.siteCode }" >
										<input type="hidden" name ="dcid" value="${list.dcid }" >
										<input type="submit" name="dcName" class="fw-bold" value="${list.dcName }" style="border: 0px solid #e0e0e0; backGround-color: white;">
									</form>
								</td>
								<td class="dcType align-middle white-space-nowrap ">
									<c:out value="${list.dcType }"/>
								</td>
								<td class="dcType align-middle white-space-nowrap ">
									<fmt:parseNumber value="${list.price}" var="price"/>
									<fmt:formatNumber value="${price}" pattern="#,###"/>
								</td>
								<td class="rate align-middle white-space-nowrap ">
									<c:out value="${list.rate }"/>
								</td>
								<td class="applyFamily align-middle white-space-nowrap ">
									<c:out value="${list.applyFamily }"/>
								</td>
								<td class="applyFamilyCnt align-middle white-space-nowrap ">
									<c:out value="${list.applyFamilyCnt }"/>
								</td>
								<td class="sortOrder align-middle white-space-nowrap ">
									<c:out value="${list.sortOrder }"/>
								</td>
								<td class="reDCNoYN align-middle white-space-nowrap ">
									<c:out value="${list.reDCNoYN }"/>
								</td>
								<td class="pissCD align-middle white-space-nowrap ">
									<c:out value="${list.pissCD }"/>
								</td>
								<td class="reDCNoChkDayCnt align-middle white-space-nowrap ">
									<c:out value="${list.reDCNoChkDayCnt }"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</table>
			</div>
		</div>
		<%-- <div class="form-actions">
			<a class="btn" href="${pageContext.request.contextPath}/DCTypeUpdOK.do" style="float: right; margin: 0 0 0 3px;" title="목록">목록</a><!-- 목록 -->
			<a class="btn btn-info" href="${pageContext.request.contextPath}/insertDcType.do" style="float: right; margin: 0 0 0 3px;" title="등록">등록</a><!-- 등록 -->
		</div> --%>
	</div>
</div>