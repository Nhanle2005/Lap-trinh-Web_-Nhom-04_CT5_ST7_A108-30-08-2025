<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
    }
    .container {
        width: 350px;
        margin: 100px auto;
        padding: 20px;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    h2 {
        text-align: center;
        color: #333;
    }
    label {
        display: block;
        margin-top: 10px;
        color: #555;
    }
    input {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    button {
        width: 100%;
        padding: 10px;
        margin-top: 15px;
        border: none;
        background: #007BFF;
        color: #fff;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
    }
    button:hover {
        background: #0056b3;
    }
    .alert {
        text-align: center;
        color: red;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .success {
        text-align: center;
        color: green;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .back-link {
        text-align:center; 
        margin-top:15px;
    }
    .back-link a {
        text-decoration: none;
        color: #007BFF;
    }
    .back-link a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="container">
        <form action="forgetpassword" method="post">
            <h2>Quên mật khẩu</h2>

            <!-- Hiển thị thông báo -->
            <c:if test="${not empty alert}">
                <div class="alert">${alert}</div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="success">${success}</div>
            </c:if>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Nhập email đã đăng ký" required />

            <button type="submit">Lấy lại mật khẩu</button>
        </form>

        <div class="back-link">
            <a href="login">Quay lại đăng nhập</a>
        </div>
    </div>
</body>
</html>
