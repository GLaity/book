package com.book.service.impl;

import com.book.dao.IUserCostDao;
import com.book.dao.impl.UserCostDaoImpl;
import com.book.pojo.Book_Basic;
import com.book.pojo.User_Cost;
import com.book.service.IBookService;
import com.book.service.IUserCostService;

import java.sql.SQLException;
import java.util.List;

public class UserCostServiceImpl implements IUserCostService {

    IUserCostDao userCostDao = new UserCostDaoImpl();

    @Override
    public void addUserCost(int userId, int bookId) {
        IBookService bookService = new BookServiceImpl();
        Book_Basic book = bookService.findBookBasicById(bookId);
        User_Cost user_cost = new User_Cost();
        user_cost.setBook_Id(bookId);
        user_cost.setUser_Id(userId);
        user_cost.setCost_Money(book.getBook_Price());
        user_cost.setCost_Other("");
        try {
            userCostDao.insertCost(user_cost);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeUserCost(int costId) {
        try {
            userCostDao.deleteCost(costId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User_Cost findUserCostByCostId(int costId) {
        User_Cost userCost = null;
        try {
            userCost = userCostDao.selectCostByCostId(costId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userCost;
    }

    @Override
    public List<User_Cost> findUserCostByBook(int bookId) {
        List<User_Cost> userCostList = null;
        try {
            userCostList = userCostDao.selectCostByBookId(bookId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userCostList;
    }

    @Override
    public List<User_Cost> findUserCostByUser(int userId) {
        List<User_Cost> userCostList = null;
        try {
            userCostList = userCostDao.selectCostByUserId(userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userCostList;
    }
}
