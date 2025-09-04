<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>
        <c:choose>
            <c:when test="${category != null}">Sửa Category</c:when>
            <c:otherwise>Thêm Category</c:otherwise>
        </c:choose>
    </title>
    <style>
        body { font-family: Arial, sans-serif; background: #f9f9f9; }
        form { width: 400px; margin: 40px auto; padding: 20px; border: 1px solid #ddd;
               border-radius: 8px; background: #fff; }
        label { display: block; margin-bottom: 6px; font-weight: bold; }
        input, textarea { width: 100%; padding: 8px; margin-bottom: 12px; border: 1px solid #ccc; border-radius: 4px; }
        button, a.btn { padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; }
        button { background: #4CAF50; color: white; }
        a.btn { background: #ccc; color: #000; text-decoration: none; margin-left: 10px; }
        h2 { text-align: center; margin-bottom: 20px; }
    </style>
</head>
<body>
    <h2>
        <c:choose>
            <c:when test="${category != null}">Sửa Category</c:when>
            <c:otherwise>Thêm Category</c:otherwise>
        </c:choose>
    </h2>

    <form action="category" method="post">
        <input type="hidden" name="id" value="<c:out value='${category != null ? category.id : ""}'/>" />

        <label for="name">Tên Category</label>
        <input type="text" id="name" name="name"
               value="<c:out value='${category != null ? category.name : ""}'/>" required />

        <label for="description">Mô tả</label>
        <textarea id="description" name="description" rows="4"><c:out value='${category != null ? category.description : ""}'/></textarea>

        <button type="submit">Lưu</button>
        <a href="category" class="btn">Hủy</a>
    </form>
</body>
</html>
