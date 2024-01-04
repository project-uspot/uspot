<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>

<script type="text/javascript">


</script>


<div class="p-0">
	<div class="mb-9">
		<div class="row g-2 mb-4">
		    <div class="col-auto">
		      <h2 class="mb-0">일일입장 메뉴관리</h2>
		    </div>
		</div>
		<div class="mb-4">
			<div class="row g-3">
				<!-- <div class="col-auto">
					<div class="search-box">
						<form class="position-relative" data-bs-toggle="search" data-bs-display="static">
							<input class="form-control search-input search" type="search" placeholder="Search customers" aria-label="Search" />
							<span class="fas fa-search search-box-icon"></span>

						</form>
					</div>
				</div> -->
				<div class="col-auto scrollbar overflow-hidden-y flex-grow-1">
				</div>
				<div class="col-auto">
					<a class="btn btn-info px-5" href="${pageContext.request.contextPath}/OrderItemInsert.do" id="insert" title="신규">신규(F2)</a>
					<script>
						// 키보드 이벤트 감지
						document.addEventListener('keydown', function(event) {
							if (event.key === 'F2') { // F2 키를 눌렀을 때
								event.preventDefault(); // 기본 동작 방지
								window.location.href = document.getElementById('insert').getAttribute('href'); // 링크 주소로 이동
							}
						});
					</script>
				</div>
			</div>
		</div>
		<div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1">
			<div class="table-responsive scrollbar-overlay mx-n1 px-1">
				<table class="table table-sm fs--1 mb-1 table-hover table-bordered">
					<colgroup>
						<col style="width:35px">
						<col style="width:35px">
						<col style="width:35px">
						<col style="width:35px">
						<col style="width:35px">
						<col style="width:35px">
						<col style="width:35px">
						<col style="width:35px">
						<col style="width:35px">
						<col style="width:25px">
						<col style="width:25px">
						<col style="width:25px">
						<col style="width:25px">
						<col style="width:25px">
						<col style="width:25px">
						<col style="width:25px">
						<col style="width:45px">
						<col style="width:75px">
						<col style="width:35px">
						<col style="width:45px">
					</colgroup>
					<thead>
						<tr>
							<th class="sort align-middle pe-1 text-center" scope="col">분류명</th>
							<th class="sort align-middle pe-1 text-center" scope="col">메뉴명</th>
							<th class="sort align-middle pe-1 text-center" scope="col">시작시간</th>
							<th class="sort align-middle pe-1 text-center" scope="col">종료시간</th>
							<th class="sort align-middle pe-1 text-center" scope="col">이용구분</th>
							<th class="sort align-middle pe-1 text-center" scope="col">성별</th>
							<th class="sort align-middle pe-1 text-center" scope="col">할인</th>
							<th class="sort align-middle pe-1 text-center" scope="col">이용금액</th>
							<th class="sort align-middle pe-1 text-center" scope="col">정원</th>
							<th class="sort align-middle pe-1 text-center" scope="col">일</th>
							<th class="sort align-middle pe-1 text-center" scope="col">월</th>
							<th class="sort align-middle pe-1 text-center" scope="col">화</th>
							<th class="sort align-middle pe-1 text-center" scope="col">수</th>
							<th class="sort align-middle pe-1 text-center" scope="col">목</th>
							<th class="sort align-middle pe-1 text-center" scope="col">금</th>
							<th class="sort align-middle pe-1 text-center" scope="col">토</th>
							<th class="sort align-middle pe-1 text-center" scope="col">정렬순서</th>
							<th class="sort align-middle pe-1 text-center" scope="col">무인발권기사용</th>
							<th class="sort align-middle pe-1 text-center" scope="col">약칭</th>
							<th class="sort align-middle pe-1 text-center" scope="col">출입업장</th>
						</tr>
					</thead>
					<tbody class="list">
						<c:forEach items="${list }" var="list">
							<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center">
								<td class="groupName align-middle py-3 ">
									<c:out value="${list.groupName }"/>
								</td>
								<td class="itemName align-middle white-space-nowrap ">
									<form action="<c:url value='/OrderItemUpd.do'/>" method="post">
										<input type="hidden" name="SiteCode" value="${list.siteCode }">
										<input type="hidden" name=pkid value="${list.pkid }">
										<input type="submit" class="fw-bold" name="ItemName" value="<c:out value="${list.itemName }"/>" style="border: 0px solid #e0e0e0; backGround-color: white;"> 
									</form>
								</td>
								<td class="fromTime align-middle white-space-nowrap ">
									<c:out value="${list.fromTime }"/>
								</td>
								<td class="toTime align-middle white-space-nowrap ">
									<c:out value="${list.toTime }"/>
								</td>
								<td class="adultGBN align-middle white-space-nowrap ">
									<c:out value="${list.adultGBN }"/>
								</td>
								<td class="gender align-middle white-space-nowrap ">
									<c:out value="${list.gender }"/>
								</td>
								<td class="dcType align-middle white-space-nowrap ">
									<c:out value="${list.dcType }"/>
								</td>
								<td class="price align-middle white-space-nowrap ">
									<fmt:parseNumber value="${list.price}" var="price"/>
									<fmt:formatNumber value="${price}" pattern="#,###"/>
								</td>
								<td class="jungwon align-middle white-space-nowrap ">
									<c:out value="${list.jungwon }"/>
								</td>
								<td class="sun align-middle white-space-nowrap ">
									<input type="checkbox" name="Sun" value="1" <c:if test="${list.sun eq '1' }">checked</c:if>>
								</td>
								<td class="mon align-middle white-space-nowrap ">
									<input type="checkbox" name="Mon" value="1" <c:if test="${list.mon eq '1' }">checked</c:if>>
								</td>
								<td class="tue align-middle white-space-nowrap ">
									<input type="checkbox" name="Tue" value="1" <c:if test="${list.tue eq '1' }">checked</c:if>>
								</td>
								<td class="wed align-middle white-space-nowrap ">
									<input type="checkbox" name="Wed" value="1" <c:if test="${list.wed eq '1' }">checked</c:if>>
								</td>
								<td class="thu align-middle white-space-nowrap ">
									<input type="checkbox" name="Thu" value="1" <c:if test="${list.thu eq '1' }">checked</c:if>>
								</td>
								<td class="fri align-middle white-space-nowrap ">
									<input type="checkbox" name="Fri" value="1" <c:if test="${list.fri eq '1' }">checked</c:if>>
								</td>
								<td class="sat align-middle white-space-nowrap ">
									<input type="checkbox" name="Sat" value="1" <c:if test="${list.sat eq '1' }">checked</c:if>>
								</td>
								<td class="sortOrder align-middle white-space-nowrap ">
									<c:out value="${list.sortOrder }"/>
								</td>
								<td class="kioskYN align-middle white-space-nowrap ">
									<c:out value="${list.kioskYN }"/>
								</td>
								<td class="shortName align-middle white-space-nowrap ">
									<c:out value="${list.shortName }"/>
								</td>
								<td class="upJang align-middle white-space-nowrap ">
									<c:out value="${list.upJang }"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>