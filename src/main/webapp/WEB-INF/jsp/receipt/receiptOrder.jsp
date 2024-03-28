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
		<div>-----------------------------------------------</div>
	</c:if>
	<c:if test="${status.index == 0 or receiptMap.ItemName != receiptList[status.index-1].ItemName}">
		<div><span>메뉴명 : [${receiptMap.GroupName }] ${receiptMap.ItemName }</span></div>
		<div><span>수 량 : ${receiptMap.Amount }</span></div>
		<div><span>메뉴금액 : <fmt:formatNumber value='${receiptMap.TotalPrice }' pattern=" #,###" /></span></div>
		<div><span>할인금액 : <fmt:formatNumber value='${receiptMap.DcPrice }' pattern=" #,###" /></span></div>
		<c:choose>
			<c:when test="${receiptMap.NVAT eq 'Y'}">
				<div><span>메뉴금액: <fmt:formatNumber value='${receiptMap.gonggub }' pattern=" #,###" /></span></div>
				<div><span>부 가 세: <fmt:formatNumber value='${receiptMap.vat }' pattern=" #,###" /></span></div>		
			</c:when>
			<c:otherwise>
				<div><span>메뉴금액: <fmt:formatNumber value='${receiptMap.gonggub }' pattern=" #,###" /></span></div>
			</c:otherwise>
		</c:choose>
		<div>-----------------------------------------------</div>
		<c:set var="gonggub" value="${gonggub + receiptMap.gonggub}" />
		<c:set var="vat" value="${vat + receiptMap.vat}" />
		<c:set var="RealPrice" value="${RealPrice + receiptMap.RealPrice}" />
		<c:set var="PaidPrice" value="${PaidPrice + receiptMap.PaidPrice}" />
	</c:if>
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
		<div><span>받은금액: <fmt:formatNumber value='${receiptMap.Price }' pattern=" #,###" /></span></div>
		<c:if test="${Misu > 0 }">
			<div><span>미납금액: <fmt:formatNumber value='${Misu }' pattern=" #,###" /></span></div>
		</c:if>
		<div><span>담 당 자: [${receiptMap.SawonNo}]${receiptMap.SawonName }</span></div>
	</c:if>
</c:forEach>
<c:forEach items="${receiptList }" var="receiptMap" varStatus="status">
	<h3 style='text-align:center;'>[락커배정표]</h3>
	<div><span>성별: ${receiptMap.Gender }</span></div>
	<div><span>업장: ${receiptMap.Upjang }</span></div>
	<div><span>락커번호: ${receiptMap.LockerNo }</span></div>
	<div><span>배정일시: ${receiptMap.RealSaleDate }</span></div>
	<div>-----------------------------------------------</div>
	<div><span>10분 이내에 입장 바랍니다.</span></div>
</c:forEach>
</div>
</body>
</html>