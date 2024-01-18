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
<body style="overflow: hidden;">
    <div class="card h-100 mb-1" style="width: 1595px;">
        <div class="card-body mb-n4 mt-n3">
            <div class="col-12">
                <div>
                    <div class="row g-3">
                        <h3 class="mb-3 w-25 pt-2">환불정보 등록 및 변경</h3>
                        <div style="margin-top: -46px;margin-left: 300px;">
                        	<div class="col-auto position-absolute" style="margin-left:700px;">
	                            <button class="btn btn-phoenix-primary" type="button" onclick="save()" >환불대기(T)</button>
	                        </div>
	                        <div class="col-auto position-absolute" style="margin-left:850px;">
	                            <button class="btn btn-phoenix-secondary" type="button" onclick="save()" >대기취소(Q)</button>
	                        </div>
	                        <div class="col-auto position-absolute" style="margin-left:1000px;">
	                            <button class="btn btn-success" type="button" onclick="save()" >환불완료(S)</button>
	                        </div>
	                        <div class="col-auto position-absolute" style="margin-left:1150px;">
	                            <button class="btn btn-danger" type="button" onclick="alldelete()">삭제(D)</button>
	                    	</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
	    <div class="card h-100 mb-1 w-20 ms-3 me-1" style="width: 240px;">
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
	    <div class="card h-100 mb-1 w-20 me-1" style="width: 465px;">
	        <div class="card-body mb-n5 mt-n3 mx-n4" style="height: 425px; width: 510px;">
	            <div class="col-md-10">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">강습반</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="olditemname" name="olditemname" value="${itemname}" readonly="readonly"/>
						<input type="hidden" id="saleno" name="saleno" value="${fmsc_s01.saleNo}">
					</div>
				</div>
				<div class="col-md-5">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">등록일자</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="saledate" name="saledate" value="${fmsc_s01.saleDate}" readonly="readonly"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">강습기간</span>
								<input class="form-control" type="text" aria-describedby="basic-addon1" id="fromdate" name="fromdate" style="width: 110px;" value="${fmsc_s01.fromDate}" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto mt-1 mx-n4">
							~
						</div>
						<div class="col-auto ms-n1">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="todate" name="todate" style="width: 115px;" value="${fmsc_s01.toDate}" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto ms-n3">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="regmonth" name="regmonth" style="width: 50px;" value="${fmsc_s01.regMonth}" readonly="readonly"/>
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
						value="<fmt:formatNumber value="${fmsc_s01.itemPrice}" pattern="#,###"/>" readonly="readonly" style="text-align: right;"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-md-5">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">B.할인</span>
								<input class="form-control" type="text"  id="olddcprice" name="olddcprice" value="<fmt:formatNumber value="${fmsc_s01.DCPrice}" pattern="#,###"/>"  
								readonly="readonly" style="text-align: right;"/>
							</div>
						</div>
						<c:set var="dcname"></c:set>
						<c:set var="dcid" value="0"></c:set>
						<c:forEach var="dc" items="${dclist}">
	                        <c:if test="${dc.dcid == fmsc_s01.DCID}">
	                            <c:set var="dcname" value="${dc.dcName}"></c:set>
	                            <c:set var="dcid" value="${dc.dcid}"></c:set>
	                        </c:if>
						</c:forEach>
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="olddcname" name="${dcid}" value="${dcname}" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">C.판매금액</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="realprice" name="realprice"
						 value="<fmt:formatNumber value="${fmsc_s01.realPrice}" pattern="#,###"/>" readonly="readonly" style="text-align: right;"/>
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
								<input class="form-control" type="text" aria-describedby="basic-addon1" id="itemmonth" name="itemmonth" readonly="readonly" value="${itemmonth}" style="text-align: center;"/>
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
																<c:if test="${duescheck == 1}">
																	<input class="form-check-input" id="dues1" type="radio" name="dues" value="0" aria-describedby="basic-addon1"/>
																</c:if>
																<c:if test="${duescheck == 0}">
																	<input class="form-check-input" id="dues1" type="radio" name="dues" value="0" aria-describedby="basic-addon1" checked="checked"/>
																</c:if>
																<label class="form-check-label" for="dues1">납입회비</label>
															</div>
															<div class="form-check form-check-inline ms-n3" aria-describedby="basic-addon1">
																<c:if test="${duescheck == 0}">
																	<input class="form-check-input" id="dues1" type="radio" name="dues" value="1" aria-describedby="basic-addon1"/>
																</c:if>
																<c:if test="${duescheck == 1}">
																	<input class="form-check-input" id="dues1" type="radio" name="dues" value="1" aria-describedby="basic-addon1" checked="checked"/>
																</c:if>
																<label class="form-check-label" for="dues1">표준회비</label>
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
	    <div class="card h-100 mb-1 w-20 me-1" style="width: 562px;">
	        <div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 490px;">
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
								<select class="form-select" id="totaldc" name="totaldc" style="width: 152px; text-align: right;">
									<option selected="selected" id="0" value="0"></option>
									<c:forEach var="dc" items="${dclist}">
										<c:choose>
											<c:when test="${dc.dcid == dcid}">
												<option id="${dc.rate}" value="${dc.dcid}" selected="selected">${dc.dcName}</option>
												<c:set var="dcrate" value="${dc.rate}"></c:set>
											</c:when>
											<c:otherwise>
												<option id="${dc.rate}" value="${dc.dcid}">${dc.dcName}</option>
											</c:otherwise>
										</c:choose>
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
								<input class="form-control" type="number" id="dcper" name="dcper" readonly="readonly" style="width: 152px;"/>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<input class="form-control" type="number" id="dcper" name="dcper" style="width: 72px;" readonly="readonly"/>
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
								<select class="form-select" id="currentdc" name="currentdc" style="width: 152px; text-align: right;">
									<option selected="selected" id="0" value="0"></option>
									<c:forEach var="dc" items="${dclist}">
										<c:choose>
											<c:when test="${dc.dcid == dcid}">
												<option id="${dc.rate}" value="${dc.dcid}" selected="selected">${dc.dcName}</option>
											</c:when>
											<c:otherwise>
												<option id="${dc.rate}" value="${dc.dcid}">${dc.dcName}</option>
											</c:otherwise>
										</c:choose>
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
						<input class="form-control" type="text" id="wiyakprice" name="wiyakprice" readonly="readonly"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">4.(당월)사용금액</span>
								<input class="form-control" type="text" id="currentuseprice" name="currentuseprice" readonly="readonly" style="width: 144px;"/>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">3.(당월)사용일수</span>
								<input class="form-control" type="number" id="dcper" name="dcper" style="width: 72px;"/>
								<span class="input-group-text" id="basic-addon1">일</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm" style="width: 272px;">
						<span class="input-group-text" id="basic-addon1">5.공제합계(1+4)</span>
						<input class="form-control" type="text" id="gongjesum" name="gongjesum" readonly="readonly"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">6.잔여개월금액</span>
								<input class="form-control" type="number" id="dcper" name="dcper" readonly="readonly" style="width: 152px;"/>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<input class="form-control" type="number" id="dcper" name="dcper" style="width: 72px;" readonly="readonly"/>
								<span class="input-group-text" id="basic-addon1">개월(b)</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm" style="width: 272px;">
						<span class="input-group-text" id="basic-addon1">7.반환금액</span>
						<input class="form-control" type="number" id="dcper" name="dcper" readonly="readonly"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">환불사유</span>
								<select class="form-select" id="dcds" name="dcds" style="width: 163px; text-align: right;">
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
								<input class="form-control" type="text" id="dcper" name="dcper" style="width: 282px;"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">예금주</span>
								<input class="form-control" type="text" id="dcper" name="dcper" style="width: 201px;"/>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">은행명</span>
								<input class="form-control" type="text" id="dcper" name="dcper" style="width: 111px;"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">계좌번호</span>
						<input class="form-control" type="text" id="dcper" name="dcper" style="width: 111px;"/>
					</div>
				</div>
	        </div>
	    </div>
	    <div class="card border border-primary" style="width: 308px;height: 444px;">
	    	<div class="card-body my-n3 mx-n5">
	      		<div class="col-auto">
	      			<div class="form-check">
						<input class="form-check-input" id="flexRadioDefault1" type="radio" name="flexRadioDefault" />
						<label class="form-check-label" for="flexRadioDefault1">기본개월 종목</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" id="flexRadioDefault2" type="radio" name="flexRadioDefault" checked="checked" />
						<label class="form-check-label" for="flexRadioDefault2">기본1개월종목 2개월 이상(표준회비)</label>
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
	                        		<tr class="hover-actions-trigger btn-reveal-trigger position-static">
									    <td class="paiddate align-middle white-space-nowrap text-center fw-bold">${paid.realSaleDate}</td>
									    <td class="paidcategory align-middle white-space-nowrap text-center">${paid.payType}</td>
									    <fmt:parseNumber var="paidprice" integerOnly="true" value="${paid.price}"/>
									    <td class="paidprice align-middle white-space-nowrap text-start fw-bold text-700"><fmt:formatNumber value="${paidprice}" pattern="#,###"/></td>
									    <td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">${paid.assignType}</td>
									    <td class="paidmapsa align-middle white-space-nowrap text-center">${paid.maeipsa}</td>
									    <td class="paidcardtype align-middle white-space-nowrap text-start">${paid.cardName}</td>
									    <td class="paidassignN align-middle white-space-nowrap text-start">${paid.assignNo}</td>
									    <td class="paidcardN align-middle white-space-nowrap text-start">${paid.cardNo}</td>
									    <td class="POS align-middle white-space-nowrap text-start">${paid.pos}</td>
									    <td class="signpad py-2 align-middle white-space-nowrap">${paid.signPad}</td>
									    <td class="OID py-2 align-middle white-space-nowrap">${paid.OID}</td>
									    <td class="PayKind py-2 align-middle white-space-nowrap"></td>
									</tr>
								</c:forEach>
                        	</tbody>
                    	</table>
                    </div>
            	</div>
	    	</div>
	    </div>
	    <div class="card w-35 h-100 mb-1 w-20 me-1" style="width: 317px; ">
	    	<div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 273px;">
	    		<div class="col-auto">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">반환금</span>
						<input class="form-control" type="text" id="payprice" name="payprice" readonly="readonly"/>
					</div>
				</div>
				<div class="btn-group btn-group-sm mt-n2" role="group" style="width: 283px;">
  					<button class="btn btn-phoenix-primary" type="button" id="pay-cash" name="pay-cash" onclick="paycash()">현금</button>
  					<button class="btn btn-phoenix-secondary" type="button">현금영수증(간편결제)</button>
				</div>
				<div class="btn-group btn-group-sm" role="group" style="width: 283px;">
  					<button class="btn btn-soft-primary" type="button">신용카드</button>
  					<button class="btn btn-soft-success" type="button">영수증재발행</button>
				</div>
	    	</div>
	    </div>
	</div>
</body>
<script type="text/javascript">
//숨겨진 모달 버튼 dd
var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
$('body').append(buttonHTML);

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
	window.location.reload();
}

var tpaidprice = 0;

$('#paidbody tr').each(function() {
	tpaidprice += parseInt(removeCommasFromNumber($(this).find('.paidprice').text()));
});

$('#tpaidprice').val(formatNumberWithCommas(tpaidprice));


// Get today's date
var today = new Date();

// Format the date as "YYYY-MM-DD" which is the required format for the date input
var formattedDate = today.toISOString().split('T')[0];

// Set the value of the input field to today's date
$('#regdate, #canceldate').val(formattedDate);
//어른 어린이 등을 저장하는 변수 생성


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
});

$('#gongje, #wiyak, #julsak').on('change', function() {
	optionchange({ [this.id]: $(this).val() });
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

$('#totaldc').on('change', function() {
    // 선택된 옵션의 값 가져오기
	var dcrate = $(this).find('option:selected').attr('id');
	$('#totaldcper').val(dcrate);
});

$('#currentdc').on('change', function() {
    // 선택된 옵션의 값 가져오기
	var dcrate = $(this).find('option:selected').attr('id');
	$('#currentdcper').val(dcrate);
});

//위약금 퍼센트 추출
var wiyak = parseInt($('#wiyak').val().match(/\((\d+)%\)/)[1], 10);;

//위약금 공제시작후일 경우
if($('#gongje').val() == '위약금공제(시작후)'){
	//수강이 시작했을 경우
	if(Math.floor(daysDifference) > 0){
		todaysaledate();
		if($('#saledate').val() == formattedDate){
			$('#currentuseprice').val(0);
		}else{
			var useprice = removeCommasFromNumber($('#itemprice').val())*$('#regmonth').val()*$('#usecnt').val()/$('#totalcnt').val();
			$('#currentuseprice').val(formatNumberWithCommas(useprice.toFixed(0)));
		}
	}else{
		$('#wiyakprice').val(0);
	}
//위약금 공제시작전 일 경우	
}else if($('#gongje').val() == '위약금공제(시작전)'){
	todaysaledate();
//위약금 공제 일 경우
}else{
	wiyakbygongje();
}

//dues 옵션에 따라 위약금액 설정하는 함수
function wiyakbygongje(){
	//기본개월이 1개월인데 강습기간이 1개월 이상일 경우 
	if($('#itemmonth').val() ==1 && $('#regmonth').val() > 1){				
		$('#wiyakprice').val(formatNumberWithCommas(removeCommasFromNumber($('#realprice').val())*wiyak/100));
	}else{
		//납입회비 로 체크했을때
		if($('input[name=dues]:checked').val() == 0){
			$('#wiyakprice').val(formatNumberWithCommas(removeCommasFromNumber($('#tpaidprice').val())*wiyak));
		}else{
			$('#wiyakprice').val(formatNumberWithCommas(removeCommasFromNumber($('#realprice').val())*wiyak/100));
		}
	}
}

function todaysaledate(){
	//오늘 등록했을경우
	if($('#saledate').val() == formattedDate){
		$('#wiyakprice').val(0);
	}else{
		wiyakbygongje();	
	}
}

$('#gongjesum').val(formatNumberWithCommas(removeCommasFromNumber($('#currentuseprice').val())+removeCommasFromNumber($('#wiyakprice').val())));




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


function save() {
	if($('#itemname').val()==''){
		$('#resultmessage').html('변경 할 강좌를 선택해주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	if(removeCommasFromNumber($('#tremainprice').val()) != 0){
		$('#resultmessage').html('반변경 차액을 결제해 주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}else{
		fmsc_01save();	
	}
}

function fmsc_01save() {
		var iteration = 0;
		const yearmonth = extractYearMonth($('#fromdate').val());
		$.ajax({
	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
	        url: "classchange", // 실제 엔드포인트로 교체해야 합니다
	        dataType : 'json',
	        data: { 
	        	SaleNo : $('#saleno').val(),
	        	SaleDate : $('#saledate').val(),
	        	ItemPeriod : yearmonth,
	        	CustCode : $('#memberid').val(),
	        	FromDate : $('#fromdate').val(),
	        	ToDate : $('#todate').val(),
	        	RFromDate : $('#fromdate').val(),
	        	RToDate : $('#todate').val(),
	        	RegMonth : $('#regmonth').val(),
	        	DCID : $('#dcds').val(),
	        	DiscountRate : $('#dcper').val(),
	        	DCPrice : removeCommasFromNumber($('#dcprice').val()),
	        	ItemPrice : $('#price option:selected').attr('id'),
	        	RealPrice : removeCommasFromNumber($('#sortprice').val()),
	        	Misu : removeCommasFromNumber($('#tremainprice').val()),
	        	EmpCode : $('#empcode').val(),
	        	IsReReg : '0',
	        	State : 'G+',
	        	ItemPKID : $('#itemid').val(),
	        	InType : '반변경',
	        	prevInType : '등록',
	        	CurState : 1,
	        	PaidPrice : 0
	        },
	        success: function(data) {	
	        	var numberOfTR = $('#paidbody tr#new').length;
	        	if(numberOfTR>0){
	        		$('#paidbody tr#new').each(function() {
		        		$.ajax({
			    	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
			    	        url: "tblpaidinsert", // 실제 엔드포인트로 교체해야 합니다
			    	        dataType : 'text',
			    	        data: { 
			    	        	FPKID: data,
			    	        	SaleDate : $(this).find('.paiddate').text().substr(0,10),
			    	        	RealSaleDate : $(this).find('.paiddate').text(),
			    	        	SaleType : '반변경',
			    	        	PayType : $(this).find('.paidcategory').text(),
			    	        	Price : removeCommasFromNumber($(this).find('.paidprice').text()),
			    	        	AssignType : $(this).find('.paidassignType').text(),
			    	        	PaidGroupSaleNo : data
			    	        },
			    	        success: function(data){
			    	        	iteration++;
			    	        	if(iteration === numberOfTR){
			    	        		window.opener.location.reload();
			    	                window.close();
			    	        	}
			    	        }
			    		});
		        	});
	        	}else{
	        		window.opener.location.reload();
	                window.close();
	        	}
	        },
	        error: function(xhr, status, error) {
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
	        }
		}); 
}  

//itemperiod 를 위한 날짜 포맷 함수
function extractYearMonth(dateString) {
  
	const [year, month] = dateString.split('-');
  
	const yearMonth = year + month;
	
    return yearMonth;
}
  
//현금 결제
function paycash() {
	if($('#tremainprice').val() == 0 || $('#tremainprice').val() == ''){
	  	$('#resultmessage').html('받을 금액이 0원입니다.<br>확인 후 결제해 주세요.');
	  	$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
	    $('#modalButton').click();
	    modalcheck = true;
	    return false;
	}
	var newRow = $('<tr class="hover-actions-trigger btn-reveal-trigger position-static" id = "new"></tr>');
	newRow.append('<td class="paiddate align-middle white-space-nowrap text-center fw-bold">' + getCurrentDateTime() + '</td>');
	newRow.append('<td class="paidcategory align-middle white-space-nowrap text-center">현금</td>');
	newRow.append('<td class="paidprice align-middle white-space-nowrap text-start fw-bold text-700">' + $('#payprice').val() + '</td>');
	newRow.append('<td class="paidassignType align-middle white-space-nowrap text-900 fs--1 text-start">' + '</td>');
	newRow.append('<td class="paidmapsa align-middle white-space-nowrap text-center">' + '</td>');
	newRow.append('<td class="paidcardtype align-middle white-space-nowrap text-start">' +  '</td>');
	newRow.append('<td class="paidassignN align-middle white-space-nowrap text-start">' + '</td>');
	newRow.append('<td class="paidcardN align-middle white-space-nowrap text-start">' +'</td>');
	newRow.append('<td class="POS align-middle white-space-nowrap text-start">' + '</td>');
	newRow.append('<td class="signpad py-2 align-middle white-space-nowrap">' + '</td>');
	newRow.append('<td class="OID py-2 align-middle white-space-nowrap">' +  '</td>');
	newRow.append('<td class="PayKind py-2 align-middle white-space-nowrap">' + '</td>');
	
	// Get the tbody element with ID 'paidbody' and append the new row
	var tableBody = $('#paidbody');
	tableBody.append(newRow);
	totalchange();
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