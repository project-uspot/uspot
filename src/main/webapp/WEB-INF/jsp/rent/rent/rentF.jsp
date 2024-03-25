<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/AdminTop.jsp" %>
<div class="col-auto mb-4">
 	<div class="justify-content-between row">
 		<div class="col-auto">
			<h2>대관관리</h2>
		</div>
     	<div class="col-auto">
     		<button class="btn btn-info" id="insertButton" type="button" onclick="create()">대관신청</button>
			<button class="btn btn-warning" id="updateButton" type="button" onclick="merge()">대관변경</button>
			<button class="btn btn-danger" id="removeButton" type="button" onclick="remove()">허가서미리보기</button>
   		</div>
	</div>
</div>
<script type="text/javascript">
if('${authyn.ins}' == 'N'){
	$('#insertButton').attr('disabled','disabled');
}
if('${authyn.upd}' == 'N'){
	$('#updateButton').attr('disabled','disabled');
}
</script>
<div class="card p-3">
    <div class="col-auto">
     	<div class="row">
         	<div class="col-auto">
				<div class="input-group">
					<span class="input-group-text">업장</span>	
	  				<select class="form-select" id="partCD" name="partCD" onchange="placeCDChange()">
						<c:forEach items="${partlist}" var="part">
							<option value="${part.partCD}">${part.partNM}</option>
						</c:forEach>
					</select>
				</div>
       		</div>
       		<div class="col-auto">
				<div class="input-group">
					<span class="input-group-text">장소</span>	
	  				<select class="form-select" id="placeCD" name="placeCD">
					</select>
				</div>
       		</div>
       		<div class="col-auto mx-n4">
				<div class="input-group">
	  				<select class="form-select">
						<option value="1">선택</option>
						<option value="2">사용기간</option>
						<option value="3">신청기간</option>
					</select>
				</div>
       		</div>
       		<div class="col-auto">
				<div class="input-group">
					<input class="form-control" type="date" id="fromdate" name="fromdate"/>
				</div>
       		</div>
       		<div class="col-auto mt-1 mx-n3">
				~
       		</div>
       		<div class="col-auto">
				<div class="input-group">
					<input class="form-control" type="date" id="todate" name="todate"/>
				</div>
       		</div>
       		<div class="col-auto mx-n3">
				<button class="btn btn-warning" type="button">조회</button>
				<button class="btn btn-danger" type="button">대관일정표</button>
       		</div>
   		</div>
   	</div>
</div>
<div class="bg-white border-top border-bottom w-75">
	<div id="listtable" data-list='{"valueNames":["PLockerGroupName","PLockerLocation","PLockerDeposite","PLockerPrice","PLockerMonth"
		,"jungsiNewDate","jungsiReDate","jungsiFromToDate","sortOrder","danCnt"]}'>
		<div class="table-responsive">
			<table class="table table-hover table-bordered fs--1 mb-0" id="myTable">
				<thead>
			        <tr>
						<th class="sort pe-1 white-space-nowrap align-middle text-center" scope="col" data-sort="PLockerGroupName" style="width:9%;">분류</th>
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
						<tr class="text-center hover-actions-trigger btn-reveal-trigger position-static" onclick="tbodyclick(this)" ondblclick="merge()" style="cursor:pointer;">
							<td class="PLockerGroupID white-space-nowrap" style="display: none;">${list.PLockerGroupID}</td>
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
	
	$('#fromdate,#todate').val(getCurrentDate());
	
	placeCDChange();
	function placeCDChange() {
		var partCD = $('#partCD').val();
		
		$.ajax({
	        type: "POST", 
	        url: "placeCDChange", 
	        dataType : 'json',
	        data: { 
	        	PartCD : partCD
	        },
	        success: function(data) {	
	        	if(data[0].isDelete == 'Y'){
	        		alert("세션이 만료되었습니다.다시 로그인해주세요.");
	        		window.location.reload();
	        	}else{
	        		$("#placeCD").empty();
	        		
		        	$.each(data, function(index, element) {
		        		
						var placeCD = element.placeCD;
		                var placeNM = element.placeNM;

		                var optionElement = $("<option>").val(placeCD).text(placeNM);

		                $("#placeCD").append(optionElement);
		            });
	        	}
	        },
	        error: function(xhr, status, error) {
	       	 console.log("Status: " + status);
	         console.log("Error: " + error);
	        }
		});
	}
</script>
<%@ include file="../../include/foot.jsp" %>