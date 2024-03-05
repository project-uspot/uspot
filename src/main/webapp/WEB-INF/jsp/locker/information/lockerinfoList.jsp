<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/AdminTop.jsp" %>
<div class="row g-2 mb-4">
    <div class="col-9">
     	<div class="justify-content-between row">
     		<div class="col-auto">
				<h2>사물함 분류정보 관리</h2>
         	</div>
         	<div class="col-auto">
         		<button class="btn btn-info" type="button" onclick="save()">신규</button>
				<button class="btn btn-warning" type="button" onclick="merge()">수정</button>
				<button class="btn btn-danger" type="button" onclick="save()">삭제</button>
				<button class="btn btn-success" type="button" onclick="save()">엑셀로 저장</button>
				<button class="btn btn-secondary" type="button" onclick="save()">삭제데이터 보기</button>
       		</div>
   		</div>
   	</div>
</div>
<div class="bg-white border-top border-bottom w-75">
	<div id="listtable" data-list='{"valueNames":["PLockerGroupName","PLockerLocation","PLockerDeposite","PLockerPrice","PLockerMonth"
		,"jungsiNewDate","jungsiReDate","jungsiFromToDate","sortOrder","danCnt"]}'>
		<div class="table-responsive">
			<table class="table table-hover table-bordered fs--1 mb-0">
				<thead>
			        <tr>
						<th class="sort pe-1 text-center"  data-sort="PLockerGroupName" style="width:9%;">분류</th>
						<th class="sort pe-1 text-center"  data-sort="PLockerLocation">위 치</th>
						<th class="sort pe-1 text-center"  data-sort="PLockerDeposite">보증금</th>
						<th class="sort pe-1 text-center"  data-sort="PLockerPrice">사용료</th>
						<th class="sort pe-1 text-center"  data-sort="PLockerMonth">기준개월</th>
						<th class="sort pe-1 text-center"  data-sort="jungsiNewDate">신규접수일</th>
						<th class="sort pe-1 text-center"  data-sort="jungsiReDate">재접수일</th>
						<th class="sort pe-1 text-center"  data-sort="jungsiFromToDate">사용기간</th>
						<th class="sort pe-1 text-center"  data-sort="sortOrder">정렬순서</th>
						<th class="sort pe-1 text-center"  data-sort="danCnt">단수</th>
					</tr>
      			</thead>
		        <tbody class="list">
					<c:forEach items="${list}" var="list">
						<tr class="text-center" onclick="tbodyclick(this)" ondblclick="merge()" style="cursor:pointer;">
							<td class="PLockerGroupID" style="display: none;">${list.PLockerGroupID}</td>
							<td class="PLockerGroupName">${list.PLockerGroupName}</td>
							<td class="PLockerLocation">${list.PLockerLocation}</td>
							<fmt:parseNumber var="PLockerDeposite" integerOnly="true" value="${list.PLockerDeposite}"/>
							<td class="PLockerDeposite text-end"><fmt:formatNumber value="${PLockerDeposite}" pattern="#,###"/></td>
							<fmt:parseNumber var="PLockerPrice" integerOnly="true" value="${list.PLockerPrice}"/>
							<td class="PLockerPrice text-end"><fmt:formatNumber value="${PLockerPrice}" pattern="#,###"/></td>
							<td class="PLockerMonth">${list.PLockerMonth}</td>
							<td class="jungsiNewDate">${list.jungsiNewDate}</td>
							<td class="jungsiReDate">${list.jungsiReDate}</td>
							<td class="jungsiFromToDate">${list.jungsiFromToDate}</td>
							<td class="sortOrder">${list.sortOrder}</td>
							<td class="danCnt">${list.danCnt}</td>
						</tr>
					</c:forEach>
				</tbody>
    		</table>
		</div>
	</div>
</div>
<script type="text/javascript">
	var myPopup;
	function merge(){
		var groupid = $(previousRow).find('.PLockerGroupID').text();
		var url = "lockerdetail.do?lockergroupid="+groupid;
		var windowFeatures = "status=no,location=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=700";
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
	
	//테이블 클릭하면 행 바뀌는 로직
	var previousRow = null;
	function tbodyclick(clickedRow){
		if (previousRow !== null) {
	    	$(previousRow).css('background-color', '');
	    }
		$(clickedRow).css('background-color', 'lightblue');
	    previousRow = clickedRow;
	}
</script>