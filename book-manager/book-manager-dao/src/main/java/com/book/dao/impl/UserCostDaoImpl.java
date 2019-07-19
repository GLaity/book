package com.book.dao.impl;

import com.book.dao.IUserCostDao;
import com.book.pojo.User_Cost;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class UserCostDaoImpl implements IUserCostDao {

    private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

    @Override
    public void insertCost(User_Cost userCost) throws SQLException {
        String adStr = "insert into user_cost(user_id,book_id,cost_money,cost_other,cost_date) values (?,?,?,?,date(NOW()))";
        qr.update(adStr,userCost.getUser_Id(),userCost.getBook_Id(),userCost.getCost_Money(),userCost.getCost_Other());
    }

    @Override
    public void deleteCost(int costId) throws SQLException {
        String adStr = "delete from user_cost where cost_id = ?";
        qr.update(adStr,costId);
    }

    @Override
    public User_Cost selectCostByCostId(int costId) throws SQLException {
        String adStr = "select * from user_cost where cost_id = ?";
        return qr.query(adStr, new BeanHandler<>(User_Cost.class), costId);
    }

    @Override
    public List<User_Cost> selectCostByUserId(int userId) throws SQLException {
        String adStr = "select * from user_cost where user_id = ?";
        return qr.query(adStr, new BeanListHandler<>(User_Cost.class), userId);
    }

    @Override
    public List<User_Cost> selectCostByBookId(int bookId) throws SQLException {
        String adStr = "select * from user_cost where book_id = ?";
        return qr.query(adStr, new BeanListHandler<>(User_Cost.class), bookId);
    }
}
