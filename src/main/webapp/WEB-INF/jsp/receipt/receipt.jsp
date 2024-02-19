<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<c:set var="dayName" value="" />
<c:set var="gonggub" value="0" />
<c:set var="vat" value="0" />
<c:set var="RealPrice" value="0" />
<c:set var="PaidPrice" value="0" />
<c:set var="Misu" value="0" />
<c:forEach items="${receiptList }" var="receiptMap" varStatus="status">
	<c:if test="${status.index == 0}">
		<h3 style='text-align:center;'>${receiptMap.SiteName }</h3>
		<div><span>${receiptMap.SiteBNo } (대표:${receiptMap.PName })</span></div>
		<div><address>${receiptMap.Address } ${receiptMap.SubAddress }</address></div>
		<div><span>TEL) ${receiptMap.Phone1 }</span></div>
		<div><span>[${receiptMap.saletype }] ${receiptMap.RealSaleDate }</span></div>
		<div><span>회원번호: ${receiptMap.MemberID } [${receiptMap.Name }]</span></div>
		<div>-----------------------------------------------</div>
	</c:if>
	<c:choose>
		<c:when test="${receiptMap.DayName eq '월화수목금토일'}">
			<c:set var="dayName" value="월~일" />
		</c:when>
		<c:when test="${receiptMap.DayName eq '월화수목금토'}">
			<c:set var="dayName" value="월~토" />
		</c:when>
		<c:when test="${receiptMap.DayName eq '월화수목금'}">
			<c:set var="dayName" value="월~금" />
		</c:when>
		<c:otherwise>
			<c:set var="dayName" value="${receiptMap.DayName}" />
		</c:otherwise>
	</c:choose>
	<div><span>강 습 반: [${receiptMap.CategoryName }]${receiptMap.JungName } ${receiptMap.LevelName } ${dayName } ${receiptMap.FromTime }</span></div>
	<div><span>등 록 일: ${receiptMap.SaleDate }</span></div>
	<div><span>수강기간: ${receiptMap.RFromDate }~${receiptMap.RToDate }(${receiptMap.RegMonth })</span></div>
	<div><span>강 습 료: <fmt:formatNumber value='${receiptMap.ItemPrice }' pattern=" #,###" /></span></div>
	<div><span>할인금액: <fmt:formatNumber value='${receiptMap.dcPrice }' pattern=" #,###" /></span></div>
	<c:choose>
		<c:when test="${receiptMap.NVAT eq 'Y'}">
			<div><span>강습금액: <fmt:formatNumber value='${receiptMap.gonggub }' pattern=" #,###" /></span></div>
			<div><span>부 가 세: <fmt:formatNumber value='${receiptMap.vat }' pattern=" #,###" /></span></div>		
		</c:when>
		<c:otherwise>
			<div><span>강습금액: <fmt:formatNumber value='${receiptMap.gonggub }' pattern=" #,###" /></span></div>
		</c:otherwise>
	</c:choose>
	<div>-----------------------------------------------</div>
	<c:set var="gonggub" value="${gonggub + receiptMap.gonggub}" />
	<c:set var="vat" value="${vat + receiptMap.vat}" />
	<c:set var="RealPrice" value="${RealPrice + receiptMap.RealPrice}" />
	<c:set var="PaidPrice" value="${PaidPrice + receiptMap.PaidPrice}" />
	<c:set var="Misu" value="${Misu + receiptMap.Misu}" />
	<c:if test="${status.index + 1 == fn:length(receiptList)}">
		<div><span>공급가액: <fmt:formatNumber value='${gonggub }' pattern=" #,###" /></span></div>
		<div><span>부 가 세: <fmt:formatNumber value='${vat }' pattern=" #,###" /></span></div>
		<div><span>받을금액: <fmt:formatNumber value='${RealPrice }' pattern=" #,###" /></span></div>
		<div>-----------------------------------------------</div>
		<c:choose>
			<c:when test="${receiptMap.paytype eq '현금' }">
				<div><span>현   금: <fmt:formatNumber value='${receiptMap.Price }' pattern=" #,###" /></span></div>
			</c:when>
			<c:when test="${receiptMap.paytype eq '현금영수증' }">
				<div><span>승인구분: ${receiptMap.AssignType }</span></div>
				<div><span>승인번호: ${receiptMap.AssignNo }</span></div>
				<div><span>승인금액: <fmt:formatNumber value='${receiptMap.Price }' pattern=" #,###" /></span></div>
			</c:when>
			<c:when test="${receiptMap.paytype eq '신용카드' }">
				<div><span>카드종류: ${receiptMap.CardName }</span></div>
				<div><span>승인구분: ${receiptMap.AssignType }</span></div>
				<div><span>승인번호: ${receiptMap.AssignNo }</span></div>
				<div><span>승인금액: <fmt:formatNumber value='${receiptMap.Price }' pattern=" #,###" /></span></div>
			</c:when>
			<c:when test="${receiptMap.paytype eq '간편결제' }">
				<div><span>간편결제: <fmt:formatNumber value='${receiptMap.Price }' pattern=" #,###" /></span></div>
			</c:when>
			<c:when test="${receiptMap.paytype eq '제로페이' }">
				<div><span>제로페이: <fmt:formatNumber value='${receiptMap.Price }' pattern=" #,###" /></span></div>
			</c:when>
			<c:when test="${receiptMap.paytype eq '계좌이체' }">
				<div><span>계좌이체: <fmt:formatNumber value='${receiptMap.Price }' pattern=" #,###" /></span></div>
			</c:when>
		</c:choose>
		<div><span>승인일자: ${receiptMap.RealSaleDate }</span></div>
		<div>-----------------------------------------------</div>
		<div><span>받은금액: <fmt:formatNumber value='${PaidPrice }' pattern=" #,###" /></span></div>
		<c:if test="${Misu > 0 }">
			<div><span>미납금액: <fmt:formatNumber value='${Misu }' pattern=" #,###" /></span></div>
		</c:if>
		<div><span>담 당 자: [${receiptMap.SawonNo}]${receiptMap.SawonName }</span></div>
	</c:if>
</c:forEach>
</div>
</body>
</html>