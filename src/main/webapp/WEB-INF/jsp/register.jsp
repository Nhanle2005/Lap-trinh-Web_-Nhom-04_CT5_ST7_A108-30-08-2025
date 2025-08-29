<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Đăng ký tài khoản</title>
    <!-- Có thể thêm Bootstrap & FontAwesome -->
    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body class="container mt-5">

    <h2 class="mb-4 text-center">Đăng ký</h2>

    <form action="register" method="post" class="card p-4 shadow-sm">

        <!-- Hiển thị thông báo lỗi -->
        <c:if test="${alert != null}">
            <div class="alert alert-danger">${alert}</div>
        </c:if>

        <!-- Họ và tên -->
        <div class="mb-3">
            <label class="form-label">Họ và tên</label>
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fa fa-id-card"></i>
                </span>
                <input type="text" 
                       placeholder="Nhập họ và tên" 
                       name="fullname" 
                       class="form-control" required>
            </div>
        </div>

        <!-- Email -->
        <div class="mb-3">
            <label class="form-label">Email</label>
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fa fa-envelope"></i>
                </span>
                <input type="email" 
                       placeholder="Nhập email" 
                       name="email" 
                       class="form-control" required>
            </div>
        </div>

        <!-- Tài khoản -->
        <div class="mb-3">
            <label class="form-label">Tài khoản</label>
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fa fa-user"></i>
                </span>
                <input type="text" 
                       placeholder="Tên đăng nhập" 
                       name="username" 
                       class="form-control" required>
            </div>
        </div>

        <!-- Mật khẩu -->
        <div class="mb-3">
            <label class="form-label">Mật khẩu</label>
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fa fa-lock"></i>
                </span>
                <input type="password" 
                       placeholder="Mật khẩu" 
                       name="password" 
                       class="form-control" required>
            </div>
        </div>

        <!-- Xác nhận mật khẩu -->
        <div class="mb-3">
            <label class="form-label">Xác nhận mật khẩu</label>
            <div class="input-group">
                <span class="input-group-text">
                    <i class="fa fa-lock"></i>
                </span>
                <input type="password" 
                       placeholder="Nhập lại mật khẩu" 
                       name="confirmPassword" 
                       class="form-control" required>
            </div>
        </div>

        <!-- Nút đăng ký -->
        <button type="submit" class="btn btn-primary w-100">
            Đăng ký
        </button>

        <!-- Link sang trang đăng nhập -->
        <p class="mt-3 text-center">
            Đã có tài khoản?
            <a href="login">Đăng nhập ngay</a>
        </p>

    </form>
</body>
</html>
