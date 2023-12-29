<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강습반명 변경</title>
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/favicon-16x16.png">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/favicon.ico">
<link rel="manifest" href="${pageContext.request.contextPath}/new_lib/assets/img/favicons/manifest.json">
<meta name="msapplication-TileImage" content="${pageContext.request.contextPath}/new_lib/assets/img/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">
<meta name="robots" content="noindex">
<script src="${pageContext.request.contextPath}/new_lib/vendors/imagesloaded/imagesloaded.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/assets/js/config.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!-- ===============================================-->
<!--    Stylesheets-->
<!-- ===============================================-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/new_lib/vendors/simplebar/simplebar.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
<link href="${pageContext.request.contextPath}/new_lib/assets/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl">
<link href="${pageContext.request.contextPath}/new_lib/assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
<link href="${pageContext.request.contextPath}/new_lib/assets/css/user-rtl.min.css" type="text/css" rel="stylesheet" id="user-style-rtl">
<link href="${pageContext.request.contextPath}/new_lib/assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
<link href="${pageContext.request.contextPath}/new_lib/scss/theme/_navbar-vertical.scss" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/new_lib/vendors/dropzone/dropzone.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet/leaflet.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/MarkerCluster.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/MarkerCluster.Default.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
</head>
<body>
	<div class="card h-100">
		<div class="card-body pb-3">
			<div class="col-12 col-xxl-8">
				<div class="mb-6">
					<div class="row g-3">
      					<h3 class="mb-4" style="padding-top: 5px; width: 265px;">강습종목정보 변경</h3>
						<div class="col-auto">
							<input type="button" class="btn btn-warning px-5"  value="수정(F3)" id="modify" onclick="valueChk();"/>
						</div>
          			</div>
					<form method="post" id="frm"  name="frm" action="updateItem02.do">
						<input type="hidden" id="SubGroupID" name="SubGroupID" value="${item02.subGroupID }">
						<div class="row mt-2">
							<div class="col-auto">
								<label class="col-auto col-form-label" for="JungSi1Inlive">강습종목</label>
							</div>
							<div class="col-auto">
								<div class="form-floating">
									<select class="form-select" id="GroupID" name="GroupID">
										<c:forEach items="${list}" var="list">
											<option value="${list.groupID }" <c:if test="${item02.groupID eq list.groupID}">selected</c:if> >${list.groupName }</option>
										</c:forEach>
									</select>
									<label for="GroupID">강습종목</label>
								</div>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col-auto">
								<label class="col-auto col-form-label" for="JungSi1Inlive">강습반명</label>
							</div>
							<div class="col-auto">
								<div class="form-floating">
									<input class="form-control" id="SubGroupName" name="SubGroupName" type="text" value="${item02.subGroupName }" placeholder="강습반명" />
									<label for="SubGroupName">강습반명</label>
								</div>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col-auto">
								<label class="col-auto col-form-label" for="JungSi1Inlive">정렬순서</label>
							</div>
							<div class="col-auto">
								<div class="form-floating">
									<input class="form-control" id="SortOrder" name="SortOrder" type="text"  placeholder="정렬순서" value="${item02.sortOrder }" />
									<label for="SortOrder">정렬순서</label>
								</div>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col-auto ">
								<div class="form-check form-check-inline ">
									<input type="checkbox" class="dcType form-check-input" name="IsDeleteChk" id="IsDelete" maxlength="1" value="Y" <c:if test="${item02.isDelete eq 'Y' }">checked</c:if>>
									<label class="form-check-label" for="IsDelete">삭제</label>
								</div>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-auto">
								<div class="form-check form-check-inline ">
									<input type="checkbox" class="dcType form-check-input" name="TimeChk" id="TimeChk" maxlength="1" value="Y">
									<label class="form-check-label" for="TimeChk">입장시간설정</label>
								</div>
							</div>
							<div class="col-auto ms-n4">
								<font >강습시작시간</font>
							</div>
							<div class="col-sm-3 col-sm-3">
								<div class="form-floating align-middle">
									<input class="form-control  text-center" id="InTime" name="InTimeChk" type="number" value="${item02.inTime }"onkeydown="onlyNumber(this)" style="height: 30px" />
								</div>
							</div>
							<div class="col-auto ms-n4">
								<font >분 전까지</font>
							</div>
						</div>
						<div class="row mt-2" style="margin-left: 166px;">
							<div class="col-auto ms-n4">
								<font >강습종료시간</font>
							</div>
							<div class="col-sm-3 col-sm-3">
								<div class="form-floating align-middle">
									<input class="form-control  text-center" id="InEndTime" name="InEndTimeChk" type="number" value="${item02.inEndTime }"  onkeydown="onlyNumber(this)" style="height: 30px; "  />
								</div>
							</div>
							<div class="col-auto ms-n4" >
								<font >분 전까지</font>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- <div class="modal-footer">
		<input type="button" class="btn btn-warning px-5"  value="수정" id="modify" onclick="valueChk();"/>
	</div> -->
	<script>
		document.addEventListener('keydown', function(event) {
	    	if (event.key === 'Escape') {
	      		window.close();
	    	}
	  	});
	
		function Time() {
		    var InTime = "${item02.inTime}";
	
		    // 기간설정 체크박스와 날짜 입력 필드 관리
		    if (InTime !== null && InTime > 0) {
		    	 document.getElementById("TimeChk").checked = true;
		    } else {
		    	document.getElementById("TimeChk").checked = false;
		    }
		}
		// 초기 설정을 위해 함수 호출
		Time();
		
		document.addEventListener('keydown', function(event) {
		    if (event.key === 'Enter' || event.key === 'F3') {
		        var modifyButton = document.getElementById('modify');
		        if (modifyButton) {
		            modifyButton.click(); // 버튼 클릭
		        }
		    }
		});
	
		function valueChk() {
			var frm = document.frm; 
	        
			if(confirm("수정하시겠습니까?")) {
				
				frm.submit();
			} else {
				return false;
			}
		}
		
		
		function onlyNumber(obj) {
		    $(obj).keyup(function(){
		         $(this).val($(this).val().replace(/[^0-9]/g,""));
		    }); 
		}
		
	</script>
	
</body>
</html>
