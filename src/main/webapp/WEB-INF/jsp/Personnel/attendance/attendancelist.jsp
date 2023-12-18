<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<div class="p-0">
   <div class="mb-9 col-lg-14">
      <div class="row g-2 mb-4">
          <div class="col-auto">
            <h2 class="mb-0">출석부 관리</h2>
          </div>
      </div>
      <div class="mb-1">
      	<div class="row g-2">
	      	<div class="card h-75 col-md-2">
               <div class="card-body h-100">
				<div class="d-grid gap-2 mb-8">
				<h6 class="text-700 h-50">조회일자</h6>
					<div class="p-2">
						<input class="form-control" id="startday" type="date" name="startday"/>
					</div>
				</div>
               </div>
             </div>
             <div class="card h-100 col-md-7">
               <div class="card-body">
               		<div class="row g-3">
               		<h6 class="text-700 h-25">강좌</h6>
						<div class="d-grid gap-2 col-md-4">
							<div class="input-group input-group mb-4">
								<h6 class="col-md-3 pt-3">사업장:</h6>
								<input class="form-control col-md-1" id="sitename" type="text" name="sitename" readonly="readonly" maxlength="8" aria-describedby="SiteCodespan" value="${sitename}"/>
								<span class="input-group-text" id="SiteCodespan" style="cursor: pointer;" onclick="execDaumPostcode()"><span data-feather="search"></span></span> 
							</div> 
							<div class="input-group input-group">
								<h6 class="col-md-3 pt-3">요일:</h6>
								<input class="form-control col-md-1" id="sitename" type="text" name="sitename" readonly="readonly" maxlength="8" aria-describedby="SiteCodespan" value="${sitename}"/>
								<span class="input-group-text" id="SiteCodespan" style="cursor: pointer;" onclick="execDaumPostcode()"><span data-feather="search"></span></span> 
							</div> 
						</div>
						<div class="d-grid gap-2 col-md-4">
							<div class="input-group input-group mb-4">
								<h6 class="col-md-3 pt-3">종목:</h6>
								<input class="form-control" id="ZipCode" type="text" name="ZipCode" readonly="readonly" maxlength="8" aria-describedby="ZipCodespan"/>
								<span class="input-group-text" id="ZipCodespan" style="cursor: pointer;" onclick="item01list()"><span data-feather="search"></span></span> 
							</div> 
							<div class="input-group input-group">
								<h6 class="col-md-3 pt-3">시간:</h6>
								<input class="form-control col-md-1" id="sitename" type="text" name="sitename" readonly="readonly" maxlength="8" aria-describedby="SiteCodespan" value="${sitename}"/>
								<span class="input-group-text" id="SiteCodespan" style="cursor: pointer;" onclick="execDaumPostcode()"><span data-feather="search"></span></span> 
							</div> 
						</div>
						<div class="d-grid gap-2 col-md-4">
							<div class="input-group input-group mb-4">
								<h6 class="col-md-3 pt-3">반명:</h6>
								<input class="form-control col-md-1" id="sitename" type="text" name="sitename" readonly="readonly" maxlength="8" aria-describedby="SiteCodespan" value="${sitename}"/>
								<span class="input-group-text" id="SiteCodespan" style="cursor: pointer;" onclick="execDaumPostcode()"><span data-feather="search"></span></span> 
							</div> 
							<div class="input-group input-group">
								<h6 class="col-md-3 pt-3">단계:</h6>
								<input class="form-control col-md-1" id="sitename" type="text" name="sitename" readonly="readonly" maxlength="8" aria-describedby="SiteCodespan" value="${sitename}"/>
								<span class="input-group-text" id="SiteCodespan" style="cursor: pointer;" onclick="execDaumPostcode()"><span data-feather="search"></span></span> 
							</div> 
						</div>
					</div>
               </div>
             </div>
	  	  </div>
      </div>  
      <div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1" >
         <div class="table-responsive scrollbar-overlay mx-n1 px-1">
            <table class="table table-sm fs--1 mb-1 table-hover table-bordered" id="itemTable">
               <thead class="itemcodelist">
                  <tr>
                     <th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >사업장명</th>
                     <th colspan="5" class="sort align-middle pe-1 text-center" scope="col">강좌정보</th>
                     <th colspan="6" class="sort align-middle pe-1 text-center" scope="col">수강정보</th>
                     <th colspan="9" class="sort align-middle pe-1 text-center" scope="col">회원정보</th>
                  </tr>
                  <tr>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">분류</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">강좌명</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">요일</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">시간</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">단계</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">등록일</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">상태</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">등록구분</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">등록개월</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">시작일</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">종료일</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">회원번호</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">회원성명</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">성별</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">구분</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">일반전화</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">휴대폰</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">나이</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">생년</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">차량번호</th>
                  </tr>                  
               </thead>
               <tbody class="list" id="tbody">
                  <c:forEach items="${list}" var="list">
                     <tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" data-bs-toggle="modal"
                     data-bs-target="#updateModal" id="updateTR01" style="cursor:pointer;"  >
                        <td class="groupName align-middle py-3 " id="GroupName" data-item-id=${list.groupID } >
                           <c:out value="${list.groupName} "/>
                        </td>
                        <td class="jsType align-middle white-space-nowrap ">
                           <c:choose>
                              <c:when test="${list.jsType == '0'}">정시접수</c:when>
                              <c:when test="${list.jsType == '1'}">수시접수</c:when>
                              <c:when test="${list.jsType == '2'}">기간지정</c:when>
                           </c:choose>
                        </td> 
                        <td class="pkid align-middle py-3 ">
                           <c:out value="${list.fromDate }"/> ~ <c:out value="${list.toDate }"/>
                            
                        </td>
                        <td class="pkid align-middle py-3 ">
                           <c:out value="${fn:substring(list.jungSi1,0,10)}"/> <c:out value="${list.jungSi1STime }"/>
                            ~ <c:out value="${fn:substring(list.jungSi1,11,21)}"/> <c:out value="${list.jungSi1ETime }"/> 
                        </td>
                        <td class="pkid align-middle py-3 ">
                           <c:out value="${fn:substring(list.jungSi2,0,10)}"/> <c:out value="${list.jungSi2STime }"/>
                            ~ <c:out value="${fn:substring(list.jungSi2,11,21)}"/> <c:out value="${list.jungSi2ETime }"/> 
                        </td>
                        <td class="pkid align-middle py-3 ">
                           <c:out value="${fn:substring(list.jungSi3,0,10)}"/> ~ <c:out value="${fn:substring(list.jungSi3,11,21)}"/> 
                        </td>
                        <td class="jungSi1Inlive align-middle py-3 ">
                           <c:out value="${list.jungSi1Inlive}"/> 
                        </td>
                        <td class="sortOrder align-middle py-3 ">
                           <c:out value="${list.sortOrder}"/> 
                        </td>
                        <td class="pkid align-middle py-3 ">
                           <c:out value="${list.againMonth}"/> 
                        </td>
                        <td class="pkid align-middle py-3 ">
                           <c:out value="${list.webYN}"/> 
                        </td>
                        <td class="pkid align-middle py-3 ">
                           <c:out value="${list.itemRejectCnt}"/> 
                        </td>
                        <td class="pkid align-middle py-3 ">
                           <c:out value="${list.monthSelNo}"/> 
                        </td>
                        <td class="pkid align-middle py-3 ">
                           <c:out value="${list.jungSiLotteryFromDate}"/> ~ <c:out value="${list.jungSiLotteryToDate}"/> 
                        </td>
                        <td class="pkid align-middle py-3 ">
                           <c:out value="${list.jungSiLotteryDate}"/> 
                        </td>
                        <td class="pkid align-middle py-3 ">
                           <c:out value="${list.jungSiLotteryPayFromDate}"/> ~ <c:out value="${list.jungSiLotteryPayToDate}"/> 
                        </td>
                        <td class="pkid align-middle py-3 ">
                           <c:out value="${list.jungSiLotteryAddFromDate}"/> ~ <c:out value="${list.jungSiLotteryAddToDate}"/> 
                        </td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
      </div> 
   </div>
</div>
<script type="text/javascript">
function item01list() {
	var url = "item01list.do";
	var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=400,height=700";
    window.open(url, "_blank", windowFeatures);
}
</script>