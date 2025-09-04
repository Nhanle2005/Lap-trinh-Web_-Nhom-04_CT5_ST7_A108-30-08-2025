<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, DBcontroller.DB" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý User</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            margin: 0;
            padding: 0;
            background: #f5f7fa;
            color: #333;
        }
        header {
            background: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            width: 90%;
            margin: 30px auto;
        }
        h2 {
            margin-top: 20px;
            color: #444;
        }
        .userinfo {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        .userinfo p { margin: 8px 0; }
        a.logout {
            display: inline-block;
            margin-top: 10px;
            background: #e74c3c;
            color: white;
            padding: 8px 15px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
        }
        a.logout:hover { background: #c0392b; }

        table {
            border-collapse: collapse;
            width: 100%;
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        table th, table td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
            text-align: left;
        }
        th {
            background: #4CAF50;
            color: white;
        }
        tr:hover { background: #f9f9f9; }

        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            color: white;
            font-size: 13px;
        }
        .delete-btn { background: #e74c3c; }
        .delete-btn:hover { background: #c0392b; }
        .update-btn { background: #3498db; }
        .update-btn:hover { background: #2980b9; }

        .form-container {
            margin-top: 30px;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            width: 400px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .form-container h3 { margin-bottom: 15px; }
        .form-container input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }
        .form-container button {
            background: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }
        .form-container button:hover { background: #45a049; }
    </style>
</head>
<body>
    <header>
        <h1>Trang Quản lý User</h1>
    </header>
    <div class="container">
        <div class="userinfo">
            <h2>Xin chào, ${sessionScope.account.fullName}!</h2>
            <p><strong>Email:</strong> ${sessionScope.account.email}</p>
            <p><strong>Role ID:</strong> ${sessionScope.account.roleid}</p>
            <a class="logout" href="logout">Đăng xuất</a>
        </div>

        <h2>Danh sách User</h2>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                conn = DB.getConnection();
                String sql = "SELECT id, username, email, fullname, roleid, created_at FROM users";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
        %>

        <table>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Fullname</th>
                <th>RoleID</th>
                <th>Created_at</th>
                <th>Hành động</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("fullname") %></td>
                <td><%= rs.getInt("roleid") %></td>
                <td><%= rs.getString("created_at") %></td>
                <td>
                    <form action="category" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <button type="submit" class="action-btn delete-btn">Quản lý</button>
                    </form>
                
                </td>
            </tr>
            <% } %>
        </table>

        <div class="form-container">
            <h3>Thêm User mới</h3>
            <form action="category" method="post">
                <input type="hidden" name="action" value="add">
                <input type="text" name="username" placeholder="Username" required>
                <input type="text" name="password" placeholder="Password" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="text" name="fullname" placeholder="Fullname" required>
                <input type="number" name="roleid" placeholder="RoleID" required>
                <button type="submit">Thêm User</button>
            </form>
        </div>

        <%
            } catch (Exception e) {
                out.println("<p style='color:red;'>Lỗi: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
    </div>
</body>
</html>
