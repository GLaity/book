package com.book.dao;

import com.book.pojo.User_Account;

import java.util.List;

public interface IUserDao {
    //新增用户
    public  void insertUser(User_Account user);
    //注册用户
    public void insertUserAccount(User_Account user);
    //更新记录
    public void updateUserAccount(User_Account user);
    //查询一条记录
    public User_Account selectUserAccountById(int id);
    public User_Account selectUserAccountByUsername(String username);
    //查询所有记录
    public List<User_Account> selectUserAccount();
    //删除一条记录
    public void deleteUserAccountId(int id);
    //查询
}
