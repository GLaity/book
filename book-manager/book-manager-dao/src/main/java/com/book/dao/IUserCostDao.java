package com.book.dao;

import com.book.pojo.User_Cost;

import java.sql.SQLException;
import java.util.List;

public interface IUserCostDao {
    void insertCost(User_Cost userCost) throws SQLException;
    void deleteCost(int costId) throws SQLException;
    User_Cost selectCostByCostId(int costId) throws SQLException;
    List<User_Cost> selectCostByUserId(int userId) throws SQLException;
    List<User_Cost> selectCostByBookId(int bookId) throws SQLException;
}
