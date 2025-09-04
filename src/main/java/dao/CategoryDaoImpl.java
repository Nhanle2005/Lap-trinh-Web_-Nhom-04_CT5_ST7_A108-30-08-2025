package dao;

import DBcontroller.DB;
import model.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao {

    @Override
    public boolean addCategory(Category category) {
        String sql = "INSERT INTO category(name, description, user_id) VALUES (?, ?, ?)";
        try (Connection conn = DB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, category.getName());
            ps.setString(2, category.getDescription());
            ps.setInt(3, category.getUserId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error when adding category: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean updateCategory(Category category) {
        String sql = "UPDATE category SET name = ?, description = ? WHERE id = ?";
        try (Connection conn = DB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, category.getName());
            ps.setString(2, category.getDescription());
            ps.setInt(3, category.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error when updating category: " + e.getMessage());
        }
        return false;
    }

    @Override
    public boolean deleteCategory(int id) {
        String sql = "DELETE FROM category WHERE id = ?";
        try (Connection conn = DB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error when deleting category: " + e.getMessage());
        }
        return false;
    }

    @Override
    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM category WHERE id = ?";
        try (Connection conn = DB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return extractCategoryFromResultSet(rs);
                }
            }

        } catch (SQLException e) {
            System.out.println("Error when fetching category by ID: " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<Category> getCategoriesByUserId(int userId) {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM category WHERE user_id = ?";
        try (Connection conn = DB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(extractCategoryFromResultSet(rs));
                }
            }

        } catch (SQLException e) {
            System.out.println("Error when fetching categories by user ID: " + e.getMessage());
        }
        return list;
    }

    @Override
    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM category";
        try (Connection conn = DB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(extractCategoryFromResultSet(rs));
            }

        } catch (SQLException e) {
            System.out.println("Error when fetching all categories: " + e.getMessage());
        }
        return list;
    }

    // Hàm tái sử dụng để lấy dữ liệu từ ResultSet
    private Category extractCategoryFromResultSet(ResultSet rs) throws SQLException {
        Category c = new Category();
        c.setId(rs.getInt("id"));
        c.setName(rs.getString("name"));
        c.setDescription(rs.getString("description"));
        c.setUserId(rs.getInt("user_id"));
        c.setCreatedAt(rs.getTimestamp("created_at"));
        return c;
    }
}