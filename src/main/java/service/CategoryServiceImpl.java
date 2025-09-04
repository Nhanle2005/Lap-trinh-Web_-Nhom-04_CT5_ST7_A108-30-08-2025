package service;

import dao.CategoryDao;
import dao.CategoryDaoImpl;
import model.Category;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    private CategoryDao dao = new CategoryDaoImpl();

    @Override
    public boolean addCategory(Category category) {
        return dao.addCategory(category);
    }

    @Override
    public boolean updateCategory(Category category) {
        return dao.updateCategory(category);
    }

    @Override
    public boolean deleteCategory(int id) {
        return dao.deleteCategory(id);
    }

    @Override
    public Category getCategoryById(int id) {
        return dao.getCategoryById(id);
    }

    @Override
    public List<Category> getCategoriesByUserId(int userId) {
        return dao.getCategoriesByUserId(userId);
    }
    @Override
    public List<Category> getAllCategories() {
        return dao.getAllCategories();
    }

}
