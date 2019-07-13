package com.book.dao.impl;

import com.book.dao.IBookContendDao;
import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Contend;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.columns.StringColumnHandler;

import java.sql.SQLException;

public class BookContendDaoImpl implements IBookContendDao {

    @Override
    public void insertBookContend(Book_Contend contend) {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "insert into BOOK_CONTEND(BOOK_ID,BOOK_CONTEND) VALUES (?,?)";
        try {
            qr.update(sql,contend.getBook_Id(),contend.getBook_Contend());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteBookContend(int BookId) {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "delete from BOOK_CONTEND where book_id=?";
        try {
            qr.update(sql,BookId);
        } catch (SQLException e) {
            e.printStackTrace();
        }    }

    @Override
    public Book_Contend findBookContend(int BookId) {
//    public String findBookContend(int BookId) {
        Book_Contend contend = null;
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "select BOOK_CONTEND from BOOK_CONTEND where book_id=?";
        try {
            contend = qr.query(sql,new BeanHandler<Book_Contend>(Book_Contend.class),BookId);
//            contend = qr.query(sql,new ScalarHandler(),BookId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contend;
    }
}
