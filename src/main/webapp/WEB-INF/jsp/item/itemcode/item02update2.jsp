<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사물함코드 등록 및 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/js/theme/flatpickr.js"></script>
<link href="${pageContext.request.contextPath}/new_lib/vendors/flatpickr/flatpickr.min.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="modal-header bg-primary">
		<h5 class="modal-title text-white" id="insertModalLabel">강습반명 변경</h5>
		<button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1 text-white"></span></button>
	</div>
	<div class="modal-body">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<form method="post" id="form"  name="form" action="${pageContext.request.contextPath}/updateItem02.do" class="row g-3 mb-6">
						<div class="col-sm-6 col-md-4">
							<div class="form-floating">
								<select class="form-select" id="GroupID" name="GroupID">
									<c:forEach items="${list}" var="list">
										<option value="${list.groupID }" >${list.groupName }</option>
									</c:forEach>
								</select>
								<label for="GroupID">강습종목</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-4">
							<div class="form-floating">
								<input class="form-control" id="SubGroupName" name="SubGroupName" type="text" placeholder="강습반명" />
								<label for="SubGroupName">강습반명</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-4">
							<div class="form-floating">
								<input class="form-control" id="SortOrder" name="SortOrder" type="text" placeholder="정렬순서" value="${SortOrder02}" readonly />
								<label for="SortOrder">정렬순서</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-4">
							<div class="form-floating">
								<input class="form-control" id="InTime" name="InTime" type="number" placeholder="메뉴명" onkeydown="onlyNumber(this)"  />
								<label for="InTime">강습시작전 출입시간</label>
							</div>
						</div>
						<div class="col-sm-6 col-md-4">
							<div class="form-floating">
								<input class="form-control" id="InEndTime" name="InEndTime" type="number" placeholder="메뉴명" onkeydown="onlyNumber(this)"  />
								<label for="InEndTime">강습시작전 출입시간</label>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button class="btn btn-primary" type="submit" id="value" >Okay</button>
		<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">Cancel</button>
	</div>
	<script>
		
		$(document).ready(function() {
			$("#value").click(function() {
				var datas = $("#form").serialize();
				alert(datas);
				$.ajax({
					type : "post", 
                    url : "updateItem02.do",
                    data : datas, 
                    success : function() {
                    	location.href = "itemcode.do";
                    },
                    error : function(xhr, status, error) {
                    	alert(xhr);
                    	alert(status);
                    	alert(error);
            			console.log("Status: " + status);
                        console.log("Error: " + error);
            		}
				})
			})
		})
		
		function onlyNumber(obj) {
		    $(obj).keyup(function(){
		         $(this).val($(this).val().replace(/[^0-9]/g,""));
		    }); 
		}
		
	</script>
	
</body>
</html>
