<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/jsp/include/head.jsp">
	<jsp:param value="회원관리 프로그램 - 일일입장 할인" name="title"/>
</jsp:include>
<body>
<main class="main" id="top">
	<div class="card mb-1">
		<div class="card-body pb-1">
			<div class="col-12 col-xxl-8">
				<div class="g-3">
					<div class="g-3">
                        <h3 class="pt-2">할인유형 선택</h3>
                    </div>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-auto w-100">
					<div class="card">
						<div class="card-header">
							<div class="btn-group btn-group-lg" role="group" aria-label="First group">
							    <button class="btn btn-secondary ms-2 fs-5" id="prevButton" type="button">
							    	<span data-feather="chevron-left"></span>
							    </button>
								<c:forEach items="${dcList}" var="dc" varStatus="loop">
									<button class="btn btn-outline-secondary ms-1 groupButton" type="button" value="${dc.dcid }" onclick="payDiscount(${dc.dcid }, ${dc.rate })">${dc.dcName}</button>
						    	</c:forEach>
							    <button class="btn btn-secondary ms-2" id="nextButton" >
							    	<span data-feather="chevron-right"></span>
							    </button>
							</div>
						</div>
						<div class="card-body pb-0">
							<div class="input-group input-group-sm mb-1">
								<span class="input-group-text" id="DcPricespan">할인금액</span>
								<input class="form-control" id="DcPrice" name="DcPrice" type="text" readonly />
							</div>
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
									<button type="button" class="btn btn-phoenix-secondary w-100" onclick="payDiscountSet()" >할인</button>
								</div>
								<div class="col-auto ps-1 w-33">
									<button type="button" class="btn btn-soft-warning w-100"  onclick="payDiscountOff()">할인취소</button>
								</div>
								<div class="col-auto ps-1 w-33">
									<button type="button" class="btn btn-secondary w-100" onclick="self.close()">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/include/foot.jsp"></jsp:include>
</main>
<script>
window.removeEventListener('beforeunload', beforeUnloadHandler);

let groupButtons = document.querySelectorAll('.groupButton');
let prevButton = document.getElementById('prevButton');
let nextButton = document.getElementById('nextButton');
let currentIndex = 0;
const groupsPerPage = 3; // 한 페이지에 보여질 그룹 개수
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

function payDiscount(dcid, DcRate){
	opener.payDiscountSet(dcid, DcRate, 0);
	self.close();
}
function payDiscountSet(){
	opener.payDiscountSet(0,0,$("#DcPrice").val());
	self.close();
}
function payDiscountOff(){
	opener.payDiscountOff();
	self.close();
}

$(".PriceNum").on('click',function(){
	var chk = $(this).data('num').toString();
	let DcPrice = $("#DcPrice").val().toString();
	switch(chk){
	case "cls":
        $("#DcPrice").val('');
		break;
	case "del":
		DcPrice = DcPrice.substring(0,DcPrice.length-1);
		$("#DcPrice").val(DcPrice);
		break;
	case "-":
		if(parseInt(DcPrice) != 0 && DcPrice.length > 0){
			DcPrice = DcPrice * (-1);
		}else {
			DcPrice = chk;
		}
		$("#DcPrice").val(DcPrice);
		break;
	case "0":case "00":case "000":
		if(parseInt(DcPrice) != 0 && DcPrice.length > 0){
			DcPrice = DcPrice + chk.toString();
			$("#DcPrice").val(DcPrice);	
		}
		break;
	default:
		DcPrice = DcPrice + chk;
		$("#DcPrice").val(DcPrice);
		break;
	}
});

</script>
</body>
</html>