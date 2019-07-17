package com.book.dao;

import com.book.pojo.Vip_Account;

import java.util.List;

public interface IVipDao {
    
    //������¼
    public void insertVipAccount(Vip_Account vip);
    //���¼�¼
    public void updateVipAccount(Vip_Account vip);
    //��ѯһ����¼
    public Vip_Account selectVipAccount(int id);
    //��ѯ���м�¼
    public List<Vip_Account> selectVipAccount();
    //ɾ��һ����¼����id
    public void deleteVipAccountId(int id);

}
