<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>

<div class="p-0" >
	<div class="mb-9 col-sm-4">
		<div class="row g-2 mb-4">
            <div class="col-auto">
				<h2 class="mb-0">사용자 그룹관리</h2>
            </div>
        </div>
       	<div class="mb-4">
			<div class="row g-3">
				<div class="col-auto scrollbar overflow-hidden-y flex-grow-1">
				</div>
				<div class="col-auto">
					<a class="btn btn-info px-5" href="${pageContext.request.contextPath}/insertUserGroup.do" id="insert" title="신규">신규(F2)</a>
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
				<table class="table table-sm fs--1 mb-1">
					<colgroup>
						<col style="width:50px">
						<col style="width:50px">
					</colgroup>
					<thead>
						<tr>
							<th class="sort align-middle pe-1 text-center" scope="col" data-sort="userGroupName" >사용자그룹</th>
							<th class="sort align-middle pe-1 text-center" scope="col" data-sort="SortOrder">정렬순서</th>
						</tr>
					</thead>
					<tbody class="list">
						<c:forEach items="${list }" var="list">
							<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center">
								<td class="userGroupName align-middle py-2 ">
									<form action="<c:url value='/UserGroupUpd.do'/>" method="post">
										<input type="hidden" name="SiteCode" value="${list.siteCode }">
										<input type="hidden" name="UserGroupID" value="${list.userGroupID }">
										<input type="submit" class="fw-bold" value="<c:out value="${list.userGroupName }"/>" style="border: 0px solid #e0e0e0; backGround-color: white;"> 
									</form>
								</td>
								<td class="SortOrder align-middle white-space-nowrap">
									<c:out value="${list.sortOrder }"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</table>
				<%-- <div class="form-actions">
					<a class="btn" href="${pageContext.request.contextPath}/main.do" style="float: right; margin: 0 0 0 3px;" title="목록">목록</a><!-- 목록 -->
					<a class="btn btn-info" href="${pageContext.request.contextPath}/insertUserGroup.do" style="float: right; margin: 0 0 0 3px;" title="등록">등록</a><!-- 등록 -->
				</div> --%>
			</div>
		</div>
	</div>
</div>