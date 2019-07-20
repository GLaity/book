package com.book.service.impl;

import com.book.dao.*;
import com.book.dao.impl.*;
import com.book.pojo.Book_Basic;
import com.book.pojo.Count_Account;
import com.book.pojo.User_Account;
import com.book.pojo.Vip_Account;
import com.book.service.IBookService;
import com.book.service.IUserBookShelfService;
import com.book.service.IUserCostService;
import com.book.service.IUserService;

import java.util.List;

public class IUserServiceImpl implements IUserService {
    public void addUser(User_Account user) {
        IUserDao dao = new UserDaoImpl();
        dao.insertUserAccount(user);
        ICountAccountDao countDao = new CountAccountImpl();
        IVipDao vipDao = new VipDaoImpl();
        countDao.insertUserCount(user.getUser_Id());
        dao.insertUserVip(user.getUser_Id());
        Vip_Account vipAccount = new Vip_Account();
        vipAccount.setUser_Id(user.getUser_Id());
        vipAccount.setVip_Id(1);
        vipAccount.setVip_Balance(0);
        vipDao.insertVipAccount(vipAccount);
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

    @Override
    public void modifyBalance(int userId, double newBalance) {
        IUserDao userDao = new UserDaoImpl();
        userDao.updateUserVip(userId,newBalance);
    }

    @Override
    public Vip_Account findBalance(int userId) {
        IUserDao userDao = new UserDaoImpl();
        return userDao.selectUserVip(userId);
    }

    @Override
    public void buyBook(int userId, int bookId) {
        IUserDao userDao = new UserDaoImpl();
        IBookDao bookDao = new BookDaoImpl();
        IBookService bookService = new BookServiceImpl();
        IUserBookShelfService userBookShelfService = new UserBookShelfServiceImpl();
        IUserCostService userCostService = new UserCostServiceImpl();
        Vip_Account userVip = findBalance(userId);
        Book_Basic book = bookDao.selectBookById(bookId);

        userDao.updateUserVip(userId, userVip.getVip_Balance() - book.getBook_Price());
        modifyTotalBought(userId);
        bookService.modifyboughtById(bookId);
        userBookShelfService.addUserBought(userId,bookId);
        modifyTotalPay(userId,book.getBook_Price());
        userCostService.addUserCost(userId,bookId);
    }

    @Override
    public Count_Account findUserCountById(int userId) {
        ICountAccountDao countDao = new CountAccountImpl();
        return countDao.selectById(userId);
    }

}
