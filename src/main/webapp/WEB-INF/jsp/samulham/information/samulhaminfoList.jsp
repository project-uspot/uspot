<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<div class="p-0">
	<div class="mb-9 col-lg-9">
		<div class="row g-2 mb-4">
		    <div class="col-auto">
		      <h2 class="mb-0">사물함 분류정보 관리 </h2>
		    </div>
		</div>
		<div class="mb-4">
			<div class="row g-3">
				<div class="col-auto scrollbar overflow-hidden-y flex-grow-1">
				</div>
				<div class="col-auto">
					<a class="btn btn-info px-5" href="${pageContext.request.contextPath}/OrderGpInsert.do" title="등록">등록</a>
				</div>
			</div>
		</div>
		<div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1">
			<div class="table-responsive scrollbar-overlay mx-n1 px-1">
				<table class="table table-sm fs--1 mb-1">
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
							<th class="sort align-middle pe-1 text-center" scope="col" style="width: 40px;">분류</th>
							<th class="sort align-middle pe-1 text-center" scope="col" style="width: 40px;">위 치</th>
							<th class="sort align-middle pe-1 text-center" scope="col">보증금</th>
							<th class="sort align-middle pe-1 text-center" scope="col">사용료</th>
							<th class="sort align-middle pe-1 text-center" scope="col" style="width: 60px;">기준개월</th>
							<th class="sort align-middle pe-1 text-center" scope="col" style="width: 72px;">신규접수일</th>
							<th class="sort align-middle pe-1 text-center" scope="col">재접수일</th>
							<th class="sort align-middle pe-1 text-center" scope="col">사용기간</th>
							<th class="sort align-middle pe-1 text-center" scope="col">정렬순서</th>
							<th class="sort align-middle pe-1 text-center" scope="col">단수</th>
						</tr>
					</thead>
					<tbody class="list">
						<c:forEach items="${list}" var="list">
							<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" 
							onclick="openpop(${list.PLockergroupid})" style="cursor:pointer;">
								<td class="pkid align-middle py-3 ">
									<c:out value="${list.PLockergroupname}"/>
								</td>
								<td class="groupName align-middle white-space-nowrap ">
									<c:out value="${list.PLockerlocation}"/>
								</td>
								<td class="sortOrder align-middle white-space-nowrap ">
									<c:out value="${list.PLockerdeposit}"/>
								</td>
								<td class="groupJungWon align-middle white-space-nowrap ">
									<c:out value="${list.PLockerprice}"/>
								</td>
								<td class="parkingTimeWeek align-middle white-space-nowrap ">
									<c:out value="${list.PLockermonth}"/>
								</td>
								<td class="parkingTimeWeekend align-middle white-space-nowrap ">
									<c:out value="${list.jungsinewdate}"/>
								</td>
								<td class="parkingTimeWeekend align-middle white-space-nowrap ">
									<c:out value="${list.jungsiredate}"/>
								</td>
								<td class="parkingTimeWeekend align-middle white-space-nowrap ">
									<c:out value="${list.jungsifromtodate}"/>
								</td>
								<td class="parkingTimeWeekend align-middle white-space-nowrap ">
									<c:out value="${list.sortorder}"/>
								</td>
								<td class="parkingTimeWeekend align-middle white-space-nowrap ">
									<c:out value="${list.dancnt}"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function openpop(groupid) {
		var url = "samulhaminfodetail?lockergroupid="+groupid;
		window.open(url, "_blank_","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=900, height=700");
	}
</script>