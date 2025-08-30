package Controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import service.UserService;
import service.UserServiceImpl;

@WebServlet("/forgetpassword")
public class ForgetControler extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/forgetpassword.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        if (email == null || email.isEmpty()) {
            req.setAttribute("alert", "Vui lòng nhập email!");
            req.setAttribute("type", "error");
            req.getRequestDispatcher("/WEB-INF/jsp/forgetpassword.jsp").forward(req, resp);
            return;
        }
        User user = userService.getUserByEmail(email);
        if (user != null) {
            // DEMO: hiển thị mật khẩu ra luôn
            req.setAttribute("alert", "Mật khẩu của bạn là: " + user.getPassWord());
            req.setAttribute("type", "success");
        } else {
            req.setAttribute("alert", "Email không tồn tại trong hệ thống!");
            req.setAttribute("type", "error");
        }
        req.getRequestDispatcher("/WEB-INF/jsp/forgetpassword.jsp").forward(req, resp);
    }
}
