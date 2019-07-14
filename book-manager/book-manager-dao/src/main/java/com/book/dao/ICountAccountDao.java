package com.book.dao;

import com.book.pojo.Count_Account;

public interface ICountAccountDao {
    public void insertUserCount(int user_Id);
    public void updataTotalVisit(int user_Id);
    public void updataTotalBought(int user_Id);
    public void updataTotalTime(int user_Id,int readTime);
    public void updataTotalPay(int user_Id,double pay);
    public Count_Account selectById(int user_Id);

}
