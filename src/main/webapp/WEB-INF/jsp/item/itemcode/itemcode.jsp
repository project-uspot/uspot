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
            <h2 class="mb-0">강습코드관리</h2>
          </div>
      </div>
      <div class="mb-1">
         <div class="row g-6">
            <div class="col-sm-3 col-md-2 mb-2">
               <select class="form-select" id="item" name="item" aria-label="Default select example">
                  <option value="0" selected >종목</option>
                  <option value="1">강습반명</option>
                  <option value="2">단계</option>
               </select>
            </div>
            <div class="col-sm-6 col-md-3 mb-2">
               <div class="form-check" style="padding-top: 15px;">
                  <input class="form-check-input" id="isdeletecheck" type="checkbox" name="isdeletecheck"/>
                  <label class="form-check-label text-900 fs-0" for="fragileCheck">삭제데이터보기</label>
                  <input type="hidden" name="IsDelete" id="isdelete">
               </div>
            </div>
            <div class="col-auto" style="padding-top: 5px;">
               <button class="btn btn-primary" type="button" data-bs-toggle="modal" id="modal" data-bs-target="#insertModal" onclick="openModal()">등록</button>
               <!-- <button class="btn btn-success" type="button" data-bs-toggle="modal" id="modal" name="modify" data-bs-target="#updateModal" >수정</button> -->
            </div>
         </div>
      </div>
      
      <div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1" >
         <div class="table-responsive scrollbar-overlay mx-n1 px-1" style="overflow-x:scroll; ">
            <table class="table table-sm fs--1 mb-1 table-hover" id="itemTable">
               <%-- <colgroup>
                  <col style="width:95px">
                  <col style="width:2000px">
                  <col style="width:200px">
                  <col style="width:1600px">
                  <col style="width:2550px">
                  <col style="width:2550px">
                  <col style="width:2550px">
                  <col style="width:1600px">
                  <col style="width:260px">
                  <col style="width:260px">
                  <col style="width:260px">
                  <col style="width:260px">
                  <col style="width:260px">
                  <col style="width:1600px">
                  <col style="width:1600px">
                  <col style="width:1600px">
                  <col style="width:1600px">
               </colgroup> --%>
               <thead class="itemcodelist">
                  <tr>
                     <!-- <th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >선택</th> -->
                     <th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >강습종목</th>
                     <th rowspan="2" class="sort align-middle pe-1 text-center" scope="col">접수구분</th>
                     <th colspan="5" class="sort align-middle pe-1 text-center" scope="col">접수기간</th>
                     <th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >정렬순서</th>
                     <th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >재등록<br>제한개월</th>
                     <th rowspan="2" class="sort align-middle pe-1 text-center" scope="col">온라인<br>사용</th>
                     <th rowspan="2" class="sort align-middle pe-1 text-center" scope="col">등록제한<br>건수</th>
                     <th rowspan="2" class="sort align-middle pe-1 text-center" scope="col">다개월<br>불가</th>
                     <th colspan="4" class="sort align-middle pe-1 text-center" scope="col">추첨접수기간</th>
                  </tr>
                  <tr>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">기간</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">신규</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">재등록</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">강습기간</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">구민접수</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">접수기간</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">추첨일</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">결제기간</th>
                     <th class="sort board border-github align-middle pe-1 text-center" scope="col">선착순</th>
                  </tr>
               </thead>
               <tbody class="list" id="tbody">
                  <c:forEach items="${list}" var="list">
                     <tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" data-bs-toggle="modal"
                     data-bs-target="#updateModal" id="updateTR01" style="cursor:pointer;"  >
                         <%-- <td class="align-middle py-3 ">
                            <input type="checkbox" id="check" class="align-middle text-center" value="${list.groupID}">
                         </td> --%>
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
function openModal() {
    
   var item = $("#item").val();
   if(item === '0') {
      $('#modal-content').load("insertItem01.do");
   } else if (item === '1') {
      $('#modal-content').load("insertItem02.do");
   } else {
      $('#modal-content').load("insertItem03.do");
   }
}



function updateModal() {
   var item = $("#item").val();
   
   if(item === '0') {
      $('#modal-content').load("updateItem01.do");
   }  else if (item === '1') {
      $('#modal-content').load("updateItem02.do");
   } else {
      $('#modal-content').load("updateItem03.do");
   } 
} 


var checkbox = document.getElementById("isdeletecheck");
var hiddenInput = document.getElementById("isdelete");

if (checkbox.checked) {
    hiddenInput.value = "Y";
} else {
    hiddenInput.value = "N";
}



$("#item,#isdeletecheck").change(function() {
    var checkbox = document.getElementById("isdeletecheck");
    var hiddenInput = document.getElementById("isdelete");
    var item = $("#item").val();
    

    if (checkbox.checked) {
        hiddenInput.value = "Y";
    } else {
        hiddenInput.value = "N";
    }
    
    var thead =$(".itemcodelist");
    var tbody =$(".list");
    thead.empty();
    tbody.empty();
    
    $.ajax({
      type: "GET",
      url: "itemCodeList.do",
      dataType: 'json',
      data: {
         item:item,
         isDelete:hiddenInput.value
      },
      success: function(data) {
         if(item === '0') {
            var item01 = data.item01
            var head = '<tr>'
               /* head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >선택</th>'; */
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >강습종목</th>';
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col">접수구분</th>';
               head += '<th colspan="5" class="sort align-middle pe-1 text-center" scope="col">접수기간</th>';
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >정렬순서</th>';
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col" >재등록<br>제한개월</th>';
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col">온라인<br>사용</th>';
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col">등록제한<br>건수</th>';
               head += '<th rowspan="2" class="sort align-middle pe-1 text-center" scope="col">다개월<br>불가</th>';
               head += '<th colspan="4" class="sort align-middle pe-1 text-center" scope="col">추첨접수기간</th>';
               head += '</tr>';
               head += '<tr>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">기간</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">신규</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">재등록</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">강습기간</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">구민접수</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">접수기간</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">추첨일</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">결제기간</th>';
               head += '<th class="sort board border-github align-middle pe-1 text-center" scope="col">선착순</th>';
               head += '</tr>';
               thead.append(head);
            item01.forEach(function(list) {
               var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" ' + 
                   ' style="cursor:pointer;" data-bs-toggle="modal" data-bs-target="#updateModal" id="updateTR01" >';
               /* row += '<td class="groupName align-middle py-3 "><input type="checkbox"></td>'; */
               row += '<td class="groupName align-middle py-3 " id="GroupName" data-item-id=' + list.groupID + '>' + list.groupName + '</td>';
               var JSType = '';
               if(list.jsType == '0') {
                  JSType = '정시접수';
               } else if (list.jsType == '1') {
                  JSType = '수시접수';
               } else if (list.jsType == '2') {
                  JSType = '기간지정'
               }
               row += '<td class="JSType align-middle py-3 ">' + JSType + '</td>';
               var FromDate = list.fromDate
               var ToDate = list.toDate
               if(FromDate == null && ToDate == null) {
                  FromDate = '';
                  ToDate = '';
               }
               row += '<td class="inTime align-middle py-3 ">' + FromDate + ' ~ ' +  ToDate + '</td>';
               var JSi1 = list.jungSi1
               if(JSi1 === null) {
                  JSi1 = '';
               } else {
                  var js1FD = JSi1.substr(0,10)
                  var js1TD = JSi1.substr(11,21)
               }
               row += '<td class="inTime align-middle py-3 ">' + js1FD +' '+ list.jungSi1STime + ' ~ ' +  js1TD +' '+  list.jungSi1ETime+ '</td>';
               var JSi2 = list.jungSi2
               if (JSi2 === null  ) {
                  JSi2 = '';
               } else {
                  var js2FD = JSi2.substr(0,10)
                  var js2TD = JSi2.substr(11,21)
               }
               row += '<td class="inTime align-middle py-3 ">' + js2FD +' '+ list.jungSi2STime + ' ~ ' +  js2TD +' '+ list.jungSi2ETime+ '</td>';
               var JSi3 = list.jungSi3
               if(JSi3 === null) {
                  JSi3 = '';
               } else {
                  var js3FD = JSi3.substr(0,10)
                  var js3TD = JSi3.substr(11,21)
               }
               row += '<td class="inTime align-middle py-3 ">' + js3FD +' '+ list.jungSi2STime + ' ~ ' +  js3TD +' '+ list.jungSi2ETime+ '</td>';
               if(list.jungSi1Inlive === null) {
                  JungSi1Inlive = "";
               } else {
                  JungSi1Inlive = list.jungSi1Inlive;
               }
               row += '<td class="inTime align-middle py-3 ">' + JungSi1Inlive + '</td>';
               row += '<td class="inTime align-middle py-3 ">' + list.sortOrder + '</td>';
               row += '<td class="inTime align-middle py-3 ">' + list.againMonth + '</td>';
               if(list.webYN === null) {
                  WebYN = "";
               } else {
                  WebYN = list.webYN; 
               }
               row += '<td class="inTime align-middle py-3 ">' + WebYN + '</td>';
               if(list.itemRejectCnt === null) {
                  ItemRejectCnt = "";
               } else {
                  ItemRejectCnt = list.itemRejectCnt;
               }
               row += '<td class="inTime align-middle py-3 ">' + ItemRejectCnt + '</td>';
               if(list.monthSelNo === null) {
                  MonthSelNo = "";
               } else {
                  MonthSelNo = list.monthSelNo;
               }
               row += '<td class="inTime align-middle py-3 ">' + MonthSelNo + '</td>';
               var JungSiLotteryFromDate = list.jungSiLotteryFromDate;
               if(JungSiLotteryFromDate === null) {
                  JungSiLotteryFromDate = '';
               }
               var JungSiLotteryToDate = list.jungSiLotteryToDate;
               if(JungSiLotteryToDate == null) {
                  JungSiLotteryToDate = '';
               }
               var JungSiLotteryDate = list.jungSiLotteryDate;
               if(JungSiLotteryDate == null) {
                  JungSiLotteryDate = '';
               }
               var JungSiLotteryPayFromDate = list.jungSiLotteryPayFromDate;
               if(JungSiLotteryPayFromDate == null) {
                  JungSiLotteryPayFromDate = '';
               }
               var JungSiLotteryPayToDate = list.jungSiLotteryPayToDate;
               if(JungSiLotteryPayToDate == null ) {
                  JungSiLotteryPayToDate = '';
               }
               var JungSiLotteryAddFromDate = list.jungSiLotteryAddFromDate;
               if(JungSiLotteryAddFromDate == null) {
                  JungSiLotteryAddFromDate = '';
               }
               var JungSiLotteryAddToDate = list.jungSiLotteryAddToDate;
               if(JungSiLotteryAddToDate == null) {
                  JungSiLotteryAddToDate  = '';
               }
               
               row += '<td class="inTime align-middle py-3 ">' + JungSiLotteryFromDate + ' ~ ' + JungSiLotteryToDate + '</td>';
               row += '<td class="inTime align-middle py-3 ">' + JungSiLotteryDate + '</td>';
               row += '<td class="inTime align-middle py-3 ">' + JungSiLotteryPayFromDate + ' ~ ' + JungSiLotteryPayToDate + '</td>';
               row += '<td class="inTime align-middle py-3 ">' + JungSiLotteryAddFromDate + ' ~ ' + JungSiLotteryAddToDate + '</td>';
               row += '</tr>';
               tbody.append(row);
               
            }) 
         } else if(item === '1') {
            var item02= data.item02
            var head = '<tr>'
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >강습종목</th>';
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >강습반명</th>';
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >입장시간</th>';
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >입장종료시간</th>';
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >정렬순서</th>';
               head += '</tr>';
               thead.append(head);
               
            item02.forEach(function(list) {
               var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" data-bs-toggle="modal" '+
                  'data-bs-target="#updateModal"  style="cursor:pointer;" id="updateTR02">';
               row += '<td class="groupName align-middle py-3 ">' + list.groupName + '</td>';
               row += '<td class="subGroupName align-middle py-3 " id="SubGroupName" data-item-id=' + list.subGroupID + '>' + list.subGroupName + '</td>';
               row += '<td class="inTime align-middle py-3 ">' + list.inTime + '</td>';
               row += '<td class="inEndTime align-middle py-3 ">' + list.inEndTime + '</td>';
               row += '<td class="sortOrder align-middle py-3 ">' + list.sortOrder + '</td>';
               row += '</tr>';
               tbody.append(row);
            })
         } else if (item === '2') {
            var item03= data.item03
            var head = '<tr>'
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >코드</th>';
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >단계</th>';
               head += '<th class="sort align-middle pe-1 text-center" scope="col" >정렬순서</th>';
               head += '</tr>';
               thead.append(head);
            item03.forEach(function(list) {
               var row = '<tr class="hover-actions-trigger btn-reveal-trigger position-static text-center" ' + 
                   'style="cursor:pointer;" data-bs-toggle="modal" data-bs-target="#updateModal" id="updateTR03">';
               row += '<td class="groupName align-middle py-3 ">' + list.defCode + '</td>';
               row += '<td class="subGroupName align-middle py-3 " id="LevelName" data-item-id=' + list.LevelID + '>' + list.levelName + '</td>';
               row += '<td class="sortOrder align-middle py-3 ">' + list.sortOrder + '</td>';
               row += '</tr>';
               tbody.append(row);
            })
         }
      },
      error: function(xhr, status, error) {
         console.log("Status: " + status);
            console.log("Error: " + error);
      }
    });
    
});




$(document).ready(function(){
    // Add a click event listener to all rows with class 'hover-actions-trigger'
    $('.hover-actions-trigger').click(function(){
    	
		// Get the value of 'data-item-id' attribute from the clicked row
		var itemId = $(this).find('#GroupName').data('item-id');
        alert('Clicked row with data-item-id = GroupName: ' + itemId);
        
        $.ajax({
            type: 'POST',
            url: 'clickValue.do',  // Replace with the correct URL
            dataType : 'json',
            data: { itemId: itemId },
            success: function(data) {
            /* 강습종목 */                
            $('[id="GroupName"]').val(data.groupName);
            
            /* GroupID */                
            $('[id="GroupID"]').val(data.groupID);
            
            /* 접수유형 */
            if (data.jsType == '0') {
                $('[id="jsType0"]').prop('checked', true);
            } else if (data.jsType == '1') {
                $('[id="jsType1"]').prop('checked', true);
            } else if (data.jsType == '2') {
                $('[id="jsType2"]').prop('checked', true);
            }
            
            /* 기간지정 */
            $('[id="FromDate"]').val(data.fromDate);
            $('[id="ToDate"]').val(data.toDate);
            
            /* 정렬순서 */
               $('[id="SortOrder"]').val(data.sortOrder);
            /* 강좌등록 제한건수 */
            $('[id="ItemRejectCnt"] option').each(function () {
                if ($(this).val() == data.itemRejectCnt) {
                    $(this).prop('selected', true);
                } else {
                    $(this).prop('selected', false);
                }
            });
            /* 재등록 이용가능 개월 */
            $('[id="AgainMonth"] option').each(function () {
                if ($(this).val() == data.againMonth) {
                    $(this).prop('selected', true);
                } else {
                    $(this).prop('selected', false);
                }
            });
            /* 온라인 사용 */
            if(data.webYN == 'Y') {
               $('[id="WebYN"]').prop('checked', true);
            } else {
               $('[id="WebYN"]').prop('checked', false);
            }
            /* 다개월 선택 불가 */
            if(data.monthSelNo == 'Y') {
               $('[id="MonthSelNo"]').prop('checked', true);
            } else {
               $('[id="MonthSelNo"]').prop('checked', false);
            }
            
            /* 일일입장 미결제 삭제시간 */
            $('[id="PayDelayTime"]').val(data.payDelayTime);

            /* 신규접수 */
            var JungSi1 = data.jungSi1
            var JungSi1Date = JungSi1.split("~")
            $('[id="JungSi1Start"]').val(JungSi1Date[0] + " " + data.jungSi1STime);
            $('[id="JungSi1End"]').val(JungSi1Date[1] + " " + data.jungSi1ETime);
            
            /* 재등록 */
            var JungSi2 = data.jungSi2
            var JungSi2Date = JungSi2.split("~")
            $('[id="JungSi2Start"]').val(JungSi2Date[0] + " " + data.jungSi1STime);
            $('[id="JungSi2End"]').val(JungSi2Date[1] + " " + data.jungSi1ETime);
            
            /* 강습기간 */
            var JungSi3 = data.jungSi3
            var JungSi3Date = JungSi3.split("~")
            $('[id="JungSi3Start"]').val(JungSi3Date[0]);
            $('[id="JungSi3End"]').val(JungSi3Date[1]);
            
            /* 구민접수 */
            $('[id="JungSi1Inlive"]').val(data.jungSi1Inlive);
            
            /* 추첨접수 시작 */
            $('[id="JungSiLotteryFromDate"]').val(data.jungSiLotteryFromDate);
            
            /* 추첨접수 종료 */
            $('[id="JungSiLotteryToDate"]').val(data.jungSiLotteryToDate);
                
            /* 추첨일 */
            $('[id="JungSiLotteryDate"]').val(data.jungSiLotteryDate);
            
            /* 추첨결제 시작 */
            $('[id="JungSiLotteryPayFromDate"]').val(data.jungSiLotteryPayFromDate);
            
            /* 추첨결제 종료 */
            $('[id="JungSiLotteryPayToDate"]').val(data.jungSiLotteryPayToDate);
            
            /* 추첨 선착순 시작 */
            $('[id="JungSiLotteryAddFromDate"]').val(data.jungSiLotteryAddFromDate);
            
            /* 추첨 선착순 종료 */
            $('[id="JungSiLotteryAddToDate"]').val(data.jungSiLotteryAddToDate);
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });
        
        $('#item').change(function () {
        	var items = $("#item").val();
        	alert(items);
        	var itemId1 = $(this).find('#SubGroupName').data('item-id');
            alert('Clicked row with data-item-id = SubGroupName: ' + itemId1);
        	if(items === '1') {
	        	$.ajax({
	                type: 'POST',
	                url: 'clickValue01.do',  // Replace with the correct URL
	                dataType : 'json',
	                data: { itemId1: itemId1 },
	                success: function(data) {
	                	
	                },
	                error: function(error) {
	                    console.error('Error:', error);
	                }
	            });
        	}
    	});
    });
});


</script>




<div class="modal fade" id="insertModal" tabindex="-1"
   data-bs-backdrop="static" aria-labelledby="insertModalLabel"
   aria-hidden="true">
   <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content" id="01">
         <jsp:include page="item01insert.jsp" />
      </div>
      <div class="modal-content" style="display: none;" id="02">
         <jsp:include page="item02insert.jsp" />
      </div>
      <div class="modal-content" style="display: none;" id="03">
         <jsp:include page="item03insert.jsp" />
      </div>
   </div>
</div>

<div class="modal fade" id="updateModal" tabindex="-1"
   data-bs-backdrop="static" aria-labelledby="updateModalLabel"
   aria-hidden="true">
   <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content" id="up01">
         <jsp:include page="item01update.jsp" />
      </div>
      <div class="modal-content" style="display: none;" id="up02">
         <jsp:include page="item02update.jsp" />
      </div>
      <div class="modal-content" style="display: none;" id="up03">
         <jsp:include page="item03update.jsp" />
      </div>
   </div>
</div>

<script>

	/* 종목 반명 단계 등록 */
    // select 요소 가져오기
    var selectElement= 0;
    var selectedValue = 0;

    selectElement = document.getElementById("item");
    var div01 = document.getElementById("01");
    if (selectedValue === "0") {
         div01.style.display = "block";
     }
    var div02 = document.getElementById("02");
    var div03 = document.getElementById("03");


    // select 요소의 값이 변경될 때 실행할 함수 정의
    selectElement.addEventListener("change", function () {
        // 선택된 옵션의 값을 가져와서 alert 창에 표시
        selectedValue = selectElement.value;
        div01.style.display = "none";
        div02.style.display = "none";
        div03.style.display = "none";

        if (selectedValue === "0") {
            div01.style.display = "block";
        } else if (selectedValue === "1") {
            div02.style.display = "block";
        } else if (selectedValue === "2") {
            div03.style.display = "block";
        } 
    });
</script>



<script>

    // select 요소 가져오기
    var selectElementup= 0;
    var selectedValueup = 0;

    selectElementup = document.getElementById("item");
    var div01up = document.getElementById("up01");
    if (selectedValueup === "0") {
           div01up.style.display = "block";
       }
    var div02up = document.getElementById("up02");
    var div03up = document.getElementById("up03");
    

    // select 요소의 값이 변경될 때 실행할 함수 정의
    selectElementup.addEventListener("change", function () {
       
       
        // 선택된 옵션의 값을 가져와서 alert 창에 표시
        selectedValueup = selectElementup.value;
        div01up.style.display = "none";
        div02up.style.display = "none";
        div03up.style.display = "none";


        if (selectedValueup === "0") {
           
            div01up.style.display = "block";
        } else if (selectedValueup === "1") {
            div02up.style.display = "block";
        } else if (selectedValueup === "2") {
            div03up.style.display = "block";
        } 
    });
</script>