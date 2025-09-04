<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager - Trang chủ</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 450px;
        margin: 100px auto;
        padding: 20px;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    h2 {
        color: #5bc0de;
        margin-bottom: 15px;
    }

    p {
        margin: 8px 0;
        font-size: 15px;
        color: #555;
    }

    a {
        display: inline-block;
        margin-top: 15px;
        padding: 10px 20px;
        background: #007BFF;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: 0.3s;
    }

    a:hover {
        background: #0056b3;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Xin chào Manager, ${sessionScope.account.fullName}!</h2>
        <p><strong>Email:</strong> ${sessionScope.account.email}</p>
        <p><strong>Role ID:</strong> ${sessionScope.account.roleid}</p>
        <a href="logout">Đăng xuất</a>
    </div>
</body>
</html>
