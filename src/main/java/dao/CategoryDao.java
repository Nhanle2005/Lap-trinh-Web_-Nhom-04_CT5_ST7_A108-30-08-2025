package dao;

import model.Category;
import java.util.List;

public interface CategoryDao {
    boolean addCategory(Category category);
    boolean updateCategory(Category category);
    boolean deleteCategory(int id);
    Category getCategoryById(int id);
    List<Category> getCategoriesByUserId(int userId);
    List<Category> getAllCategories();

}
