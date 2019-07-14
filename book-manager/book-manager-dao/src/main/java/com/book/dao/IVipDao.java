package com.book.dao;

import com.book.pojo.Vip_Account;

import java.util.List;

public interface IVipDao {
    
    //新增记录
    public void insertVipAccount(Vip_Account vip);
    //更新记录
    public void updateVipAccount(Vip_Account vip);
    //查询一条记录
    public Vip_Account selectVipAccount(int id);
    //查询所有记录
    public List<Vip_Account> selectVipAccount();
    //删除一条记录根据id
    public void deleteVipAccountId(int id);

}
