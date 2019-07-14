package com.book.dao.impl;

import com.book.dao.IUserDao;
import com.book.pojo.User_Account;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl implements IUserDao {
    //新增用户 ，注册用户
    public void insertUserAccount(User_Account user) {
        String sql ="insert into user_account(user_username,user_password,user_date)values(?,?,date(NOW()))";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,user.getUser_Username(),user.getUser_Password());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //更新用户 修改资料
    public void updateUserAccount(User_Account user) {
        String sql ="update user_account set user_username=?,user_date=?,user_password=?,user_tel=?,user_email=?,user_photo=? where user_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,user.getUser_Username(),user.getUser_Date(),user.getUser_Password(),user.getUser_Tel(),user.getUser_Email(),user.getUser_Photo(),user.getUser_Id());
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
        //根据id查询用户信息selectUserAccountById
    public User_Account selectUserAccountById(int id) {
        String sql = "select * from user_account where user_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        User_Account user = null;
        try {
            user = qr.query(sql,new BeanHandler<User_Account>(User_Account.class),id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User_Account selectUserAccountByUsername(String username) {
        String sql = "select * from user_account where user_username=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        User_Account user = null;
        try {
            user = qr.query(sql,new BeanHandler<User_Account>(User_Account.class),username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //查询所有用户
    public List<User_Account> selectUserAccount() {
        List<User_Account> userList= null;
        String sql = "select * from `user_account`";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            userList  = qr.query(sql,new BeanListHandler<User_Account>(User_Account.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
        //删除用户
    public void deleteUserAccountId(int id) {
        String sql = "delete from `user_account` where user_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
