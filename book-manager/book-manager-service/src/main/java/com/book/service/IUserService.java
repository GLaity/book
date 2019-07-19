package com.book.service;

import com.book.pojo.Count_Account;
import com.book.pojo.User_Account;
import com.book.pojo.Vip_Account;

import java.util.List;

public interface IUserService {
    public void addUser(User_Account user);
    public void modifyUser(User_Account user);
    public User_Account findUserById(int id);
    public User_Account findUserByUsername(String username);
    public List<User_Account> findAll();
    public void removeUser(int id);
    public User_Account loginService(String username,String password);


    public void modifyTotalVisit(int user_id);
    public void modifyTotalBought(int user_id);
    public void modifyTotalTime(int user_id,int readTime);
    public void modifyTotalPay(int user_id,double pay);
    public void modifyById(int user_id);

    void modifyBalance(int userId, double newBalance);
    Vip_Account findBalance(int userId);
    void buyBook(int userId, int bookId);

    Count_Account findUserCountById(int userId);
}
