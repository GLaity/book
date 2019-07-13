package com.book.dao.impl;

import com.book.dao.IReplyDao;
import com.book.pojo.Reply;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ReplyDaoImpl implements IReplyDao {

    private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

    @Override
    public void insertReply(Reply reply) throws SQLException {
        String adStr = "insert into reply(reply_text,reply_date,advice_id) values (?,?,?)";
        qr.update(adStr,reply.getReply_Text(),reply.getReply_Date(),reply.getAdvice_Id());
    }

    @Override
    public void deleteReply(int reply_Id) throws SQLException {
        String adStr = "delete from reply where reply_id = ?";
        qr.update(adStr,reply_Id);
    }

    @Override
    public void deleteReplyByAdvice(int advice_Id) throws SQLException {
        String adStr = "delete from reply where advice_id = ?";
        qr.update(adStr,advice_Id);
    }

    @Override
    public Reply select(int reply_Id) throws SQLException {
        String adStr = "select * from reply where reply_id = ?";
        return qr.query(adStr, new BeanHandler<>(Reply.class), reply_Id);
    }

    @Override
    public List<Reply> selectByAdvice(int advice_Id) throws SQLException {
        String adStr = "select * from reply where advice_id = ?";
        return qr.query(adStr, new BeanListHandler<>(Reply.class), advice_Id);
    }
}
