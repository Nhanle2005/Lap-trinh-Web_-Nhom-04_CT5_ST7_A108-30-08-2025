<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
</head>
<body>
    <h2>Xin chào ${sessionScope.account.fullName}!</h2>
    <p>Email: ${sessionScope.account.email}</p>
    <p>Role ID: ${sessionScope.account.roleid}</p>
    <a href="logout">Đăng xuất</a>
</body>
</html>
