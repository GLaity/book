package com.book.service;

import com.book.pojo.User_Cost;

import java.util.List;

public interface IUserCostService  {
    void addUserCost(int userId, int bookId);
    void removeUserCost(int costId);
    User_Cost findUserCostByCostId(int costId);
    List<User_Cost> findUserCostByBook(int bookId);
    List<User_Cost> findUserCostByUser(int userId);
}
