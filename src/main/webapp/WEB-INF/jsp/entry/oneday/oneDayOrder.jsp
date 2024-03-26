<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일일입장관리</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<%-- <script src="${pageContext.request.contextPath}/new_lib/js/theme/flatpickr.js"></script> --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.js" integrity="sha512-K/oyQtMXpxI4+K0W7H25UopjM8pzq0yrVdFdG21Fh5dBe91I40pDd9A4lzNlHPHBIP2cwZuoxaUSX0GJSObvGA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


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
<link href="${pageContext.request.contextPath}/new_lib/vendors/flatpickr/flatpickr.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.css" integrity="sha512-MQXduO8IQnJVq1qmySpN87QQkiR1bZHtorbJBD0tzy7/0U9+YIC93QWHeGTEoojMVHWWNkoCp8V6OzVSYrX0oQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.css" integrity="sha512-EM9iXXndA8L72Sgf6i5hYHnfcGNchX5oDY6E/GNvb6CXyEXxyzXeSiXHK9UEpQw+cKD8C4ZU/Qn4HI0z8JPENg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
    .custom-btn {
        width: 150px;
        height: 100px;
    }
    .selected {
    background-color: #f0f0f0; /* 선택된 항목의 배경색을 변경하세요 */
    /* 다른 스타일을 추가할 수 있어요 */
}
</style>

</head>
<body>
	<div class="card ">
		<div class="card-header ">
			<div class="row">
				<div class="col-6">
					<h1 id="date"></h1>
				</div>
				<div class="col-sm-3">
					<div class="input-group input-group-sm">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="autoLocker" name="autoLocker">
							<label class="form-check-label" for="autoLocker">전자키사용</label>
						</div>
						<input type="hidden" id="Lng_Locker_Condition" name="Lng_Locker_Condition" value=""/>
						<input type="hidden" id="Lng_Locker_ManAddNum" name="Lng_Locker_ManAddNum" value=""/>
						<input type="hidden" id="Lng_Locker_WoManAddNum" name="Lng_Locker_WoManAddNum" value=""/>
					</div>
					<div class="wsLockerState">
						<span class="form-check-label">서버접속:</span>
						<span id="wsLockerStateIcon" class="fa fa-circle me-2 d-inline-block text-secondary" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span>
						<span id="wsLockerStateText" class="badge badge-phoenix fs--2 badge-phoenix-secondary">사용불가</span>
					</div>
				</div>	
				<div class="col-sm-3">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="JungwonChk" name="JungwonChk">
						<label class="form-check-label" for="JungwonChk">분류별 정원</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="dcTypeAll" name="dcTypeAll">
						<label class="form-check-label" for="dcTypeAll">전체할인</label>
					</div>
				</div>	
			</div>
		</div>
		<div class="card-body pb-3">
			<div class="col-12">
				<div class="mb-6">
					<div class="row flex-row">
						<div class="card-group">
							<div class="col-auto w-50">
								<div class="card">
									<div class="card-header" style="text-align: center;">
										<!-- <button class="btn btn-secondary btn-lg" type="button" disabled 
										style="width: 114px; height: 100px;"><b>일일입장</b></button> -->
										<div class="btn-group btn-group-lg" role="group" aria-label="First group">
										    <button class="btn btn-secondary ms-2 fs-5" id="prevButton" type="button">
										    	<span data-feather="chevron-left"></span>
										    </button>
										    <c:forEach items="${group}" var="group" varStatus="loop">
										        <button class="btn btn-secondary ms-1 groupButton" type="button" value="${group.pkid }">${group.groupName}</button>
										    </c:forEach>
										    <button class="btn btn-secondary ms-2" id="nextButton" >
										    	<span data-feather="chevron-right"></span>
										    </button>
										</div>
									</div>
									<div class="card-body" style="text-align: center;">
										<div id="item" style="height: 375px;overflow-y: auto;">
											<div class="row">

										    </div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="card">
									<div class="card-header">
										<div class="selected-items-info">
										    <p>총 발권수 : <span class="total-count"></span></p>
										    <p>합계 금액 : <span class="total-price"></span></p>
										</div>
									</div>
									<div class="card-body ">
										<div class="row">
											<div class="col-auto ps-1 w-25">
												<button type="button" class="btn btn-soft-primary w-100 OrderNum" id="clean" data-num="C">C</button>
											</div>
											<div class="col-auto ps-1 w-25">
												<button type="button" class="btn btn-soft-primary w-100 OrderNum" id="plus"  data-num="+1">+1</button>
											</div>
											<div class="col-auto ps-1 w-25">
												<button type="button" class="btn btn-soft-primary w-100 OrderNum" id="minus" data-num="-1">-1</button>
											</div>
											<div class="col-auto ps-1 w-25">
												<button type="button" class="btn btn-soft-primary w-100 OrderNum" id="del"  data-num="del">
													<span class="fs-3" data-feather="delete"></span>
												</button>
											</div>
										</div>
										<div class="row mt-1">
											<div class="col-auto ps-1 w-20">
												<button type="button" class="btn btn-soft-primary btn-sm w-100 OrderNum" data-num="1">1</button>
											</div>
											<div class="col-auto ps-1 w-20">
												<button type="button" class="btn btn-soft-primary btn-sm w-100 OrderNum" data-num="2">2</button>
											</div>
											<div class="col-auto ps-1 w-20">
												<button type="button" class="btn btn-soft-primary btn-sm w-100 OrderNum" data-num="3">3</button>
											</div>
											<div class="col-auto ps-1 w-20">
												<button type="button" class="btn btn-soft-primary btn-sm w-100 OrderNum" data-num="4">4</button>
											</div>
											<div class="col-auto ps-1 w-20">
												<button type="button" class="btn btn-soft-primary btn-sm w-100 OrderNum" data-num="5">5</button>
											</div>
										</div>
										<div class="row mt-1">
											<div class="col-auto ps-1 w-20">
												<button type="button" class="btn btn-soft-primary btn-sm w-100 OrderNum" data-num="6">6</button>
											</div>
											<div class="col-auto ps-1 w-20">
												<button type="button" class="btn btn-soft-primary btn-sm w-100 OrderNum" data-num="7">7</button>
											</div>
											<div class="col-auto ps-1 w-20">
												<button type="button" class="btn btn-soft-primary btn-sm w-100 OrderNum" data-num="8">8</button>
											</div>
											<div class="col-auto ps-1 w-20">
												<button type="button" class="btn btn-soft-primary btn-sm w-100 OrderNum" data-num="9">9</button>
											</div>
											<div class="col-auto ps-1 w-20">
												<button type="button" class="btn btn-soft-primary btn-sm w-100 OrderNum" data-num="0">0</button>
											</div>
										</div>
									</div>
									<div class="card-footer">
										<div class="mt-2" style="height: 215px;overflow-y: auto;">
											<table class="table table-sm mb-1 table-hover ">
												<thead>
													<tr>
														<th scope="col">입장구분</th>
														<th scope="col">수량</th>
														<th scope="col">가격</th>
													</tr>
												</thead>
												<tbody id="tbody">
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="card">
									<div class="card-header">
										<div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="TotalPriceSpan">청구금액</span>
											<input class="form-control" id="TotalPrice" name="TotalPrice" type="text" readonly />
										</div>
										<div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="DcPriceSpan">할인금액</span>
											<input class="form-control" id="DcPrice" name="DcPrice" type="text" readonly />
										</div>
										<div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="RealPriceSpan">결제금액</span>
											<input class="form-control" id="RealPrice" name="RealPrice" type="text" readonly />
										</div>
										<!-- <div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="DepositSpan">받은  돈</span>
											<input class="form-control" id="Deposit" name="Deposit" type="text" readonly />
										</div>
										<div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="ChangeSpan">거스름 돈</span>
											<input class="form-control" id="Change" name="Change" type="text" readonly />
										</div> -->
									</div>
									<div class="card-body">
										<div>
											<div class="row mt-1 ms-0">
												<div class="col-auto ps-1 w-33">
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="7">7</button>
												</div>
												<div class="col-auto ps-1 w-33">
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="8">8</button>
												</div>
												<div class="col-auto ps-1 w-33">
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="9">9</button>
												</div>                                                                      
											</div>                                                                          
											<div class="row mt-1 ms-0">                                                               
												<div class="col-auto ps-1 w-33">                                                      
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="4">4</button>
												</div>
												<div class="col-auto ps-1 w-33">
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="5">5</button>
												</div>
												<div class="col-auto ps-1 w-33">
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="6">6</button>
												</div>                                                                      
											</div>                                                                          
											<div class="row mt-1 ms-0" >                                                               
												<div class="col-auto ps-1 w-33">                                                      
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="1">1</button>
												</div>
												<div class="col-auto ps-1 w-33">
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="2">2</button>
												</div>
												<div class="col-auto ps-1 w-33">
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="3">3</button>
												</div>
											</div>
											<div class="row mt-1 ms-0" >                                                               
												<div class="col-auto ps-1 w-33">                                                      
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="0">0</button>
												</div>
												<div class="col-auto ps-1 w-33">
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="00">00</button>
												</div>
												<div class="col-auto ps-1 w-33">
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="000">000</button>
												</div>
											</div>
											<div class="row mt-1 ms-0" >                                                               
												<div class="col-auto ps-1 w-33">                                                      
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="-">-</button>
												</div>
												<div class="col-auto ps-1 w-33">
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="del">
														<span class="fs-3" data-feather="delete"></span>
													</button>
												</div>
												<div class="col-auto ps-1 w-33">
													<button type="button" class="btn btn-soft-primary btn-lg w-100 PriceNum" data-num="cls">CLS</button>
												</div>
											</div>
										</div>
									</div>
									<div class="card-footer">
										<div class="row">
											<div class="col-auto ps-1 w-33">
												<button type="button" class="btn btn-phoenix-secondary w-100" onclick="payDiscount()" >할인</button>
											</div>
											<div class="col-auto ps-1 w-33">
												<button type="button" class="btn btn-phoenix-primary w-100"  onclick="paycash()">현금</button>
											</div>
											<div class="col-auto ps-1 w-33">
												<button type="button" class="btn btn-soft-primary w-100" onclick="paycredit()">신용카드</button>
											</div>
										</div>
									</div>
									<div id="paidbody" style="display:none"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/include/foot.jsp"></jsp:include>
</body>
<script type="text/javascript">
	document.addEventListener('keydown', function(event) {
		if (event.key === 'Escape') {
	  		window.close();
		}
	});
	/* 날짜 구하기 */
    var today = new Date();

    // 날짜를 원하는 형식으로 포맷팅하기
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1 해주고 두 자리로 표시
    var day = ('0' + today.getDate()).slice(-2); // 일은 두 자리로 표시

    // 포맷팅한 날짜를 원하는 형식으로 출력
    var formattedDate = year + '/' + month + '/' + day;

    // 날짜를 HTML 요소에 넣기
    document.getElementById('date').innerText = formattedDate;
    /* 날짜 구하기 끝 */
    
    /* 일일입장 그룹 버튼 */
	let groupButtons = document.querySelectorAll('.groupButton');
	let prevButton = document.getElementById('prevButton');
	let nextButton = document.getElementById('nextButton');
	let currentIndex = 0;
	const groupsPerPage = 4; // 한 페이지에 보여질 그룹 개수
	let inwonChk = false;

	// 초기 상태에서 처음 3개 그룹만 보이도록 설정
	showGroups();

	function showGroups() {
	    for (let i = 0; i < groupButtons.length; i++) {
	        if (i >= currentIndex && i < currentIndex + groupsPerPage) {
	            groupButtons[i].style.display = 'inline-block';
	        } else {
	            groupButtons[i].style.display = 'none';
	        }
	    }
	}

	prevButton.addEventListener('click', function() {
	    if (currentIndex > 0) {
	        currentIndex -= groupsPerPage;
	        showGroups();
	    }
	});

	nextButton.addEventListener('click', function() {
	    if (currentIndex + groupsPerPage < groupButtons.length) {
	        currentIndex += groupsPerPage;
	        showGroups();
	    }
	});
	/* 일일입장 그룹 버튼 끝 */
	var selectedRow = null;
	/* 일일입장 버튼 */
	$(document).ready(function() {
	    let selectedItems = {}; // 선택된 아이템을 저장할 객체 (아이템명을 키로 사용)
	    //let selectedRow = null;
	
	    $('.groupButton').on('click', function() {
	        const valueToSend = $(this).val();
	        $.ajax({
	            url: 'GroupValue', 
	            method: 'POST',
	            data: { value: valueToSend },
	            success: function(response) {
	                var itemsHTML = '<div id="item"><div class="row">';
	                for (let i = 0; i < response.size; i++) {
	                    const item = response.list[i];
	                    if (i % 3 === 0 && i !== 0) {
	                        itemsHTML += '</div><div class="row">';
	                    }
	                    //console.log(item);
	                    if(item.gender == "여자"){
	                    	itemsHTML += '<div class="col-4"><button class="btn btn-warning custom-btn btn-lg mt-1" type="button" data-pkid="'+ item.pkid + '" data-name="' + item.itemName + '" data-price="' + item.price + '" data-jungwon="'+item.jungwon+'" data-group="'+item.groupCode+'" data-name="'+item.itemName+'" >' + item.itemName + '<br>' + parseInt(item.price).toLocaleString() + '</button></div>';
	                    }else if(item.gender == "남자"){
	                    	itemsHTML += '<div class="col-4"><button class="btn btn-primary custom-btn btn-lg mt-1" type="button" data-pkid="'+ item.pkid + '" data-name="' + item.itemName + '" data-price="' + item.price + '" data-jungwon="'+item.jungwon+'" data-group="'+item.groupCode+'" data-name="'+item.itemName+'" >' + item.itemName + '<br>' + parseInt(item.price).toLocaleString() + '</button></div>';	
	                    }else{
	                    	itemsHTML += '<div class="col-4"><button class="btn btn-secondary custom-btn btn-lg mt-1" type="button" data-pkid="'+ item.pkid + '" data-name="' + item.itemName + '" data-price="' + item.price + '" data-jungwon="'+item.jungwon+'" data-group="'+item.groupCode+'" data-name="'+item.itemName+'" >' + item.itemName + '<br>' + parseInt(item.price).toLocaleString() + '</button></div>';
	                    }
	                    
	                }
	                itemsHTML += '</div></div>';
	                $('#item').html(itemsHTML);
	            },
	            error: function(xhr, status, error) {
	                console.error('전송 실패', error);
	            }
	        });
	    });
	    
	    $('#item').on('click', 'button', function(event) {
	        const target = $(event.currentTarget);
	        const pkid = target.data('pkid');
	        const itemName = target.data('name');
	        const price = parseFloat(target.data('price'));
	        const jungwon = parseInt(target.data('jungwon'));
	        const group = parseInt(target.data('group'));

	        let existingItem = null;
	        $('#tbody tr').each(function() {
	            const existingPKID = $(this).data('pkid');
	            if (existingPKID === pkid) {
	                existingItem = $(this);
	                if (selectedRow !== null) {
			            selectedRow.removeClass('selected');
			        }
	                selectedRow = existingItem;
			        selectedRow.addClass('selected');
			        inwonChk = false;
	                return false; // 중복 아이템을 찾으면 반복문 종료
	            }
	        });

	        if (existingItem) {
	            //updateQuantityAndTable('add', existingItem);
	            updateNumberOfQuantityAndTable("+1",existingItem);
	        } else {
	        	if (selectedRow !== null) {
		            selectedRow.removeClass('selected');
		        }
	            const row = $('<tr data-price="' + price + '" data-jungwon="'+jungwon+'" data-group="'+group+'" data-pkid="'+pkid+'" data-name="'+itemName+'" data-dcid="0" data-dcprice="0" data-amount="1" data-tprice="' + price + '">');
	            row.append($('<td>').text(itemName)); // 아이템 이름
	            row.append($('<td>').text('1')); // 기본 수량 1로 추가
	            row.append($('<td>').text(price.toLocaleString())); // 가격
	            $('#tbody').append(row);
	            selectedRow = row;
		        selectedRow.addClass('selected');
		        inwonChk = false;
	        }
	        updateTotalCountAndPrice();
	    }); 


	    $(".OrderNum").on('click',function(){
	    	var chk = $(this).data('num');
	    	switch(chk){
	    	case "C":
	    		selectedItems = {};
		        $('#tbody').empty(); // 아이템 내용 삭제
		        updateTotalCountAndPrice();
	    		break;
	    	default:
	    		updateNumberOfQuantityAndTable(chk,selectedRow);
	    		break;
	    	}
	    });
		
	    $('#tbody').on('click', 'tr', function() {
	        if (selectedRow !== null) {
	            selectedRow.removeClass('selected');
	        }
	        selectedRow = $(this);
	        selectedRow.addClass('selected');
	        inwonChk = false;
	    });

	    function updateNumberOfQuantityAndTable(action, item) {
	        const itemName = item.data('name');
	        const pkid = item.data('pkid');
	        let jungwon = item.data('jungwon');
	        const quantityCell = item.closest('tr').find('td:eq(1)');
	        const priceCell = item.closest('tr').find('td:eq(2)');
	        let quantity = parseInt(quantityCell.text());
	        let totalPrice = parseFloat(priceCell.text().replace(/,/g, ''));
	        let price = item.data('price');
	        let dcprice = item.data('dcprice');
	        let inwon = 0;
	        let toCount = parseInt($('.total-count').text());

	        $.ajax({
	        	url:"Jungwon",
	        	method: 'POST',
	            data: { "pkid": pkid },
	            async : false,
	            success: function(data) {
	            	inwon = data.inwon;
	            	jungwon = data.GroupJungwon;
	            },
	            error: function(e){
	            	console.log(e);
	            }
	        });

			if(action == "del"){
				if (quantity >= 10) {
					toCount = toCount - quantity;
					quantity = parseInt(quantityCell.text().substring(0,quantityCell.text().length-1));
					totalPrice = price * quantity;
	            }
			}else if (action.toString() === "0"){
				toCount = toCount - quantity;
				quantity = parseInt(quantityCell.text()+action);
				totalPrice = price * quantity;
			}else if (action.toString() === "+1"){
				toCount = toCount - quantity;
				quantity = parseInt(quantityCell.text())+1;
				totalPrice = price * quantity;
			}else if (action.toString() === "-1"){
				if (quantity > 1) {
					toCount = toCount - quantity;
					quantity = parseInt(quantityCell.text())-1;
					totalPrice = price * quantity;
	            }
			}else{
				toCount = toCount - quantity;
				if(inwonChk){
					quantity = parseInt(quantityCell.text()+action);
				}else{
					quantity = parseInt(action);
					inwonChk = true;
				}
				totalPrice = price * quantity;
			}
			totalPrice = totalPrice-dcprice;
			toCount = toCount + quantity;

			//console.log(jungwon,inwon,toCount);
			if(jungwon != 0 && jungwon - inwon < toCount){
				$('#resultmessage').html(itemName+"의 하루정원은 "+jungwon+"명 입니다.<br>현재 판매량 : "+ inwon+"<br>그래도 판매하시겠습니까?");
				$('.modal-footer').empty();
				var okaybutton = '<button class="btn btn-primary" type="button" data-bs-dismiss="modal" onclick="save()">확인</button>';
				var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				$('.modal-footer').append(okaybutton);
				$('.modal-footer').append(cancelbutton);
			    $('#modalButton').click();
			    modalcheck = true;
			}

			item.data('amount',quantity);
			item.data('tprice',totalPrice);

	        quantityCell.text(quantity);
	        priceCell.text(totalPrice.toLocaleString());
	        updateTotalCountAndPrice();
	    }
	    
	});
	/* 일일입장 버튼 끝 */

	
	    function updateTotalCountAndPrice() {
	        var totalCount = 0;
	        var totalPrice = 0;
	        let tDcPrice = 0;

	        $('#tbody tr').each(function(index, row) {
	            const quantityText = $(this).find('td:eq(1)').text();
	            const price = $(this).data('price');
				const tprice = $(this).data('tprice');
				const quantity = $(this).data('amount');
	            //const quantity = parseInt(quantityText, 10);
	            const DcPrice = parseInt($(this).data('dcprice'));

	            //console.log('Row:', index, 'Quantity:', $(this).data('amount'), 'Price:', $(this).data('price'), 'totPrice:', $(this).data('tprice'), 'DcPrice:', $(this).data('dcprice'));

	            if (!isNaN(quantity) && !isNaN(price)) {
	                totalCount += quantity;
	                totalPrice += price * quantity;
	                tDcPrice += DcPrice;
	            } else {
	                console.error('Invalid quantity or price in row ' + index);
	            }
	        });

	        //console.log('Total count:', totalCount, 'Total price:', totalPrice);

	        $('.total-count').text(totalCount);
	        $('.total-price').text(totalPrice.toLocaleString('en-US'));
	        $("#TotalPrice").val(totalPrice.toLocaleString('en-US'));
	        $("#DcPrice").val(tDcPrice.toLocaleString('en-US'));
	        $("#RealPrice").val((totalPrice-tDcPrice).toLocaleString('en-US'));
	    }

		let myPopup;

		function payDiscount(){
			var url = "${pageContext.request.contextPath}/order/discount.do";
	    	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=700,height=750";
	        if (myPopup === undefined || myPopup.closed) {
	            myPopup = window.open(url, "_blank", windowFeatures);
	        } else {
	        	myPopup.focus();
	        }
	        document.addEventListener('click', function() {
	            if (myPopup && !myPopup.closed) {
	                myPopup.focus();
	            }
	      	});
		}

		function payDiscountSet(DCID, DCRate, DCPrice){
			let price = selectedRow.data("price");
			let tprice = selectedRow.data("tprice");
	        let priceCell = selectedRow.find('td:eq(2)');
	        let dcTypeAll = $("#dcTypeAll").is(":checked");

	        if(dcTypeAll){
	        	$('#tbody tr').each(function(index, row) {
	        		price = $(this).data("price");
	    			tprice = $(this).data("tprice");
	    	        priceCell = $(this).find('td:eq(2)');
		        	if( DCID == "0"){
					}else{
						DCPrice = parseFloat(price) * (parseFloat(DCRate)/100);	
					}
					priceCell.text((tprice - parseInt(DCPrice)).toLocaleString());
					$(this).data("dcid", DCID);
					$(this).data("dcprice", DCPrice);
					$(this).data("tprice", tprice - parseInt(DCPrice));
	        	});
	        }else{
	        	if( DCID == "0"){
				}else{
					DCPrice = parseFloat(price) * (parseFloat(DCRate)/100);	
				}
				priceCell.text((tprice - parseInt(DCPrice)).toLocaleString());
				selectedRow.data("dcid", DCID);
				selectedRow.data("dcprice", DCPrice);
				selectedRow.data("tprice", tprice - parseInt(DCPrice));
	        }
			updateTotalCountAndPrice();
		}

		function payDiscountOff(){
			let price = selectedRow.data("price");
			let amount = selectedRow.data("amount");
			let priceCell = selectedRow.find('td:eq(2)');
	        let dcTypeAll = $("#dcTypeAll").is(":checked");

	        if(dcTypeAll){
	        	$('#tbody tr').each(function(index, row) {
	    			let price = $(this).data("price");
	    			let amount = $(this).data("amount");
	    			let priceCell = $(this).find('td:eq(2)');

	    			$(this).data("dcid", 0);
	    			$(this).data("dcprice", 0);
	    			$(this).data("tprice", price*amount);
					priceCell.text((price*amount).toLocaleString());
	        	});
	        }else{
				selectedRow.data("dcid", 0);
				selectedRow.data("dcprice", 0);
				selectedRow.data("tprice", price*amount);
				priceCell.text((price*amount).toLocaleString());
	        	
	        }
			updateTotalCountAndPrice();
		}
		
		<%-- 신용카드 결제 --%>
		function paycredit(){
			if(removeCommasFromNumber($('#RealPrice').val()) < 1 || $('#RealPrice').val() == ''){
				$('#resultmessage').html('받을 금액이 0원입니다.<br>확인 후 결제해 주세요.');
				$('.modal-footer').empty();
				var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				$('.modal-footer').append(cancelbutton);
				$('#modalButton').click();
				modalcheck = true;
				return false;
			}
			var saleNo = 0;
			var dataList = [];
			$('#tbody tr').each(function() {
				var data = {
						itemPKID: $(this).data('pkid'),
						itemName: $(this).data('name'),
						unitPrice: $(this).data('price'),
						DCCode: $(this).data('dcid'),
						DCPrice: $(this).data('dcprice'),
						amount: $(this).data('amount'),
						realPrice: $(this).data('tprice'),
				};
				dataList.push(data);
			});

			$.ajax({
				url:"${pageContext.request.contextPath}/orderTemp.do",
				type: "POST",
				dataType : 'json',
				contentType: 'application/json',
				async : false,
				data : JSON.stringify({
						"realPrice":removeCommasFromNumber($("#RealPrice").val()),
						"DCPrice":removeCommasFromNumber($("#DcPrice").val()),
						"details":dataList,
					}),
				success:function(data){
						saleNo = data;
						return false;
					},
				error:function(e){
					console.log(e);
					return false;
				}
			});
			
			var url = "${pageContext.request.contextPath}/lecture/CreditCard.do?payprice=" + $("#RealPrice").val() +"&MemberID=&tempSaleNo="+saleNo+"&Insert=&InType=일일입장";
			var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600";
		    if (myPopup === undefined || myPopup.closed) {
		        myPopup = window.open(url, "_blank", windowFeatures);
		    } else {
		    	myPopup.focus();
		    }
		    document.addEventListener('click', function() {
		        if (myPopup && !myPopup.closed) {
		            myPopup.focus();
		        }
		  	});
		}
		<%-- 결제 후 처리 --%>
		function totalchange(){
			$("#paidbody").empty();
		}
</script>
<script src="${pageContext.request.contextPath}/lib/js/common.js"></script>
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