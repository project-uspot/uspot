<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>

<script type="text/javascript">


</script>


<div class="p-0">
	<div class="mb-9 col-sm-4">
		<div class="row g-2 mb-4">
		    <div class="col-auto">
		      <h2 class="mb-0">기타매출그룹 관리</h2>
		    </div>
		</div>
		<div class="mb-4">
			<div class="row g-3">
				<div class="col-auto scrollbar overflow-hidden-y flex-grow-1">
				</div>
				<div class="col-auto">
					<button class="btn btn-info px-5" onclick="location.href=='ExpenseGpInsert.do'" id="insert" title="신규">신규(F2)</button>
					<script>
						if('${authyn.ins}' == 'N'){
							$('#insert').attr('disabled','disabled');
						}
						// 키보드 이벤트 감지
						document.addEventListener('keydown', function(event) {
							if('${authyn.ins}' == 'N'){
								return false;
							}
							if (event.key === 'F2') { // F2 키를 눌렀을 때
								event.preventDefault(); // 기본 동작 방지
								location.href = 'ExpenseGpInsert.do';
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
							<th class="sort align-middle pe-1 text-center" scope="col">비용분류 항목</th>
							<th class="sort align-middle pe-1 text-center" scope="col">정렬순서</th>
						</tr>
					</thead>
					<tbody class="list">
						<c:forEach items="${list }" var="list">
							<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center">
								<td class="expenseGroupName align-middle py-2 ">
									<form action="<c:url value='/ExpenseGroupUdp.do'/>" method="post">
										<input type="hidden" name ="SiteCode" value="${list.siteCode }" >
										<input type="hidden" name ="ExpenseGroupID" value="${list.expenseGroupID }" >
										<input type="submit" name="expenseGroupName" class="fw-bold" value="${list.expenseGroupName }" style="border: 0px solid #e0e0e0; backGround-color: white;">
									</form>
								</td>
								<td class="sortOrder align-middle white-space-nowrap ">
									<c:out value="${list.sortOrder }"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>