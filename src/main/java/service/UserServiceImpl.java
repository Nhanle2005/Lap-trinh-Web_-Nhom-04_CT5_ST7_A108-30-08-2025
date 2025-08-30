package service;

import dao.UserDao;
import dao.UserDaoImpl;
import model.User;

public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        return userDao.login(username, password);
    }

    @Override
    public boolean register(User user) {
        // Kiểm tra user đã tồn tại chưa
        if (userDao.getUserByUsername(user.getUserName()) != null) {
            return false;
        }
        return userDao.saveUser(user);
    }
    
    @Override
    public User getUserByEmail(String email) {
        return userDao.getUserByEmail(email);
    }
}

