<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                    </div>
					<div class="row">
						<div class="col-auto ms-n3">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text me-3" id="basic-addon1">강습반</span>
							<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
								<input class="form-check-input" id="indexradio1" type="radio" name="index" value="1" aria-describedby="basic-addon1" checked="checked"/>
								<label class="form-check-label" for="indexradio1">일반</label>
							</div>
							<div class="form-check form-check-inline mt-2" aria-describedby="basic-addon1">
								<input class="form-check-input" id="indexradio2" type="radio" name="index" value="2" aria-describedby="basic-addon1"/>
								<label class="form-check-label" for="indexradio2">복합</label>
							</div>
						</div>
					</div>
	                    <div class="col-sm-6 col-md-2">
	                    	<div class="input-group">
							  <input class="form-control" type="text" aria-label="Recipient's username" aria-describedby="basic-addon2" name="findstring" id="findstring" onkeydown="handleKeyPress(event)"/>
							  <span class="input-group-text" id="basic-addon2" onclick="finditem()" style="cursor: pointer;">찾기</span>
							</div>
	                    </div>
	                    <div class="col-auto mt-1">
                            <p style="background-color: lightblue;">[${member.memberID}]${member.name}(${member.genderText})${member.typeText} / ${mleveltext} / ${dcname}</p>
                            <input type="hidden" name="memberid" id="memberid" value="${member.memberID}">
						</div>
						<div class="col-auto position-absolute" style="margin-left:1000px;">
                            <button class="btn btn-success" type="button" onclick="save()" >저장(S)</button>
                        </div>
                        <div class="col-auto position-absolute" style="margin-left:1104px;">
                            <button class="btn btn-danger" type="button" onclick="window.location.reload();">삭제(D)</button>
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
                                <tbody class="list" id="itemtbody">
                               		<tr>
                               			<td class="code align-middle white-space-nowrap text-center fw-bold">
                               			${item.ItemCode}
                               			<input type="hidden" id="SaleNo" name="SaleNo" value="${fmsc_s01.saleNo}">
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
									    <td class="enter py-2 align-middle white-space-nowrap">${item.RegCnt + item.RegCnt2}</td>
									    <td class="remain py-2 align-middle white-space-nowrap">${item.OffMax + item.OnMax - (item.RegCnt + item.RegCnt2)}</td>
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
	    <div class="card w-60" style="height: 250px;">
	    	<div class="card-body">
		        <div class="row mt-n3">
		        	<div class="col-auto">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text" id="basic-addon1">접수일자</span>
							<input class="form-control" type="date" aria-describedby="basic-addon1" id="saledate" name="saledate" value="${fmsc_s01.saleDate}"/>
						</div>
					</div>
					<div class="col-auto ms-n4">
						<div class="input-group input-group-sm mb-3">
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
								<input class="form-check-input" id="inlineRadio3" type="radio" name="inlineRadioOptions" value="option3" aria-describedby="basic-addon1" checked="checked"/>
								<label class="form-check-label" for="inlineRadio3">0장</label>
							</div>
						</div>
					</div>
				</div>
				<fmt:parseNumber var="DefPrice" integerOnly="true" value="${item.DefPrice}"/>
				<fmt:parseNumber var="Price1" integerOnly="true" value="${item.Price1}"/>
				<fmt:parseNumber var="Price2" integerOnly="true" value="${item.Price2}"/>
				<fmt:parseNumber var="Price3" integerOnly="true" value="${item.Price3}"/>
				<fmt:parseNumber var="Price4" integerOnly="true" value="${item.Price4}"/>
				<fmt:parseNumber var="Price5" integerOnly="true" value="${item.Price5}"/>
				<div class="row">
		        	<div class="col-auto">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text" id="basic-addon1">강습료</span>
							<select class="form-select" aria-label="Default select example" id="price" aria-describedby="basic-addon1" style="width: 152px; text-align: right;">
								<c:if test="${not empty DefPrice}">
									<option value="${DefPrice}">어른<fmt:formatNumber value="${item.DefPrice}" pattern="#,###"/></option>
								</c:if>
								<c:if test="${not empty Price1}">
									<option value="${Price1}">청소년<fmt:formatNumber value="${item.Price1}" pattern="#,###"/></option>
								</c:if>
								<c:if test="${not empty Price2}">
									<option value="${Price2}">어린이<fmt:formatNumber value="${item.Price2}" pattern="#,###"/></option>
								</c:if>
								<c:if test="${not empty Price3}">
									<option value="${Price3}">경로<fmt:formatNumber value="${item.Price3}" pattern="#,###"/></option>
								</c:if>
								<c:if test="${not empty Price4}">
									<option value="${Price4}">기본금<fmt:formatNumber value="${item.Price4}" pattern="#,###"/></option>
								</c:if>
								<c:if test="${not empty Price5}">
									<option value="${Price5}"><fmt:formatNumber value="${item.Price5}" pattern="#,###"/></option>								
								</c:if>
							</select>
						</div>
					</div>
					<div class="col-auto">
						<div class="input-group input-group-sm mb-3 ms-1">
							<span class="input-group-text" id="basic-addon1">등록개월</span>
							<input class="form-control" type="number" aria-describedby="basic-addon1" min="1" style="width: 60px;" name="regmonth" id="regmonth" value="${fmsc_s01.regMonth}"/>
						</div>
					</div>
					<div class="col-md-5 ms-n2" style="width: 327px;">
						<div class="input-group input-group-sm mb-3">
							<span class="input-group-text" id="basic-addon1">할인유형</span>
							<select class="form-select" id="dcds" aria-label="Default select example" aria-describedby="basic-addon1">
								<option selected="selected" value="0" id="0"></option>
								<c:forEach var="dc" items="${dclist}">
									<option id="${dc.rate}" value="${dc.dcid}">${dc.dcName}</option>
                                </c:forEach>
							</select>
						</div>
					</div>
				</div>
				<script type="text/javascript">
				var fmsc_s01DCID = '${fmsc_s01.DCID}';
				$('#dcds').val(fmsc_s01DCID);
				</script>
				<div class="row">
					<div class="col-auto">
						<div class="input-group mb-3 input-group-sm">
							<span class="input-group-text" id="basic-addon1">강습기간</span>
							<input class="form-control" type="date" aria-describedby="basic-addon1" id="fromdate" name="fromdate" value="${fmsc_s01.fromDate}"/>
						</div>
					</div>
					<div class="col-auto mt-1 mx-n4">
						~
					</div>
					<div class="col-auto ms-n1">
						<div class="input-group mb-3 input-group-sm">
							<input class="form-control" type="date" id="todate" name="todate" value="${fmsc_s01.toDate}"/>
						</div>
					</div>
					<div class="col-auto">
						<div class="input-group mb-3 input-group-sm">
							<span class="input-group-text" id="basic-addon1">할인율/금액</span>
							<input class="form-control" type="number" id="dcper" name="dcper" aria-describedby="basic-addon1" min="1" readonly="readonly" style="width: 65px;" value="${fmsc_s01.discountRate}"/>
						</div>
					</div>
					<div class="col-auto mt-1 mx-n3">
						%
					</div>
					<div class="col-auto ms-n2">
						<div class="input-group mb-3 w-auto input-group-sm">
							<input class="form-control" type="text" id="dcpri" name="dcpri" readonly="readonly" 
							style="width: 99px;text-align: right;" value="<fmt:formatNumber value="${fmsc_s01.DCPrice}" pattern="#,###"/>"/>
						</div>
					</div>
				</div>
		        <div class="row">
		        	<div class="col-md-7">
		        		<div class="input-group mb-3 input-group-sm">
							<span class="input-group-text" id="basic-addon1">비고</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" />
						</div>
		        	</div>
		        	<div class="col-md-5" style="width: 312px;">
		        		<div class="input-group mb-3 ms-n3 input-group-sm">
							<span class="input-group-text" id="basic-addon1">합계</span>
							<input class="form-control" type="text" id="sortpri" name="sortpri" aria-describedby="basic-addon1" style="text-align: right;" readonly="readonly" value="<fmt:formatNumber value="${fmsc_s01.realPrice}" pattern="#,###"/>"/>
						</div>
		        	</div>
		        </div>
		        <div class="row">
		        	<div class="col-md-7">
		        		<div class="input-group mb-3 input-group-sm">
							<span class="input-group-text" id="basic-addon1">잔여개월</span>
							<input class="form-control" type="text" aria-describedby="basic-addon1" />
						</div>
		        	</div>
					<div class="col-auto mt-2">
						<div class="row">
							<div class="col-auto">
							만나이 : 
							</div>
							<div class="col-auto ms-n3">
							<p id="age">${member.age}</p>
							</div>
						</div>
		        	</div>
		        	<div class="col-auto mt-2">
						<div class="row">
							<div class="col-auto">
							연나이 : 
							</div>
							<div class="col-auto ms-n3">
							<p id="yearage">${yearage}</p>
							</div>
						</div>
		        	</div>
		        </div>
	  		</div>
	    </div>
	    <div class="card w-31 ms-1" style="width: 509px; height: 350px;">
	    	<div class="card-body">
				<div class="col-md-5 mt-n3" style="width: 332px;">
					<div class="input-group mb-3 input-group-sm">
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
				    	<div class="card-body my-n3">
				      		<div class="col-auto">
                        		<div class="row">
                           			<div class="col-auto">
										<h4 class="card-title">결제내역</h4>
										<div class="row">
											<div class="col-auto">
												<div class="input-group mb-3 input-group-sm">
													<span class="input-group-text" id="basic-addon1">총매출금액</span>
													<input class="form-control" type="text" id="totalprice" name="totalprice" 
													aria-describedby="basic-addon1" style="width: 134px;text-align: right;" readonly="readonly"
													 value="<fmt:formatNumber value="${fmsc_s01.realPrice}" pattern="#,###"/>"/>
												</div>
											</div>
											<div class="col-auto">
												<div class="input-group mb-3 input-group-sm">
													<span class="input-group-text" id="basic-addon1">정원</span>
													<input class="form-control" type="text" id="max" name="max" 
													aria-describedby="basic-addon1" style="width: 57px;" readonly="readonly" value="${item.OffMax + item.OnMax}"/>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-auto">
												<div class="input-group mb-3 input-group-sm">
													<span class="input-group-text" id="basic-addon1">총결제금액</span>
													<input class="form-control" type="text" id="tpaidprice" name="tpaidprice"
													 aria-describedby="basic-addon1" style="width: 134px;text-align: right;" readonly="readonly"
													  value="<fmt:formatNumber value="${fmsc_s01.realPrice-fmsc_s01.misu}" pattern="#,###"/>"/>
												</div>
											</div>
											<div class="col-auto">
												<div class="input-group mb-3 input-group-sm">
													<span class="input-group-text" id="basic-addon1">등록</span>
													<input class="form-control" type="text" id="enter" name="enter"
													 aria-describedby="basic-addon1" style="width: 57px;" readonly="readonly" value="${item.RegCnt + item.RegCnt2}"/>
												</div>
											</div>
										</div>
										<div class="row mb-n3">
											<div class="col-auto">
												<div class="input-group mb-3 input-group-sm">
													<span class="input-group-text" id="basic-addon1">총미납금액</span>
													<input class="form-control" type="text" id="tremainprice" name="tremainprice"
													 aria-describedby="basic-addon1" style="width: 134px;text-align: right;" readonly="readonly" value="<fmt:formatNumber value="${fmsc_s01.misu}" pattern="#,###"/>"/>
												</div>
											</div>
											<div class="col-auto">
												<div class="input-group mb-3 input-group-sm">
													<span class="input-group-text" id="basic-addon1">잔여</span>
													<input class="form-control" type="text" id="remain" name="remain" 
													aria-describedby="basic-addon1" style="width: 57px;" readonly="readonly" value="${item.OffMax + item.OnMax - (item.RegCnt + item.RegCnt2)}"/>
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
						<div class="input-group mb-3 input-group-sm">
							<span class="input-group-text">총일수</span>
							<input class="form-control" type="number" id="totalday" name="totalday" aria-label="Amount (to the nearest dollar)" min="0"/>
							<span class="input-group-text">일</span>
						</div>
					</div>
					<div class="col-md-6">
						<div class="input-group mb-3 input-group-sm">
							<span class="input-group-text">사용일수</span>
							<input class="form-control" type="number" id="useday" name="useday" aria-label="Amount (to the nearest dollar)" min="0"/>
							<span class="input-group-text">일</span>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">강습료</span>
						<input class="form-control" type="text" id="learnprice" name="learnprice" readonly="readonly" style="text-align: right;font-weight: 900;" value="<fmt:formatNumber value="${fmsc_s01.itemPrice}" pattern="#,###"/>"/>
					</div>
				</div>
		    </div>
		</div>
	    <div class="card w-60 mt-n12 h-50">
	    	<div class="card-body my-n3">
	    		<div class="border-top border-bottom border-200" id="customerOrdersTable" style="overflow-y: scroll; height: 263px;"
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
	    <div class="card w-35 ms-1" style="width: 509px; height: 185px;">
	    	<div class="card-body my-n3">
	    		<div class="col-auto">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">받을금액</span>
						<input class="form-control" type="text" id="payprice" name="payprice" style="text-align: right;font-weight: 900;"/>
					</div>
				</div>
				<div class="row mb-1">
					<div class="col-auto">
						<button class="btn btn-phoenix-primary" type="button" id="pay-cash" name="pay-cash" onclick="paycash()">현금</button>
					</div>
					<div class="col-auto ms-4">
						<button class="btn btn-phoenix-secondary" type="button">현금영수증(간편결제)</button>
					</div>
					<div class="col-auto ms-n6">
						<button class="btn btn-soft-secondary" type="button">계좌입금</button>
					</div>
				</div>
				<div class="row mb-1">
					<div class="col-auto">
						<button class="btn btn-phoenix-info" type="button">현.영발행</button>
					</div>
					<div class="col-auto ms-n1">
						<button class="btn btn-phoenix-success" type="button">현금(제로페이)</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-soft-success" type="button">영수증재발행</button>
					</div>
				</div>
				<div class="row">
					<div class="col-auto">
						<button class="btn btn-soft-primary" type="button">신용카드</button>
					</div>
					<div class="col-auto">
						<button class="btn btn-soft-danger" type="button">결제취소</button>
					</div>
					<div class="col-auto ms-5">
						<button class="btn btn-soft-info" type="button">행삭제</button>
					</div>
				</div>
	    	</div>
	    </div>
	</div>
</body>
<script type="text/javascript">
//숨겨진 모달 버튼
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
  
//강습료를 수정할때 바뀐 강습료의 값을 저장하는 함수
$('#price').on('change', function() {
    // 선택된 옵션의 값 가져오기
	var selectedValue = $('#price').val();
    $('#itemtbody').find('.price').text(formatNumberWithCommas(selectedValue));
    $('#learnprice').val(formatNumberWithCommas(selectedValue));
    sortchange();
});


   
//할인유형을 선택하면 그 행의 할인코드 칸을 바꾸는 함수
$('#dcds').on('change', function() {
    var selectedID = $(this).val(); // 선택된 값 가져오기
    var selectedpercent = $(this).find('option:selected').attr('id'); // 선택된 옵션의 id 값을 가져오기
    // 해당 행을 찾았을 때 선택된 값으로 'dccode' 클래스를 가진 td에 내용을 넣어줍니다.
    $('#itemtbody').find('.dccode').text(selectedID);
    // 선택된 값으로 'dcpercent' 클래스를 가진 td에 내용을 넣어줍니다.
    $('#itemtbody').find('.dcpercent').text(selectedpercent);
    $('#dcper').val(selectedpercent);
    sortchange();
});
   
   
   
$('#regmonth').on('change', function() {
    // 선택된 옵션의 값 가져오기
    var selectedValue = $('#regmonth').val();

   	// 해당 행을 찾았을 때 선택된 값으로 'dccode' 클래스를 가진 td에 내용을 넣어줍니다.
   	const result = parseString($('#itemtbody').find('.date').text());
   
   	const formattedDate = new Date(result[0]);
   	var monthsToAdd = parseInt(selectedValue);
    formattedDate.setMonth(formattedDate.getMonth() + monthsToAdd);
    formattedDate.setDate(formattedDate.getDate()-1);
    const formattedDateString = formatDate(formattedDate);
    $('#todate').val(formattedDateString);
   
 	const revalue = result[0]+'~'+formattedDateString+'('+selectedValue+')';

 	$('#itemtbody').find('.date').text(revalue);
 	sortchange();
});
   
   
   
$('#fromdate').on('change', function() {
	// 선택된 옵션의 값 가져오기
	var selectedValue = $('#fromdate').val();
	
	// 해당 행을 찾았을 때 선택된 값으로 'dccode' 클래스를 가진 td에 내용을 넣어줍니다.
	const result = parseString($('#itemtbody').find('.date').text());
	   
	const formattedDate = new Date(selectedValue);
	var monthsToAdd = parseInt(result[2], 10);
	formattedDate.setMonth(formattedDate.getMonth() + monthsToAdd);
	formattedDate.setDate(formattedDate.getDate()-1);
	const formattedDateString = formatDate(formattedDate);
	$('#todate').val(formattedDateString);
	   
	const revalue = selectedValue+'~'+formattedDateString+'('+result[2]+')';
	$('#itemtbody').find('.date').text(revalue);
});
   
   
   
$('#todate').on('change', function() {
    // 선택된 옵션의 값 가져오기
	var selectedValue = $('#todate').val();
    // 해당 행을 찾았을 때 선택된 값으로 'dccode' 클래스를 가진 td에 내용을 넣어줍니다.
	const result = parseString($('#itemtbody').find('.date').text());
         
    const revalue = result[0]+'~'+selectedValue+'('+result[2]+')';
    $('#itemtbody').find('.date').text(revalue);
});
   
//소계바꾸는 함수
function sortchange(){
	var price = removeCommasFromNumber($('#itemtbody').find('.price').text());
	var dcpercent = parseInt($('#itemtbody').find('.dcpercent').text());
	const regmonth = $('#regmonth').val();
	var dcprice = price*(dcpercent*0.01);
	var afterdcprice = price-dcprice;
	$('#itemtbody').find('.dc').text(formatNumberWithCommas(dcprice*regmonth));
	$('#itemtbody').find('.sort').text(formatNumberWithCommas(afterdcprice*regmonth));
	$('#dcpri').val(formatNumberWithCommas(dcprice*regmonth));
	$('#sortpri').val(formatNumberWithCommas(afterdcprice*regmonth));
	totalchange();
}
   
//결제 내역에 있는 총 금액 변경 함수
function totalchange(){
	var tpaidprice = 0;
	
	$('#paidbody tr').each(function() {
		tpaidprice += parseInt(removeCommasFromNumber($(this).find('.paidprice').text()));
 	});
	
	$('#totalprice').val($('#sortpri').val());

	$('#tpaidprice').val(formatNumberWithCommas(tpaidprice));

	$('#tremainprice').val(formatNumberWithCommas(removeCommasFromNumber($('#sortpri').val())-tpaidprice));
	
	$('#payprice').val(formatNumberWithCommas(removeCommasFromNumber($('#sortpri').val())-tpaidprice));
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

function save() {
	if(removeCommasFromNumber($('#tremainprice').val()) != 0){
		$('#resultmessage').html('미납금액이 존재합니다.<br>미납금액정산 없이 저장하시겠습니까?');
		$('.modal-footer').empty();
		var okaybutton = '<button class="btn btn-primary" type="button" onclick="fmsc_01save()">확인</button>';
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(okaybutton);
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
	//itemperiod 셋팅
	const result = parseString($('#itemtbody').find('.date').text());
	const yearmonth = extractYearMonth(result[0]);
	$.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "fmsc_01update", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'text',
        data: { 
        	SaleNo : $('#itemtbody').find('input[name="SaleNo"]').val(),
        	SaleDate : $('#saledate').val(),
        	ItemPeriod : yearmonth,
        	FromDate : result[0],
        	ToDate : result[1],
        	RFromDate : result[0],
        	RToDate : result[1],
        	RegMonth : result[2],
        	DCID : $('#itemtbody').find('.dccode').text(),
        	DiscountRate : $('#itemtbody').find('.dcpercent').text(),
        	DCPrice : removeCommasFromNumber($('#itemtbody').find('.dc').text()),
        	ItemPrice : removeCommasFromNumber($('#itemtbody').find('.price').text()),
        	RealPrice : removeCommasFromNumber($('#itemtbody').find('.sort').text()),
        	Misu : removeCommasFromNumber($('#tremainprice').val())
        },
        success: function(){
        	var numberOfTR = $('#paidbody tr#new').length;
        	if(numberOfTR>0){
        		$('#paidbody tr#new').each(function() {
	        		$.ajax({
		    	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
		    	        url: "tblpaidinsert", // 실제 엔드포인트로 교체해야 합니다
		    	        dataType : 'text',
		    	        data: { 
		    	        	FPKID: $('#itemtbody').find('input[name="SaleNo"]').val(),
		    	        	SaleDate : $(this).find('.paiddate').text().substr(0,10),
		    	        	RealSaleDate : $(this).find('.paiddate').text(),
		    	        	SaleType : '등록',
		    	        	PayType : $(this).find('.paidcategory').text(),
		    	        	Price : removeCommasFromNumber($(this).find('.paidprice').text()),
		    	        	AssignType : $(this).find('.paidassignType').text(),
		    	        	PaidGroupSaleNo : $('#itemtbody').find('input[name="SaleNo"]').val()
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
	if(removeCommasFromNumber($('#tremainprice').val()) == 0 || $('#tremainprice').val() == ''){
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
	newRow.append('<td class="paidprice align-middle white-space-nowrap text-start fw-bold text-700">' + $('#tremainprice').val() + '</td>');
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