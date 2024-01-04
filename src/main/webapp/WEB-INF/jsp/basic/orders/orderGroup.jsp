<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>

<script type="text/javascript">


</script>


<div class="p-0">
	<div class="mb-9 col-lg-9">
		<div class="row g-2 mb-4">
		    <div class="col-auto">
		      <h2 class="mb-0">일일입장 분류 관리</h2>
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
					<a class="btn btn-info px-5" id="insert" href="${pageContext.request.contextPath}/OrderGpInsert.do" title="신규">신규(F2)</a>
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
						<col style="width:20px">
						<col style="width:20px">
						<col style="width:20px">
						<col style="width:20px">
						<col style="width:20px">
						<col style="width:20px">
					</colgroup>
					<thead>
						<tr>
							<th class="sort align-middle pe-1 text-center" scope="col">코드</th>
							<th class="sort align-middle pe-1 text-center" scope="col">분류명</th>
							<th class="sort align-middle pe-1 text-center" scope="col">정렬순서</th>
							<th class="sort align-middle pe-1 text-center" scope="col">정원</th>
							<th class="sort align-middle pe-1 text-center" scope="col">평일주차시간</th>
							<th class="sort align-middle pe-1 text-center" scope="col">주말주차시간</th>
						</tr>
					</thead>
					<tbody class="list">
						<c:forEach items="${list }" var="list">
							<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center">
								<td class="pkid align-middle py-3 ">
									<c:out value="${list.pkid }"/>
								</td>
								<td class="groupName align-middle white-space-nowrap ">
									<form action="<c:url value='/OrderGroupUpd.do'/>" method="post">
										<input type="hidden" name="SiteCode" value="${list.siteCode }">
										<input type="hidden" name=pkid value="${list.pkid }">
										<input type="submit" name="GroupName" class="fw-bold" value="<c:out value="${list.groupName }"/>" style="border: 0px solid #e0e0e0; backGround-color: white;"> 
									</form>
								</td>
								<td class="sortOrder align-middle white-space-nowrap ">
									<c:out value="${list.sortOrder }"/>
								</td>
								<td class="groupJungWon align-middle white-space-nowrap ">
									<c:out value="${list.groupJungWon }"/>
								</td>
								<td class="parkingTimeWeek align-middle white-space-nowrap ">
									<c:out value="${list.parkingTimeWeek }"/>
								</td>
								<td class="parkingTimeWeekend align-middle white-space-nowrap ">
									<c:out value="${list.parkingTimeWeekend }"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>