package com.book.dao.impl;

import com.book.dao.IVipDao;
import com.book.pojo.Vip_Account;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class VipDaoImpl implements IVipDao {


    public void insertVipAccount(Vip_Account vip) {
        String sql ="insert into vip_account values(?,?,?)";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,vip.getUser_Id(),vip.getVip_Id(),vip.getVip_Balance());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //更改会员余额
    public void updateVipAccount(Vip_Account vip) {
        String sql ="update vip_account set vip_balance=? where vip_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,vip.getVip_Balance(),vip.getVip_Id());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //根据id查询会员信息
    public Vip_Account selectVipAccount(int id) {
        String sql = "select * from vip_account where vip_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        Vip_Account vip = null;
        try {
            vip = qr.query(sql,new BeanHandler<Vip_Account>(Vip_Account.class),id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vip;
    }

    public List<Vip_Account> selectVipAccount() {
        List<Vip_Account> vipList= null;
        String sql = "select * from vip_account";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            vipList  = qr.query(sql,new BeanListHandler<Vip_Account>(Vip_Account.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vipList;
    }

    public void deleteVipAccountId(int id) {
        String sql = "delete from vip_account where vip_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
