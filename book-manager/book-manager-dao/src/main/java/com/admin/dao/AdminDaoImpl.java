package com.admin.dao;

import com.book.pojo.Admin;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import java.sql.SQLException;

public class AdminDaoImpl implements AdminDao {

    public Admin selectPwdById(String adminid) {
        Admin admin =null;
        String sql="select * from  `admin` where `admin_id`=?";
        QueryRunner qr =new QueryRunner(JDBCUtils.getDataSource());
        try {
           admin = qr.query(sql,new BeanHandler<Admin>(Admin.class),adminid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
}
