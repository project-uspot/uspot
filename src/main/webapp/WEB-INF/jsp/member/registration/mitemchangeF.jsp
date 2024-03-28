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
    <script src="${pageContext.request.contextPath}/lib/js/common.js"></script>
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
    <div class="card h-100 mb-1" style="width: 1282px;">
        <div class="card-body mb-n4 mt-n3">
            <div class="col-12 col-xxl-8">
                <div>
                    <div class="row g-3">
                        <h3 class="mb-3 w-25 pt-2">반변경정보 등록 및 변경</h3>
                        <div class="col-auto position-absolute" style="margin-left:1050px;">
                            <button class="btn btn-success" type="button" onclick="save()" >저장(S)</button>
                        </div>
                        <div class="col-auto position-absolute" style="margin-left:1150px;">
                            <button class="btn btn-danger" type="button" onclick="alldelete()">삭제(D)</button>
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
									<c:forEach items="${fmsc_s01List }" var="fmsc_s01" varStatus="status">
										<c:set var="item" value="${itemList[status.index]}" />
										<c:if test="${fmsc_s01.curState == 1 }">
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
											<td class="paidPrice py-2 align-middle white-space-nowrap text-end" style="display:none;">${fmsc_s01.paidPrice}</td>
											<td class="dcname py-2 align-middle white-space-nowrap text-end" style="display:none;">${fmsc_s01.DCName}</td>
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
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">회원등급</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="mlevel" name="mlevel" value="${mleveltext}"/>
					</div>
				</div>
	        </div>
	    </div>
	    <div class="card h-100 mb-1 me-1" style="width: 465px;">
	        <div class="card-body mb-n5 mt-n3 mx-n4" style="height: 330px; width: 510px;">
	            <div class="col-md-10">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">강습반</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="olditemname" name="olditemname" value="<%-- ${itemname} --%>" readonly="readonly"/>
						<input type="hidden" id="saleno" name="saleno" value="<%-- ${fmsc_s01.saleNo} --%>">
						<input type="hidden" id="itemPKID" name="itemPKID" value="<%-- ${fmsc_s01.itemPKID} --%>">
					</div>
				</div>
				<div class="col-md-5">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">등록일자</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="oldsaledate" name="oldsaledate" value="<%-- ${fmsc_s01.saleDate} --%>" readonly="readonly"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">강습기간</span>
								<input class="form-control" type="text" aria-describedby="basic-addon1" id="oldfromdate" name="oldfromdate" style="width: 110px;" value="<%-- ${fmsc_s01.fromDate} --%>" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto mt-1 mx-n4">
							~
						</div>
						<div class="col-auto ms-n1">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="oldtodate" name="oldtodate" style="width: 115px;" value="<%-- ${fmsc_s01.toDate} --%>" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto ms-n3">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="oldregmonth" name="oldregmonth" style="width: 50px;" value="<%-- ${fmsc_s01.regMonth} --%>" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto ms-n2 mt-2">
							개월
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">강습료</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="olditemprice" name="olditemprice" 
						value="<%-- <fmt:formatNumber value="${fmsc_s01.itemPrice}" pattern="#,###"/> --%>" readonly="readonly" style="text-align: right;"/>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-md-5">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">할인</span>
								<input class="form-control" type="text"  id="olddcprice" name="olddcprice" value="<%-- <fmt:formatNumber value="${fmsc_s01.DCPrice}" pattern="#,###"/> --%>"  
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
				<div class="col-md-10">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">판매금액</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="oldprice" name="oldprice" 
						value="<%-- <fmt:formatNumber value="${fmsc_s01.realPrice}" pattern="#,###"/> --%>" readonly="readonly" style="text-align: right;"/>
						<span class="input-group-text" id="basic-addon1">결제금액</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="oldPaidprice" name="oldPaidprice" 
						value="<%-- <fmt:formatNumber value="${fmsc_s01.paidPrice}" pattern="#,###"/> --%>" readonly="readonly" style="text-align: right;"/>
					</div>
				</div>
				<div class="col-md-10">
					<div class="input-group input-group-sm">
  						<span class="input-group-text">비고</span>
						<textarea class="form-control" aria-label="With textarea" readonly="readonly"></textarea>
					</div>
				</div>
	        </div>
	    </div>
	    <div class="card h-100 mb-1 me-1" style="width: 562px;">
	        <div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 330px;">
	            <div class="col-md-10">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">강습반조회</span>
						<input class="form-control" type="text" aria-label="Recipient's username" aria-describedby="basic-addon2" name="findstring" id="findstring" onkeydown="handleKeyPress(event)"/>
						<span class="input-group-text" id="basic-addon2" onclick="finditem()" style="cursor: pointer;">찾기</span>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">변경강습반</span>
						<input class="form-control" type="text" id="itemname" name="itemname" readonly="readonly"/>
						<input type="hidden" name="itemid" id="itemid">
						<input type="hidden" name="empcode" id="empcode">
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">강습료</span>
								<select class="form-select" id="price" name="price" style="width: 152px; text-align: right;">
									<option selected="selected" value="0">0</option>
								</select>
							</div>
						</div>
						<div class="col-md-6 ms-n2">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">등록개월</span>
								<input class="form-control" type="number" id="regmonth" name="regmonth"/>
								<span class="input-group-text" id="basic-addon1">개월</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">강습기간</span>
								<input class="form-control" type="date" aria-describedby="basic-addon1" id="fromdate" name="fromdate"/>
							</div>
						</div>
						<div class="col-auto mt-1 mx-n4">
							~
						</div>
						<div class="col-auto ms-n1">
							<div class="input-group input-group-sm">
								<input class="form-control" type="date" id="todate" name="todate"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">할인유형</span>
								<select class="form-select" id="dcds" name="dcds" style="width: 152px; text-align: right;">
									<option selected="selected" id="0" value="0"></option>
									<c:forEach var="dc" items="${dclist}">
										<option id="${dc.rate}" value="${dc.dcid}">${dc.dcName}</option>
                                	</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-auto" style="margin-left: 41px;">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">총매출금액</span>
								<input class="form-control" type="text" id="totalprice" name="totalprice" style="width: 120px;text-align: right;" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">할인율/금액</span>
								<input class="form-control" type="number" id="dcper" name="dcper" style="width: 72px;" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto mt-1 mx-n4">
							%
						</div>
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<input class="form-control" type="text" id="dcprice" name="dcprice" style="width: 97px;text-align: right;" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto ms-n4">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">총결제금액</span>
								<input class="form-control" type="text" id="tpaidprice" name="tpaidprice" style="width: 120px;text-align: right;" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="row">
						<div class="col-auto">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">합계</span>
								<input class="form-control" type="text" id="sortprice" name="sortprice" style="width: 120px;text-align: right;" readonly="readonly"/>
							</div>
						</div>
						<div class="col-auto" style="margin-left: 98px;">
							<div class="input-group input-group-sm">
								<span class="input-group-text" id="basic-addon1">총미납금액</span>
								<input class="form-control" type="text" id="tremainprice" name="tremainprice" style="width: 120px;text-align: right;" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="col-auto">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">변경사유</span>
						<input class="form-control" type="text" id="note" name="note"/>
					</div>
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
	    <div class="card w-35 h-100 mb-1 me-1" style="width: 497px; ">
	    	<div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 275px;">
	    		<div class="col-auto">
	    			<div class="row">
	    				<div class="col-auto">
	    					<div class="input-group mb-3 input-group-sm">
								<span class="input-group-text">변경일자</span>
								<input class="form-control" type="date" id="saledate" name="saledate"/>
							</div>
	    				</div>
	    				<div class="col-auto ms-n3">
	    					<div class="input-group mb-3 input-group-sm">
								<span class="input-group-text">변경차액</span>
								<input class="form-control" type="text" style="width: 137px;text-align: right;font-weight: 900;" id="changeprice" name="changeprice" readonly="readonly"/>
							</div>
	    				</div>
	    			</div>
				</div>
	    		<div class="col-auto">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">금액</span>
						<input class="form-control" type="text" id="payprice" name="payprice" style="text-align: right;font-weight: 900;" oninput="onlyNumber(this)"/>
					</div>
				</div>
				<div class="row mb-1 w-100 ms-1">
					<div class="col w-30 px-1">
						<button class="btn btn-phoenix-primary w-100" type="button"  id="pay-cash" name="pay-cash" onclick="paycash()">현금</button>
					</div>
					<div class="col w-30 px-1">
						<button class="btn btn-soft-primary w-100" type="button"  onclick="paycredit()">신용카드</button>
					</div>
					<div class="col w-30 px-1">
						<button class="btn btn-soft-secondary w-100" type="button" onclick="payAccount()">계좌입금</button>
					</div>
				</div>
				<div class="row mb-1 w-100 ms-1">
					<div class="col w-30 px-1">
						<button class="btn btn-phoenix-info w-100" type="button"  onclick="cashReceiptChange()">현.영발행</button>
					</div>
					<div class="col w-30 px-1">
						<button class="btn btn-soft-success w-100" type="button" disabled='disabled'>영수증재발행</button>
					</div>
					<div class="col w-30 px-1">
						<button class="btn btn-soft-danger w-100" type="button"  onclick="paidCancel()">결제취소</button>
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
	    	<input type="hidden" name="GroupSaleNo" id="GroupSaleNo" value="${fmsc_s01.groupSaleNo }">
	    	<input type="hidden" name="Insert" id="Insert" value="Y">
	    	<input type="hidden" name="PKID" id="PKID" value="">
	    </form>
	</div>
</body>
<script type="text/javascript">
//숨겨진 모달 버튼
var buttonHTML = '<button class="btn" id="modalButton" type="button" data-bs-toggle="modal" data-bs-target="#verticallyCentered" style="display: none;">Vertically centered modal</button>';
$('body').append(buttonHTML);

var today = new Date();
var formattedDate = today.toISOString().split('T')[0];
document.getElementById('saledate').value = formattedDate;

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
});

<%--//엔터시에 검색하는 기능 --%>
function handleKeyPress(event) {
	if (event.key === "Enter") {
		finditem();
 	}
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
    document.getElementById('oldfromdate').value = result[0];
    document.getElementById('oldtodate').value = result[1];
    document.getElementById('oldregmonth').value = result[2];
    var price = $(clickedRow).find('.price').text();
    var itemid = $(clickedRow).find('#ItemID').val();
    clickeditemid = itemid;

    var itemname = '['+$(clickedRow).find('.item').text()+']'+$(clickedRow).find('.name').text()+' '+$(clickedRow).find('.day').text()+' '+$(clickedRow).find('.level').text();
    $("#olditemname").val(itemname);
    $("#saleno").val($(clickedRow).find('#SaleNo').val());
    $("#itemPKID").val(itemid);

	$("#oldsaledate").val($(clickedRow).find('#SaleDate').val());
	$("#olditemprice").val($(clickedRow).find('.price').text());
	$("#olddcprice").val($(clickedRow).find('.dc').text());
	$("#olddcname").val($(clickedRow).find('.dcname').text());
	$("#olddcname").attr("name",$(clickedRow).find('.dccode').text());
	$("#oldprice").val($(clickedRow).find('.sort').text());
	$("#oldPaidprice").val($(clickedRow).find('.paidPrice').text());
	if($("#sortprice").val() != ""){
		totalchange();	
	}
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
  
<%--//검색하고 검색결과를 팝업으로 여는 함수--%>
function finditem() {
	var findstring = document.getElementById('findstring').value;
	var oldfromdate = document.getElementById('oldfromdate').value;
	if(findstring == '' || findstring == null){
   		$('#resultmessage').text('검색어를 입력해주세요.');
   		$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
        $('#modalButton').click();
        modalcheck = true;
		return false;
	}
	var url = "mitemfindlist?findstring=" + findstring+"&finddate="+ oldfromdate;
    var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=1000,height=500";
    window.open(url, "_blank", windowFeatures);
}
	
<%--// 검색 하고나서 선택된 값을 테이블에 추가하는 함수 --%>
function test(ItemID,selectedDate,nextDate) {
	if(ItemID == $("#itemPKID").val()){
   		$('#resultmessage').text('동일한 강좌입니다.');
   		$('.modal-footer').empty();
	  	var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
	  	$('.modal-footer').append(cancelbutton);
        $('#modalButton').click();
        modalcheck = true;
		return false;
	}else{
		$.ajax({
	        type: "POST",
	        url: "mitemfindbyid",
	        dataType : 'json',
			async : false,
	        data: { 
	        	ItemID: ItemID,
	        	FindDate: selectedDate
	        },
	        success: function(list) {
	        		var olddcid = $('#olddcname').attr('name');
					$('#itemname').val('['+list.CategoryName+']'+list.JungName+' '+list.DayName+' '+list.LevelName);
					$('#empcode').val(list.DamDangUserPKID);
			       	$('#itemid').val(list.ItemID);
					
					var priceoptionlist = $('#price');
			       	priceoptionlist.empty();
			       	$.ajax({
			   	        type: "POST",
			   	        url: "tblcodelist",
			   	        dataType : 'json',
			   			async : false,
			   	        success: function(codelist) {
			   	        	if(list.DefPrice != 0 && list.DefPrice != '' && list.DefPrice != null){
			   	        		priceoptionlist.append($('<option>', {
			   	        			id: list.DefPrice,
			   		                value: codelist[0]+list.DefPrice,
			   		                text: codelist[0]+formatNumberWithCommas(list.DefPrice)
			   		            }));
			   	        	}
			   	        	if (list.Price1 != 0 && list.Price1 != '' && list.Price1 != null) {
			   	        	    var option = $('<option>', {
			   	        	    	id: list.Price1,
			   	        	        value: codelist[1] + list.Price1,
			   	        	        text: codelist[1]+formatNumberWithCommas(list.Price1)
			   	        	    });
	
			   	        	    priceoptionlist.append(option);
	
			   	        	    if ($('#yearage').val() > 13 && $('#yearage').val() < 19) {
			   	        	        option.attr('selected', 'selected');
			   	        	    }
			   	        	}
			   	        	if (list.Price2 != 0 && list.Price2 != '' && list.Price2 != null) {
			   	        	    var option = $('<option>', {
			   	        	    	id: list.Price2,
			   	        	        value: codelist[2] + list.Price2,
			   	        	        text: codelist[2]+formatNumberWithCommas(list.Price2)
			   	        	    });
	
			   	        	    priceoptionlist.append(option);
	
			   	        	    if ($('#yearage').val() >= 0 && $('#yearage').val() < 14) {
			   	        	        option.attr('selected', 'selected');
			   	        	    }
			   	        	}
			   	        	if (list.Price3 != 0 && list.Price3 != '' && list.Price3 != null) {
			   	        	    var option = $('<option>', {
			   	        	    	id: list.Price3,
			   	        	    	value: codelist[3]+list.Price3,
			   		                text: codelist[3]+formatNumberWithCommas(list.Price3)
			   	        	    });
			   	        	    priceoptionlist.append(option);
			   	        	    if ($('#yearage').val() > 64) {
			   	        	        option.attr('selected', 'selected');
			   	        	    }
			   	        	}
			   	        	if(list.Price4 != 0 && list.Price4 != '' && list.Price4 != null){
			   	        		priceoptionlist.append($('<option>', {
			   	        			id: list.Price4,
			   		                value: codelist[4]+list.Price4,
			   		                text: codelist[4]+formatNumberWithCommas(list.Price4)
			   		            }));
			   	        	}
			   	        	if(list.Price5 != 0 && list.Price5 != '' && list.Price5 != null){
			   	        		priceoptionlist.append($('<option>', {
			   	        			id: list.Price5,
			   		                value: codelist[5]+list.Price5,
			   		                text: codelist[5]+formatNumberWithCommas(list.Price5)
			   		            }));
			   	        	}
			   	        	
			   	        	if(list.DcNoChk != 'Y'){
			   	        		$('#dcds option').each(function() {
									if ($(this).val() === olddcid) {
		    							$(this).attr('selected', 'selected');
		    							$('#dcper').val($(this).attr('id'));
									}
				   	         	});
			   	        	}else{
			   	        		$('#dcds option').each(function() {
									if ($(this).val() === '') {
		    							$(this).attr('selected', 'selected');
		    							$('#dcper').val($(this).attr('id'));
									}
				   	         	});
			   	        	}
			   	        },
			   	        error: function(xhr, status, error) {
				   	       	 console.log("Status: " + status);
				   	         console.log("Error: " + error);
				   	         return false;
			   	        }
			   		});
					
			       	$('#regmonth').val($('#oldregmonth').val());
			       	if($('#oldfromdate').val()< formattedDate){
			       		$('#fromdate').val(formattedDate);
			       	}else{
			       		$('#fromdate').val($('#oldfromdate').val());
			       	}		       	
			       	$('#todate').val($('#oldtodate').val());
			    	
	   	        	sortchange();
	        },
	        error: function(xhr, status, error) {
		       	 console.log("Status: " + status);
		         console.log("Error: " + error);
		         return false;
	        }
		});
	}
}

<%--//강습료를 수정할때 바뀐 강습료의 값을 저장하는 함수--%>
$('#price').on('change', function() {
	sortchange();
});
   
<%--//할인유형을 선택하면 그 행의 할인코드 칸을 바꾸는 함수--%>
$('#dcds').on('change', function() {
    var selectedpercent = $('#dcds').find('option:selected').attr('id'); // 선택된 옵션의 id 값을 가져오기
    $('#dcper').val(selectedpercent);
    sortchange();
});
   
$('#regmonth, #fromdate').on('change', function() {
	  
    var selectedValue = $('#regmonth').val();
    var fromdate = $('#fromdate').val();
    
    const formattedDate = new Date(fromdate);
    var monthsToAdd = parseInt(selectedValue);
    
    formattedDate.setMonth(formattedDate.getMonth() + monthsToAdd);
    formattedDate.setDate(formattedDate.getDate()-1);
    
    const formattedDateString = TformatDate(formattedDate);
    
    $('#todate').val(formattedDateString);
});

<%--//소계바꾸는 함수--%>
function sortchange(){
	var regmonth = $('#regmonth').val();
	var price = $('#price option:selected').attr('id');
   	var dcper = $('#dcds').find('option:selected').attr('id');

   	var dcprice = (price*dcper/100)*regmonth;
   	var sortprice = (price*regmonth)-dcprice;
   	
   	$('#dcprice').val(formatNumberWithCommas(dcprice));
   	$('#sortprice').val(formatNumberWithCommas(sortprice));
   	
   	totalchange();
}
   
<%--//결제 내역에 있는 총 금액 변경 함수--%>
function totalchange(){

	var totalprice = 0;<%--총매출금액--%>
	var tpaidprice = 0;<%--총결제금--%>
	var tremainprice = 0;<%--총미납금--%>
	var tchangeprice = 0;<%--변경강습금액--%>
	var toldPaidprice = 0;<%--변경될강습금액--%>

	$('#itemtbody tr').each(function() {
		totalprice += parseInt(removeCommasFromNumber($(this).find('.sort').text()));
	});

	$('#paidbody tr').each(function() {
		tpaidprice += parseInt(removeCommasFromNumber($(this).find('.paidprice').text()));
 	});

	tchangeprice = removeCommasFromNumber($('#sortprice').val());
	toldPaidprice = removeCommasFromNumber($('#oldPaidprice').val());
	totalprice = totalprice - toldPaidprice + tchangeprice;

	tremainprice = totalprice-tpaidprice;
	
	$('#totalprice').val(formatNumberWithCommas(totalprice));

	$('#tpaidprice').val(formatNumberWithCommas(tpaidprice));

	$('#tremainprice').val(formatNumberWithCommas(tremainprice));

	$('#changeprice').val(formatNumberWithCommas(tremainprice));

	$('#payprice').val(formatNumberWithCommas(tremainprice));
	
}

<%--//날짜를 테이블에서 가지고와서 잘라서 보내는 함수--%>
function parseString(inputString) {
	const regex = /(\d{4}-\d{2}-\d{2})~(\d{4}-\d{2}-\d{2})\((\d+)\)/;
	const matches = inputString.match(regex);

	if (!matches || matches.length !== 4) {
		return null; <%--// 입력 형식이 잘못된 경우 처리--%>
	}
	const startDate = matches[1];
	const endDate = matches[2];
	const numberOfMonths = parseInt(matches[3], 10);

	return [startDate, endDate, numberOfMonths.toString()];
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
	var tpaidprice = 0;<%--총결제금--%>
	$('#paidbody tr#new').each(function() {
		tpaidprice += parseInt(removeCommasFromNumber($(this).find('.paidprice').text()));
	});
	tpaidprice += parseInt(removeCommasFromNumber($("#oldPaidprice").val()));

	var iteration = 0;
	const yearmonth = extractYearMonth($('#fromdate').val());

	$.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "classchange", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'json',
		async : false,
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
        	DiscountRate : parseInt($('#dcper').val())||0,
        	DCPrice : removeCommasFromNumber($('#dcprice').val()),
        	ItemPrice : $('#price option:selected').attr('id'),
        	RealPrice : removeCommasFromNumber($('#sortprice').val()),
        	PaidPrice : tpaidprice,
        	Misu : removeCommasFromNumber($('#tremainprice').val()),
        	EmpCode : $('#empcode').val(),
        	IsReReg : '0',
        	State : 'G+',
        	ItemPKID : $('#itemid').val(),
        	InType : '반변경',
        	prevInType : '등록',
        	CurState : 1,
        	GroupSaleNo : $("#GroupSaleNo").val(),
        },
        success: function(data) {	
	        console.log(data);
        },
        error: function(xhr, status, error) {
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
	         return false;
        }
	}); 
	
	var numberOfTR = $('#paidbody tr#new').length;
	if(numberOfTR>0){
		$('#paidbody tr#new').each(function() {
			if($(this).attr('itemid') != 'off'){
	    		$.ajax({
	    	        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
	    	        url: "tblpaidinsert", // 실제 엔드포인트로 교체해야 합니다
	    	        dataType : 'json',
					async : false,
	    	        data: { 
	    	        	SiteCode : "${loginuserinfo.siteCode}",
	    	        	FPKID: $("#GroupSaleNo").val(),
	    	        	SaleDate : $(this).find('.paiddate').text().substr(0,10),
	    	        	RealSaleDate : $(this).find('.paiddate').text(),
	    	        	SaleType : "반변경",
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
						console.log(data);
						paidPkid=data;
	    	        },
	    	        error:function(xhr, status, error){
						console.log("Status: " + status);
						console.log("Error: " + error);
						return false;
					}
	    		});
			}

    		//var inlineRadioOptions = parseInt(document.querySelector('input[name="inlineRadioOptions"]:checked').value);
    		var inlineRadioOptions = 0;

    		if(inlineRadioOptions >= 1){
    		    var myWindow = window.open("${pageContext.request.contextPath}/lecture/Receipt.do?PKID="+paidPkid+"&Type=Change", "MsgWindow", "width=320,height=800");
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
    	});
	}else{
		window.opener.location.reload();
        window.close();
	}
}  

<%--//itemperiod 를 위한 날짜 포맷 함수--%>
function extractYearMonth(dateString) {
	const [year, month] = dateString.split('-');
	const yearMonth = year + month;
	return yearMonth;
}
  
<%--//현금 결제--%>
function paycash() {
	if(removeCommasFromNumber($('#payprice').val()) == 0 || $('#payprice').val() == ''){
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
	
	var tableBody = $('#paidbody');
	tableBody.append(newRow);
	totalchange();
}


<%-- 신용카드 결제 --%>
function paycredit(){
	if(removeCommasFromNumber($('#tremainprice').val()) == 0 || $('#tremainprice').val() == ''){
		$('#resultmessage').html('받을 금액이 0원입니다.<br>확인 후 결제해 주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
		$('#modalButton').click();
		modalcheck = true;
		return false;
	}
	
	var GroupSaleNo = $("#GroupSaleNo").val();
	var InType = "반변경";
	var url = "";

	if(removeCommasFromNumber($('#tremainprice').val()) > 0){
		url = "${pageContext.request.contextPath}/lecture/CreditCard.do?payprice=" + $("#payprice").val() +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Insert=Y&InType="+InType;	
	}else{
		var frm = document.payFrm;
		if(frm.paidCategory.value == ""){
			$('#resultmessage').html('결제취소할 강좌를 선택해주세요.');
			$('.modal-footer').empty();
			var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			$('.modal-footer').append(cancelbutton);
			$('#modalButton').click();
			modalcheck = true;
			return false;
		}else if(frm.paidCategory.value != "신용카드"){
			$('#resultmessage').html('기존 결제를 취소 후 진행해 주세요.');
			$('.modal-footer').empty();
			var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
			$('.modal-footer').append(cancelbutton);
			$('#modalButton').click();
			modalcheck = true;
			return false;
		}else{
			if(removeCommasFromNumber(frm.paidPrice.value) >= removeCommasFromNumber($('#tremainprice').val().replaceAll('-',''))){
				url = "${pageContext.request.contextPath}/lecture/CancelPaid.do?payprice=" +$('#tremainprice').val().replaceAll('-','') +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Insert=Y&InType="+InType;
			}else{
				url = "${pageContext.request.contextPath}/lecture/CancelPaid.do?payprice=" +frm.paidPrice.value +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Insert=Y&InType="+InType;
			}
		}
	}
	
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

<%-- 결제 취소 --%>
function paidCancel(){
	var frm = document.payFrm;

	if($("#tpaidprice").val() == 0){
		$('#resultmessage').html('결제 금액이 0원입니다.<br>확인 후 결제취소해주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
		$('#modalButton').click();
		modalcheck = true;
		return false;
	}else if($("#tpaidprice").val() < 0){
		$('#resultmessage').html('결제가 취소된 금액입니다.<br>확인 후 결제취소해주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
		$('#modalButton').click();
		modalcheck = true;
		return false;
	}

	var GroupSaleNo = $("#GroupSaleNo").val();
	var InType = "반변경";

	if(frm.paidCategory.value == "현금" ){
		$("#paidbody .hover-actions-trigger").each(function() {
			var bgColor = $(this).css("background-color");
			if (bgColor === "rgb(173, 216, 230)" || bgColor === "lightblue") {
	        	if(isToday($(this).find('.paiddate').text()) && $(this).attr("id") == "new"){
	        		$(this).remove();	
	        	}else{
		        	if(removeCommasFromNumber($(this).find(".paidprice").text()) < 0){
		        		$('#resultmessage').html('결제가 취소된 금액입니다.<br>확인 후 결제취소해주세요.');
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
	        		newRow.append('<td class="paidprice align-middle white-space-nowrap text-start fw-bold text-700">-' + $(this).find('.paidprice').text() + '</td>');
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
	        }
	    });
	}else if(frm.paidCategory.value == "계좌이체" ){
		
		if(removeCommasFromNumber(frm.paidPrice.value) < 0){
    		$('#resultmessage').html('결제가 취소된 금액입니다.<br>확인 후 결제취소해주세요.');
    		$('.modal-footer').empty();
    		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
    		$('.modal-footer').append(cancelbutton);
    		$('#modalButton').click();
    		modalcheck = true;
    		return false;
    	}
		var url = "${pageContext.request.contextPath}/lecture/AccountCancel.do?payprice=" +frm.paidPrice.value +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Insert=Y&InType="+InType;
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
		if(removeCommasFromNumber(frm.paidPrice.value) < 0){
    		$('#resultmessage').html('결제가 취소된 금액입니다.<br>확인 후 결제취소해주세요.');
    		$('.modal-footer').empty();
    		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
    		$('.modal-footer').append(cancelbutton);
    		$('#modalButton').click();
    		modalcheck = true;
    		return false;
    	}
		var url = "${pageContext.request.contextPath}/lecture/CancelPaid.do?payprice=" +frm.paidPrice.value +"&CardName="+frm.CardName.value+"&Maeipsa="+frm.Maeipsa.value+"&AssignNo=" +frm.paidAssignNo.value +"&paidCategory=" +frm.paidCategory.value +"&SaleTime=" +frm.SaleTime.value +"&OID=" +frm.OID.value +"&TID=" +frm.TID.value +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+GroupSaleNo+"&Insert=Y&InType="+InType;
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
	totalchange();
}

<%-- 현금 영수증 변환--%>
function cashReceiptChange(){
	var frm = document.payFrm;

	if($("#tpaidprice").val() == 0){
		$('#resultmessage').html('결제 금액이 0원입니다.<br>확인해주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
		$('#modalButton').click();
		modalcheck = true;
		return false;
	}else if($("#tpaidprice").val() < 0){
		$('#resultmessage').html('결제가 취소된 금액입니다.<br>확인해주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
		$('#modalButton').click();
		modalcheck = true;
		return false;
	}

	if(frm.paidCategory.value == "현금" ){
		$("#paidbody .hover-actions-trigger").each(function() {
			var bgColor = $(this).css("background-color");
	        if (bgColor === "rgb(173, 216, 230)" || bgColor === "lightblue") {
	        	console.log($(this).find(".paidprice"));
	        	var url = "${pageContext.request.contextPath}/lecture/ChangeReceipt.do?payprice=" + removeCommasFromNumber($(this).find(".paidprice").text()) +"&MemberID="+$('#memberid').val()+"&tempSaleNo="+$("#GroupSaleNo").val();
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
	    });
	}else{
		$('#resultmessage').html('현금결제가 아닙니다.<br>확인해주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
		$('#modalButton').click();
		modalcheck = true;
		return false;
	}
}

<%-- 계좌입금 --%>
function payAccount(){
	if(removeCommasFromNumber($('#tremainprice').val()) < 1 || $('#tremainprice').val() == ''){
		$('#resultmessage').html('받을 금액이 0원입니다.<br>확인 후 결제해 주세요.');
		$('.modal-footer').empty();
		var cancelbutton = '<button class="btn btn-outline-primary" type="button" data-bs-dismiss="modal">나가기</button>';
		$('.modal-footer').append(cancelbutton);
		$('#modalButton').click();
		modalcheck = true;
		return false;
	}
 	
	var url = "${pageContext.request.contextPath}/lecture/Account.do?payprice=" + $("#payprice").val() +"&MemberID="+$('#memberid').val();
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

<%-- 영수증 재발행 --%>
function reReceipt(){
	var frm = document.payFrm;
	var myWindow = window.open("${pageContext.request.contextPath}/lecture/ReReceipt.do?PKID="+frm.PKID.value, "MsgWindow", "width=320,height=800");
	myWindow.print();
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