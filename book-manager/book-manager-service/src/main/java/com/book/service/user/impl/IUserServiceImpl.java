package com.book.service.user.impl;

import com.book.dao.IUserDao;
import com.book.dao.impl.UserDaoImpl;
import com.book.pojo.User_Account;
import com.book.service.user.IUserService;

import java.util.List;

public class IUserServiceImpl implements IUserService {
    public void addUser(User_Account user) {
        IUserDao dao = new UserDaoImpl();
        dao.insertUserAccount(user);

    }

    public void modifyUser(User_Account user) {
        IUserDao dao = new UserDaoImpl();
        dao.updateUserAccount(user);
    }

    public User_Account findUserById(int id) {
        IUserDao dao = new UserDaoImpl();
        User_Account user = new User_Account();
        user = dao.selectUserAccountById(id);
        return user;
    }
    public User_Account findUserByUsername(String username) {
        IUserDao dao = new UserDaoImpl();
        User_Account user = new User_Account();
        user = dao.selectUserAccountByUsername(username);
        return user;
    }
    public List<User_Account> findAll() {
        IUserDao dao = new UserDaoImpl();
        List<User_Account> userList = dao.selectUserAccount();
        return userList;
    }

    public void removeUser(int id) {
        IUserDao dao = new UserDaoImpl();
        dao.deleteUserAccountId(id);
    }

    public User_Account loginService(String username, String password) {
        IUserDao userdao = new UserDaoImpl();
        User_Account user = new User_Account();
        user = userdao.selectUserAccountByUsername(username);
        if(user!=null){
            if(password.equals(user.getUser_Password())){
                return user;
            }else{
                return null;
            }
        }else{
            return null;
        }
    }

}
