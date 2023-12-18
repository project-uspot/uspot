<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_idx" value="10"></c:set>
<%@ include file="../../include/AdminTop.jsp" %>
<%@ include file ="../../include/AdminLeft.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div class="mb-9">
	<div class="row g-2 mb-4">
		<div class="col-auto">
			<h2 class="mb-0">사용자그룹별 권한관리</h2>
		</div>
	</div>
	<div class="row g-7 gy-7">
		<div class="col-12 col-xl-4 col-xxl-3">
			<div class="row">
				<div class="col-12">
					<div class="card mb-3">
						<div class="card-body">
							<h3 class="card-title mb-4"><span class="far fa-caret-square-down fs-2 mx-2"></span>사용자그룹</h3>
							<div>
								<table class="table table-sm fs--1 mb-1 table-hover">
									<thead>
										<tr>
											<th rowspan="2" class="sort board border-github align-middle pe-1" scope="col">사용자그룹</th>
										</tr>
									</thead>
									<tbody class="usergrouplist">
									<c:forEach items="${arr_item1}" var="mItem1">
										<tr>
											<td id="UserGroupName" style="cursor: pointer;">
												<c:out value="${mItem1.userGroupName}"></c:out>
												<input type="hidden" value="${mItem1.userGroupID}" class="userGroupID">
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h3 class="card-title mb-4"><span class="far fa-caret-square-down fs-2 mx-2"></span>프로그램 그룹</h3>
							<table class="table table-sm fs--1 mb-1 table-hover">
								<thead>
									<tr>
										<th rowspan="2" class="sort board border-github align-middle pe-1" scope="col">프로그램 그룹</th>
									</tr>
								</thead>
								<tbody class="pgmgrouplist">
								<c:forEach items="${arr_item2}" var="mItem2">
									<tr>
										<td id="pgmGroupName" style="cursor: pointer;">
											${mItem2.pgmGroupName}
											<input type="hidden" value="${mItem2.pgmGroupID}" class="pgmgroupid">
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-12 col-xl-8 col-xxl-9">
			<div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1 mb-3">
				<div class="table-responsive scrollbar-overlay mx-n1 px-1  ">
					<h3 class="card-title mt-3 mb-2"><span class="far fa-caret-square-down fs-2 mx-2"></span>권한 설정된 프로그램</h3>
					<a class="btn btn-info px-5" href="javascript:Yselectall()" style="position: absolute; margin-top: -41px;margin-left: 350px;">전체선택</a>
					<a class="btn btn-info px-5" href="javascript:Yremoveall()" style="position: absolute; margin-top: -41px;margin-left: 500px;">선택해제</a>
					<a class="btn btn-info px-5" href="javascript:authYselectall()" style="position: absolute; margin-top: -41px;margin-left: 650px;">권한전체선택</a>
					<a class="btn btn-info px-5" href="javascript:authYremoveall()" style="position: absolute; margin-top: -41px;margin-left: 830px;">권한선택해제</a>
					<table class="table table-sm fs--1 mb-1">
						<thead>
							<tr>
								<th rowspan="2" class="sort board border-github align-middle pe-1" scope="col">선택</th>
								<th rowspan="2" class="sort board border-github align-middle pe-1" scope="col">프로그램ID</th>
								<th rowspan="2" class="sort board border-github align-middle pe-1" scope="col">프로그램명</th>
								<th colspan="6" class="sort board border-github border-bottom align-middle pe-1 " scope="col" style="text-align: center;">권한</th>
							</tr>
							<tr>
								<th class="sort board border-github align-middle pe-1" scope="col">조회</th>
								<th class="sort board border-github align-middle pe-1" scope="col">입력</th>
								<th class="sort board border-github align-middle pe-1" scope="col">수정</th>
								<th class="sort board border-github align-middle pe-1" scope="col">삭제</th>
								<th class="sort board border-github align-middle pe-1" scope="col">엑셀</th>
								<th class="sort board border-github align-middle pe-1" scope="col">인쇄</th>
							</tr>
						</thead>					
						<tbody class="authylist">
						<c:forEach items="${arr_item4}" var="mItem4">
							<tr>
								<td >
									<input type="checkbox" class="form-check-input" id="Yauth" name="Yauth">
									<input type="hidden" value="${mItem4.pkid}" class="pkid">
								</td>
								<td>
									<c:out value="${mItem4.pgmID}"/>
								</td>
								<td>
									<c:out value="${mItem4.pgmName}"/>
								</td>
								<td>
									<input type="checkbox" class="form-check-input" name="Sel" id="authY" <c:if test="${mItem4.sel eq 'Y'}">checked</c:if>>
								</td>
								<td>
									<input type="checkbox" class="form-check-input" name="Ins" id="authY" <c:if test="${mItem4.ins eq 'Y'}">checked</c:if>>
								</td>
								<td>
									<input type="checkbox" class="form-check-input" name="Upd" id="authY" <c:if test="${mItem4.upd eq 'Y'}">checked</c:if>>
								</td>
								<td>
									<input type="checkbox" class="form-check-input" name="Del" id="authY" <c:if test="${mItem4.del eq 'Y'}">checked</c:if>>
								</td>
								<td>
									<input type="checkbox" class="form-check-input" name="Excel" id="authY" <c:if test="${mItem4.excel eq 'Y'}">checked</c:if>>
								</td>
								<td>
									<input type="checkbox" class="form-check-input" name="Prt" id="authY" <c:if test="${mItem4.prt eq 'Y'}">checked</c:if>>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1">
				<div class="table-responsive scrollbar-overlay mx-n1 px-1  ">
					<h3 class="card-title mt-3 mb-2"><span class="far fa-caret-square-down fs-2 mx-2"></span>권한 설정 가능한 프로그램 </h3>
					<a class="btn btn-info px-5" href="javascript:Authorization()" style="position: absolute; margin-top: -41px;margin-left: 350px;">권한부여</a>
					<a class="btn btn-info px-5" href="javascript:revauthority()" style="position: absolute; margin-top: -41px;margin-left: 500px;">권한회수</a>
					<a class="btn btn-info px-5" href="javascript:Nselectall()" style="position: absolute; margin-top: -41px;margin-left: 650px;">전체선택</a>
					<a class="btn btn-info px-5" href="javascript:Nremoveall()" style="position: absolute; margin-top: -41px;margin-left: 800px;">선택해제</a>
					<table class="table table-sm fs--1 mb-1">
						<thead>
							<tr>
								<th rowspan="2" class="sort board border-github align-middle pe-1" scope="col">선택</th>
								<th rowspan="2" class="sort board border-github align-middle pe-1" scope="col">프로그램ID</th>
								<th rowspan="2" class="sort board border-github align-middle pe-1" scope="col">프로그램명</th>
							</tr>
						</thead>
						<tbody class="authnlist">
						<c:forEach items="${arr_item3}" var="Item3">
							<tr>
								<td >
									<input type="checkbox" class="form-check-input" id="authN">
								</td>
								<td>
									<c:out value="${Item3.pgmID}"/>
								</td>
								<td>
									<c:out value="${Item3.pgmName}"/>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var checkedValues = [];
var checkedYValues = [];
var remembepgmGroupID = '';
var rememberuserGroupID = '';


//페이지 처음 들어갈때 첫번째 요소들을 선택해주는 기능
document.addEventListener("DOMContentLoaded", function() {
    // 페이지가 로드될 때, 첫 번째 tbody의 첫 번째 tr 요소를 클릭 상태로 만듭니다.
	var firstTd = document.querySelector('.usergrouplist tr:first-child td');
    // 첫 번째 td를 클릭된 상태로 만듭니다.
    firstTd.click();
    
    var firstpgmTd = document.querySelector('.pgmgrouplist tr:first-child td');
    // 첫 번째 td를 클릭된 상태로 만듭니다.
    
    firstpgmTd.click();
    
});

// <td> 요소를 선택합니다.
var tdElements = document.querySelectorAll(".usergrouplist #UserGroupName");
var usergrouplistClickedTd = null;
// 각 <td> 요소에 클릭 이벤트 리스너를 추가합니다.
// 기본 페이지를 띄울때 쓰는 기능
tdElements.forEach(function(td) {
    td.addEventListener("click", function() {
    	
        if (usergrouplistClickedTd) {
        	usergrouplistClickedTd.style.backgroundColor = ""; // Restore the original background color
        }
        
        td.style.backgroundColor = "lightblue";
    	
    	checkedYValues = []; 
    	checkedValues = [];
        var userGroupID = td.querySelector(".userGroupID").value;
        rememberuserGroupID = userGroupID;
        var tableBody = $(".authylist");
        tableBody.empty(); // 기존 내용을 지웁니다
        
        usergrouplistClickedTd = td;
        
        $.ajax({
            type: "POST", // 또는 "POST", 서버 설정에 따라 다름
            url: "authusergrouplistY.do", // 실제 엔드포인트로 교체해야 합니다
            dataType : 'json',
            data: { 
            	UserGroupID: userGroupID
            },
            success: function(data) {	
           	 var commentList = data.commentList;
           	 commentList.forEach(function(list) {
                    // 데이터를 기반으로 HTML 로우를 만듭니다.
                    var row = '<tr>';   
                    row += '<td><input type="checkbox" class="form-check-input" id="Yauth" name="Yauth">';
                    row += '<input type="hidden" value="'+list.pkid+'" class="pkid"></td>';
                    row += '<td>' + list.pgmID +'</td>';
                    row += '<td>' + list.pgmName + '</td>';
                    if(list.sel == 'Y'){
                    	row +='<td><input type="checkbox" class="form-check-input" name="Sel" id="authY" checked></td>';
                    } else{
                    	row +='<td><input type="checkbox" class="form-check-input" name="Sel" id="authY"></td>';
                    }
                    if(list.ins == 'Y'){
                    	row +='<td><input type="checkbox" class="form-check-input" name="Ins" id="authY" checked></td>';
                    } else{
                    	row +='<td><input type="checkbox" class="form-check-input" name="Ins" id="authY"></td>';
                    }
                    if(list.upd == 'Y'){
                    	row +='<td><input type="checkbox" class="form-check-input" name="Upd" id="authY" checked></td>';
                    } else{
                    	row +='<td><input type="checkbox" class="form-check-input" name="Upd" id="authY"></td>';
                    }
                    if(list.del == 'Y'){
                    	row +='<td><input type="checkbox" class="form-check-input" name="Del" id="authY" checked></td>';
                    } else{
                    	row +='<td><input type="checkbox" class="form-check-input" name="Del" id="authY"></td>';
                    }
                    if(list.excel == 'Y'){
                    	row +='<td><input type="checkbox" class="form-check-input" name="Excel" id="authY" checked></td>';
                    } else{
                    	row +='<td><input type="checkbox" class="form-check-input" name="Excel" id="authY"></td>';
                    }
                    if(list.prt == 'Y'){
                    	row +='<td><input type="checkbox" class="form-check-input" name="Prt" id="authY" checked></td>';
                    } else{
                    	row +='<td><input type="checkbox" class="form-check-input" name="Prt" id="authY"></td>';
                    }
                    row += '</tr>';
                    tableBody.append(row);         
                });
            },
            error: function(xhr, status, error) {
                console.log("Status: " + status);
                console.log("Error: " + error);
            }
        });
        
        var NtableBody = $(".authnlist");
        NtableBody.empty(); // 기존 내용을 지웁니다
        
        $.ajax({
            type: "POST", // 또는 "POST", 서버 설정에 따라 다름
            url: "authusergrouplistN.do", // 실제 엔드포인트로 교체해야 합니다
            dataType : 'json',
            data: { 
            	UserGroupID : rememberuserGroupID,
            	PGMGroupID: remembepgmGroupID
            },
            success: function(data) {	
           	 var commentList = data.commentList;
           	 commentList.forEach(function(list) {
                    // 데이터를 기반으로 HTML 로우를 만듭니다.
                    var row = '<tr>';   
                    row += '<td><input type="checkbox" class="form-check-input" id="authN">';
                    row += '<input type="hidden" value="'+list.pkid+'" class="pkid"></td>';
                    row += '<td>' + list.pgmID +'</td>';
                    row += '<td>' + list.pgmName + '</td>';
                    row += '</tr>';
                    NtableBody.append(row);
                });
            },
            error: function(xhr, status, error) {
                console.log("Status: " + status);
                console.log("Error: " + error);
            }
        });
    });
});

//권한 체크박스 체크하면 반영해주는 기능
$(document).on('change', '#authY', function() {
	checkedValues = [];
    var isChecked = $(this).prop('checked'); // 체크박스가 체크되었는지 확인
    var id = $(this).attr('name'); // 체크박스의 ID 가져오기
    var pkid = $(this).closest('tr').find('.pkid').val();
	var value = '';
	var data = {};
    // 경고 메시지를 준비합니다.
    if (isChecked) {
        value="Y";
    } else {
        value="N";
    }

	
    // 경고 창을 표시합니다.
    data[id] = value;
    data['pkid'] = pkid;
    $.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "changeYN.do", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'json',
        data: data,
        success: function() {	
			
        },
        error: function(xhr, status, error) {
            console.log("Status: " + status);
            console.log("Error: " + error);
        }
    });
});

//<td> 요소를 선택합니다.
var pgmtdElements = document.querySelectorAll(".pgmgrouplist #pgmGroupName");
var pgmgrouplistClickedTd = null;
// 각 <td> 요소에 클릭 이벤트 리스너를 추가합니다.
pgmtdElements.forEach(function(td) {
    td.addEventListener("click", function() {
    	
    	if (pgmgrouplistClickedTd) {
    		pgmgrouplistClickedTd.style.backgroundColor = ""; // Restore the original background color
        }
    	
    	td.style.backgroundColor = "lightblue";
    	
    	checkedValues = [];
    	var pgmGroupID = td.querySelector(".pgmgroupid").value;
    	remembepgmGroupID = pgmGroupID;
    	
        var tableBody = $(".authnlist");
        tableBody.empty(); // 기존 내용을 지웁니다
    	
        pgmgrouplistClickedTd = td;
        
        $.ajax({
            type: "POST", // 또는 "POST", 서버 설정에 따라 다름
            url: "authusergrouplistN.do", // 실제 엔드포인트로 교체해야 합니다
            dataType : 'json',
            data: { 
            	UserGroupID : rememberuserGroupID,
            	PGMGroupID: pgmGroupID
            },
            success: function(data) {	
           	 var commentList = data.commentList;
           	 commentList.forEach(function(list) {
                    // 데이터를 기반으로 HTML 로우를 만듭니다.
                    var row = '<tr>';   
                    row += '<td><input type="checkbox" class="form-check-input" id="authN">';
                    row += '<input type="hidden" value="'+list.pkid+'" class="pkid"></td>';
                    row += '<td>' + list.pgmID +'</td>';
                    row += '<td>' + list.pgmName + '</td>';
                    row += '</tr>';
                    tableBody.append(row);
                });
            },
            error: function(xhr, status, error) {
                console.log("Status: " + status);
                console.log("Error: " + error);
            }
        });
    });
});
//delete 된걸 체크하면 배열에 넣는 함수
$(document).on('change', '#authN', function() {
    var isChecked = $(this).prop('checked'); // 체크박스가 선택되었는지 확인
    var hiddenInputValue = $(this).closest('tr').find('.pkid').val();

    if (isChecked) {
        // 체크박스가 선택되었을 때, 연결된 숨겨진 입력 값을 배열에 추가합니다
        checkedValues.push(hiddenInputValue);
    } else {
        // 체크박스가 선택 해제되었을 때, 배열에서 연결된 값을 제거합니다
        var index = checkedValues.indexOf(hiddenInputValue);
        if (index !== -1) {
            checkedValues.splice(index, 1);
        }
    }
});

//delete 안된걸 체크하면 배열에 넣는 함수
$(document).on('change', '#Yauth', function() {
    var isChecked = $(this).prop('checked'); // 체크박스가 선택되었는지 확인
    var hiddenInputValue = $(this).closest('tr').find('.pkid').val();

    if (isChecked) {
        // 체크박스가 선택되었을 때, 연결된 숨겨진 입력 값을 배열에 추가합니다
        checkedYValues.push(hiddenInputValue);
    } else {
        // 체크박스가 선택 해제되었을 때, 배열에서 연결된 값을 제거합니다
        var index = checkedYValues.indexOf(hiddenInputValue);
        if (index !== -1) {
        	checkedYValues.splice(index, 1);
        }
    }
});
//권한부여 기능
function Authorization() {
	
	if(checkedValues.length === 0){
		return false;
	}
	
    var tableBody = $(".authnlist");
    tableBody.empty(); // 기존 내용을 지웁니다
	
    $.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "authorization.do", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'json',
        data: { 
        	pkidlist : checkedValues,
        	UserGroupID : rememberuserGroupID,
        	PGMGroupID : remembepgmGroupID
        },
        success: function(data) {	
       	 var commentList = data.commentList;
       	 commentList.forEach(function(list) {
                // 데이터를 기반으로 HTML 로우를 만듭니다.
                var row = '<tr>';   
                row += '<td><input type="checkbox" class="form-check-input" id="authN">';
                row += '<input type="hidden" value="'+list.pkid+'" class="pkid"></td>';
                row += '<td>' + list.pgmID +'</td>';
                row += '<td>' + list.pgmName + '</td>';
                row += '</tr>';
                tableBody.append(row);
                checkedValues = []; 
                checkedYValues = [];    
            });
        },
        error: function(xhr, status, error) {
            console.log("Status: " + status);
            console.log("Error: " + error);
        }
    });
    
    var tableBody1 = $(".authylist");
    tableBody1.empty(); // 기존 내용을 지웁니다
    
    $.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "authusergrouplistY.do", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'json',
        data: { 
        	UserGroupID: rememberuserGroupID
        },
        success: function(data) {	
       	 var commentList = data.commentList;
       	 commentList.forEach(function(list) {
                // 데이터를 기반으로 HTML 로우를 만듭니다.
                var row = '<tr>';   
                row += '<td><input type="checkbox" class="form-check-input" id="Yauth" name="Yauth">';
                row += '<input type="hidden" value="'+list.pkid+'" class="pkid"></td>';
                row += '<td>' + list.pgmID +'</td>';
                row += '<td>' + list.pgmName + '</td>';
                if(list.sel == 'Y'){
                	row +='<td><input type="checkbox" class="form-check-input" name="Sel" id="authY" checked></td>';
                } else{
                	row +='<td><input type="checkbox" class="form-check-input" name="Sel" id="authY"></td>';
                }
                if(list.ins == 'Y'){
                	row +='<td><input type="checkbox" class="form-check-input" name="Ins" id="authY" checked></td>';
                } else{
                	row +='<td><input type="checkbox" class="form-check-input" name="Ins" id="authY"></td>';
                }
                if(list.upd == 'Y'){
                	row +='<td><input type="checkbox" class="form-check-input" name="Upd" id="authY" checked></td>';
                } else{
                	row +='<td><input type="checkbox" class="form-check-input" name="Upd" id="authY"></td>';
                }
                if(list.del == 'Y'){
                	row +='<td><input type="checkbox" class="form-check-input" name="Del" id="authY" checked></td>';
                } else{
                	row +='<td><input type="checkbox" class="form-check-input" name="Del" id="authY"></td>';
                }
                if(list.excel == 'Y'){
                	row +='<td><input type="checkbox" class="form-check-input" name="Excel" id="authY" checked></td>';
                } else{
                	row +='<td><input type="checkbox" class="form-check-input" name="Excel" id="authY"></td>';
                }
                if(list.prt == 'Y'){
                	row +='<td><input type="checkbox" class="form-check-input" name="Prt" id="authY" checked></td>';
                } else{
                	row +='<td><input type="checkbox" class="form-check-input" name="Prt" id="authY"></td>';
                }
                row += '</tr>';
                tableBody1.append(row);
            });
        },
        error: function(xhr, status, error) {
            console.log("Status: " + status);
            console.log("Error: " + error);
        }
    });
}

//권한회수기능
function revauthority() {
	
	if(checkedYValues.length === 0){
		return false;
	}
	
	var tableBody = $(".authylist");
    tableBody.empty(); // 기존 내용을 지웁니다
    
    $.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "revauthority.do", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'json',
        data: { 
        	pkidlist : checkedYValues,
        	UserGroupID : rememberuserGroupID,
        	PGMGroupID : remembepgmGroupID
        },
        success: function(data) {	
       	 var commentList = data.commentList;
       	 commentList.forEach(function(list) {
                // 데이터를 기반으로 HTML 로우를 만듭니다.
                var row = '<tr>';   
                row += '<td><input type="checkbox" class="form-check-input" id="Yauth" name="Yauth">';
                row += '<input type="hidden" value="'+list.pkid+'" class="pkid"></td>';
                row += '<td>' + list.pgmID +'</td>';
                row += '<td>' + list.pgmName + '</td>';
                if(list.sel == 'Y'){
                	row +='<td><input type="checkbox" class="form-check-input" name="Sel" id="authY" checked></td>';
                } else{
                	row +='<td><input type="checkbox" class="form-check-input" name="Sel" id="authY"></td>';
                }
                if(list.ins == 'Y'){
                	row +='<td><input type="checkbox" class="form-check-input" name="Ins" id="authY" checked></td>';
                } else{
                	row +='<td><input type="checkbox" class="form-check-input" name="Ins" id="authY"></td>';
                }
                if(list.upd == 'Y'){
                	row +='<td><input type="checkbox" class="form-check-input" name="Upd" id="authY" checked></td>';
                } else{
                	row +='<td><input type="checkbox" class="form-check-input" name="Upd" id="authY"></td>';
                }
                if(list.del == 'Y'){
                	row +='<td><input type="checkbox" class="form-check-input" name="Del" id="authY" checked></td>';
                } else{
                	row +='<td><input type="checkbox" class="form-check-input" name="Del" id="authY"></td>';
                }
                if(list.excel == 'Y'){
                	row +='<td><input type="checkbox" class="form-check-input" name="Excel" id="authY" checked></td>';
                } else{
                	row +='<td><input type="checkbox" class="form-check-input" name="Excel" id="authY"></td>';
                }
                if(list.prt == 'Y'){
                	row +='<td><input type="checkbox" class="form-check-input" name="Prt" id="authY" checked></td>';
                } else{
                	row +='<td><input type="checkbox" class="form-check-input" name="Prt" id="authY"></td>';
                }
                row += '</tr>';
                tableBody.append(row);
            });
        },
        error: function(xhr, status, error) {
            console.log("Status: " + status);
            console.log("Error: " + error);
        }
    });
    var tableBody1 = $(".authnlist");
    tableBody1.empty(); // 기존 내용을 지웁니다
    
    $.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "authusergrouplistN.do", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'json',
        data: { 
        	UserGroupID : rememberuserGroupID,
        	PGMGroupID: remembepgmGroupID
        },
        success: function(data) {	
       	 var commentList = data.commentList;
       	 commentList.forEach(function(list) {
                // 데이터를 기반으로 HTML 로우를 만듭니다.
                var row = '<tr>';   
                row += '<td><input type="checkbox" class="form-check-input" id="authN">';
                row += '<input type="hidden" value="'+list.pkid+'" class="pkid"></td>';
                row += '<td>' + list.pgmID +'</td>';
                row += '<td>' + list.pgmName + '</td>';
                row += '</tr>';
                tableBody1.append(row);
            });
        },
        error: function(xhr, status, error) {
            console.log("Status: " + status);
            console.log("Error: " + error);
        }
    });
}
//권한 설정된 프로그램의 전체선택기능
function Yselectall() {
	var checkboxes = document.querySelectorAll('input[name="Yauth"]');
	checkedYValues = [];
	for (var i = 0; i < checkboxes.length; i++) {
		checkboxes[i].checked = true;
		var hiddenInput = checkboxes[i].nextElementSibling; // Assuming the hidden input is the next sibling
	    if (hiddenInput && hiddenInput.tagName === 'INPUT' && hiddenInput.type === 'hidden') {
	      checkedYValues.push(hiddenInput.value);
	    }
	}
}
//권한 설정된 프로그램의 전체선택해제기능
function Yremoveall() {
	checkedYValues = [];
	var checkboxes = document.querySelectorAll('input[name="Yauth"]');
	for (var i = 0; i < checkboxes.length; i++) {
		checkboxes[i].checked = false;
	}
}
//권한 설정된 프로그램의 권한전체선택기능
function authYselectall() {
	var checkboxes = document.querySelectorAll('#authY');
	for (var i = 0; i < checkboxes.length; i++) {
		checkboxes[i].checked = true;
	}
	
    $.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "allchange.do", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'json',
        data: { 
        	UserGroupID: rememberuserGroupID,
       		IsDelete : 'N'
        },
        success: function() {	
			
        },
        error: function(xhr, status, error) {
            console.log("Status: " + status);
            console.log("Error: " + error);
        }
    });
}
//권한 설정된 프로그램의 권한전체선택해제기능
function authYremoveall() {
	var checkboxes = document.querySelectorAll('#authY');
	for (var i = 0; i < checkboxes.length; i++) {
		checkboxes[i].checked = false;
	}
	alert(rememberuserGroupID);
	
    $.ajax({
        type: "POST", // 또는 "POST", 서버 설정에 따라 다름
        url: "allchange.do", // 실제 엔드포인트로 교체해야 합니다
        dataType : 'json',
        data: { 
        	UserGroupID: rememberuserGroupID,
        	IsDelete : 'Y'
        },
        success: function() {	
			
        },
        error: function(xhr, status, error) {
            console.log("Status: " + status);
            console.log("Error: " + error);
        }
    });
}
//권한 설정가능한 프로그램의 전체선택기능
function Nselectall() {
	var checkboxes = document.querySelectorAll('#authN');
	checkedValues = [];
	for (var i = 0; i < checkboxes.length; i++) {
		checkboxes[i].checked = true;
		var hiddenInput = checkboxes[i].nextElementSibling; // Assuming the hidden input is the next sibling
	    if (hiddenInput && hiddenInput.tagName === 'INPUT' && hiddenInput.type === 'hidden') {
	    	checkedValues.push(hiddenInput.value);
	    }
	}
}
//권한 설정가능한 프로그램의 전체선택해제기능
function Nremoveall() {
	checkedValues = [];
	var checkboxes = document.querySelectorAll('#authN');
	for (var i = 0; i < checkboxes.length; i++) {
		checkboxes[i].checked = false;
	}
}
</script>
