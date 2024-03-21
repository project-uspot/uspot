<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file ="../include/AdminTop.jsp"%>
<%@ include file ="../include/AdminLeft.jsp"%>


<div class="p-0 w-auto">
	<div class="mb-9">
		<div class="justify-content-between row">
			<div class="col-auto">
				<h2 class="mb-0">사업장 관리</h2>
            </div>
            <div class="col-auto">
            	<button class="btn btn-success" type="button" id="excelButton" onclick="fnExcelReport('myTable','사업장관리')"><span class="far fa-file-excel"></span>&emsp;엑셀로 저장</button>
            </div>
        </div>
        <script type="text/javascript">
        if('${authyn.excel}' == 'N'){
			$('#excelButton').attr('disabled','disabled');
		}
        </script>
        <div class="mb-4">
	          <div class="row g-3">
	            <div class="col-auto scrollbar overflow-hidden-y flex-grow-1">
	            </div>
	            <%-- <div class="col-auto">
	              <a class="btn btn-info px-5" href="${pageContext.request.contextPath}/insertSite.do" title="등록">등록</a>
	            </div> --%>
	          </div>
	        </div>
		<div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top  border-200 position-relative top-1">
			<div class="table-responsive scrollbar-overlay mx-n1 px-1">
	  			<table class="table table-sm table-hover fs--1 mb-1" id="myTable">
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
	  					<c:forEach items="${siteList}" var="site">
			  				<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" ondblclick="location.href='siteDetail.do?SiteCode=${site.siteCode}'">
			  					<td class="SiteID align-middle white-space-nowrap">
			  						<c:out value="${site.siteID}"></c:out>
			  					</td>
			  					<td class="SiteName align-middle white-space-nowrap ">
									<c:out value="${site.siteName }"/> 
			  					</td>
			  					<td style="display: none;">
			  						<input type="hidden" name=SiteID value="${site.siteID }">
			  					</td>
			  					<td class="SiteBNo align-middle white-space-nowrap ">
			  						<c:out value="${site.siteBNo }"></c:out>
			  					</td>
			  					<td class="Pname align-middle white-space-nowrap ">
			  						<c:out value="${site.pname }"></c:out>
			  					</td>
			  					<td class="UpTae align-middle white-space-nowrap ">
			  						<c:out value="${site.upTae }"></c:out>
			  					</td>
			  					<td class="JongMok align-middle white-space-nowrap ">
			  						<c:out value="${site.jongMok }"></c:out>
			  					</td>
			  					<td class="ZipCode align-middle white-space-nowrap ">
			  						<c:out value="${site.zipCode }"></c:out>
			  					</td>
			  					<td class="Address align-middle white-space-nowrap ">
			  						<c:out value="${site.address }"></c:out>
			  					</td>
			  					<td class="SubAddress align-middle white-space-nowrap ">
			  						<c:out value="${site.subAddress }"></c:out>
			  					</td>
			  					<td class="Phone1 align-middle white-space-nowrap ">
			  						<c:out value="${fn:replace(site.phone1,'-','')}"></c:out>
			  					</td>
			  					<td class="Phone2 align-middle white-space-nowrap ">
			  						<c:out value="${fn:replace(site.phone2,'-','')}"></c:out>
			  					</td>
			  					<td class="Fax align-middle white-space-nowrap ">
			  						<c:out value="${site.fax }"></c:out>
			  					</td>
			  					<td class="Email align-middle white-space-nowrap ">
			  						<c:out value="${site.email }"></c:out>
			  					</td>
			  					<td class="DamDangJa align-middle white-space-nowrap ">	
			  						<c:out value="${site.damDangJa }"></c:out>
			  					</td>
			  					<td class="DamDangJaPhone align-middle white-space-nowrap ">
			  						<c:out value="${site.damDangJaPhone }"></c:out>
			  					</td>
			  					<td class="Note align-middle white-space-nowrap ">
			  						<c:out value="${site.note }"></c:out>
			  					</td>
			  				</tr>
		  				</c:forEach>
	  				</tbody>
		  		</table>
			</div> 
		</div>
	</div>
</div>


