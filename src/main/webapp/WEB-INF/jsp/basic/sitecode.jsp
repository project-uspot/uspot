<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file ="../include/AdminTop.jsp"%>
<%@ include file ="../include/AdminLeft.jsp"%>


<div class="p-0 w-auto">
	<div class="mb-9">
		<div class="row g-2 mb-4">
            <div class="col-auto">
              <h2 class="mb-0">사업장 관리</h2>
            </div>
        </div>
        <div class="mb-4">
	          <div class="row g-3">
	            <div class="col-auto">
	              <div class="search-box">
	                <form class="position-relative" data-bs-toggle="search" data-bs-display="static">
	                  <input class="form-control search-input search" type="search" placeholder="Search customers" aria-label="Search" />
	                  <span class="fas fa-search search-box-icon"></span>
	
	                </form>
	              </div>
	            </div>
	            <div class="col-auto scrollbar overflow-hidden-y flex-grow-1">
	            </div>
	            <div class="col-auto">
	              <a class="btn btn-info px-5" href="${pageContext.request.contextPath}/insertSite.do" title="등록">등록</a>
	            </div>
	          </div>
	        </div>
		<div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top  border-200 position-relative top-1">
			<div class="table-responsive scrollbar-overlay mx-n1 px-1">
	  			<table class="table table-sm fs--1 mb-1">
		  			<colgroup>
		  				<col style="width:50px">
		  				<col style="width:140px">
		  				<col style="width:120px">
		  				<col style="width:60px">
		  				<col style="width:60px">
		  				<col style="width:100px">
		  				<col style="width:180px">
		  				<col style="width:230px">
		  				<col style="width:320px">
		  				<col style="width:120px">
		  				<col style="width:120px">
		  				<col style="width:120px">
		  				<col style="width:100px">
		  				<col style="width:50px">
		  				<col style="width:120px">
		  				<col style="width:100px">
		  			</colgroup>
		  			<thead>
		  				<tr>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="SiteID">사업장코드</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="SiteName">사업장명</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="SiteBNo">사업자번호</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="Pname">대표자</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="UpTae">업태</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="JongMok">종목</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="ZipCode">우편번호</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="Address">주소</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="SubAddress">세부주소</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="Phone1">전화번호1</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="Phone2">전화번호2</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="Fax">FAX</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="Email">E-Mail</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="DamDangJa">담당자</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="DamDangJaPhone">연락처</th>
		  					<th class="sort align-middle pe-1 text-center" scope="col" data-sort="Note">비고</th>
		  				</tr>
  					</thead>
	  				<tbody class="list">
		  				<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center">
		  					<td class="SiteID align-middle white-space-nowrap pe-5">
		  						<c:out value="${list.siteID }"></c:out>
		  					</td>
		  					<td class="SiteName align-middle white-space-nowrap ">
		  						<form action="<c:url value='siteDetail.do'/>" method="post">
									<input type="hidden" name="SiteCode" value="${list.siteCode }">
									<input type="hidden" name=SiteID value="${list.siteID }">
									<input class="fw-bold" type="submit" value="<c:out value="${list.siteName }"/>" style="border: 0px solid #e0e0e0; backGround-color: white;"> 
								</form>
		  					</td>
		  					<td class="SiteBNo align-middle white-space-nowrap ">
		  						<c:out value="${list.siteBNo }"></c:out>
		  					</td>
		  					<td class="Pname align-middle white-space-nowrap ">
		  						<c:out value="${list.pname }"></c:out>
		  					</td>
		  					<td class="UpTae align-middle white-space-nowrap ">
		  						<c:out value="${list.upTae }"></c:out>
		  					</td>
		  					<td class="JongMok align-middle white-space-nowrap ">
		  						<c:out value="${list.jongMok }"></c:out>
		  					</td>
		  					<td class="ZipCode align-middle white-space-nowrap ">
		  						<c:out value="${list.zipCode }"></c:out>
		  					</td>
		  					<td class="Address align-middle white-space-nowrap ">
		  						<c:out value="${list.address }"></c:out>
		  					</td>
		  					<td class="SubAddress align-middle white-space-nowrap ">
		  						<c:out value="${list.subAddress }"></c:out>
		  					</td>
		  					<td class="Phone1 align-middle white-space-nowrap ">
		  						<c:out value="${fn:replace(list.phone1,'-','')}"></c:out>
		  					</td>
		  					<td class="Phone2 align-middle white-space-nowrap ">
		  						<c:out value="${fn:replace(list.phone2,'-','')}"></c:out>
		  					</td>
		  					<td class="Fax align-middle white-space-nowrap ">
		  						<c:out value="${list.fax }"></c:out>
		  					</td>
		  					<td class="Email align-middle white-space-nowrap ">
		  						<c:out value="${list.email }"></c:out>
		  					</td>
		  					<td class="DamDangJa align-middle white-space-nowrap ">	
		  						<c:out value="${list.damDangJa }"></c:out>
		  					</td>
		  					<td class="DamDangJaPhone align-middle white-space-nowrap ">
		  						<c:out value="${list.damDangJaPhone }"></c:out>
		  					</td>
		  					<td class="Note align-middle white-space-nowrap ">
		  						<c:out value="${list.note }"></c:out>
		  					</td>
		  				</tr>
	  				</tbody>
		  		</table>
			</div> 
		</div>
	</div>
</div>


