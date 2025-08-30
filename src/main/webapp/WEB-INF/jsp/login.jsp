<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
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
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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

.register {
	text-align: center;
	margin-top: 15px;
}

.register a {
	color: #007BFF;
	text-decoration: none;
}

.register a:hover {
	text-decoration: underline;
}

.alert {
	text-align: center;
	color: red;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<form action="login" method="post">
			<h2>Đăng nhập</h2>

			<c:if test="${alert != null}">
				<div class="alert">${alert}</div>
			</c:if>

			<label>Tài khoản:</label> <input type="text" name="username"
				placeholder="Nhập tài khoản" /> <label>Mật khẩu:</label> <input
				type="password" name="password" placeholder="Nhập mật khẩu" />

			<button type="submit">Đăng nhập</button>
		</form>
		<div style="text-align: center; margin-top: 10px;">
			<a href="forgetpassword">Quên mật khẩu?</a>
		</div>
		<div class="register">
			Chưa có tài khoản? <a href="register">Đăng ký ngay</a>
		</div>
	</div>
</body>
</html>
