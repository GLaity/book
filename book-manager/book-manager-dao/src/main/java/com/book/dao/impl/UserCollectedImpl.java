package com.book.dao.impl;

import com.book.dao.IUserCollectedDao;
import com.book.pojo.Book_Basic;
import com.book.pojo.User_Book_Collection;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class UserCollectedImpl implements IUserCollectedDao {
    @Override
    public void insertUserCollect(User_Book_Collection userBookCollection) {
        String sql = "insert into user_book_collection values(?,?)";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,userBookCollection.getUser_Id(),userBookCollection.getBook_Id());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteUserCollect(int userId, int bookId) {
        String sql = "delete from user_book_collection where user_id=? and book_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,userId,bookId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<Book_Basic> countUserCollectList(int userId) {
        String sql = "SELECT * FROM book_basic WHERE book_id in (SELECT book_id FROM user_book_collection WHERE user_id = ?)";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        List<Book_Basic> bookBasic = null;
        try {
            bookBasic = qr.query(sql,new BeanListHandler<>(Book_Basic.class),userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookBasic;
    }
}
