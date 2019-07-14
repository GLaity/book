package com.book.dao.impl;

import com.book.dao.ICountAccountDao;
import com.book.pojo.Count_Account;
import com.book.pojo.User_Account;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;

public class CountAccountImpl implements ICountAccountDao {
    @Override
    public void insertUserCount(int user_Id) {
        String sql = "insert into count_account values (?,0,0,0,0)";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,user_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updataTotalVisit(int user_Id) {
        ICountAccountDao countDao = new CountAccountImpl();
        Count_Account count_account = null;
        count_account = countDao.selectById(user_Id);
        String sql = "update count_account set count_totalvisit=? where user_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,count_account.getCount_TotalVisit()+1,user_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updataTotalBought(int user_Id) {
        ICountAccountDao countDao = new CountAccountImpl();
        Count_Account count_account = null;
        count_account = countDao.selectById(user_Id);
        String sql = "update count_account set count_totalbought=? where user_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,count_account.getCount_TotalBought()+1,user_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updataTotalTime(int user_Id, int readTime) {
        ICountAccountDao countDao = new CountAccountImpl();
        Count_Account count_account = null;
        count_account = countDao.selectById(user_Id);
        String sql = "update count_account set count_totaltime=? where user_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,count_account.getCount_TotalTime()+readTime,user_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updataTotalPay(int user_Id, double pay) {
        ICountAccountDao countDao = new CountAccountImpl();
        Count_Account count_account = null;
        count_account = countDao.selectById(user_Id);
        String sql = "update count_account set count_totalpay=? where user_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,count_account.getCount_TotalPay()+pay,user_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Count_Account selectById(int user_Id) {
        String sql = "select * from count_account where user_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        Count_Account count_account = null;
        try {
             count_account = qr.query(sql,new BeanHandler<Count_Account>(Count_Account.class),user_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count_account;
    }


}
