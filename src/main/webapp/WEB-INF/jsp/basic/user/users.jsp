<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>

<script type="text/javascript">


</script>


<div class="p-0">
	<div class="mb-9 ">
		<div class="row g-2 mb-4">
		    <div class="col-auto">
		      <h2 class="mb-0">사용자 관리</h2>
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
              <a class="btn btn-info" href="${pageContext.request.contextPath}/userInsert.do" title="등록">등록</a>
            </div>
          </div>
        </div>
		<div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1" style="overflow-x:scroll; ">
			<div class="table-responsive scrollbar-overlay mx-n1 px-1">
				<table class="table table-sm fs--1 mb-1">
				<colgroup>
					<col style="width:140px;" >
					<col style="width:80px;" >
					<col style="width:30px;" >
					<col style="width:70px;" >
					<col style="width:50px;" >
					<col style="width:50px;" >
					<col style="width:120px;" >
					<col style="width:120px;" >
					<col style="width:50px;" >
					<col style="width:140px;" >
					<col style="width:70px;" >
					<col style="width:50px;" >
					<col style="width:130px;" >
					<col style="width:100px;" >
					<col style="width:120px;" >
					<col style="width:120px;" >
					<col style="width:120px;" >
				</colgroup>
					<thead>
						<tr>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">시설명</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">사원번호</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">사원명</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">사용자ID</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">성별</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">구분</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">일반전화</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">휴대전화</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">상태</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">담당강습반</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">근무부서</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">직위</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">비번오류횟수</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">LoginIP</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">LoginDate</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">LogOutDate</th>
							<th class="white-space-nowrap fs--1 align-middle ps-0 text-center" scope="col">기타정보</th>
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
									<form action="<c:url value='/UsersUpd.do'/>" method="post">
										<input type="hidden" name="SiteCode" value="${list.siteCode }">
										<input type="hidden" name=SawonNo value="${list.sawonNo }">
										<input type="submit" class="fw-bold" value="<c:out value="${list.sawonName }"/>" style="border: 0px solid #e0e0e0; backGround-color: white;"> 
									</form>
								</td>
								<td class="userID align-middle py-3 white-space-nowrap ">
									<c:out value="${list.userID }"/>
								</td>
								<td class="gender align-middle white-space-nowrap ">
									<c:out value="${list.gender }"/>
								</td>
								<td class="authType align-middle white-space-nowrap ">
									<c:out value="${list.authType }"/>
								</td>
								<td class="homePhone align-middle white-space-nowrap ">
									<c:out value="${list.homePhone }"/>
								</td>
								<td class="cellPhone align-middle white-space-nowrap">
									<c:out value="${list.cellPhone }"/>
								</td>
								<td class="state align-middle white-space-nowrap ">
									<c:out value="${list.state }"/>
								</td>
								<td class="groupName align-middle white-space-nowrap ">
									<c:out value="${list.groupName }"/>
								</td>
								<td class="buseoID align-middle white-space-nowrap ">
									<c:out value="${list.buseoID }"/>
								</td>
								<td class="jikwiID align-middle white-space-nowrap ">
									<c:out value="${list.jikwiID }"/>
								</td>
								<td class="passwordErrorCNT align-middle white-space-nowrap ">
									<c:out value="${list.passwordErrorCNT }"/>
								</td>
								<td class="loginIP align-middle white-space-nowrap ">
									<c:out value="${list.loginIP }"/>
								</td>
								<td class="loginDate align-middle white-space-nowrap ">
									<c:out value="${list.loginDate }"/>
								</td>
								<td class="logoutDate align-middle white-space-nowrap ">
									<c:out value="${list.logoutDate }"/>
								</td>
								<td class="note align-middle white-space-nowrap ">
									<c:out value="${list.note }"/>
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