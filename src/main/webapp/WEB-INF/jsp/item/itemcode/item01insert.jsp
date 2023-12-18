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
<script type="text/javascript">
datetimepicker.flatpickr({    local: 'ko'});	
</script>
<body>
	<div class="modal-header bg-primary">
		<h5 class="modal-title text-white" id="insertModalLabel">강습종목 등록</h5>
		<button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1 text-white"></span></button>
	</div>
	<div class="modal-body">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<form method="post" id="frm"  name="frm" action="${pageContext.request.contextPath}/insertItem01.do" class="row g-3 mb-6">
						<div class="col-md-6 gy-6">
							<div class="form-floating">
								<input class="form-control" id="GroupName" name="GroupName" type="text" placeholder="강습종목" />
								<label for="GroupName">강습종목</label>
							</div>
						</div>
						<h4 class=" mt-3">접수유형 </h4>
						<div class="col-12 mt-2 ">
							<div class="form-check form-check-inline">
								<input type="radio" class="jsType form-check-input" name="jsType" id="jsType1" maxlength="1" value="0">
								<label class="form-check-label" for="jsType1">정시접수</label>
							</div>
							<div class="form-check form-check-inline ">
								<input type="radio" class="jsType form-check-input" name="jsType" id="jsType2" maxlength="1" value="1">
								<label class="form-check-label" for="jsType2">수시접수</label>
							</div>
							<div class="form-check form-check-inline ">
								<input type="radio" class="jsType form-check-input" name="jsType" id="jsType3" maxlength="1" value="2">
								<label class="form-check-label" for="jsType3">접수기간지정</label>
							</div>
						</div>
						<div class="form-check form-check-inline col-1 gy-7 ">
							<input type="checkbox" class="dcType form-check-input " name="dcType" id="dcType2" maxlength="1" value="U">
							<label class="form-check-label" for="dcType2">추첨접수:</label>
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSiLotteryFromDate">Start Date</label>
							<input class="form-control datetimepicker" id="JungSiLotteryFromDate" name="JungSiLotteryFromDate" type="text"  placeholder="yyyy-mm-dd hour : minute" data-options='{"enableTime":true,"dateFormat":"Y-m-d H:i","disableMobile":true}' />
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSiLotteryToDate">End Date</label>
							<input class="form-control datetimepicker" id="JungSiLotteryToDate" name="JungSiLotteryToDate" type="text" placeholder="yyyy-mm-dd hour : minute" data-options='{"enableTime":true,"dateFormat":"Y-m-d H:i","disableMobile":true}' />
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSiLotteryDate">추첨일</label>
   							<input class="form-control datetimepicker" id="JungSiLotteryDate" name="JungSiLotteryDate" type="text" placeholder="y-m-d" required="required" data-options='{"disableMobile":true,"allowInput":true}' />
						</div>
						<div></div>
						<div class="form-check form-check-inline col-1 gy-7 ">
							<input type="checkbox" class="dcType form-check-input " name="dcType" id="dcType2" maxlength="1" value="U">
							<label class="form-check-label" for="dcType2">추첨결제:</label>
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSiLotteryPayFromDate">Start Date</label>
							<input class="form-control datetimepicker" id="JungSiLotteryPayFromDate" name="JungSiLotteryPayFromDate" type="text" placeholder="yyyy-mm-dd hour : minute" data-options='{"enableTime":true,"dateFormat":"Y-m-d H:i","disableMobile":true}' />
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSiLotteryPayToDate">End Date</label>
							<input class="form-control datetimepicker" id="JungSiLotteryPayToDate" name="JungSiLotteryPayToDate" type="text" placeholder="yyyy-mm-dd hour : minute" data-options='{"enableTime":true,"dateFormat":"Y-m-d H:i","disableMobile":true}' />
						</div>
						<div></div>
						<div class="form-check form-check-inline col-1 gy-7 ">
							<input type="checkbox" class="dcType form-check-input " name="dcType" id="dcType2" maxlength="1" value="U">
							<label class="form-check-label" for="dcType2">추첨강좌:<br>(선착순)</label>
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSiLotteryAddFromDate">Start Date</label>
							<input class="form-control datetimepicker" id="JungSiLotteryAddFromDate" name="JungSiLotteryAddFromDate" type="text" placeholder="yyyy-mm-dd hour : minute" data-options='{"enableTime":true,"dateFormat":"Y-m-d H:i","disableMobile":true}' />
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSiLotteryAddToDate">End Date</label>
							<input class="form-control datetimepicker" id="JungSiLotteryAddToDate" name="JungSiLotteryAddToDate" type="text" placeholder="yyyy-mm-dd hour : minute" data-options='{"enableTime":true,"dateFormat":"Y-m-d H:i","disableMobile":true}' />
						</div>
						<div></div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSi1Inlive">구민접수</label>
   							<input class="form-control datetimepicker" id="JungSi1Inlive" name="JungSi1Inlive" type="text" placeholder="y-m-d" required="required" data-options='{"disableMobile":true,"allowInput":true}' />
						</div>
						<div></div>
						<div class="form-check form-check-inline col-1 gy-7 ">
							<input type="checkbox" class="dcType form-check-input " name="dcType" id="dcType2" maxlength="1" value="U">
							<label class="form-check-label" for="dcType2">신규 :</label>
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSi1">Start Date</label>
							<input class="form-control datetimepicker" id="JungSi1" name="JungSi1Start" type="text" placeholder="yyyy-mm-dd hour : minute" data-options='{"enableTime":true,"dateFormat":"Y-m-d H:i","disableMobile":true}' />
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSi1End">End Date</label>
							<input class="form-control datetimepicker" id="JungSi1End" name="JungSi1End" type="text" placeholder="yyyy-mm-dd hour : minute" data-options='{"enableTime":true,"dateFormat":"Y-m-d H:i","disableMobile":true}' />
						</div>
						<div></div>
						<div class="form-check form-check-inline col-1 gy-7 ">
							<input type="checkbox" class="dcType form-check-input " name="dcType" id="dcType2" maxlength="1" value="U">
							<label class="form-check-label" for="dcType2">재등록:</label>
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSi2Start">Start Date</label>
							<input class="form-control datetimepicker" id="JungSi2Start" name="JungSi2Start"  type="text" placeholder="yyyy-mm-dd hour : minute" data-options='{"enableTime":true,"dateFormat":"Y-m-d H:i","disableMobile":true}' />
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="datetimepicker">End Date</label>
							<input class="form-control datetimepicker" id="JungSi2End" name="JungSi2End" type="text" placeholder="yyyy-mm-dd hour : minute" data-options='{"enableTime":true,"dateFormat":"Y-m-d H:i","disableMobile":true}' />
						</div>
						<div></div>
						<div class="form-check form-check-inline col-1 gy-7 ">
							<input type="checkbox" class="dcType form-check-input " name="dcType" id="dcType2" maxlength="1" value="U">
							<label class="form-check-label" for="dcType2">강습기간:</label>
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSi3Start">Start Date</label>
   							<input class="form-control datetimepicker" id="JungSi3Start" name="JungSi3Start" type="text" placeholder="y-m-d" required="required" data-options='{"disableMobile":true,"allowInput":true}' />
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="JungSi3End">End Date</label>
   							<input class="form-control datetimepicker" id="JungSi3End" name="JungSi3End" type="text" placeholder="y-m-d" required="required" data-options='{"disableMobile":true,"allowInput":true}' />
						</div>
						<div></div>
						<div class="form-check form-check-inline col-1 gy-7 ">
							<input type="radio" class="dcType form-check-input " name="dcType" id="dcType2" maxlength="1" value="U">
							<label class="form-check-label" for="dcType2">기간지정:</label>
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="FromDate">Start Date</label>
   							<input class="form-control datetimepicker" id="FromDate" name="FromDate" type="text" placeholder="y-m-d" required="required" data-options='{"disableMobile":true,"allowInput":true}' />
						</div>
						<div class="col-md-4 gy-4 ">
							<label class="form-label" for="ToDate">End Date</label>
   							<input class="form-control datetimepicker" id="ToDate" name="ToDate" type="text" placeholder="y-m-d" required="required" data-options='{"disableMobile":true,"allowInput":true}' />
						</div>
						<div></div>
						<div class="col-sm-4 gy-4">
							<div class="form-floating">
								<select class="form-select" id="AgainMonth" name="AgainMonth">
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
								<label for="AgainMonth">재등록 이용가능 개월</label>
							</div>
						</div>
						<div class="col-sm-4 gy-4">
							<div class="form-floating">
								<select class="form-select" id="ItemRejectCnt" name="ItemRejectCnt">
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
								</select>
								<label for="ItemRejectCnt">강좌등록 제한건수</label>
							</div>
						</div>
						<div></div>
						<div class="col-md-4 gy-6">
							<div class="form-floating">
								<input class="form-control" id="dcid" name="SortOrder" type="text" placeholder="정렬순서" value="${SortOrder }" readonly />
								<label for="SortOrder">정렬순서</label>
							</div>
						</div>
						<div class="col-md-4 gy-6">
							<div class="form-floating">
								<input class="form-control" id="PayDelayTime" name="PayDelayTime" type="text" placeholder="일일권 미결제 삭제시간" />
								<label for="PayDelayTime">일일권 미결제 삭제시간</label>
							</div>
						</div>
						<div class="col-12 mt-2">
							<div class="form-check form-check-inline">
								<input type="checkbox" class="dcType form-check-input" name="MonthSelNo" id="MonthSelNo" maxlength="1" value="Y">
								<label class="form-check-label" for="MonthSelNo">다개월 선택 불가</label>
							</div>
							<div class="form-check form-check-inline ">
								<input type="checkbox" class="dcType form-check-input" name="WebYN" id="WebYN" maxlength="1" value="Y">
								<label class="form-check-label" for="WebYN">온라인 사용</label>
							</div>
						</div> 
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button class="btn btn-primary" type="submit" id="submit" >Okay</button>
		<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">Cancel</button>
	</div>
	<script>
		
		$(document).ready(function() {
			$("#submit").click(function() {
				var datas = $("#frm").serialize();
				
				$.ajax({
					type : "post", 
                    url : "insertItem01.do",
                    data : datas, 
                    success : function() {
                    	location.href = "itemcode.do";
                    },
                    error : function(xhr, status, error) {
            			console.log("Status: " + status);
                        console.log("Error: " + error);
            		}
				})
			})
		})
		
	</script>
</body>
</html>
