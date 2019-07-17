package com.book.dao;

import com.book.pojo.Reply;

import java.sql.SQLException;
import java.util.List;

public interface IReplyDao {

    void insertReply(Reply reply) throws SQLException;

    void deleteReply(int reply_Id) throws SQLException;

    void deleteReplyByAdvice(int advice_Id) throws SQLException;

    Reply select(int reply_Id) throws SQLException;

    List<Reply> selectByAdvice(int advice_Id) throws SQLException;
}
