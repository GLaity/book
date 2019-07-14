package com.book.service.impl;

import com.book.dao.ICountAccountDao;
import com.book.dao.IUserDao;
import com.book.dao.impl.CountAccountImpl;
import com.book.dao.impl.UserDaoImpl;
import com.book.pojo.User_Account;
import com.book.service.IUserService;

import java.util.List;

public class IUserServiceImpl implements IUserService {
    public void addUser(User_Account user) {
        IUserDao dao = new UserDaoImpl();
        dao.insertUserAccount(user);
        ICountAccountDao countDao = new CountAccountImpl();
        countDao.insertUserCount(user.getUser_Id());
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

    @Override
    public void modifyTotalVisit(int user_id) {
        ICountAccountDao countDao = new CountAccountImpl();
        countDao.updataTotalVisit(user_id);
    }

    @Override
    public void modifyTotalBought(int user_id) {
        ICountAccountDao countDao = new CountAccountImpl();
        countDao.updataTotalBought(user_id);
    }

    @Override
    public void modifyTotalTime(int user_id, int readTime) {
        ICountAccountDao countDao = new CountAccountImpl();
        countDao.updataTotalTime(user_id,readTime);
    }

    @Override
    public void modifyTotalPay(int user_id, double pay) {
        ICountAccountDao countDao = new CountAccountImpl();
        countDao.updataTotalPay(user_id,pay);
    }

    @Override
    public void modifyById(int user_id) {
        ICountAccountDao countDao = new CountAccountImpl();
        countDao.selectById(user_id);
    }

}
