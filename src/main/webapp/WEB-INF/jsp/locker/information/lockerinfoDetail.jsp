<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/head.jsp" %>
<body style="overflow: hidden;">
    <div class="card h-100 mb-1">
        <div class="card-body mb-n4 mt-n3">
            <div class="col-auto">
        		<div class="row justify-content-between">
        			<div class="col-auto">
						<h3 class="mb-3 pt-2">사물함 분류정보 등록</h3>
            		</div>
            		<div class="col-auto">
						<button class="btn btn-success" type="button" onclick="save()">저장</button>						
						<button class="btn btn-danger" type="button" onclick="Change()">취소</button>
            		</div>
        		</div>
        	</div>
        </div>
    </div>
    <div class="row">
	    <div class="card ms-3" style="width: 440px;">
	        <div class="card-body" style="height: 525px;">
	       		<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">&ensp;분&emsp;류&ensp;</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="plockergroupname" name="plockergroupname"/>
					</div>
				</div>
				<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">&ensp;위&emsp;치&ensp;</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="plockerlocation" name="plockerlocation"/>
					</div>
				</div>
				<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">&ensp;구&emsp;분&ensp;</span>
						<select class="form-select" aria-label="basic-addon1" id="plockertype" name="plockertype">
							<option value="1">일반락커</option>
						  	<option value="2">옷장</option>
						</select>
					</div>
				</div>
				<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">&ensp;보증금&ensp;</span>
						<input class="form-control text-end" type="text" aria-describedby="basic-addon1" id="plockerdeposite" name="plockerdeposite" oninput="onlyNumber(this)"/>
					</div>
				</div>
				<div class="row mb-2">
					<div style="width: 241px;">
						<div class="input-group input-group-sm">
							<span class="input-group-text" id="basic-addon1">&ensp;사용료&ensp;</span>
							<input class="form-control text-end" type="text" aria-describedby="basic-addon1" id="plockerprice" name="plockerprice" oninput="onlyNumber(this)"/>
						</div>
					</div>
					<div class="mt-1" style="width: 136px;">
						<div class="form-check form-check-inline">
							<input class="form-check-input" id="nvat" type="checkbox" value="Y"/>
							<label class="form-check-label" for="nvat">부가세포함</label>
						</div>
					</div>
				</div>
				<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">기준개월</span>
						<input class="form-control" type="text" aria-describedby="basic-addon1" id="plockermonth" name="plockermonth"/>
					</div>
				</div>
				<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">&ensp;순&emsp;위&ensp;</span>
						<input class="form-control text-end" type="text" aria-describedby="basic-addon1" id="sortorder" name="sortorder"/>
					</div>
				</div>
				<div class="col-7 mb-2">
					<div class="input-group input-group-sm">
						<span class="input-group-text" id="basic-addon1">&ensp;단수량&ensp;</span>
						<input class="form-control text-end" type="text" aria-describedby="basic-addon1" id="dancnt" name="dancnt"/>
					</div>
				</div>
	        </div>
		</div>
	    <div class="card h-100 mb-1 w-20 me-1" style="width: 622px;">
	        <div class="card-body mb-n5 mt-n3 me-3 mx-n4" style="height: 525px;">
	        </div>
	    </div>
	</div>
</body>