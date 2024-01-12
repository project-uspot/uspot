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
			<h1 id="date"></h1>
		</div>
		<div class="card-body pb-3">
			<div class="col-12 col-xxl-8">
				<div class="mb-6">
					<div class="row flex-row">
						<div class="row">
							<div class="col-auto">
								<div class="card">
									<div class="card-body">
										<!-- <button class="btn btn-secondary btn-lg" type="button" disabled 
										style="width: 114px; height: 100px;"><b>일일입장</b></button> -->
										<div class="btn-group btn-group-lg" role="group" aria-label="First group">
										    <button class="btn btn-secondary ms-2 fs-5" id="prevButton" type="button"><span data-feather="chevron-left"></span></button>
										    <c:forEach items="${group}" var="group" varStatus="loop">
										        <button class="btn btn-secondary ms-1 groupButton" type="button" value="${group.pkid }">${group.groupName}</button>
										    </c:forEach>
										    <button class="btn btn-secondary ms-2" id="nextButton" ><span data-feather="chevron-right"></span></button>
										</div>
										<div class="card mt-2">
											<div class="card-body">
												<div id="item">
													<div class="row">
												        <%-- <c:forEach items="${item}" var="item" varStatus="loop">
												            <c:if test="${loop.index % 3 == 0}">
												                </div><div class="row">
												            </c:if>
												            <div class="col-4">
												                <button class="btn btn-secondary custom-btn btn-lg  mt-1 " type="button">${item.itemName}</button>
												            </div>
												        </c:forEach> --%>
												    </div>
												</div>
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
											<div class="col-auto">
												<button type="button" class="btn btn-soft-primary" id="clean" style="width: 74px;">CLS</button>
												<button type="button" class="btn btn-soft-primary" id="plus" style="width: 66px;">+1</button>
												<button type="button" class="btn btn-soft-primary" id="minus" style="width: 64px">-1</button>
												<button type="button" class="btn btn-soft-primary" style="width: 59px"><span class="uil-backspace text-center" style="font-size: 20px"></span></button>
											</div>
										</div>
										<div class="row mt-1">
											<div class="col-auto">
												<button type="button" class="btn btn-soft-primary btn-sm" style="width: 50px;">1</button>
												<button type="button" class="btn btn-soft-primary btn-sm" style="width: 50px;">2</button>
												<button type="button" class="btn btn-soft-primary btn-sm" style="width: 50px;">3</button>
												<button type="button" class="btn btn-soft-primary btn-sm" style="width: 50px;">4</button>
												<button type="button" class="btn btn-soft-primary btn-sm" style="width: 50px;">5</button>
											</div>
										</div>
										<div class="row mt-1">
											<div class="col-auto ">
												<button type="button" class="btn btn-soft-primary btn-sm" style="width: 50px;">6</button>
												<button type="button" class="btn btn-soft-primary btn-sm" style="width: 50px;">7</button>
												<button type="button" class="btn btn-soft-primary btn-sm" style="width: 50px;">8</button>
												<button type="button" class="btn btn-soft-primary btn-sm" style="width: 50px;">9</button>
												<button type="button" class="btn btn-soft-primary btn-sm" style="width: 50px;">0</button>
											</div>
										</div>
										<div class="card mt-2">
											<div class="card-body">
												<div class="col-auto">
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
								</div>
							</div>
							<div class="col-sm-3">
								<div class="card">
									<div class="card-header">
										<div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="ZipCodespan">청구금액</span>
											<input class="form-control" id="TotalPrice" name="TotalPrice" type="text" name="ZipCode" readonly />
										</div>
										<div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="ZipCodespan">할인금액</span>
											<input class="form-control" id="DcPrice" name="DcPrice" type="text" name="ZipCode" readonly />
										</div>
										<div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="ZipCodespan">결제금액</span>
											<input class="form-control" id="RealPrice" name="RealPrice" type="text" name="ZipCode" readonly />
										</div>
										<div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="ZipCodespan">받은  돈</span>
											<input class="form-control" id="Deposit" name="Deposit" type="text" name="ZipCode" readonly />
										</div>
										<div class="input-group input-group-sm mb-1">
											<span class="input-group-text" id="ZipCodespan">거스름 돈</span>
											<input class="form-control" id="Change" name="Change" type="text" name="ZipCode" readonly />
										</div>
									</div>
									<div class="card-body">
										<div class="row mt-1">
											<div class="col-auto">
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">7</button>
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">8</button>
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">9</button>
											</div>                                                                      
										</div>                                                                          
										<div class="row mt-1">                                                               
											<div class="col-auto">                                                      
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">4</button>
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">5</button>
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">6</button>
											</div>                                                                      
										</div>                                                                          
										<div class="row mt-1" >                                                               
											<div class="col-auto">                                                      
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">1</button>
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">2</button>
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">3</button>
											</div>
										</div>
										<div class="row mt-1" >                                                               
											<div class="col-auto">                                                      
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">0</button>
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">00</button>
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">000</button>
											</div>
										</div>
										<div class="row mt-1 " >                                                               
											<div class="col-auto">                                                      
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">-</button>
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;"><span class="uil-backspace"></span></button>
												<button type="button" class="btn btn-soft-primary btn-lg" style="width: 88px;">CLS</button>
											</div>
										</div>
									</div>
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col-auto">
													<button type="button" class="btn btn-phoenix-primary" >할인</button>
													<button type="button" class="btn btn-phoenix-primary " >현금</button>
													<button type="button" class="btn btn-phoenix-primary " >현금영수증</button>
												</div>
												<div class="col-auto mt-1">
													<button type="button" class="btn btn-phoenix-primary " >신용카드</button>
													<button type="button" class="btn btn-phoenix-primary" disabled >-</button>
													<button type="button" class="btn btn-phoenix-primary " >제로페이</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	
	/* 일일입장 버튼 */
	$(document).ready(function() {
	    let selectedItems = {}; // 선택된 아이템을 저장할 객체 (아이템명을 키로 사용)
	    let selectedRow = null;
	
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
	                    itemsHTML += '<div class="col-4"><button class="btn btn-secondary custom-btn btn-lg mt-1" type="button" data-pkid="'+ item.pkid + '" data-name="' + item.itemName + '" data-price="' + item.price + '">' + item.itemName + '<br>' + parseInt(item.price).toLocaleString() + '</button></div>';
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
	        const itemName = target.data('name');
	        const price = parseFloat(target.data('price'));

	        let existingItem = null;
	        $('#tbody tr').each(function() {
	            const existingName = $(this).find('td:eq(0)').text();
	            if (existingName === itemName) {
	                existingItem = $(this);
	                return false; // 중복 아이템을 찾으면 반복문 종료
	            }
	        });

	        if (existingItem) {
	            updateQuantityAndTable('add', existingItem);
	        } else {
	            const row = $('<tr>');
	            row.append($('<td>').text(itemName)); // 아이템 이름
	            row.append($('<td>').text('1')); // 기본 수량 1로 추가
	            row.append($('<td>').text(price.toLocaleString())); // 가격
	            $('#tbody').append(row);
	        }
	        updateTotalCountAndPrice();
	    });

	    $('#clean').on('click', function() {
	        selectedItems = {};
	        $('#tbody').empty(); // 아이템 내용 삭제
	        updateTotalCountAndPrice();
	    });
	    
	    $('#plus').on('click', function() {
	        if (selectedRow) {
	            updateQuantityAndTable('increase', selectedRow);
	        }
	    });
	    
	    $('#minus').on('click', function() {
	        if (selectedRow) {
	            updateQuantityAndTable('decrease', selectedRow);
	        }
	    });
		
	    $('#tbody').on('click', 'tr', function() {
	        if (selectedRow !== null) {
	            selectedRow.removeClass('selected');
	        }
	        selectedRow = $(this);
	        selectedRow.addClass('selected');
	    });
	    
	    function updateQuantityAndTable(action, item) {
	        const itemName = item.data('name');
	        const pkid = item.data('pkid');
	        const quantityCell = item.closest('tr').find('td:eq(1)');
	        const priceCell = item.closest('tr').find('td:eq(2)');
	        let quantity = parseInt(quantityCell.text());
	        let totalPrice = parseFloat(priceCell.text().replace(/,/g, ''));
	        let price = totalPrice / quantity;
			
	        if (action === 'increase') { /* +1 눌렀을때 */
	        	console.log("action : " + action);      
	        	quantity++;
	            totalPrice += price;
	        } else if (action === 'add') { /* 일일입장 버튼 눌렀을때 */
	            if (selectedItems[itemName]) {
	                selectedItems[itemName].quantity += 1;
	            } else {
	                const newPrice = parseFloat(item.data('price'));
	                selectedItems[itemName] = { price: newPrice, quantity: 1, pkid: pkid };
	            }

	            quantity = selectedItems[itemName].quantity;
	            totalPrice = selectedItems[itemName].price * quantity;
	        } else if (action === 'decrease') {
	        	if (quantity > 1) { // 수량이 1 이상인 경우에만 감소하도록 조건 추가
	                quantity--;
	                totalPrice -= price;
	            }
	        }
	        quantityCell.text(quantity);
	        priceCell.text(totalPrice.toLocaleString());
	        updateTotalCountAndPrice();
	    }

	    function updateTotalCountAndPrice() {
	        
	        var totalCount = 0;
	        var totalPrice = 0;

	        $('#tbody tr').each(function() {
	            const quantity = parseInt($(this).find('td:eq(1)').text());
	            totalCount += quantity;

	            console.log("parseFloat($(this).find('td:eq(2)').text().replace(/,/g, '')) : " +parseFloat($(this).find('td:eq(2)').text().replace(/,/g, '')));
	            const price = parseFloat($(this).find('td:eq(2)').text().replace(/,/g, ''));
	            
	            totalPrice += price;
	        });

	        $('.total-count').text(totalCount);
	        $('.total-price').text(totalPrice.toLocaleString());
	    }
	    
	    
	});
	/* 일일입장 버튼 끝 */

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