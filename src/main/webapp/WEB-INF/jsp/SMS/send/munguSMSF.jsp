<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal-header bg-primary">
		<h5 class="modal-title text-white" id="insertModalLabel">자주쓰는 문구 관리</h5>
		<button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1 text-white"></span></button>
	</div>
	<div class="modal-body">
		<div class="input-group">
			<textarea class="form-control" aria-label="With textarea"></textarea>
			<span class="input-group-text cursor-pointer">등록</span>
			<span class="input-group-text cursor-pointer">삭제</span>
		</div>
		<div class="text-end me-15" id="CountMungu">
			SMS:0/90Bytes
		</div>
		<div class="border-top border-bottom border-200" id="customerOrdersTable" style="overflow-y: scroll; height: 257px;">
			<div class="table-responsive scrollbar">
				<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 90%;">
					</colgroup>
                   	<thead>
						<tr>
							<th class="sort align-middle text-center"></th>
							<th class="sort align-middle text-center">문자내용</th>
                        </tr>
                   	</thead>
                   	<tbody class="list" id="mungubody">
                   		<c:forEach items="${mungulist}" var="vo" varStatus="status">
                   			<tr class="hover-actions-trigger btn-reveal-trigger position-static" id="mungu">
								<td class="align-middle text-center fw-bold">${status.index+1}</td>
								<td class="align-middle fw-bold">${vo.mungu}</td>
							</tr>
                   		</c:forEach>
                   	</tbody>
               	</table>
			</div>
		</div>
	</div>
</body>
</html>