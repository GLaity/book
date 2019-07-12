package com.book.service.user;

import com.book.pojo.User_Account;

import java.util.List;

public interface IUserService {
    public void addUser(User_Account user);
    public void modifyUser(User_Account user);
    public User_Account findUserById(int id);
    public User_Account findUserByUsername(String username);
    public List<User_Account> findAll();
    public void removeUser(int id);
    public void loginService(String username,String password);
}
