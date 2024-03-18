<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SMS</title>
</head>
<body style="overflow: hidden;">
    <div class="card h-100 mb-1">
        <div class="card-body mb-n4 mt-n3">
            <div class="col-auto">
        		<div class="row justify-content-between">
        			<div class="col-auto">
						<h3 class="mb-3 pt-2">SMS 관리</h3>
            		</div>
            		<div class="col-auto">
            			<button class="btn btn-success" type="button" onclick="etcsave()">발송닷컴 CallBack인증(1회용)</button>
            			<button class="btn btn-primary" type="button" data-bs-toggle="modal" id="mungu" data-bs-target="#insertModal" onclick="munguManage()">자주쓰는 문구관리</button>
						<button class="btn btn-success" type="button" onclick="etcsave()">작업 초기화</button>
            		</div>
        		</div>
        	</div>
        </div>
    </div>
    <script type="text/javascript">
    	function munguManage() {
			$('#modal-content').load("insertClassInfo.do");
		}
    </script>
    <div class="row g-0 g-md-4 g-xl-6">
    	<div class="me-n5" style="width: 478px;">
    		<div class="card bg-1100 h-100 mb-1 w-20 ms-3 me-1 rounded-5">
		        <div class="card-body mb-n5 mt-n3 me-3 mx-n3" style="height: 800px;">
		        	<div class="col-auto mt-2">
						<div class="card border border-secondary">
							<div class="card-body" style="height: 670px;">
								<h4 class="card-title">▶제목</h4>
								<input class="form-control" id="title" type="text"/>
								<h4 class="card-title mt-3">▶문자내용</h4>
								<textarea class="form-control" id="exampleTextarea" rows="20"></textarea>
								<div class="text-end">
								SMS:0/96Bytes
								</div>
								<h4 class="card-title mt-3">▶보내는 사람 번호</h4>
								<input class="form-control" id="title" type="text"/>
							</div>
						</div>
						<div class="ms-13 mt-2">
							<button class="btn btn-info" type="button">보내기</button>
							<button class="btn btn-outline-info" type="button">삭제</button>
						</div>
					</div>
				</div>
			</div>
    	</div>
		<div class="col-md-7 col-lg-7 col-xl-8">
			<div class="card h-50">
		    	<div class="card-body my-n3">
		    		<h4 class="card-title mt-3">▶수신번호(받는 사람 번호)</h4>
		    		<div class="border-top border-bottom border-200" id="customerOrdersTable" style="overflow-y: scroll; height: 257px;"
	                    data-list='{"valueNames":["paiddate","paidcategory","paidprice","paidassignType","paidmapsa",""paidcardtype"","paidassignN","paidcardN","POS","signpad","OID","PayKind"],"page":6,"pagination":true}'>
	                	<div class="table-responsive scrollbar">
	                    	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
	                        	<thead>
		                        	<tr>
			                        	<th class="sort align-middle text-center" scope="col" data-sort="paiddate">선택</th>
			                           	<th class="sort align-middle text-center" scope="col" data-sort="paidcategory">회원번호</th>
			                           	<th class="sort align-middle text-center" scope="col" data-sort="paidprice">회원성명</th>
			                            <th class="sort align-middle text-center" scope="col" data-sort="paidassignType">성별</th>
			                            <th class="sort align-middle text-center" scope="col" data-sort="paidmapsa">회원구분</th>
			                            <th class="sort align-middle text-center" scope="col" data-sort="paidcardtype">일반전화</th>
			                            <th class="sort align-middle text-center" scope="col" data-sort="paidassignN">휴대전화</th>
			                            <th class="sort align-middle text-center" scope="col" data-sort="paidcardN">수신</th>
		                            </tr>
	                        	</thead>
	                        	<tbody class="list" id="paidbody">
	                        	</tbody>
	                    	</table>
	                    </div>
	            	</div>
	            	<div class="row mt-2">
	            		<div class="col">
	            			<button class="btn btn-outline-info" type="button">전체선택</button>
	            			<button class="btn btn-outline-info" type="button">전체선택</button>
	            		</div>
	            		<div class="col">
	            			<button class="btn btn-outline-info" type="button">검색결과 지우기</button>
	            		</div>
	            		<div class="col text-end">
	            			<button class="btn btn-outline-info" type="button">+목록추가</button>
	            		</div>
	            	</div>
		    	</div>
		    </div>
		    <div class="row">
		    	<div class="col me-n15">
		    		<div class="card mb-1 w-20 me-1" style="width: 350px;height:380px;">
				    	<div class="card-body mb-n5 mt-n3 me-3 mx-n4">
							<div class="row">
								<div class="col">
									<h4 class="card-title mt-3">▶전송자목록</h4>
									<div class="table-responsive scrollbar bg-light w-70" style="height: 270px;">
				                    	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
				                        	<thead>
					                        	<tr>
						                        	<th class="sort align-middle text-center" scope="col" data-sort="paiddate">선택</th>
						                           	<th class="sort align-middle text-center" scope="col" data-sort="paidcategory">회원번호</th>
					                            </tr>
				                        	</thead>
				                        	<tbody class="list" id="paidbody">
				                        	</tbody>
				                    	</table>
			                    	</div>
			                    	<div class="row">
			                    		<div class="col mt-2">
			                    			<button class="btn btn-outline-info me-2" type="button">전체삭제</button>
			                    			<button class="btn btn-outline-info" type="button">선택영역 삭제</button>
			                    		</div>
			                    	</div>
								</div>
							</div>
				    	</div>
				    </div>
		    	</div>
		    	<div class="col ms-n8">
		    		<div class="card mb-1" style="width: 500px;height:380px;">
				    	<div class="card-body mb-n5 mt-n3 me-3 mx-n4">
							<div class="row">
								<div class="col">
									<div class="row justify-content-between">
										<div class="col-auto">
											<h4 class="card-title mt-3">▶전송자목록</h4>	
										</div>
										<div class="col-auto">
											<div class="form-check form-check-inline mt-2">
												<input class="form-check-input" id="nocheck" type="checkbox" value="option1" />
												<label class="form-check-label" for="nocheck">수신거부제외</label>
											</div>
										</div>
									</div>
									<div class="col-5 ms-4">
										<div class="input-group">
											<span class="input-group-text" id="basic-addon1">회원성명</span>
											<input class="form-control" type="text" aria-describedby="basic-addon1" />
										</div>
									</div>
									<div class="col-9 ms-4 mb-2">
										<div class="input-group">
											<span class="input-group-text" id="basic-addon1">전화번호</span>
											<input class="form-control" type="text" aria-describedby="basic-addon1" />
											<span class="input-group-text">입력(추가)</span>
  											<span class="input-group-text">취소</span>
										</div>
									</div>
									<div class="table-responsive scrollbar bg-light" style="height: 230px;">
				                    	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
				                        	<thead>
					                        	<tr>
						                        	<th class="sort align-middle text-center" scope="col" data-sort="paiddate">선택</th>
						                           	<th class="sort align-middle text-center" scope="col" data-sort="paidcategory">회원번호</th>
					                            </tr>
				                        	</thead>
				                        	<tbody class="list" id="paidbody">
				                        	</tbody>
				                    	</table>
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
<div class="modal fade" id="insertModal" tabindex="-1" data-bs-backdrop="static" aria-labelledby="insertModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-md">
		<div class="modal-content" id="01">
			<jsp:include page="munguSMSF.jsp"/>
		</div>
	</div>
</div>
</html>
<%@ include file="../../include/foot.jsp" %>