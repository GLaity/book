package com.book.dao;

import com.book.pojo.Advice;

import java.sql.SQLException;
import java.util.List;

public interface IAdviceDao {

    void insertAdvice(Advice advice) throws SQLException;

    void deleteAdvice(int advice_Id) throws SQLException;

    void updateAdvice(Advice advice) throws SQLException;

    Advice select(int advice_Id) throws SQLException;

    List<Advice> selectAll() throws SQLException;

    List<Advice> selectByBook(int book_Id) throws SQLException;

    List<Advice> selectByUser(int user_Id) throws SQLException;
}
