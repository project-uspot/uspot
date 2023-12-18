<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            color: #000;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container h2 {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 24px;
            background-color: #00a2ff;
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
            width: 30%;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>비밀번호 변경</h2>
    <form action="passwordchange.do" method="post">
        <div>
            <label for="UserID" style="font-size: 16px;">사용자 ID</label>
            <input type="text" name="UserID" style="margin-top: 10px;">
        </div>
        <div>
            <label for="UserPWD" style="font-size: 16px;">기존 PW</label>
            <input type="password" name="UserPWD" style="margin-top: 10px;">
        </div>
        <div>
            <label for="newPWD" style="font-size: 16px;">새로운 PW</label>
            <input type="password" name="newPWD" style="margin-top: 10px;">
        </div>
        <div>
            <label for="checkPWD" style="font-size: 16px;">확인 PW</label>
            <input type="password" name="checkPWD" style="margin-top: 10px;">
        </div>
        <button type="submit">저장</button>
    </form>
</div>
</body>
</html>
