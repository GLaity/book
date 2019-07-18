package com.book.dao;

import com.book.pojo.Vip_Account;

import java.util.List;

public interface IVipDao {

    public void insertVipAccount(Vip_Account vip);

    public void updateVipAccount(Vip_Account vip);

    public Vip_Account selectVipAccount(int id);

    public List<Vip_Account> selectVipAccount();
    public void deleteVipAccountId(int id);

}
