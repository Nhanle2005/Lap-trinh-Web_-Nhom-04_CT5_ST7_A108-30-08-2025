package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Category;
import model.User;
import service.CategoryService;
import service.CategoryServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/category")
public class CategoryController extends HttpServlet {
    private final CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "add" -> { 
                req.setAttribute("category", null);
                req.getRequestDispatcher("/WEB-INF/views/category/form.jsp")
                   .forward(req, resp);
            }
            case "edit" -> {
                int id = Integer.parseInt(req.getParameter("id"));
                Category c = categoryService.getCategoryById(id);
                req.setAttribute("category", c);
                req.getRequestDispatcher("/WEB-INF/views/category/form.jsp")
                   .forward(req, resp);
            }
            case "delete" -> {
                int id = Integer.parseInt(req.getParameter("id"));
                categoryService.deleteCategory(id);
                resp.sendRedirect(req.getContextPath() + "/category");
            }
            default -> { // list
                List<Category> list = categoryService.getAllCategories();
                req.setAttribute("list", list);
                req.getRequestDispatcher("/WEB-INF/views/category/list.jsp")
                   .forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int id = (req.getParameter("id") == null || req.getParameter("id").isEmpty())
                ? 0 : Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");

        // Lấy userId từ session nếu có login
        HttpSession session = req.getSession(false);
        int userId = 0;
        if (session != null && session.getAttribute("account") != null) {
            userId = ((User) session.getAttribute("account")).getId();
        }

        Category c = new Category(id, name, description, userId);

        if (id == 0) {
            categoryService.addCategory(c);
        } else {
            categoryService.updateCategory(c);
        }

        resp.sendRedirect(req.getContextPath() + "/category");
    }
}