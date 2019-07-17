package com.book.service.impl;

import com.book.dao.IAdviceDao;
import com.book.dao.IReplyDao;
import com.book.dao.impl.AdviceDaoImpl;
import com.book.dao.impl.ReplyDaoImpl;
import com.book.pojo.Advice;
import com.book.pojo.Reply;
import com.book.service.IAdviceService;

import java.sql.SQLException;
import java.util.List;

public class AdviceServiceImpl implements IAdviceService {

    IAdviceDao adviceDao = new AdviceDaoImpl();
    IReplyDao replyDao = new ReplyDaoImpl();

    public void addAdvice(Advice advice) {
        try {
            adviceDao.insertAdvice(advice);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeAdvice(int advice_Id) {
        try {
            adviceDao.deleteAdvice(advice_Id);
            replyDao.deleteReplyByAdvice(advice_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void modifyAdvice(Advice advice) {
        try {
            adviceDao.updateAdvice(advice);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Advice findAdviceById(int advice_Id) {
        Advice advice = null;
        try {
            advice = adviceDao.select(advice_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return advice;
    }

    public List<Advice> findAdviceAll() {
        List<Advice> adviceList = null;
        try {
            adviceList = adviceDao.selectAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adviceList;
    }

    public List<Advice> findAdviceByBook(int book_Id) {
        List<Advice> adviceList = null;
        try {
            adviceList = adviceDao.selectByBook(book_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adviceList;
    }

    public List<Advice> findAdviceByUser(int user_Id) {
        List<Advice> adviceList = null;
        try {
            adviceList = adviceDao.selectByUser(user_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adviceList;
    }

    public void addReply(Reply reply) {
        try {
            replyDao.insertReply(reply);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeReply(int reply_Id) {
        try {
            replyDao.deleteReply(reply_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Reply findReplyById(int reply_id) {
        Reply reply = null;
        try {
            reply = replyDao.select(reply_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reply;
    }

    public List<Reply> findReplyByAdvice(int advice_Id) {
        List<Reply> replies = null;
        try {
            replies = replyDao.selectByAdvice(advice_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return replies;
    }
}
