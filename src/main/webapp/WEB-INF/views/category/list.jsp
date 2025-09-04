<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách Category</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f9f9f9; }
        h2 { text-align: center; margin-top: 20px; }
        .actions { text-align: center; margin: 15px; }
        table { border-collapse: collapse; width: 80%; margin: 0 auto; background: #fff; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        th { background-color: #f2f2f2; }
        a.btn { padding: 6px 12px; border-radius: 4px; text-decoration: none; margin: 2px; }
        a.add-btn { background: #4CAF50; color: white; }
        a.edit-btn { background: #2196F3; color: white; }
        a.delete-btn { background: #f44336; color: white; }
        a.back-btn { background: #9E9E9E; color: white; }
        tr:hover { background: #fafafa; }
    </style>
</head>
<body>
    <h2>Danh sách Category</h2>

    <div class="actions">
        <a href="category?action=add" class="btn add-btn">+ Thêm Category</a>
        <a href="<c:url value='/admin'/>" class="btn back-btn">⬅ Trở lại Trang Admin</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Mô tả</th>
                <th>Người tạo</th>
                <th>Ngày tạo</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
        <c:if test="${empty list}">
            <tr>
                <td colspan="6">Chưa có category nào</td>
            </tr>
        </c:if>
        <c:forEach var="c" items="${list}">
            <tr>
                <td>${c.id}</td>
                <td>${c.name}</td>
                <td>${c.description}</td>
                <td>${c.userId}</td>
                <td>${c.createdAt}</td>
                <td>
                    <a href="category?action=edit&id=${c.id}" class="btn edit-btn">Sửa</a>
                    <a href="category?action=delete&id=${c.id}" class="btn delete-btn"
                       onclick="return confirm('Bạn có chắc muốn xóa category này?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
