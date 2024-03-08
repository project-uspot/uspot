<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/include/head.jsp">
	<jsp:param value="회원관리 프로그램" name="title"/>
</jsp:include>
<body>
<main class="main" id="top">
	<div class="card h-100 mb-1">
		<div class="card-body pb-3">
			<div class="col-12 col-xxl-8">
				<div class="row g-3">
					<div class="col-sm-3 g-3">
                        <h3 class="mb-3 pt-2">출입관리</h3>
                    </div>
                    <div class="col-sm-3">
                    	<div class="input-group">
                    		<span class="input-group-text">회원성명/회원카드번호</span>
                    		<input class="form-control" id="barCode" name="barCode" type="text"/>
                    	</div>
                    </div>
                    <div class="col-sm-3">
                    	<ul class="">
	                    	<li class="form-check">
	                    		<input class="form-check-input" type="checkbox" id="inTimeNo" name="inTimeNo">
	                    		<label class="form-check-label" for="inTimeNo">주말입장시간제한 없음(시작시간~23:00)</label>
	                    	</li>
	                    	<li class="form-check">
	                    		<input class="form-check-input" type="checkbox" id="outChkNo" name="outChkNo">
	                    		<label class="form-check-label" for="outChkNo">퇴장처리안함</label>
	                    	</li>
                    	</ul>
                    </div>
                    <div class="col-sm-3">
                    	<div class="input-group input-group-sm">
                    		<div class="form-check form-check-inline">
	                    		<input class="form-check-input" type="checkbox" id="autoLocker" name="autoLocker">
	                    		<label class="form-check-label" for="autoLocker">전자키사용</label>
                    		</div>
                    	</div>
                    	<div class="wsLockerState">
                    		<span class="form-check-label">서버접속:</span>
                    		<span id="wsLockerStateIcon" class="fa fa-circle me-2 d-inline-block text-secondary" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span>
                    		<span id="wsLockerStateText" class="badge badge-phoenix fs--2 badge-phoenix-secondary">사용불가</span>
                    	</div>
                    </div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="card col-sm-6">
				<div class="card-header">
					<ul class="nav nav-underline" id="myTab" role="tablist">
					    <li class="nav-item"><a class="nav-link active" id="mem-info-tab" data-bs-toggle="tab" href="#tab-mem-info" role="tab" aria-controls="tab-mem-info" aria-selected="true">회원기본정보</a></li>
					    <li class="nav-item"><a class="nav-link" id="entry-info-tab" data-bs-toggle="tab" href="#tab-entry-info" role="tab" aria-controls="tab-entry-info" aria-selected="false">회원출입정보</a></li>
					</ul>
					<div class="tab-content mt-3" id="myTabContent">
						<div class="tab-pane fade show active" id="tab-mem-info" role="tabpanel" aria-labelledby="mem-info-tab">
							<div class="row">
								<div class="col-sm-8 row">
									<div class="col-12 col-sm-auto mb-sm-2">
										<div class="avatar avatar-5xl ms-3">
											<img class="rounded-circle" src="/uspot/new_lib/assets/img/memberimage/imagesample.jpg">
										</div>
									</div>
									<div class="col-12 col-sm-auto flex-1">
										<div class="input-group input-group-sm">
											<span class="input-group-text">회원번호</span>
											<input class="form-control">
										</div>
										<div class="input-group input-group-sm">
											<span class="input-group-text">회원성명</span>
											<input class="form-control">
										</div>
										<div class="input-group input-group-sm">
											<span class="input-group-text">회원성별</span>
											<input class="form-control">
										</div>
										<div class="input-group input-group-sm">
											<span class="input-group-text">회원구분</span>
											<input class="form-control">
										</div>
										<div class="input-group input-group-sm">
											<span class="input-group-text">생년월일</span>
											<input class="form-control">
										</div>
										<div class="input-group input-group-sm">
											<span class="input-group-text">휴대전화</span>
											<input class="form-control">
										</div>
										<div class="input-group input-group-sm">
											<span class="input-group-text">일반전화</span>
											<input class="form-control">
										</div>
										<div class="input-group input-group-sm">
											<span class="input-group-text">회원카드</span>
											<input class="form-control">
										</div>
									</div>
								</div>
								<div class="col-sm-4 calendar-outline fc fc-media-screen fc-direction-ltr fc-theme-standard">
									<table role="grid" class="fc-scrollgrid  fc-scrollgrid-liquid">
										<thead role="rowgroup">
											<tr role="presentation" class="fc-scrollgrid-section fc-scrollgrid-section-header fc-col-header ">
												<th role="presentation" class="fc-col-header-cell fc-day fc-day-sun">일</th>
												<th role="presentation" class="fc-col-header-cell fc-day fc-day-sun">월</th>
												<th role="presentation" class="fc-col-header-cell fc-day fc-day-sun">화</th>
												<th role="presentation" class="fc-col-header-cell fc-day fc-day-sun">수</th>
												<th role="presentation" class="fc-col-header-cell fc-day fc-day-sun">목</th>
												<th role="presentation" class="fc-col-header-cell fc-day fc-day-sun">금</th>
												<th role="presentation" class="fc-col-header-cell fc-day fc-day-sun">토</th>
											</tr>
										</thead>
										<tbody role="rowgroup">
											<tr>
												<td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other">-</td>
												<td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other">-</td>
												<td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other">-</td>
												<td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other">-</td>
												<td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other">-</td>
												<td>1</td>
												<td>2</td>
											</tr>
											<tr>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
												<td>7</td>
												<td>8</td>
												<td>9</td>
											</tr>
											<tr>
												<td>10</td>
												<td>11</td>
												<td>12</td>
												<td>13</td>
												<td>14</td>
												<td>15</td>
												<td>16</td>
											</tr>
											<tr>
												<td>17</td>
												<td>18</td>
												<td>19</td>
												<td>20</td>
												<td>21</td>
												<td>22</td>
												<td>23</td>
											</tr>
											<tr>
												<td>24</td>
												<td>25</td>
												<td>26</td>
												<td>27</td>
												<td>28</td>
												<td>29</td>
												<td>30</td>
											</tr>
											<tr>
												<td>31</td>
												<td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other">-</td>
												<td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other">-</td>
												<td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other">-</td>
												<td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other">-</td>
												<td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other">-</td>
												<td class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other">-</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="learntable" data-list='{"valueNames":["State","SaleDate","GubunCode","SubGroupName","WeekName","Time","LevelName","Date","Regmonth"],"page":6,"pagination":true}'>
								<div class="table-responsive scrollbar">
									<table class="table table-sm fs--1 mb-0">
										<thead>
											<tr>
												<th class="sort white-space-nowrap align-middle ps-0 pe-3"		 scope="col" data-sort="State" 			style="width:10%;">상태</th>
												<th class="sort align-middle text-center pe-7"					 scope="col" data-sort="SaleDate" 		style="width:20%;">접수일자</th>
												<th class="sort align-middle white-space-nowrap pe-3" 			 scope="col" data-sort="GubunCode" 		style="width:15%;">분류</th>
												<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="SubGroupName" 	style="width:20%;">강좌명</th>
												<th class="sort align-middle white-space-nowrap text-start" 	 scope="col" data-sort="WeekName" 		style="width:30%;">요일</th>
												<th class="sort align-middle text-end pe-0" 					 scope="col" data-sort="Time"			style="width:10%;">시간</th>
												<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="LevelName" 		style="width:20%;">단계</th>
												<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="Date" 			style="width:20%;">수강기간</th>
												<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="Regmonth" 		style="width:20%;">등록개월</th>
											</tr>
										</thead>
										<tbody class="list" id="learntbody">
										</tbody>
									</table>
								</div>
								<script type="text/javascript">
									$('#learntbody').children('tr:first').click();
								</script>
								<div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
									<div class="col-auto d-flex">
										<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
									</div>
									<div class="col-auto d-flex">
										<button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
										<ul class="mb-0 pagination"></ul>
										<button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade show" id="tab-entry-info" role="tabpanel" aria-labelledby="entry-info-tab">
							<div id="entryLtable" data-list='{"valueNames":["EntryDate","InTime","OutTime","LockerNo","Type"],"page":6,"pagination":true}'>
								<div class="table-responsive scrollbar">
									<table class="table table-sm fs--1 mb-0">
										<thead>
											<tr>
												<th class="sort white-space-nowrap align-middle ps-0 pe-3" 			scope="col" data-sort="EntryDate" style="width:20%;">출입일자</th>
												<th class="sort align-middle text-center pe-7" 						scope="col" data-sort="InTime" style="width:20%;">입장시간</th>
												<th class="sort align-middle white-space-nowrap text-center pe-3" 				scope="col" data-sort="OutTime" style="width:20%;">퇴장시간</th>
												<th class="sort align-middle white-space-nowrap text-center pe-3" 	scope="col" data-sort="LockerNo" style="width:25%;">락커번호</th>
												<th class="sort align-middle white-space-nowrap text-center" 		scope="col" data-sort="Type" style="width:15%;">발권방법</th>
											</tr>
										</thead>
										<tbody class="list" id="entryLtbody">
										</tbody>
									</table>
								</div>
								<script type="text/javascript">
									$('#entryLtbody').children('tr:first').click();
								</script>
								<div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
									<div class="col-auto d-flex">
										<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
									</div>
									<div class="col-auto d-flex">
										<button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
										<ul class="mb-0 pagination"></ul>
										<button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div id="lockertable" data-list='{"valueNames":["Locker","RegDate","FromDate","ToDate","RegMonth","RealPrice","PaidPrice","Misu","ReturnDate"],"page":6,"pagination":true}'>
						<div class="table-responsive scrollbar">
							<table class="table table-sm fs--1 mb-0">
								<thead>
									<tr>
										<th class="sort white-space-nowrap align-middle ps-0 pe-3" 		 scope="col" data-sort="Locker" 	style="width:20%;">사물함</th>
										<th class="sort align-middle text-end pe-7" 					 scope="col" data-sort="RegDate" 	style="width:10%;">신청일</th>
										<th class="sort align-middle white-space-nowrap pe-3" 			 scope="col" data-sort="FromDate" 	style="width:10%;">시작일</th>
										<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="ToDate" 	style="width:10%;">종료일</th>
										<th class="sort align-middle white-space-nowrap text-start" 	 scope="col" data-sort="RegMonth"   style="width:10%;">기간</th>
										<th class="sort align-middle text-end pe-0" 					 scope="col" data-sort="RealPrice"  style="width:10%;">받을금액</th>
										<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="PaidPrice"  style="width:10%;">결제금액</th>
										<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="Misu" 		style="width:10%;">미수금액</th>
										<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="ReturnDate" style="width:10%;">반납일</th>
									</tr>
								</thead>
								<tbody class="list" id="lockertbody">
								</tbody>
							</table>
						</div>
						<script type="text/javascript">
							$('#lockertbody').children('tr:first').click();
						</script>
						<div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
							<div class="col-auto d-flex">
								<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
							</div>
							<div class="col-auto d-flex">
								<button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
								<ul class="mb-0 pagination"></ul>
								<button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
							</div>
						</div>
					</div>
					<div id="talktable" data-list='{"valueNames":["RegDate","Sawon","Note","Bigo"],"page":6,"pagination":true}'>
						<div class="table-responsive scrollbar">
							<table class="table table-sm fs--1 mb-0">
								<thead>
									<tr>
										<th class="sort white-space-nowrap align-middle ps-0 pe-3" 		 scope="col" data-sort="RegDate"style="width:10%;">상담일자</th>
										<th class="sort align-middle text-end pe-7" 					 scope="col" data-sort="Sawon" 	style="width:10%;">상담자</th>
										<th class="sort align-middle white-space-nowrap pe-3" 			 scope="col" data-sort="Note" 	style="width:40%;">상담내용</th>
										<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="Bigo" 	style="width:40%;">조치사항</th>
									</tr>
								</thead>
								<tbody class="list" id="talktbody">
								</tbody>
							</table>
						</div>
						<script type="text/javascript">
							$('#talktbody').children('tr:first').click();
						</script>
						<div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
							<div class="col-auto d-flex">
								<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
							</div>
							<div class="col-auto d-flex">
								<button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
								<ul class="mb-0 pagination"></ul>
								<button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
							</div>
						</div>
					</div>
					<div id="entrytable" data-list='{"valueNames":["EntryDate","InTime","OutTime","State","Bigo"],"page":6,"pagination":true}'>
						<div class="table-responsive scrollbar">
							<table class="table table-sm fs--1 mb-0">
								<thead>
									<tr>
										<th class="sort white-space-nowrap align-middle ps-0 pe-3" 		 scope="col" data-sort="EntryDate"	style="width:10%;">입장날짜</th>
										<th class="sort align-middle text-end pe-7" 					 scope="col" data-sort="InTime"		style="width:10%;">입장시간</th>
										<th class="sort align-middle white-space-nowrap pe-3" 			 scope="col" data-sort="OutTime"	style="width:40%;">퇴장시간</th>
										<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="State" 		style="width:40%;">상 태</th>
										<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="Bigo" 		style="width:40%;">비 고</th>
									</tr>
								</thead>
								<tbody class="list" id="entrytbody">
								</tbody>
							</table>
						</div>
						<script type="text/javascript">
							$('#entrytbody').children('tr:first').click();
						</script>
						<div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
							<div class="col-auto d-flex">
								<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
							</div>
							<div class="col-auto d-flex">
								<button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
								<ul class="mb-0 pagination"></ul>
								<button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div id="logtable" data-list='{"valueNames":["State","SaleDate","GroupName","SubGroupName","WeekName","Time","LevelName","Date","Regmonth","RealPrice","Note","InType"],"page":6,"pagination":true}'>
					<div class="table-responsive scrollbar">
						<table class="table table-sm fs--1 mb-0">
							<thead>
								<tr>
									<th class="sort white-space-nowrap align-middle ps-0 pe-3" 		 scope="col" data-sort="EntryDate"	style="width:10%;">락커</th>
									<th class="sort align-middle text-end pe-7" 					 scope="col" data-sort="InTime"		style="width:10%;">결과</th>
									<th class="sort align-middle white-space-nowrap pe-3" 			 scope="col" data-sort="OutTime"	style="width:40%;">구분</th>
									<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="State" 		style="width:40%;">일시</th>
									<th class="sort align-middle white-space-nowrap text-start pe-3" scope="col" data-sort="Bigo" 		style="width:40%;">유형</th>
									<th class="sort align-middle text-end pe-7" 					 scope="col" data-sort="InTime"		style="width:10%;">중계기</th>
									<th class="sort align-middle white-space-nowrap pe-3" 			 scope="col" data-sort="OutTime"	style="width:40%;">메세지</th>
								</tr>
							</thead>
							<tbody class="list" id="logtbody">
							</tbody>
						</table>
					</div>
					<script type="text/javascript">
						$('#logtbody').children('tr:first').click();
					</script>
					<div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
						<div class="col-auto d-flex">
							<p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p>
						</div>
						<div class="col-auto d-flex">
							<button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
							<ul class="mb-0 pagination"></ul>
							<button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="/WEB-INF/jsp/include/foot.jsp"></jsp:include>
</main>

</body>
<script type="text/javascript">
function fetchData() {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		try {
			if (this.readyState == 4 && this.status == 200 && this.responseText != "") {
				<%--// TODO: 서버로부터 받은 데이터를 처리합니다.--%>
				<%--//document.getElementById("data").innerHTML = this.responseText;--%>
				document.getElementById('barCode').value = this.responseText;
			}
		} catch (error) {
			console.error("fetchData error:", error);
		}
	};
	xhr.open("GET", "${pageContext.request.contextPath}/barCodeGetData.do", true); <%--// 데이터를 받아오는 서버의 URL--%>
	xhr.send();
}
</script>
<script>

function connectWebSocket() {
    $.ajax({
    	url:"${pageContext.request.contextPath}/locker/check.do",
    	type: "GET",
        success: function(response) {
            // 서버로부터의 응답이 WebSocket 연결 가능 상태를 나타내면
            if(response === "available") {
    			$(".wsLockerState").find("#wsLockerStateIcon").removeClass("text-primary");
    			$(".wsLockerState").find("#wsLockerStateIcon").removeClass("text-danger");
    			$(".wsLockerState").find("#wsLockerStateIcon").removeClass("text-secondary");
    			$(".wsLockerState").find("#wsLockerStateIcon").addClass("text-primary");
    			
    			$(".wsLockerState").find("#wsLockerStateText").removeClass("badge-phoenix-primary");
    			$(".wsLockerState").find("#wsLockerStateText").removeClass("badge-phoenix-danger");
    			$(".wsLockerState").find("#wsLockerStateText").removeClass("badge-phoenix-secondary");
    			$(".wsLockerState").find("#wsLockerStateText").addClass("badge-phoenix-primary");
    			$(".wsLockerState").find("#wsLockerStateText").text("사용가능");
            } else {
    			$(".wsLockerState").find("#wsLockerStateIcon").removeClass("text-primary");
    			$(".wsLockerState").find("#wsLockerStateIcon").removeClass("text-danger");
    			$(".wsLockerState").find("#wsLockerStateIcon").removeClass("text-secondary");
    			$(".wsLockerState").find("#wsLockerStateIcon").addClass("text-danger");
    			
    			$(".wsLockerState").find("#wsLockerStateText").removeClass("badge-phoenix-primary");
    			$(".wsLockerState").find("#wsLockerStateText").removeClass("badge-phoenix-danger");
    			$(".wsLockerState").find("#wsLockerStateText").removeClass("badge-phoenix-secondary");
    			$(".wsLockerState").find("#wsLockerStateText").addClass("badge-phoenix-danger");
    			$(".wsLockerState").find("#wsLockerStateText").text("사용불가");
            }
        },
        error: function() {
			$(".wsLockerState").find("#wsLockerStateIcon").removeClass("text-primary");
			$(".wsLockerState").find("#wsLockerStateIcon").removeClass("text-danger");
			$(".wsLockerState").find("#wsLockerStateIcon").removeClass("text-secondary");
			$(".wsLockerState").find("#wsLockerStateIcon").addClass("text-secondary");
			
			$(".wsLockerState").find("#wsLockerStateText").removeClass("badge-phoenix-primary");
			$(".wsLockerState").find("#wsLockerStateText").removeClass("badge-phoenix-danger");
			$(".wsLockerState").find("#wsLockerStateText").removeClass("badge-phoenix-secondary");
			$(".wsLockerState").find("#wsLockerStateText").addClass("badge-phoenix-secondary");
			$(".wsLockerState").find("#wsLockerStateText").text("사용안함");
        }
    });
}

let lastTime = 0; <%--// 마지막으로 함수가 실행된 시간을 추적하기 위한 변수--%>
const interval = 5000; <%--// 함수 실행 간격 (5초 = 5000ms)--%>

function animate(timestamp) {
    if (timestamp - lastTime >= interval) { <%--// 현재 시간과 마지막 실행 시간의 차이가 interval 이상이면 함수 실행--%>
    	fetchData();
    	connectWebSocket();
        lastTime = timestamp; <%--// 마지막 실행 시간 업데이트--%>
    }

    requestAnimationFrame(animate); <%--// 다음 프레임을 위해 animate 함수 재귀 호출--%>
}

//requestAnimationFrame(animate); <%--// 애니메이션 시작--%>
</script>
</html>