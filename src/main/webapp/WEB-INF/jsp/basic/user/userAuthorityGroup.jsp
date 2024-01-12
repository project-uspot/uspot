<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>

<div class="p-0">
	<div class="mb-9">
		<div class="row g-2 mb-4">
		    <div class="col-auto">
		      <h2 class="mb-0">사용자별 권한그룹 지정 </h2>
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
			</div>
        </div>
        <div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1">
			<div class="table-responsive scrollbar-overlay mx-n1 px-1">
				<table class="table table-sm fs--1 mb-1">
					<colgroup>
						<col style="width:70px;">
						<col style="width:40px;" >
						<col style="width:25px;" >
						<col style="width:25px;" >
						<col style="width:25px;" >
						<col style="width:25px;" >
						<col style="width:25px;" >
						<col style="width:25px;" >
						<col style="width:25px;" >
						<col style="width:25px;" >
						<col style="width:25px;" >
						<col style="width:25px;" >
					</colgroup>
					<thead>
						<tr>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center">사업장명</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center">사원번호</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center">사원명</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center">사용자ID</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center">사용자그룹</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center">성별</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center">구분</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center">부서</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center">직위</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center">계약구분</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center">담당강습반</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center">상태</th>
						</tr>
					</thead>
					<tbody class="list">
						<c:forEach items="${list }" var="list">
							<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center">
								<td class="siteName align-middle py-3 ">
									<c:out value="${list.siteName }"/>
								</td>
								<td class="sawonNo align-middle white-space-nowrap ">
									<c:out value="${list.sawonNo }"/>
								</td>
								<td class="sawonName align-middle white-space-nowrap ">
									<form action="<c:url value='/userAuthUpd.do'/>" method="post">
										<input type="hidden" name="SiteCode" value="${list.siteCode }">
										<input type="hidden" name=SawonNo value="${list.sawonNo }">
										<input type="submit" class=" fw-bold" value="<c:out value="${list.sawonName }"/>" style="border: 0px solid #e0e0e0; backGround-color: white;"> 
									</form>
									<%-- <a href="javascript:popup();"><c:out value="${list.sawonName }"/></a> --%>
								</td>
								<td class="userID align-middle white-space-nowrap ">
									<c:out value="${list.userID }"/>
								</td>
								<td class="userGroupName align-middle white-space-nowrap ">
									<c:out value="${list.userGroupName }"/>
								</td>
								<td class="gender align-middle white-space-nowrap ">
									<c:out value="${list.gender }"/>
								</td>
								<td class="type align-middle white-space-nowrap ">
									<c:out value="${list.type }"/>
								</td>
								<td class="buseoID align-middle white-space-nowrap ">
									<c:out value="${list.buseoID }"/>
								</td>
								<td class="jikwiID align-middle white-space-nowrap ">
									<c:out value="${list.jikwiID }"/>
								</td>
								<td class="jikMooID align-middle white-space-nowrap ">
									<c:out value="${list.jikMooID }"/>
								</td>
								<td class="groupName align-middle white-space-nowrap ">
									<c:out value="${list.groupName }"/>
								</td>
								<td class="state align-middle white-space-nowrap ">
									<c:out value="${list.state }"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</table>
			</div>
		</div>
		<%-- <div class="form-actions">
			<a class="btn" href="${pageContext.request.contextPath}/main.do" style="float: right; margin: 0 0 0 3px;" title="목록">목록</a><!-- 목록 -->
			<a class="btn btn-info" href="${pageContext.request.contextPath}/userInsert.do" style="float: right; margin: 0 0 0 3px;" title="등록">등록</a><!-- 등록 -->
		</div> --%>
	</div>
</div>