<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>환불정보 등록 및 변경</title>
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
<body style="overflow:scroll;">
    <div class="card h-100 mb-1" style="width: 1595px;">
        <div class="card-body mb-n4 mt-n3">
            <div class="col-12">
                <div>
                    <div class="row g-3">
                        <h3 class="mb-3 w-25 pt-2">환불정보 등록 및 변경</h3>
                        <div style="margin-top: -46px;margin-left: 300px;">
                        	<div class="col-auto position-absolute" style="margin-left:700px;">
	                            <c:choose>
	                        		<c:when test="${fmsc_s01List[0].state eq 'F0'}">
	                        			<button class="btn btn-phoenix-primary" type="button" onclick="alreadyrefund()">환불대기(T)</button>
	                        		</c:when>
	                        		<c:when test="${fmsc_s01List[0].state eq 'E'}">
	                        			<button class="btn btn-phoenix-primary" type="button" onclick="alreadyrefund()" disabled="disabled">환불대기(T)</button>
	                        		</c:when>
	                        		<c:otherwise>
	                        			<button class="btn btn-phoenix-primary" type="button" onclick="wait_save()">환불대기(T)</button>
	                        		</c:otherwise>
	                        	</c:choose>
	                        </div>
	                        <div class="col-auto position-absolute" style="margin-left:850px;">
	                        	<c:choose>
	                        		<c:when test="${fmsc_s01List[0].state eq 'F0'}">
	                        			<button class="btn btn-phoenix-secondary" type="button" onclick="alreadyrefund()">대기취소(Q)</button>
	                        		</c:when>
	                        		<c:when test="${fmsc_s01List[0].state != 'E'}">
	                        			<button class="btn btn-phoenix-secondary" type="button" onclick="notwait()">대기취소(Q)</button>
	                        		</c:when>
	                        		<c:otherwise>
	                        			<button class="btn btn-phoenix-secondary" type="button" onclick="wait_cancel()">대기취소(Q)</button>
	                        		</c:otherwise>
	                        	</c:choose>
	                        </div>
	                        <div class="col-auto position-absolute" style="margin-left:1000px;">
	                        	<c:choose>
	                        		<c:when test="${fmsc_s01List[0].state eq 'F0'}">
	                        			<button class="btn btn-success" type="button" onclick="alreadyrefund()">환불완료(S)</button>
	                        		</c:when>
	                        		<c:otherwise>
	                        			<button class="btn btn-success" type="button" onclick="save()">환불완료(S)</button>
	                        		</c:otherwise>
	                        	</c:choose>
	                        </div>
	                        <div class="col-auto position-absolute" style="margin-left:1150px;">
	                            <button class="btn btn-danger" type="button" onclick="alldelete()">삭제(D)</button>
	                    	</div>
                        </div>
                    </div>
                    <div class="border-top border-bottom border-200" id="customerOrdersTable" style="height: 150px;overflow-y: scroll;"
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
								<tbody class="list" id="itemtbody">
									<c:forEach items="${fmsc_s01List }" var="fmsc_s01" varStatus="status">
										<c:set var="item" value="${itemList[status.index]}" />
										<c:if test="${fmsc_s01.curState == 1 or fmsc_s01.state eq 'E' }">
										<tr>
											<td class="code align-middle white-space-nowrap text-center fw-bold">
												${item.ItemCode}
												<input type="hidden" id="ItemID" name="ItemID" value="${item.ItemID}">
												<input type="hidden" id="SaleNo" name="SaleNo" value="${fmsc_s01.saleNo}">
												<input type="hidden" id="GroupSaleNo" name="GroupSaleNo" value="${fmsc_s01.groupSaleNo}">
												<input type="hidden" id="InType" name="InType" value="${fmsc_s01.inType}">
											</td>
											<td class="category align-middle white-space-nowrap text-center">
												<c:choose>
													<c:when test="${item.Type eq 'G'}">
														일반
													</c:when>
													<c:when test="${item.Type eq 'S'}">
														특강
													</c:when>
												</c:choose>
											</td>
											<td class="item align-middle white-space-nowrap text-start fw-bold text-700">${item.CategoryName}</td>
											<td class="name align-middle white-space-nowrap text-900 fs--1 text-start">${item.JungName}</td>
											<td class="day align-middle white-space-nowrap text-center">${item.DayName}</td>
											<td class="time align-middle white-space-nowrap text-start">${item.FromTime}</td>
											<td class="level align-middle white-space-nowrap text-start">${item.LevelName}</td>
											<td class="member align-middle white-space-nowrap text-start">${item.DaesangName}</td>
											<td class="teacher align-middle white-space-nowrap text-start">${item.SawonName}</td>
											<td class="date py-2 align-middle white-space-nowrap">${fmsc_s01.fromDate}~${fmsc_s01.toDate}(${fmsc_s01.regMonth})</td>
											<td class="price py-2 align-middle white-space-nowrap text-end"><fmt:formatNumber value="${fmsc_s01.itemPrice}" pattern="#,###"/></td>
											<td class="dc py-2 align-middle white-space-nowrap text-end"><fmt:formatNumber value="${fmsc_s01.DCPrice}" pattern="#,###"/></td>
											<td class="sort py-2 align-middle white-space-nowrap text-end"><fmt:formatNumber value="${fmsc_s01.realPrice}" pattern="#,###"/></td>
											<td class="dccode py-2 align-middle white-space-nowrap">${fmsc_s01.DCID}</td>
											<td class="dcpercent py-2 align-middle white-space-nowrap">${fmsc_s01.discountRate}</td>
											<td class="max py-2 align-middle white-space-nowrap">${item.OffMax + item.OnMax}</td>
											<td class="enter py-2 align-middle white-space-nowrap">${item.RegCnt + item.RegCnt2 + list.RegCnt3}</td>
											<td class="remain py-2 align-middle white-space-nowrap">${item.OffMax + item.OnMax - (item.RegCnt + item.RegCnt2 + list.RegCnt3)}</td>
											<td class="paidPrice py-2 align-middle white-space-nowrap text-end" style="display:none;"><fmt:formatNumber value="${fmsc_s01.paidPrice}" pattern="#,###"/></td>
											<td class="dcname py-2 align-middle white-space-nowrap text-end" style="display:none;">${fmsc_s01.DCName}</td>
											<td class="itemMonth py-2 align-middle white-space-nowrap text-end" style="display:none;">${item.itemmonth}</td>
											<input type="hidden" value="30" name="totalnum" id="totalnum">
											<input type="hidden" value="30" name="usenum" id="usenum">
											<input type="hidden" value="${fmsc_s01.saleDate }" name="SaleDate" id="SaleDate">
											<%-- <input type="hidden" value="${fmsc_s01.SawonNo }" name="EmpCode" id="EmpCode"> --%>
										</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="border-top border-bottom border-200" id="customerOrdersTable" style="height: 150px;overflow-y: scroll;"
						data-list='{"valueNames":["code","category","item","name","day","time","level","member","teacher","date","price","dc","sort","dccode","dcpercent","max","enter","remain"],"page":6,"pagination":true}'>
						<div class="table-responsive scrollbar">
							<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
								<thead>
									<tr>
										<th class="sort align-middle" scope="col" data-sort="item">종목</th>
										<th class="sort align-middle" scope="col" data-sort="name">강습반명</th>
										<th class="sort align-middle" scope="col" data-sort="day">요일</th>
										<th class="sort align-middle" scope="col" data-sort="time">시간</th>
										<th class="sort align-middle" scope="col" data-sort="level">단계</th>
										<th class="sort align-middle" scope="col" data-sort="totalCnt">총일수</th>
										<th class="sort align-middle" scope="col" data-sort="useCnt">사용일수</th>
										<th class="sort align-middle" scope="col" data-sort="wiyakPrice">위약금</th>
										<th class="sort align-middle" scope="col" data-sort="usePrice">사용금액</th>
										<th class="sort align-middle" scope="col" data-sort="gongjePrice">공제합계</th>
										<th class="sort align-middle" scope="col" data-sort="returnPrice">반환금액</th>
									</tr>
								</thead>
								<tbody class="list" id="refundtbody">
								<c:forEach items="${refundList }" var="refund">
								<tr class="${refund.SaleNo }">
									<td class="item align-middle white-space-nowrap fw-bold text-700 text-center">${refund.CategoryName}</td>
									<td class="name align-middle white-space-nowrap text-900 fs--1 text-center">${refund.JungName}</td>
									<td class="day align-middle white-space-nowrap text-center">${refund.DayName}</td>
									<td class="time align-middle white-space-nowrap text-center">${refund.FromTime}</td>
									<td class="level align-middle white-space-nowrap text-center">${refund.LevelName}</td>
									<td class="totalCnt align-middle white-space-nowrap text-center">${refund.totalCnt}</td>
									<td class="useCnt align-middle white-space-nowrap text-center">${refund.dayCnt}</td>
									<td class="wiyakPrice align-middle white-space-nowrap text-end"><fmt:formatNumber value="${refund.WiyakPrice}" pattern="#,###"/></td>
									<td class="usePrice align-middle white-space-nowrap text-end"><fmt:formatNumber value="${refund.UsePrice}" pattern="#,###"/></td>
									<td class="gongjePrice align-middle white-space-nowrap text-end"><fmt:formatNumber value="${refund.GongjePrice}" pattern="#,###"/></td>
									<td class="returnPrice align-middle white-space-nowrap text-end"><fmt:formatNumber value="${refund.RefundPrice}" pattern="#,###"/></td>
									<td class="realPrice py-2 align-middle white-space-nowrap text-end" style="display:none;">${refund.RealPrice}</td>
									<td class="paidPrice py-2 align-middle white-space-nowrap text-end" style="display:none;">${refund.PaidPrice}</td>
									<td class="minapPrice py-2 align-middle white-space-nowrap text-end" style="display:none;">${refund.Misu}</td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
	    <div class="card h-100 mb-1 ms-3 me-1" style="width: 240px;">
	        <div class="card-body mb-n5 mt-n3 me-3 mx-n3" style="height: 330px;">
	            <div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">회원번호</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="memberid" name="memberid" value="${member.memberID}" readonly="readonly"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">회원성명</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="name" name="name" value="${member.name}"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">회원성별</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="gendertext" name="gendertext" value="${member.genderText}"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">회원구분</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="type" name="type" value="${member.typeText}"/>
						<input type="hidden" id="yearage" name="yearage" value="${yearage}">
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">휴대전화</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="cellphone" name="cellphone" value="${member.cellPhone}"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">일반전화</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="homephone" name="homephone" value="${member.homePhone}"/>
					</div>
				</div>
	        </div>
	    </div>
	    <div class="card h-100 mb-1 me-1" style="width: 465px;">
	        <div class="card-body mb-n5 mt-n3 mx-n4" style="height: 425px; width: 510px;">
	            <div class="col-md-10">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">강습반</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="olditemname" name="olditemname" value="<%-- ${itemname} --%>" readonly="readonly"/>
						<input type="hidden" id="saleno" name="saleno" value="<%-- ${fmsc_s01.saleNo} --%>">
					</div>
				</div>
				<div class="col-md-5">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">등록일자</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="saledate" name="saledate" value="<%-- ${fmsc_s01.saleDate} --%>" readonly="readonly"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">강습기간</span>
								<input class="form-control" type="text" aria-describedby="basic-addon1" id="fromdate" name="fromdate" style="width: 110px;" value="<%-- ${fmsc_s01.fromDate} --%>" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto mt-1 mx-n4">
							~
						</div>
						<div class="col-auto ms-n1">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="todate" name="todate" style="width: 115px;" value="<%-- ${fmsc_s01.toDate} --%>" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto ms-n3">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="regmonth" name="regmonth" style="width: 50px;" value="<%-- ${fmsc_s01.regMonth} --%>" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto ms-n2 mt-2">
							개월
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">A.강습료</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="itemprice" name="itemprice" 
						value="<%-- <fmt:formatNumber value="${fmsc_s01.itemPrice}" pattern="#,###"/> --%>" readonly="readonly" style="text-align: right;"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-md-5">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">B.할인</span>
								<input class="form-control" type="text"  id="dcprice" name="dcprice" value="<%-- <fmt:formatNumber value="${fmsc_s01.DCPrice}" pattern="#,###"/> --%>"  
								readonly="readonly" style="text-align: right;"/>
							</div>
						</div>
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="olddcname" name="<%-- ${dcid} --%>" value="<%-- ${dcname} --%>" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">C.판매금액</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="realprice" name="realprice"
						 value="<%-- <fmt:formatNumber value="${fmsc_s01.realPrice}" pattern="#,###"/> --%>" readonly="readonly" style="text-align: right;"/>
					</div>
				</div>
				<div class="col-md-5">
					<div class="input-group input-group-sm" style="width: 193px;">
						<span class="input-group-text" id="basic-addon1">D.결제금액</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="tpaidprice" name="tpaidprice" readonly="readonly" style="text-align: right;"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-md-5">
							<div class="input-group input-group-sm" style="width: 193px;">
								<span class="input-group-text" id="basic-addon1">E.기본개월</span>
								<input class="form-control" type="text" aria-describedby="basic-addon1" id="itemmonth" name="itemmonth" readonly="readonly" value="<%-- ${itemmonth} --%>" style="text-align: center;"/>
							</div>
						</div>
						<div class="col-auto">
							<div class="card border border-primary mt-n8">
						    	<div class="card-body my-n3" style="width: 226px;">
						      		<div class="col-auto">
		                        		<div class="row">
		                           			<div class="col-auto">
												<h4 class="card-title mb-2">환불 옵션</h4>
												<div class="row">
													<div class="col-auto ms-n3">
														<div class="input-group input-group-sm" style="width: 232px;">
															<div class="form-check form-check-inline" aria-describedby="basic-addon1">
																<input class="form-check-input" id="dues1" type="radio" name="dues" value="0" aria-describedby="basic-addon1" <c:if test="${duescheck == 0}">checked="checked"</c:if> />
																<label class="form-check-label" for="dues1">납입회비</label>
															</div>
															<div class="form-check form-check-inline ms-n3" aria-describedby="basic-addon1">
																<input class="form-check-input" id="dues2" type="radio" name="dues" value="1" aria-describedby="basic-addon1" <c:if test="${duescheck == 1}">checked="checked"</c:if>/>
																<label class="form-check-label" for="dues2">표준회비</label>
															</div>
														</div>
													</div>
												</div>
												<div class="col-auto">
													<select class="form-select form-select-sm mb-1" id="gongje" name="gongje">
														<c:forEach var="gongje" items="${gongjelist}">
															<c:choose>
																<c:when test="${gongje.codeValue eq '1'}">
																	<option value="${gongje.codeName}" selected="selected">${gongje.codeName}</option>
																</c:when>
																<c:otherwise>
																	<option value="${gongje.codeName}">${gongje.codeName}</option>	
																</c:otherwise>
															</c:choose>
					                                	</c:forEach>
													</select>
												</div>
												<div class="col-auto">
													<select class="form-select form-select-sm mb-1" id="wiyak" name="wiyak">
														<c:forEach var="wiyak" items="${wiyaklist}">
															<c:choose>
																<c:when test="${wiyak.codeValue eq '1'}">
																	<option value="${wiyak.codeName}" selected="selected">${wiyak.codeName}</option>
																</c:when>
																<c:otherwise>
																	<option value="${wiyak.codeName}">${wiyak.codeName}</option>	
																</c:otherwise>
															</c:choose>
					                                	</c:forEach>
													</select>
												</div>
												<div class="col-auto">
													<select class="form-select form-select-sm mb-1" id="julsak" name="julsak">
														<c:forEach var="julsak" items="${julsaklist}">
															<c:choose>
																<c:when test="${julsak.codeValue eq '1'}">
																	<option value="${julsak.codeName}" selected="selected">${julsak.codeName}</option>
																</c:when>
																<c:otherwise>
																	<option value="${julsak.codeName}">${julsak.codeName}</option>	
																</c:otherwise>
															</c:choose>
					                                	</c:forEach>
													</select>
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
	    <div class="card h-100 mb-1 me-1" style="width: 562px;">
	        <div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 425px;">
	        	<div class="row">
	        		<div class="col-auto">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">환불일자</span>
							<input class="form-control" type="date" name="regdate" id="regdate"/>
						</div>
					</div>
					<div class="col-auto">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">금액반환일</span>
							<input class="form-control" type="date" id="canceldate" name="canceldate"/>
						</div>
					</div>
	        	</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1" style="width: 85px;">총일수</span>
								<input class="form-control" type="number" id="totalcnt" name="totalcnt" style="width: 75px;"/>
							</div>
						</div>
						<div class="col-auto ms-10">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1" style="width: 100px;">총 사용일수</span>
								<input class="form-control" type="number" id="usecnt" name="usecnt" style="width: 75px;"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1" style="width: 122px;">1_1.전월할인</span>
								<c:set var="dcrate"></c:set>
								<select class="form-select" id="prevdc" name="prevdc" style="width: 152px; text-align: right;" disabled="disabled">
									<option id="0" value="0"></option>
									<c:forEach var="dc" items="${dclist}">
										<option id="${dc.rate}" value="${dc.dcid}">${dc.dcName}</option>
                                	</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<input class="form-control" type="number" id="totaldcper" name="totaldcper" style="width: 72px;" value="${dcrate}" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto mt-1">
							%
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="totaldcprice" name="totaldcprice" style="width: 97px;" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">1.전월사용금액</span>
								<input class="form-control" type="text" id="prevuseprice" name="prevuseprice" readonly="readonly" value="0" style="width: 152px;color:darkgray;text-align: right;"/>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<input class="form-control" type="number" id="prevusemmonth" name="prevusemmonth" style="width: 72px;" readonly="readonly" value="0"/>
								<span class="input-group-text" id="basic-addon1">개월(a)</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1" style="width: 122px;">2_1.(당월)할인</span>
								<select class="form-select" id="currentdc" name="currentdc" style="width: 152px; text-align: right;" disabled="disabled">
									<option id="0" value="0"></option>
									<c:forEach var="dc" items="${dclist}">
										<option id="${dc.rate}" value="${dc.dcid}">${dc.dcName}</option>
                                	</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<input class="form-control" type="number" id="currentdcper" name="currentdcper" value="${dcrate}" style="width: 72px;" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto mt-1">
							%
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="currentdcprice" name="currentdcprice" style="width: 97px;" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm" style="width: 272px;">
						<span class="input-group-text" id="basic-addon1">2.(당월)위약금액</span>
						<input class="form-control" type="text" id="wiyakprice" name="wiyakprice" readonly="readonly" style="text-align: right;" value="0"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">4.(당월)사용금액</span>
								<input class="form-control" type="text" id="currentuseprice" name="currentuseprice" readonly="readonly" style="width: 144px;text-align: right;" value="0"/>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">3.(당월)사용일수</span>
								<input class="form-control" type="number" id="currentuseday" name="currentuseday" style="width: 72px;"/>
								<span class="input-group-text" id="basic-addon1">일</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm" style="width: 272px;">
						<span class="input-group-text" id="basic-addon1">5.공제합계(1+4)</span>
						<input class="form-control" type="text" id="gongjesum" name="gongjesum" readonly="readonly" style="text-align: right;color:darkgray;"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">6.잔여개월금액</span>
								<input class="form-control" type="text" id="remainprice" name="remainprice" readonly="readonly" style="width: 152px;text-align: right;color:darkgray;"/>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<input class="form-control" type="number" id="remainmonth" name="remainmonth" style="width: 72px;color:darkgray;" readonly="readonly"/>
								<span class="input-group-text" id="basic-addon1">개월(b)</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm" style="width: 272px;">
						<span class="input-group-text" id="basic-addon1">7.반환금액</span>
						<input class="form-control" type="text" id="returnprice" name="returnprice" readonly="readonly" style="text-align: right;font-weight: 900;color: red;"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">환불사유</span>
								<select class="form-select" id="note" name="note" style="width: 163px; text-align: right;">
									<option selected="selected" id="0" value="0"></option>
									<option id="0" value="0">위약금 면제(감염증외)</option>
									<option id="0" value="0">폐강(100%환불)</option>
									<option id="0" value="0">반변경(100%환불)</option>
									<option id="0" value="0">입력오류/결제수단변경</option>
									<option id="0" value="0">고객단순변심</option>
									<option id="0" value="0">부재(여행 및 출장,기타)</option>
									<option id="0" value="0">건강사유</option>
									<option id="0" value="0">시설불만</option>
									<option id="0" value="0">강사/강습불만</option>
									<option id="0" value="0">자원봉사자지원</option>
								</select>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="notetext" name="notetext" style="width: 282px;"/>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">예금주</span>
								<input class="form-control" type="text" id="account" name="account" style="width: 201px;"/>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">은행명</span>
								<input class="form-control" type="text" id="bank" name="bank" style="width: 111px;"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">계좌번호</span>
						<input class="form-control" type="text" id="accountno" name="accountno" style="width: 111px;"/>
					</div>
				</div> -->
	        </div>
	    </div>
	    <div class="card border border-primary" style="width: 308px;height: 425px;">
	    	<div class="card-body my-n3 mx-n5">
	      		<div class="col-auto">
	      			<div class="form-check">
	      				<input class="form-check-input" id="category1" type="radio" name="category" onclick="return(false);"/>
						<label class="form-check-label" for="category1">기본개월 종목</label>
					</div>
					<div class="form-check">
  						<input class="form-check-input" id="category2" type="radio" name="category" onclick="return(false);"/>
						<label class="form-check-label" for="category2">기본1개월종목 2개월 이상(표준회비)</label>
					</div>
	      		</div>
	      		<div class="col-auto">
		      		1.기본개월 2개월 이상 강좌 등록시 총금액에 10% 위약금<br>
		      		2.1개월강좌 다개월 등록시 당월만 10% 위약금(다개월 할인 불가)<br><br>
		      		3.1개월 종목 2개월이상 등록시 환불계산<br>
		      		1= ((A-(B/F)*a))*(-1)<br>
		      		2= A*10% / 100<br>
		      		3= 당일<br>
		      		4= ((A/30일)*3번)*(-1)<br>
		      		5= 1+2+4<br>
		      		6= A*b(잔여개월금액은 확인용도)<br>
		      		7= (D-5)
	      		</div>
	    	</div>
		</div>
    </div>
    <div class="row">
	    <div class="card w-60 h-50">
	    	<div class="card-body my-n3">
	    		<div class="border-top border-bottom border-200" id="customerOrdersTable" style="overflow-y: scroll; height: 210px;"
                    data-list='{"valueNames":["paiddate","paidcategory","paidprice","paidassignType","paidmapsa",""paidcardtype"","paidassignN","paidcardN","POS","signpad","OID","PayKind"],"page":6,"pagination":true}'>
                	<div class="table-responsive scrollbar">
                    	<table class="table table-sm fs--1 mb-0 table-hover table-bordered">
                        	<thead>
	                        	<tr>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paiddate">결제일자</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidcategory">결제유형</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidprice">결제금액</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidassignType">승인구분</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidmapsa">매입사</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidcardtype">카드종류</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidassignN">승인번호</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="paidcardN">카드번호</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="POS">POS</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="signpad">사인패드</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="OID">OID</th>
		                             <th class="sort align-middle text-center" scope="col" data-sort="PayKind">PayKind</th>
	                            </tr>
                        	</thead>
                        	<tbody class="list" id="paidbody">
                        		<c:forEach var="paid" items="${paidlist}">
	                        		<tr class="hover-actions-trigger btn-reveal-trigger position-static" id="${paid.saleType}">
									    <td class="paiddate align-middle white-space-nowrap text-center fw-bold">${paid.realSaleDate}</td>
									    <td class="paidcategory align-middle white-space-nowrap text-center">${paid.payType}</td>
									    <fmt:parseNumber var="paidprice" integerOnly="true" value="${paid.price}"/>
									    <td class="paidprice align-middle white-space-nowrap fw-bold text-700 text-end"><fmt:formatNumber value="${paidprice}" pattern="#,###"/></td>
									    <td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">${paid.assignType}</td>
									    <td class="paidmapsa align-middle white-space-nowrap text-center">${paid.maeipsa}</td>
									    <td class="paidcardtype align-middle white-space-nowrap text-start">${paid.cardName}</td>
									    <td class="paidassignN align-middle white-space-nowrap text-start">${paid.assignNo}</td>
									    <td class="paidcardN align-middle white-space-nowrap text-start">${paid.cardNo}</td>
									    <td class="POS align-middle white-space-nowrap text-start">${paid.pos}</td>
									    <td class="signpad py-2 align-middle white-space-nowrap">${paid.signPad}</td>
									    <td class="OID py-2 align-middle white-space-nowrap">${paid.OID}</td>
									    <td class="PayKind py-2 align-middle white-space-nowrap"></td>
									    <td class="paidPKID py-2 align-middle white-space-nowrap" style="display:none;">${paid.PKID}</td>
									    <td class="SaleTime py-2 align-middle white-space-nowrap" style="display:none;">${paid.saleTime}</td>
									</tr>
								</c:forEach>
                        	</tbody>
                    	</table>
                    </div>
            	</div>
	    	</div>
	    </div>
	    <div class="card w-35 h-100 mb-1 me-1" style="width: 317px; ">
	    	<div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 273px;">
	    		<div class="col-auto">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">공제금</span>  
						<input class="form-control" type="text" id="tgongjeprice" name="tgongjeprice" readonly="readonly" style="text-align: right;font-weight: 900;"/>
					</div>
				</div>
	    		<div class="col-auto">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">반환금</span>  
						<input class="form-control" type="text" id="refundprice" name="refundprice" readonly="readonly" style="text-align: right;font-weight: 900;color: red;"/>
					</div>
				</div>
				<div class="row mb-2">
					<div class="col-auto">
						<button class="btn btn-phoenix-primary" type="button" id="pay-cash" name="pay-cash" onclick="processRefund(false)">공제 후 환불</button>	
					</div>
					<div class="col-auto">
						<button class="btn btn-phoenix-secondary" type="button" onclick="processRefund(true)">전액환불</button>
					</div>
				</div>
				<div class="row">
					<div class="col-auto">
						<button class="btn btn-soft-primary" type="button">영수증재발행</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-soft-success" type="button">행삭제</button>
					</div>
				</div>
	    	</div>
	    </div>
	    <form action="" name="payFrm">
	    	<input type="hidden" name="paidCategory" value="">
	    	<input type="hidden" name="paidPrice" value="">
	    	<input type="hidden" name="paidAssignNo" value="">
	    	<input type="hidden" name="SaleTime" value="">
	    	<input type="hidden" name="OID" value="">
	    	<input type="hidden" name="TID" value="">
	    	<input type="hidden" name="Maeipsa" value="">
	    	<input type="hidden" name="CardName" value="">
	    	<input type="hidden" name="GroupSaleNo" id="GroupSaleNo" value="${fmsc_s01List[0].groupSaleNo }">
	    	<input type="hidden" name="Insert" id="Insert" value="Y">
	    	<input type="hidden" name="PKID" id="PKID" value="">
	    </form>
	</div>
</body>
<script type="text/javascript">
//숨겨진 모달 버튼 dd
var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
$('body').append(buttonHTML);

//어른 어린이 등을 저장하는 변수 생성
var codelist;
var myPopup;

$(document).ready(function() {
	$('#paidbody').on('click', 'tr', function() {
		paidbodyclick(this);
	});

	$('#itemtbody').on('click', 'tr', function() {
		itemtbodyclick(this);
	});
	
	$('tbody#itemtbody tr').each(function(){
		if($(this).find("#SaleNo").val() == "${param.SaleNo}"){
			itemtbodyclick(this);	
		}
	});

	SetReturnrice();
});

var modalcheck = false;
document.addEventListener('keydown', function(event) {
	if (event.key === 'Escape' && !modalcheck) {
		window.close();
   	}
   	else if (event.key === 'Escape' && modalcheck) {
   		setTimeout(() => {
   	    	modalcheck = false;
   	    }, 500);
   	}
});

function alldelete(){
	//window.location.reload();
}

<%--//과거에 선택했던 행--%>
var previousRow = null;
var previousPaidRow = null;

<%--//과거에 선택했던 행의 itemid--%>
var clickeditemid;

<%--//행을 클릭했을때 데이터를 밑에 뿌려주는 함수--%>
function itemtbodyclick(clickedRow) {
	if (previousRow !== null) {
    	$(previousRow).css('background-color', ''); // Unselect the previous row
	}
	
	$(clickedRow).css('background-color', 'lightblue'); // Highlight the clicked row
    previousRow = clickedRow; // Update the previousRow variable with the clicked row
    var date = $(clickedRow).find('.date').text();
    const result = parseString(date);
    document.getElementById('fromdate').value = result[0];
    document.getElementById('todate').value = result[1];
    document.getElementById('regmonth').value = result[2];
    var price = $(clickedRow).find('.price').text();
    var itemid = $(clickedRow).find('#ItemID').val();
    clickeditemid = itemid;

    var itemname = '['+$(clickedRow).find('.item').text()+']'+$(clickedRow).find('.name').text()+' '+$(clickedRow).find('.day').text()+' '+$(clickedRow).find('.level').text();
    $("#olditemname").val(itemname);
    $("#saleno").val($(clickedRow).find('#SaleNo').val());
    $("#itemPKID").val(itemid);

	$("#saledate").val($(clickedRow).find('#SaleDate').val());
	$("#itemprice").val($(clickedRow).find('.price').text());
	$("#dcprice").val($(clickedRow).find('.dc').text());
	$("#olddcname").val($(clickedRow).find('.dcname').text());
	$("#olddcname").attr("name",$(clickedRow).find('.dccode').text());
	$("#realprice").val($(clickedRow).find('.sort').text());
	$("#tpaidprice").val($(clickedRow).find('.paidPrice').text());
	$("#itemmonth").val($(clickedRow).find('.itemMonth').text());

	if($("#itemmonth").val() == 1){
		$("#category1").attr("checked",true);
	}else{
		$("#category2").attr("checked",true);
	}

	$('tbody#refundtbody tr').each(function(){
		$(this).css('background-color', '');
	});
	$('tbody#refundtbody tr.'+$(clickedRow).find('#SaleNo').val()).each(function(){
		$(this).css('background-color', 'lightblue');
		$("#totalcnt").val($(this).find('.totalCnt').text());
		$("#usecnt").val($(this).find('.useCnt').text());
		if(result[2] > 1){
			$("#prevdc").val($(clickedRow).find('.dccode').text());
			$("#totaldcper").val($(clickedRow).find('.dcpercent').text());
			$("#totaldcprice").val(parseInt($(clickedRow).find('.dc').text())/parseInt(result[2]));
			$("#currentdc").val($(clickedRow).find('.dccode').text());
			$("#currentdcper").val($(clickedRow).find('.dcpercent').text());
			$("#currentdcprice").val(parseInt($(clickedRow).find('.dc').text())/parseInt(result[2]));
		}else{
			$("#currentdc").val($(clickedRow).find('.dccode').text());
			$("#currentdcper").val($(clickedRow).find('.dcpercent').text());
			$("#currentdcprice").val(parseInt($(clickedRow).find('.dc').text()));
		}
	});

	fromDateObj = parseDate(result[0]);
	dateDifference = saleDateObj - fromDateObj;
	daysDifference = dateDifference / (1000 * 60 * 60 * 24);

	if(Math.floor(daysDifference) > 0){
		
		var monthDifference = calculateMonthDifference($('#regdate').val(), $('#todate').val());
		
		$('#remainmonth').val(monthDifference);
	}else{
		$('#remainmonth').val($('#regmonth').val());
	}

	$('#remainprice').val(formatNumberWithCommas($('#remainmonth').val()*removeCommasFromNumber($('#itemprice').val())));

	$('#regdate').change();
}

function paidbodyclick(clickedRow) {
	if (previousPaidRow !== null) {
		$(previousPaidRow).css('background-color', ''); <%-- Unselect the previous row--%>
	}

	$(clickedRow).css('background-color', 'lightblue'); <%-- Highlight the clicked row --%>
	previousPaidRow = clickedRow; <%-- Update the previousRow variable with the clicked row --%>
	frm = document.payFrm;
	frm.paidCategory.value = $(clickedRow).find('.paidcategory').text();
	frm.paidPrice.value = $(clickedRow).find('.paidprice').text();
	frm.paidAssignNo.value = $(clickedRow).find('.paidassignN').text();
	frm.SaleTime.value = $(clickedRow).find('.SaleTime').text();
	frm.TID.value = $(clickedRow).find('.TID').text();
	frm.OID.value = $(clickedRow).find('.OID').text();
	frm.Maeipsa.value = $(clickedRow).find('.paidmapsa').text();
	frm.CardName.value = $(clickedRow).find('.paidcardtype').text();
	frm.PKID.value = $(clickedRow).find('.paidPKID').text();
}

var tpaidprice = 0;

$('#paidbody tr').each(function() {
	tpaidprice += parseInt(removeCommasFromNumber($(this).find('.paidprice').text()));
});

$('#tpaidprice').val(formatNumberWithCommas(tpaidprice));

var today = new Date();

var formattedDate = today.toISOString().split('T')[0];

$('#regdate, #canceldate').val(formattedDate);

function optionchange(data) {
    $.ajax({
        type: "POST",
        url: "optionchange", // Replace with your actual endpoint
        dataType: 'json',
        data: data,
        error: function(xhr, status, error) {
            console.log("Status: " + status);
            console.log("Error: " + error);
        }
    });
}

$('input[name=dues]').on('change', function() {
	optionchange({ dues: $(this).val() });
	DuesCheck();
	GongjeSum();
	SetReturnrice();
});

$('#gongje, #wiyak, #julsak').on('change', function() {
	optionchange({ [this.id]: $(this).val() });
});

$('#regdate').on('change', function() {
	prevusepricechange();
	currentvusepricechange();
	DuesCheck();
	GongjeSum();
	SetReturnrice();
});

$('#usecnt').on('change', function() {
	prevusepricechange();
	currentvusepricechange()
	DuesCheck();
	GongjeSum();
	SetReturnrice();
	$('tbody#refundtbody tr.'+$(previousRow).find('#SaleNo').val()).each(function(){
		$(this).find('.totalCnt').text($("#totalcnt").val());
		$(this).find('.useCnt').text($("#usecnt").val());
		$(this).find('.wiyakPrice').text($("#wiyakprice").val());
		$(this).find('.usePrice').text($("#currentuseprice").val());
		$(this).find('.gongjePrice').text($("#gongjesum").val());
		$(this).find('.returnPrice').text('-'+$("#returnprice").val());
	});
});

//총일수 값 설정
$('#totalcnt').val($('#regmonth').val()*30);

//날짜 형식의 문자열을 Date 객체로 변환하는 함수
function parseDate(dateString) {
    var parts = dateString.split("-");
    return new Date(parts[0], parts[1] - 1, parts[2]);
}

// 각각의 날짜를 가져옴
var fromDate = $('#fromdate').val();

// Date 객체로 변환
var saleDateObj = parseDate(formattedDate);
var fromDateObj = parseDate(fromDate);

// 날짜 차이를 계산 (단위: 밀리초)
var dateDifference = saleDateObj - fromDateObj;

// 날짜 차이를 일 수로 변환
var daysDifference = dateDifference / (1000 * 60 * 60 * 24);

// 결과를 usecnt에 적용
if (daysDifference > 0) {
    $('#usecnt').val(Math.floor(daysDifference));
} else {
    $('#usecnt').val(0);
}

$('#prevdc').on('change', function() {
    // 선택된 옵션의 값 가져오기
	var dcrate = $(this).find('option:selected').attr('id');
	$('#totaldcper').val(dcrate);
});

$('#currentdc').on('change', function() {
    // 선택된 옵션의 값 가져오기
	var dcrate = $(this).find('option:selected').attr('id');
	$('#currentdcper').val(dcrate);
});


function prevusepricechange(){
	var selectedDate = new Date(fromDate);
	var regdate = new Date($('#regdate').val());
	if($('#regmonth').val() >1 && $('#itemmonth').val()== 1 && daysDifference>0){
		// 월 차이 계산
		var monthsApart = (regdate.getFullYear() - selectedDate.getFullYear()) * 12 + regdate.getMonth() - selectedDate.getMonth();
	
		$('#prevusemmonth').val(monthsApart);
		
		var itemprice = removeCommasFromNumber($('#itemprice').val());
		var dcprice = removeCommasFromNumber($('#dcprice').val())/$('#regmonth').val();
		
		var realprice = itemprice-dcprice;
		
		$('#prevuseprice').val(formatNumberWithCommas($('#prevusemmonth').val()*realprice));
	}
}


//위약금 퍼센트 추출
var wiyak = parseInt($('#wiyak').val().match(/\((\d+)%\)/)[1], 10);;

function DuesCheck(){
	if($('#gongje').val() == '위약금공제(시작후)'){
		if(daysDifference>0){
			wiyakbygongje();
		}
	}else{
		wiyakbygongje();
	}
}
//위약금 공제시작후일 경우


//dues 옵션에 따라 위약금액 설정하는 함수
function wiyakbygongje(){
	
	var itemprice = removeCommasFromNumber($('#itemprice').val());
	var dcprice = removeCommasFromNumber($('#dcprice').val())/$('#regmonth').val();
	
	var realprice = itemprice-dcprice;

	//기본개월이 1개월인데 강습기간이 1개월 이상일 경우 
	if($('#itemmonth').val() ==1 && $('#regmonth').val() > 1){				
		$('#wiyakprice').val(realprice*wiyak/100);
	}else{
		//납입회비 로 체크했을때
		if($('input[name=dues]:checked').val() == 0){
			$('#wiyakprice').val(formatNumberWithCommas(removeCommasFromNumber($('#tpaidprice').val())*wiyak/100));
		}else{
			$('#wiyakprice').val(formatNumberWithCommas(removeCommasFromNumber($('#itemprice').val())*wiyak/100));
		}
	}
}

function currentvusepricechange(){
	
	if($('#itemmonth').val() == 1 && $('#regmonth').val() > 1 && $('#regdate').val()>$('#fromdate').val()){
		//'#regdate'의 값을 가져옵니다.
		var selectedDate = $('#regdate').val();
		
		// 선택된 날짜를 Date 객체로 변환합니다.
		var date = new Date(selectedDate);
		
		// 해당 월의 첫 번째 날 (1일)을 Date 객체로 만듭니다.
		var firstDayOfMonth = new Date(date.getFullYear(), date.getMonth(), 1);
		
		// 두 날짜 사이의 차이를 밀리초 단위로 계산합니다.
		var differenceInTime = date.getTime() - firstDayOfMonth.getTime();
		
		// 밀리초를 일 단위로 변환합니다. (1일 = 24시간 * 60분 * 60초 * 1000밀리초)
		var differenceInDays = Math.floor(differenceInTime / (1000 * 3600 * 24))+1;
		
		$('#currentuseday').val(differenceInDays);
		
		var itemprice = removeCommasFromNumber($('#itemprice').val());
		var dcprice = removeCommasFromNumber($('#dcprice').val())/$('#regmonth').val();
		
		var realprice = itemprice-dcprice;
		
		$('#currentuseday').val(differenceInDays);
		
		$('#currentuseprice').val(formatNumberWithCommas(Math.floor(realprice*differenceInDays/30)));
	}else{
		$('#currentuseprice').val(formatNumberWithCommas(roundToNearestTen(removeCommasFromNumber($('#itemprice').val())*$('#usecnt').val()/$('#totalcnt').val())));
	}
}

function calculateMonthDifference(date1, date2) {
    var regdate = new Date(date1);
    var todate = new Date(date2);

    var yearsDifference = todate.getFullYear() - regdate.getFullYear();
    var monthsDifference = todate.getMonth() - regdate.getMonth();

    return yearsDifference * 12 + monthsDifference;
}

function GongjeSum() {
	
	var prevuseprice = removeCommasFromNumber($('#prevuseprice').val());
	var wiyakprice = removeCommasFromNumber($('#wiyakprice').val());
	var currentuseprice = removeCommasFromNumber($('#currentuseprice').val());
	var gongjesum = prevuseprice + wiyakprice +currentuseprice;
	$('#gongjesum').val(formatNumberWithCommas(gongjesum));
}

function SetReturnrice() {
	var tpaidprice = removeCommasFromNumber($("#tpaidprice").val());
	/* $('tbody#itemtbody tr').each(function(){
		tpaidprice = tpaidprice + parseInt(removeCommasFromNumber($(this).find(".paidPrice").text()));
	}); */
	
	var gongjesum = removeCommasFromNumber($("#gongjesum").val());
	/* $('tbody#refundtbody tr').each(function(){
		gongjesum = gongjesum + parseInt(removeCommasFromNumber($(this).find(".gongjePrice").text()));
	}); */

	var returnprice = formatNumberWithCommas(tpaidprice-gongjesum);

	$('#returnprice').val(returnprice);

	var refundPrice = 0;
	var tgongjeprice = 0;
	$('tbody#refundtbody tr').each(function(){
		refundPrice = refundPrice + parseInt(removeCommasFromNumber($(this).find(".returnPrice").text()));
		tgongjeprice = tgongjeprice  + parseInt(removeCommasFromNumber($(this).find(".gongjePrice").text()));
	});
	
	var npaidprice = 0;
	$('tbody#paidbody tr#new').each(function(){
		npaidprice = npaidprice + parseInt(removeCommasFromNumber($(this).find(".paidprice").text()));
	});

	$('#tgongjeprice').val(formatNumberWithCommas(tgongjeprice).replaceAll('-',''));
	$('#refundprice').attr("color","red");
	$('#refundprice').val(formatNumberWithCommas(refundPrice-npaidprice));	

}

if($('#paidbody tr#환불').length > 0){
	$('#refundprice').val(0);
}

function totalchange(){
	SetReturnrice();
}

//날짜를 테이블에서 가지고와서 잘라서 보내는 함수
function parseString(inputString) {
	const regex = /(\d{4}-\d{2}-\d{2})~(\d{4}-\d{2}-\d{2})\((\d+)\)/;
	const matches = inputString.match(regex);

	if (!matches || matches.length !== 4) {
		return null; // 입력 형식이 잘못된 경우 처리
	}
	const startDate = matches[1];
	const endDate = matches[2];
	const numberOfMonths = parseInt(matches[3], 10);

	return [startDate, endDate, numberOfMonths.toString()];
}
   
//date 형식을 YYYY-MM-DD 형식으로 바궈주는 함수
function formatDate(date) {
	const yyyy = date.getFullYear();
	const mm = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 2자리 숫자로 표시
	const dd = String(date.getDate()).padStart(2, '0'); // 일자를 2자리 숫자로 표시
	return yyyy+'-'+mm+'-'+dd;
}

function alreadyrefund() {
	$('#resultmessage').html('이미 환불처리 된 건입니다.');
	$('.modal-footer').empty();
	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	$('.modal-footer').append(cancelbutton);
    $('#modalButton').click();
    modalcheck = true;
    return false;
}

function save() {
	if($('#refundprice').val() != 0){
		$('#resultmessage').html('반환금액을 처리해 주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	fmsc_04save();	
}

function wait_save() {
	var numberOfTR = $('#paidbody tr#new').length;
	
	if(numberOfTR>0){
		$('#resultmessage').html('전액환불 또는 공제 후 환불을 하신경우에는 환불대기를 하실 수 없습니다.<br>환불완료 또는 행삭제 해주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	
	var note = '';
	if($('#notetext').val()== ''){
		note = $('#note option:selected').text();
	}else{
		note = $('#notetext').val();
	}
	
	$('tbody#refundtbody tr').each(function(){
		$.ajax({
	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
	        url: "itemrefund_wait", // 실제 엔드포인트로 교체해야 합니다
	        dataType : 'json',
	        async : false,
	        data: {
	        	SaleNo : $(this).attr('class'),
	        	RegDate : $('#regdate').val(),
	        	CancelDate : $('#canceldate').val(),
	        	TotalCnt : $(this).find(".totalCnt").text(),
	        	UseCnt : $(this).find(".useCnt").text(),
	        	TotalClassPaidPrice : removeCommasFromNumber($(this).find(".realPrice").text()),
	        	TotalPaidPrice : removeCommasFromNumber($(this).find(".paidPrice").text()),
	        	TotalMinapPrice : -removeCommasFromNumber($(this).find(".minapPrice").text()),
	        	WiyakPrice : -removeCommasFromNumber($(this).find(".wiyakPrice").text()),
	        	UsePrice : -removeCommasFromNumber($(this).find(".usePrice").text()),
	        	GongjePrice : -removeCommasFromNumber($(this).find(".gongjePrice").text()),
	        	ReturnPrice : removeCommasFromNumber($(this).find(".returnPrice").text()),
	        	Note : note,
	        	ORToDate : $("#todate").val(),
	        	GroupSaleNo : $("#GroupSaleNo").val()
	        },
	        success: function(data) {	
	        },
	        error: function(xhr, status, error) {
		       	 console.log("Status: " + status);
		         console.log("Error: " + error);
		         return false;
	        }
		});
	});

	window.opener.location.reload();
    window.close();
}

function notwait() {
	$('#resultmessage').html('환불 대기시에 대기 취소 가능합니다.');
	$('.modal-footer').empty();
	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	$('.modal-footer').append(cancelbutton);
    $('#modalButton').click();
    modalcheck = true;
    return false;
}

function wait_cancel() {
	$('tbody#refundtbody tr').each(function(){
		$.ajax({
	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
	        url: "itemrefund_wait_cancel", // 실제 엔드포인트로 교체해야 합니다
	        dataType : 'json',
	        async : false,
	        data: {
	        	SaleNo : $(this).attr("class")//$('#saleno').val()
	        },
	        success: function(data) {	
	        	
	        },
	        error: function(xhr, status, error) {
		       	 console.log("Status: " + status);
		         console.log("Error: " + error);
		         return false;
	        }
		});	
	});
	
	window.opener.location.reload();
    window.close();
}

function fmsc_04save() {
	var iteration = 0;
	var note = '';
	if($('#notetext').val()== ''){
		note = $('#note option:selected').text();
	}else{
		note = $('#notetext').val();
	}
	
	$('#refundtbody tr').each(function() {
		$.ajax({
	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
	        url: "itemrefund", // 실제 엔드포인트로 교체해야 합니다
	        dataType : 'json',
			async : false,
	        data: { 
	        	SiteCode : "${loginuserinfo.siteCode}",
	        	SaleNo : $(this).attr('class'),
	        	RegDate : $('#regdate').val(),
	        	CancelDate : $('#canceldate').val(),
	        	TotalCnt : $(this).find('.totalCnt').text(),
	        	UseCnt : $(this).find('.useCnt').text(),
	        	TotalClassPaidPrice : Math.abs(removeCommasFromNumber($(this).find('.realPrice').text())),
	        	TotalPaidPrice : Math.abs(removeCommasFromNumber($(this).find('.paidPrice').text())),
	        	TotalMinapPrice : Math.abs(removeCommasFromNumber($(this).find('.minapPrice').text())),
	        	WiyakPrice : -removeCommasFromNumber($(this).find('.wiyakPrice').text()),
	        	UsePrice : -removeCommasFromNumber($(this).find('.usePrice').text()),
	        	GongjePrice : -removeCommasFromNumber($(this).find('.gongjePrice').text()),
	        	ReturnPrice : removeCommasFromNumber($(this).find('.returnPrice').text()),
	        	Note : note
	        },
	        success: function(data) {	
	        	
	        },
	        error: function(xhr, status, error) {
		       	 console.log("Status: " + status);
		         console.log("Error: " + error);
		         return false;
	        }
		}); 
	});

	var numberOfTR = $('#paidbody tr#new').length;
	
	if(numberOfTR>0){
		if($(this).attr('itemid') != 'off'){
			$('#paidbody tr#new').each(function() {
				var paidprice = removeCommasFromNumber($(this).find('.paidprice').text());
				var paiddate = $(this).find('.paiddate').text();
				var paidPkid = $(this).find('.PKID').text();
				if(paidprice != '' && paidPkid == ''){
		    		$.ajax({
		    	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
		    	        url: "tblpaidinsert", // 실제 엔드포인트로 교체해야 합니다
		    	        dataType : 'text',
		    			async : false,
		    	        data: { 
		    	        	SiteCode : "${loginuserinfo.siteCode}",
		    	        	FPKID: $("#GroupSaleNo").val(),
		    	        	SaleDate : $(this).find('.paiddate').text().substr(0,10),
		    	        	RealSaleDate : $(this).find('.paiddate').text(),
		    	        	SaleType : "환불",
		    	        	PayType : $(this).find('.paidcategory').text(),
		    	        	Price : removeCommasFromNumber($(this).find('.paidprice').text()),
							AssignType : $(this).find('.paidassignType').text(),
							Maeipsa : $(this).find('.paidmapsa').text(),
							CardName : $(this).find('.paidcardtype').text(),
							AssignNo : $(this).find('.paidassignN').text(),
							Pos : $(this).find('.POS').text(),
							SignPad : $(this).find('.signpad').text(),
							Halbu : $(this).find('.Halbu').text(),
							SaleTime : $(this).find('.SaleTime').text(),
							PaidGroupSaleNo : $("#GroupSaleNo").val(),
							OID : $(this).find('.OID').text(),
							TID : $(this).find('.TID').text(),
		    	        },
		    	        success: function(data){
							paidPkid=data;
		    	        },
						error:function(xhr, status, error){
							console.log("Status: " + status);
							console.log("Error: " + error);
							return false;
						}
		    		});
				}
	    	});
		}
		var inlineRadioOptions = 0;//parseInt(document.querySelector('input[name="inlineRadioOptions"]:checked').value);
		
		if(inlineRadioOptions >= 1){
		    var myWindow = window.open("${pageContext.request.contextPath}/lecture/Receipt.do?PKID="+paidPkid, "MsgWindow", "width=320,height=800");
		    myWindow.print();

		    setTimeout(function() { 
		        if(inlineRadioOptions == 2){
		            myWindow.print();
		        }

		        setTimeout(function() { 
		            myWindow.close(); 
		            window.opener.location.reload();
		            window.close();
		        }, 2000); // 두 번째 인쇄 후 잠시 대기 후 창 닫기
		    }, 2000); // 첫 번째 인쇄 후 잠시 대기
		}else{
			window.opener.location.reload();
			window.close();
		}
	}
	window.opener.location.reload();
    window.close();
}  
  
//환불처리
function processRefund(isAllReturn) {
	var frm = document.payFrm;
	
	if($('#refundprice').val() == 0 || $('#refundprice').val() == ''){
		var numberOfTR = $('#paidbody tr#new').length;
		if(numberOfTR>0){
			$('#resultmessage').html('이미 취소된 건입니다.');
		  	$('.modal-footer').empty();
		  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		  	$('.modal-footer').append(cancelbutton);
		    $('#modalButton').click();
		    modalcheck = true;
		    return false;
		}else{
			$('#resultmessage').html('환불할 금액이 0원입니다.<br>확인 후 진행해 주세요.');
		  	$('.modal-footer').empty();
		  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		  	$('.modal-footer').append(cancelbutton);
		    $('#modalButton').click();
		    modalcheck = true;
		    return false;
		}
	}

	var GroupSaleNo = $("#GroupSaleNo").val();

	<%--전액환불--%>
	if (isAllReturn) {
		var paidCnt = 0;
		var cashChk = 0;
		var paidprice = 0;
		$("tbody#paidbody tr").each(function(){
			paidCnt++;
			if($(this).find(".paidcategory").text() == "현금"){
				cashChk++;
				paidprice = paidprice + parseInt(removeCommasFromNumber($(this).find('.paidprice').text()));
			}
		});
		<%--단건결제--%>
		if(paidCnt == 1){
			if(cashChk > 0){
				var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id = "new"></tr>');
				newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
				newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">현금</td>');
				newRow.append('<td class="paidprice align-middle white-space-nowrap fw-bold text-700 text-end">-' + paidprice + '</td>');
				newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + '</td>');
				newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + '</td>');
				newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' +  '</td>');
				newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + '</td>');
				newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
				newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + '</td>');
				newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '</td>');
				newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '</td>');
				newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
				var tableBody = $('#paidbody');
				tableBody.append(newRow);
				$('#refundprice').val(0);
			}else{
				
				$("tbody#paidbody tr").each(function(){
					paidbodyclick(this);
				});

				if(frm.paidCategory.value == "계좌이체" ){
					var url = "${pageContext.request.contextPath}/lecture/AccountCancel.do?payprice=" +frm.paidPrice.value +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Intype=환불";
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
				}else{
					var url = "${pageContext.request.contextPath}/lecture/CancelPaid.do?payprice=" +frm.paidPrice.value +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Intype=환불";
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
			}
		}else{
			<%-- 복합결제 --%>
			if(cashChk == paidCnt){
				var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id = "new"></tr>');
				newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
				newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">현금</td>');
				newRow.append('<td class="paidprice align-middle white-space-nowrap fw-bold text-700 text-end">-' + paidprice + '</td>');
				newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + '</td>');
				newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + '</td>');
				newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' +  '</td>');
				newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + '</td>');
				newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
				newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + '</td>');
				newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '</td>');
				newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '</td>');
				newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
				var tableBody = $('#paidbody');
				tableBody.append(newRow);
				$('#refundprice').val(0);
			}else{
				if(frm.paidCategory.value == "" ){
					$('#resultmessage').html('환불하실 결제정보를 클릭해주세요.');
				  	$('.modal-footer').empty();
				  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				  	$('.modal-footer').append(cancelbutton);
				    $('#modalButton').click();
				    modalcheck = true;
				    return false;
				}
				
				if(frm.paidCategory.value == "현금" ){
					var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id = "new"></tr>');
					newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
					newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">현금</td>');
					newRow.append('<td class="paidprice align-middle white-space-nowrap fw-bold text-700 text-end">-' + frm.paidPrice.value + '</td>');
					newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + '</td>');
					newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + '</td>');
					newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' +  '</td>');
					newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + '</td>');
					newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
					newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + '</td>');
					newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '</td>');
					newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '</td>');
					newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
					var tableBody = $('#paidbody');
					tableBody.append(newRow);
					$('#refundprice').val(0);
				}else if(frm.paidCategory.value == "계좌이체" ){
					var url = "${pageContext.request.contextPath}/lecture/AccountCancel.do?payprice=-" +frm.paidPrice.value +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Intype=환불";
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
				}else{
					var url = "${pageContext.request.contextPath}/lecture/CancelPaid.do?payprice=" +frm.paidPrice.value +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Intype=환불";
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
			}
		}
	}else{
		<%--공제 후 환불--%>
		var paidCnt = 0;
		var cashChk = 0;
		var paidprice = 0;
		$("tbody#paidbody tr").each(function(){
			paidCnt++;
			if($(this).find(".paidcategory").text() == "현금"){
				cashChk++;
				paidprice = paidprice + parseInt(removeCommasFromNumber($(this).find('.paidprice').text()));
			}
		});
		<%--단건결제--%>
		if(paidCnt == 1){
			if(cashChk > 0){
				var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id = "new"></tr>');
				newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
				newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">현금</td>');
				newRow.append('<td class="paidprice align-middle white-space-nowrap fw-bold text-700 text-end">-' + $("#refundprice").val().replaceAll('-','') + '</td>');
				newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + '</td>');
				newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + '</td>');
				newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' +  '</td>');
				newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + '</td>');
				newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
				newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + '</td>');
				newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '</td>');
				newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '</td>');
				newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
				var tableBody = $('#paidbody');
				tableBody.append(newRow);
				$('#refundprice').val(0);
			}else{
				
				$("tbody#paidbody tr").each(function(){
					paidbodyclick(this);
				});

				if(frm.paidCategory.value == "계좌이체" ){
					var url = "${pageContext.request.contextPath}/lecture/AccountCancel.do?payprice=-" +$("#refundprice").val().replaceAll('-','') +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Intype=환불";
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
				}else if(frm.paidCategory.value == "신용카드" ){
					var url = "${pageContext.request.contextPath}/lecture/CancelPaid.do?payprice=" +$("#refundprice").val().replaceAll('-','') +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Intype=환불";
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
				}else{
					var url = "${pageContext.request.contextPath}/lecture/CreditCard.do?payprice=" + $("#tgongjeprice").val().replaceAll('-','') +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Insert=Y&InType=환불";
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
				    var url = "${pageContext.request.contextPath}/lecture/CancelPaid.do?payprice=" +$("#refundprice").val().replaceAll('-','') +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Intype=환불";
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
			}
		}else{
			<%--복합결제--%>
			if(cashChk == paidCnt){
				var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id = "new"></tr>');
				newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
				newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">현금</td>');
				newRow.append('<td class="paidprice align-middle white-space-nowrap fw-bold text-700 text-end">-' + paidprice + '</td>');
				newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + '</td>');
				newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + '</td>');
				newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' +  '</td>');
				newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + '</td>');
				newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
				newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + '</td>');
				newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '</td>');
				newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '</td>');
				newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
				var tableBody = $('#paidbody');
				tableBody.append(newRow);
				$('#refundprice').val(0);
			}else{
				if(frm.paidCategory.value == "" ){
					$('#resultmessage').html('환불하실 결제정보를 클릭해주세요.');
				  	$('.modal-footer').empty();
				  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
				  	$('.modal-footer').append(cancelbutton);
				    $('#modalButton').click();
				    modalcheck = true;
				    return false;
				}
				if(removeCommasFromNumber(frm.paidPrice.value) < 0){
		    		$('#resultmessage').html('결제가 취소된 금액입니다.<br>확인 후 환불해주세요.');
		    		$('.modal-footer').empty();
		    		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		    		$('.modal-footer').append(cancelbutton);
		    		$('#modalButton').click();
		    		modalcheck = true;
		    		return false;
		    	}
				if(removeCommasFromNumber(frm.paidPrice.value) < removeCommasFromNumber($("#refundprice").val().replaceAll('-',''))){
					if(frm.paidCategory.value == "현금"){
						var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id = "new"></tr>');
						newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
						newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">현금</td>');
						newRow.append('<td class="paidprice align-middle white-space-nowrap fw-bold text-700 text-end">-' + frm.paidPrice.value + '</td>');
						newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + '</td>');
						newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + '</td>');
						newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' +  '</td>');
						newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + '</td>');
						newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
						newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + '</td>');
						newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '</td>');
						newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '</td>');
						newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
						var tableBody = $('#paidbody');
						tableBody.append(newRow);
						$('#refundprice').val(formatNumberWithCommas(parseInt(removeCommasFromNumber($("#refundprice").val())) + parseInt(removeCommasFromNumber(frm.paidPrice.value)) ));
					}else if(frm.paidCategory.value == "계좌이체" ){
						var url = "${pageContext.request.contextPath}/lecture/AccountCancel.do?payprice=" +frm.paidPrice.value +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Insert=Y&InType=환불";
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
					}else{
						var url = "${pageContext.request.contextPath}/lecture/CancelPaid.do?payprice=" +frm.paidPrice.value +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Insert=Y&InType=환불";
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
				}else{
					if(frm.paidCategory.value == "현금"){
						var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id = "new"></tr>');
						newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
						newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">현금</td>');
						newRow.append('<td class="paidprice align-middle white-space-nowrap fw-bold text-700 text-end">' + $('#refundprice').val() + '</td>');
						newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + '</td>');
						newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + '</td>');
						newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' +  '</td>');
						newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + '</td>');
						newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
						newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + '</td>');
						newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '</td>');
						newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '</td>');
						newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
						var tableBody = $('#paidbody');
						tableBody.append(newRow);
						$('#refundprice').val(formatNumberWithCommas(parseInt(removeCommasFromNumber($("#refundprice").val())) + parseInt(removeCommasFromNumber(frm.paidPrice.value)) ));
					}else if(frm.paidCategory.value == "계좌이체" ){
						var url = "${pageContext.request.contextPath}/lecture/AccountCancel.do?payprice=" +$('#refundprice').val() +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Insert=Y&InType=환불";
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
					}else{
						if(frm.paidCategory.value == "신용카드"){
							var url = "${pageContext.request.contextPath}/lecture/CancelPaid.do?payprice=" +$('#refundprice').val() +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Insert=Y&InType=환불";
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
						}else{
							url = "${pageContext.request.contextPath}/lecture/CreditCard.do?payprice=" + $("#tgongjeprice").val() +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Insert=Y&InType=환불";
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
					}
				}
			}
		}
	}
	
}

//paid 의 결제 일자를 넣기 위한 현재날짜 포맷
function getCurrentDateTime() {
	var today = new Date();

	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var hours = ('0' + today.getHours()).slice(-2); 
	var minutes = ('0' + today.getMinutes()).slice(-2);
	var seconds = ('0' + today.getSeconds()).slice(-2); 
	var datestring = year + '-' + month  + '-' + day +' '+ hours + ':' + minutes  + ':' + seconds; 
	return datestring;
}

//금액에 , 를 붙혀서 return 해주는 함수
function formatNumberWithCommas(amount) {
    // Check if the input is a valid number
    if (isNaN(amount)) {
        return "Invalid input";
    }

    // Convert the number to a string
    let amountStr = amount.toString();

    // Split the string into integer and decimal parts
    let parts = amountStr.split('.');

    // Add commas to the integer part
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ',');

    // Join the integer and decimal parts back together
    let formattedAmount = parts.join('.');

    return formattedAmount;
}

//금액에 붙은 , 를 지워주는 함수
function removeCommasFromNumber(formattedNumber) {
    // Remove commas from the string
    let numberWithoutCommas = formattedNumber.replace(/,/g, '');

    // Convert the string to a number
    let numericValue = parseFloat(numberWithoutCommas);

    // Check if the conversion was successful
    if (isNaN(numericValue)) {
        return "Invalid input";
    }

    return numericValue;
}

function roundToNearestTen(num) {
	return Math.round(num / 10) * 10;
}
</script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/anchorjs/anchor.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/is/is.min.js"></script>
<script src="${pageContext.request.contextPath}/new_lib/vendors/list.js/list.min.js"></script>
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

<div class="modal fade" id="verticallyCentered" tabindex="-1" aria-labelledby="verticallyCenteredModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="verticallyCenteredModalLabel">Uspot</h5>
        <button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1"></span></button>
      </div>
      <div class="modal-body">
        <p class="text-700 lh-lg mb-0" id="resultmessage"></p>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

</html>