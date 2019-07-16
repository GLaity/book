package com.admin.dao;

import com.book.pojo.Admin;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import java.sql.SQLException;

public class AdminDaoImpl implements AdminDao {

    public Admin selectPwdByNameAndPwd(String admin_Name,String admin_Password) {
        Admin admin =null;
        String sql="SELECT  * FROM `admin` WHERE admin_name=? and admin_password=?";
        QueryRunner qr =new QueryRunner(JDBCUtils.getDataSource());
        try {
           admin = qr.query(sql,new BeanHandler<Admin>(Admin.class),admin_Name,admin_Password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    public Admin selectPwdByName(String admin_Name) {
        Admin admin =null;
        String sql="SELECT  * FROM `admin` WHERE admin_name=? and admin_password=?";
        QueryRunner qr =new QueryRunner(JDBCUtils.getDataSource());
        try {
            admin = qr.query(sql,new BeanHandler<Admin>(Admin.class),admin_Name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
}
