package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import model.User;

@WebServlet("/waiting")
public class WaitingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("account") != null) {
            User user = (User) session.getAttribute("account");

            if (user.getRoleid() == 1) {
                // Admin
                req.getRequestDispatcher("/WEB-INF/views/admin/home.jsp")
                   .forward(req, resp);
            } else if (user.getRoleid() == 2) {
                // Manager
                req.getRequestDispatcher("/WEB-INF/views/manager/home.jsp")
                   .forward(req, resp);
            } else {
                // User thường
                req.getRequestDispatcher("/WEB-INF/views/user/home.jsp")
                   .forward(req, resp);
            }
        } else {
            // Chưa đăng nhập thì quay về login
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }
}
