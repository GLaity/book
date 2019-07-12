package com.book.dao.impl;

import com.book.dao.IAdviceDao;
import com.book.pojo.Advice;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdviceDaoImpl implements IAdviceDao {

    private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

    @Override
    public void insertAdvice(Advice advice) throws SQLException {
        String adStr = "insert into advice(advice_text,advice_level,book_id,user_id,advice_date) values (?,?,?,?,date(NOW()))";
        qr.update(adStr,advice.getAdvice_Text(),advice.getAdvice_Level(),advice.getBook_Id(),advice.getUser_Id());
    }

    @Override
    public void deleteAdvice(int advice_Id) throws SQLException {
        String adStr = "delete from advice where advice_id = ?";
        qr.update(adStr,advice_Id);
    }

    @Override
    public void updateAdvice(Advice advice) throws SQLException {
        String adStr = "update advice set advice_text=?, advice_date=date(NOW()) where advice_id=?";
        qr.update(adStr,advice.getAdvice_Text(),advice.getAdvice_Id());
    }

    @Override
    public Advice select(int advice_Id) throws SQLException {
        String adStr = "select * from advice where advice_id = ?";
        Advice advice = null;
        advice = qr.query(adStr, new BeanHandler<>(Advice.class), advice_Id);
        return advice;
    }

    @Override
    public List<Advice> selectAll() throws SQLException {
        String adStr = "select * from advice";
        List<Advice> adviceList = null;
        adviceList = qr.query(adStr, new BeanListHandler<>(Advice.class));
        return adviceList;
    }

    @Override
    public List<Advice> selectByBook(int book_Id) throws SQLException {
        String adStr = "select * from advice where book_id = ?";
        List<Advice> adviceList = null;
        adviceList = qr.query(adStr, new BeanListHandler<>(Advice.class),book_Id);
        return adviceList;
    }

    @Override
    public List<Advice> selectByUser(int user_Id) throws SQLException {
        String adStr = "select * from advice where user_id = ?";
        List<Advice> adviceList = null;
        adviceList = qr.query(adStr, new BeanListHandler<>(Advice.class),user_Id);
        return adviceList;
    }
}
