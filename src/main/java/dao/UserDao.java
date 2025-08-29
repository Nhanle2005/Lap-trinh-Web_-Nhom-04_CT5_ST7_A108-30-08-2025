package dao;

import model.User;

public interface UserDao {
    User login(String username, String password);
    boolean saveUser(User user);
    User getUserByUsername(String username); // để check trùng
}
