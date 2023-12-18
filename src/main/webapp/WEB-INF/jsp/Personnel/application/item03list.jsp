<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <title>단계리스트</title>
    <style>
        body {
            background-color: #f4f4f4;
        }

        /* Container styles */
.container {
    background-color: #fff;
    color: #000;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;
    margin: 20px auto; /* Adjust margin to center the container */
    width: 80%; /* Adjust container width */
}

/* Header styles */
.container h2 {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 24px;
            background-color: #6dc6ff; /* Adjust this color code to your preference */
            color: #fff;
            padding: 10px;
            border-radius: 5px 5px 0 0;
            margin: 0;
}
        form {
            margin: 20px 0;
        }

        form div {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 15px 0;
        }

        form label, form input {
            flex: 1;
        }

        form input {
            padding: 10px;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        /* Add these styles to your existing CSS or update your styles accordingly */

		/* Style for the table */
		.table {
		    width: 100%;
		    border-collapse: collapse;
		    border-radius: 5px;
		    overflow: hidden;
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		    margin-top: 20px;
		}
		
		/* Style for table header */
		.table th {
            background-color: #00a2ff;
            color: #fff;
            padding: 10px;
            text-align: center; /* Horizontal alignment */
            vertical-align: middle; /* Vertical alignment */
        }
		
		/* Style for table rows */
		.table-row:hover {
		    background-color: #f2f2f2;
		}
		
		/* Style for table data */
		.table td {
		    padding: 10px;
		    text-align: left;
		    border: 1px solid #ddd; /* Add lines between cells */
		}
		
		/* Apply a hover effect to table rows */
		.table tbody tr:hover {
		    background-color: #f2f2f2;
		}
		
		/* Adjust top margin of h2 */
		.container h2 {
		    margin-top: 0; /* Remove top margin */
		}
				        
    </style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>단계리스트</h2>
    <div style="margin-top: 20px; margin-right: 220px; width: 100px;">
    	<button type="button" id="choose" name="choose" onclick="choose()">선택완료</button>
    </div>
    <form action="passwordchange.do" method="post">
    
        <table class="table">
            <thead>
                <tr>
                    <th style="width: 30px;">선택</th>
                    <th style="width: 30px;">코드</th>
                    <th>코드명</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="list" items="${list}">
                    <tr class="table-row">
                        <td><input type="checkbox" class="checkbox"></td>
                        <td class="group-id">${list.levelID}</td>
                        <td class="group-name">${list.levelName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </form>
</div>
</body>
<script type="text/javascript">
let checkedRows = [];
let checkedRows1 = [];
var pgmgroupvalue = '';
var pgmgroupIdvalue = '';
//Function to display the alerts
function choose() {
	if(pgmgroupvalue == ''){
		alert('단계를 선택해주세요')
		return false;
	}
	opener.document.getElementById("leveltext").value = pgmgroupvalue;
	opener.document.getElementById("level").value = pgmgroupIdvalue;
	self.close();
}

function displayAlert() {
	 let names = checkedRows.map(row => row.groupName).join(',');
	 let names1 = checkedRows1.map(row => row.groupId).join(',');
	 pgmgroupvalue = names;
	 pgmgroupIdvalue = names1;
}

//Event listener for checkbox changes
document.querySelectorAll('.checkbox').forEach(checkbox => {
 checkbox.addEventListener('change', function() {
     const row = this.closest('.table-row');
     const groupName = row.querySelector('.group-name').textContent;
     const groupId = row.querySelector('.group-id').textContent;
     if (this.checked) {
         checkedRows.push({ groupName });
         checkedRows1.push({ groupId });
     } else {
         checkedRows = checkedRows.filter(item => item.groupName !== groupName);
         checkedRows1 = checkedRows1.filter(item => item.groupId !== groupId);
     }

     displayAlert();
 });
});
</script>
</html>
