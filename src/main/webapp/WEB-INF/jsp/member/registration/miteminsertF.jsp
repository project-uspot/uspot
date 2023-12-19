<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>수강정보 등록 및 변경</title>
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
</head>
<body style="overflow: hidden;">
    <div class="card h-100 mb-1">
        <div class="card-body pb-3">
            <div class="col-12 col-xxl-8">
                <div>
                    <div class="row g-3">
                        <h3 class="mb-3 w-25 pt-2">수강정보 등록 및 변경</h3>
                        <div class="col-auto">
                            <button class="btn btn-success" type="button">저장</button>
                        </div>
                        <div class="col-auto">
                            <button class="btn btn-danger" type="button">삭제</button>
                        </div>
                    </div>
					<div class="row">
						<div class="col-auto mt-1">
                            <p>강습반</p>
						</div>
	                    <div class="col-sm-6 col-md-2">
	                    	<div class="input-group">
							  <input class="form-control" type="text" aria-label="Recipient's username" aria-describedby="basic-addon2" name="findstring" id="findstring" onkeydown="handleKeyPress(event)"/>
							  <span class="input-group-text" id="basic-addon2" onclick="finditem()" style="cursor: pointer;">찾기</span>
							</div>
	                    </div>
	                    <div class="col-auto mt-1">
                            <p style="background-color: lightblue;">[${member.memberID}]${member.name}(${member.genderText})${member.typeText} / ${mleveltext} / ${dcname}</p>
						</div>
                    </div>
                    <div class="border-top border-bottom border-200" id="customerOrdersTable" style="width:1200px; height: 150px;overflow-y: scroll;"
                    data-list='{"valueNames":["code","category","item","name","day","time","level","member","teacher","date","price","dc","sort","dccode","dcpercent","max","enter","remain"],"page":6,"pagination":true}'>
                        <div class="table-responsive scrollbar">
                            <table class="table table-sm fs--1 mb-0 table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th class="sort align-middle" scope="col" data-sort="code">코드</th>
                                        <th class="sort align-middle" scope="col" data-sort="category">구분</th>
                                        <th class="sort align-middle" scope="col" data-sort="item">종목</th>
                                        <th class="sort align-middle" scope="col" data-sort="name">강습반명</th>
                                        <th class="sort align-middle" scope="col" data-sort="day">요일</th>
                                        <th class="sort align-middle" scope="col" data-sort="time">시간</th>
                                        <th class="sort align-middle" scope="col" data-sort="level">단계</th>
                                        <th class="sort align-middle" scope="col" data-sort="member">대상</th>
                                        <th class="sort align-middle" scope="col" data-sort="teacher">강사</th>
                                        <th class="sort align-middle" scope="col" data-sort="date">수강기간</th>
                                        <th class="sort align-middle" scope="col" data-sort="price">회비</th>
                                        <th class="sort align-middle" scope="col" data-sort="dc">할인</th>
                                        <th class="sort align-middle" scope="col" data-sort="sort">소계</th>
                                        <th class="sort align-middle" scope="col" data-sort="dccode">할인코드</th>
                                        <th class="sort align-middle" scope="col" data-sort="dcpercent">할인율</th>
                                        <th class="sort align-middle" scope="col" data-sort="max">정원</th>
                                        <th class="sort align-middle" scope="col" data-sort="enter">등록</th>
                                        <th class="sort align-middle" scope="col" data-sort="remain">잔여</th>
                                    </tr>
                                </thead>
                                <tbody class="list" id="customer-order-table-body">
	                                <tr class="hover-actions-trigger btn-reveal-trigger position-static" ondblclick="tronclick(this)">
	                                    <td class="code align-middle white-space-nowrap text-center fw-bold">1001</td>
	                                    <td class="category align-middle white-space-nowrap text-center">특강</td>
	                                    <td class="item align-middle white-space-nowrap text-start fw-bold text-700">ㅇㄹㅇㅇㅇ</td>
	                                    <td class="name align-middle white-space-nowrap text-900 fs--1 text-start">ㅇㄹㅇㄹㅇㄹㅇ</td>
	                                    <td class="day align-middle white-space-nowrap text-center">ㅇㄹㄹㄹ</td>
	                                    <td class="time align-middle white-space-nowrap text-start">12:00</td>
	                                    <td class="level align-middle white-space-nowrap text-start">ㄹㄹㄹㄹㄹ</td>
	                                    <td class="member align-middle white-space-nowrap text-start">ㅇㅇ</td>
	                                    <td class="teacher align-middle white-space-nowrap text-start">ㅇㅇㅇㅇㅇㅇ</td>
	                                    <td class="date py-2 align-middle white-space-nowrap">2121-ㅇㅇ-ㅇㅇ-ㅇㅇㅇㅇ-ㅇㅇ-ㅇㅇ</td>
	                                    <td class="price py-2 align-middle white-space-nowrap">ㅇㅇㅇㅇㅇ</td>
	                                    <td class="dc py-2 align-middle white-space-nowrap">ㅇㅇㅇ</td>
	                                    <td class="sort py-2 align-middle white-space-nowrap">ㅇㅇㅇㅇㅇㅇ</td>
	                                    <td class="dccode py-2 align-middle white-space-nowrap">ㅇㅇㅇㅇ</td>
	                                    <td class="dcpercent py-2 align-middle white-space-nowrap">ㅇㅇㅇㅇ</td>
	                                    <td class="max py-2 align-middle white-space-nowrap">ㅇㅇㅇㅇ</td>
	                                    <td class="enter py-2 align-middle white-space-nowrap">ㅇㅇㅇㅇ</td>
	                                    <td class="remain py-2 align-middle white-space-nowrap">dㅇㅇㅇd</td>
	                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
	    <div class="card w-60 h-50">
	    	<div class="card-body">
		        <div class="row">
		        	<div class="col-auto">
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">매출일자</span>
							<input class="form-control" type="date" aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="col-auto ms-n4">
						<div class="input-group mb-3">
							<span class="input-group-text me-3" id="basic-addon1">영수증인쇄</span>
							<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
								<input class="form-check-input" id="inlineRadio1" type="radio" name="inlineRadioOptions" value="option1" aria-describedby="basic-addon1"/>
								<label class="form-check-label" for="inlineRadio1">2장</label>
							</div>
							<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
								<input class="form-check-input" id="inlineRadio2" type="radio" name="inlineRadioOptions" value="option2" aria-describedby="basic-addon1"/>
								<label class="form-check-label" for="inlineRadio2">1장</label>
							</div>
							<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
								<input class="form-check-input" id="inlineRadio3" type="radio" name="inlineRadioOptions" value="option3" aria-describedby="basic-addon1"/>
								<label class="form-check-label" for="inlineRadio3">0장</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
		        	<div class="col-auto">
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">강습료</span>
							<input class="form-control" type="date" aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="col-auto">
						<div class="input-group mb-3 ms-1">
							<span class="input-group-text" id="basic-addon1">등록개월</span>
							<input class="form-control" type="number" aria-describedby="basic-addon1" min="1" style="width: 60px;"/>
						</div>
					</div>
					<div class="col-md-5 ms-n2" style="width: 332px;">
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">할인유형</span>
							<select class="form-select" aria-label="Default select example" aria-describedby="basic-addon1">
							  <option value="1">원단위 반올림 / 내림</option>
							  <option value="2" selected="selected">원단위 절삭</option>
							  <option value="3">원단위 절상</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-auto">
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">강습기간</span>
							<input class="form-control" type="date" aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="col-auto mt-1 mx-n4">
						~
					</div>
					<div class="col-auto ms-n1">
						<div class="input-group mb-3">
							<input class="form-control" type="date"/>
						</div>
					</div>
					<div class="col-auto">
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">할인율/금액</span>
							<input class="form-control" type="number" aria-describedby="basic-addon1" min="1" style="width: 65px;"/>
						</div>
					</div>
					<div class="col-auto mt-1 mx-n3">
						%
					</div>
					<div class="col-auto ms-n2">
						<div class="input-group mb-3 w-auto">
							<input class="form-control" type="text" style="width: 99px;"/>
						</div>
					</div>
				</div>
		        <div class="row">
		        	<div class="col-md-7">
		        		<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">비고</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" />
						</div>
		        	</div>
		        	<div class="col-md-5" style="width: 312px;">
		        		<div class="input-group mb-3 ms-n3">
							<span class="input-group-text" id="basic-addon1">합계</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" />
						</div>
		        	</div>
		        </div>
		        <div class="row">
		        	<div class="col-md-7">
		        		<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">잔여개월</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" />
						</div>
		        	</div>
					<div class="col-auto mt-2">
						만나이 : 10
		        	</div>
		        	<div class="col-auto mt-2">
						연나이 : 12
		        	</div>
		        </div>
	  		</div>
	    </div>
	    <div class="card w-31 ms-1" style="width: 509px;">
	    	<div class="card-body">
				<div class="col-md-5 " style="width: 332px;">
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">합계절사구분</span>
						<select class="form-select" aria-label="Default select example" aria-describedby="basic-addon1">
						  <option value="1">원단위 반올림 / 내림</option>
						  <option value="2" selected="selected">원단위 절삭</option>
						  <option value="3">원단위 절상</option>
						</select>
					</div>
				</div>
				<div class="col-auto mb-3">
					<div class="card border border-primary">
				    	<div class="card-body">
				      		<div class="col-auto">
                        		<div class="row">
                           			<div class="col-auto">
										<h4 class="card-title">결제내역</h4>
										<div class="row">
											<div class="col-auto">
												<div class="input-group mb-3">
													<span class="input-group-text" id="basic-addon1">총매출금액</span>
													<input class="form-control" type="text" aria-describedby="basic-addon1" style="width: 134px;"/>
												</div>
											</div>
											<div class="col-auto">
												<div class="input-group mb-3">
													<span class="input-group-text" id="basic-addon1">정원</span>
													<input class="form-control" type="text" aria-describedby="basic-addon1" style="width: 57px;"/>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-auto">
												<div class="input-group mb-3">
													<span class="input-group-text" id="basic-addon1">총결제금액</span>
													<input class="form-control" type="text" aria-describedby="basic-addon1" style="width: 134px;"/>
												</div>
											</div>
											<div class="col-auto">
												<div class="input-group mb-3">
													<span class="input-group-text" id="basic-addon1">등록</span>
													<input class="form-control" type="text" aria-describedby="basic-addon1" style="width: 57px;"/>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-auto">
												<div class="input-group mb-3">
													<span class="input-group-text" id="basic-addon1">총미납금액</span>
													<input class="form-control" type="text" aria-describedby="basic-addon1" style="width: 134px;"/>
												</div>
											</div>
											<div class="col-auto">
												<div class="input-group mb-3">
													<span class="input-group-text" id="basic-addon1">잔여</span>
													<input class="form-control" type="text" aria-describedby="basic-addon1" style="width: 57px;"/>
												</div>
											</div>
										</div>
                           			</div>
								</div>
							</div>
				    	</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="input-group mb-3">
							<span class="input-group-text">총일수</span>
							<input class="form-control" type="number" aria-label="Amount (to the nearest dollar)" min="0"/>
							<span class="input-group-text">일</span>
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group mb-3">
							<span class="input-group-text">사용일수</span>
							<input class="form-control" type="number" aria-label="Amount (to the nearest dollar)" min="0"/>
							<span class="input-group-text">일</span>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group mb-3">
						<span class="input-group-text">강습료</span>
						<input class="form-control" type="number" aria-label="Amount (to the nearest dollar)" min="0" style="text-align: right;"/>
					</div>
				</div>
		    </div>
		</div>
	    <div class="card w-60 mt-n15">
	    	<div class="card-body">
	    		<div class="border-top border-bottom border-200" id="customerOrdersTable" style="overflow-y: scroll; height: 210px;"
                    data-list='{"valueNames":["date","category","price","mapsa","cardtype","assignN","cardN","POS","signpad","OID","PayKinid"],"page":6,"pagination":true}'>
                	<div class="table-responsive scrollbar">
                    	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
                        	<thead>
	                        	<tr>
		                             <th class="sort align-middle" scope="col" data-sort="date">결제일자</th>
		                             <th class="sort align-middle" scope="col" data-sort="category">결제유형</th>
		                             <th class="sort align-middle" scope="col" data-sort="price">결제금액</th>
		                             <th class="sort align-middle" scope="col" data-sort="type">승인구분</th>
		                             <th class="sort align-middle" scope="col" data-sort="mapsa">매입사</th>
		                             <th class="sort align-middle" scope="col" data-sort="cardtype">카드종류</th>
		                             <th class="sort align-middle" scope="col" data-sort="assignN">승인번호</th>
		                             <th class="sort align-middle" scope="col" data-sort="cardN">카드번호</th>
		                             <th class="sort align-middle" scope="col" data-sort="POS">POS</th>
		                             <th class="sort align-middle" scope="col" data-sort="signpad">사인패드</th>
		                             <th class="sort align-middle" scope="col" data-sort="OID">OID</th>
		                             <th class="sort align-middle" scope="col" data-sort="PayKinid">PayKinid</th>
	                            </tr>
                        	</thead>
                        	<tbody class="list" id="customer-order-table-body">
                         		<tr class="hover-actions-trigger btn-reveal-trigger position-static">
		                            <td class="code align-middle white-space-nowrap text-center fw-bold">1001</td>
		                            <td class="category align-middle white-space-nowrap text-center">특강</td>
		                            <td class="item align-middle white-space-nowrap text-start fw-bold text-700">ㅇㄹㅇㅇㅇ</td>
		                            <td class="name align-middle white-space-nowrap text-900 fs--1 text-start">ㅇㄹㅇㄹㅇㄹㅇ</td>
		                            <td class="day align-middle white-space-nowrap text-center">ㅇㄹㄹㄹ</td>
		                            <td class="time align-middle white-space-nowrap text-start">12:00</td>
		                            <td class="level align-middle white-space-nowrap text-start">ㄹㄹㄹㄹㄹ</td>
		                            <td class="member align-middle white-space-nowrap text-start">ㅇㅇ</td>
		                            <td class="teacher align-middle white-space-nowrap text-start">ㅇㅇㅇㅇㅇㅇ</td>
		                            <td class="date py-2 align-middle white-space-nowrap">2121-ㅇㅇ-ㅇㅇ-ㅇㅇㅇㅇ-ㅇㅇ-ㅇㅇ</td>
		                            <td class="price py-2 align-middle white-space-nowrap">ㅇㅇㅇㅇㅇ</td>
		                            <td class="dc py-2 align-middle white-space-nowrap">ㅇㅇㅇ</td>
		                        </tr>
                        	</tbody>
                    	</table>
                    </div>
            	</div>
	    	</div>
	    </div>
	    <div class="card w-35 ms-1" style="width: 509px;">
	    	<div class="card-body">
	    		<div class="col-auto">
					<div class="input-group mb-3">
						<span class="input-group-text">받은금액</span>
						<input class="form-control" type="number" aria-label="Amount (to the nearest dollar)" min="0"/>
					</div>
				</div>
				<div class="row">
					<div class="col-auto">
						<button class="btn btn-outline-secondary" type="button">현금</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-outline-secondary" type="button">현금영수증<br>(간편결제)</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-outline-secondary" type="button">현금(제로페이)</button>
					</div>
				</div>
				<div class="row">
					<div class="col-auto">
						<button class="btn btn-outline-secondary" type="button">신용카드</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-outline-secondary" type="button">계좌잆금</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-outline-secondary" type="button">영수증재발행</button>
					</div>
				</div>
				<div class="row">
					<div class="col-auto">
						<button class="btn btn-outline-secondary" type="button">결제취소</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-outline-secondary" type="button">행삭제</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-outline-secondary" type="button">현금영수증발행</button>
					</div>
				</div>
	    	</div>
	    </div>
	</div>
</body>
<script type="text/javascript">
	function handleKeyPress(event) {
	  if (event.key === "Enter") {
	    finditem();
	  }
	}
	document.addEventListener('keydown', function(event) {
    	if (event.key === 'Escape') {
      		window.close();
    	}
  	});
	
	function finditem() {
		var findstring = document.getElementById('findstring').value;
		if(findstring == '' || findstring == null){
			alert('검색어를 입력해주세요.');
			return false;
		}
		var url = "mitemfindlist?findstring=" + findstring;
     	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1000,height=500";
     	window.open(url, "_blank", windowFeatures);
	}
	function test(ItemID) {
		$.ajax({
	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
	        url: "mitemfindbyid", // 실제 엔드포인트로 교체해야 합니다
	        dataType : 'json',
	        data: { 
	        	AddDate: ItemID
	        },
	        success: function(list) {
	        	var tableBody = $('#customer-order-table-body'); // Get the table body element
                var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" ondblclick="tronclick(this)"></tr>');
                newRow.append('<td class="code align-middle white-space-nowrap text-center fw-bold">' + list.ItemCode + '</td>');
                newRow.append('<td class="category align-middle white-space-nowrap text-center">' + list.Type + '</td>');
                newRow.append('<td class="item align-middle white-space-nowrap text-start fw-bold text-700">' + list.CategoryName + '</td>');
                newRow.append('<td class="name align-middle white-space-nowrap text-900 fs--1 text-start">' + list.JungName + '</td>');
                newRow.append('<td class="day align-middle white-space-nowrap text-center">' + list.DayName + '</td>');
                newRow.append('<td class="time align-middle white-space-nowrap text-start">' + list.FromTime + '</td>');
                newRow.append('<td class="level align-middle white-space-nowrap text-start">' + list.LevelName + '</td>');
                newRow.append('<td class="member align-middle white-space-nowrap text-start">' + list.DaesangName + '</td>');
                newRow.append('<td class="teacher align-middle white-space-nowrap text-start">' + list.SawonName + '</td>');
                newRow.append('<td class="date py-2 align-middle white-space-nowrap">' + '0000-00-00~0000-00-00'+ '</td>');
                newRow.append('<td class="price py-2 align-middle white-space-nowrap">' + list.DefPrice + '</td>');
                newRow.append('<td class="dc py-2 align-middle white-space-nowrap">' + list.dc + '</td>');
                newRow.append('<td class="sort py-2 align-middle white-space-nowrap">' + list.sort + '</td>');
                newRow.append('<td class="dccode py-2 align-middle white-space-nowrap">' + list.dccode + '</td>');
                newRow.append('<td class="dcpercent py-2 align-middle white-space-nowrap">' + list.dcpercent + '</td>');
                newRow.append('<td class="max py-2 align-middle white-space-nowrap">' + list.max + '</td>');
                newRow.append('<td class="enter py-2 align-middle white-space-nowrap">' + list.enter + '</td>');
                newRow.append('<td class="remain py-2 align-middle white-space-nowrap">' + list.remain + '</td>');
                
                tableBody.append(newRow);
	        },
	        error: function(xhr, status, error) {
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
	        }
		});
	}
</script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/anchorjs/anchor.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/is/is.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/fontawesome/all.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/lodash/lodash.min.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/dayjs/dayjs.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/assets/js/phoenix.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/echarts/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/leaflet/leaflet.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/leaflet.markercluster/leaflet.markercluster.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/leaflet.tilelayer.colorfilter/leaflet-tilelayer-colorfilter.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/assets/js/ecommerce-dashboard.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/tinymce/tinymce.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/dropzone/dropzone.min.js"></script>

</html>