package com.book.dao.impl;

import com.book.dao.IBookDao;
import com.book.pojo.Book_Basic;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class BookDaoImpl implements IBookDao {
    @Override
    public void insertBook(Book_Basic book) {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
//        String sql = "insert into book_basic(book_id,book_title,book_context,type_id,writer_id,book_createdate) values(?,?,?,?,?,date(NOW()))";
        String sql = "insert into BOOK_BASIC(BOOK_TITLE,BOOK_CONTEXT,TYPE_ID,WRITER_ID,book_price,BOOK_CREATEDATE) values(?,?,?,?,?,date(NOW()))";
        try {
//            qr.update(sql,book.getBook_Id(),book.getBook_Title(),book.getBook_Context(),book.getType_Id(),book.getWriter_Id());
            qr.update(sql,book.getBook_Title(),book.getBook_Context(),book.getType_Id(),book.getWriter_Id(),book.getBook_Price());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateBook(Book_Basic book) {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        System.out.println(book.toString());
        String sql = "update book_basic set book_title=?,WRITER_ID=?,book_context=?,book_price=? where book_id=?";
        try {
//            qr.update(sql,book.getBook_Title(),book.getBook_Context(),book.getType_Id(),book.getWriter_Id(),book.getBook_Createdate(),book.getBook_Id());
            qr.update(sql,book.getBook_Title(),book.getWriter_Id(),book.getBook_Context(),book.getBook_Price(),book.getBook_Id());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteBookById(int book_Id) {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "delete from book_basic where book_id=?";
        try {
            qr.update(sql,book_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Book_Basic selectBookById(int book_Id) {
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        Book_Basic book = new Book_Basic();
        String sql = "select * from book_basic where book_id=?";
        try {
            book = qr.query(sql,new BeanHandler<Book_Basic>(Book_Basic.class),book_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    @Override
    public List<Book_Basic> selectBookByType(int type_Id) {
        List<Book_Basic> books = null;
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "select * from book_basic where type_id=?";
        try {
            books = qr.query(sql,new BeanListHandler<Book_Basic>(Book_Basic.class),type_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    @Override
    public List<Book_Basic> selectAllBook() {
        List<Book_Basic> books = null;
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "select * from book_basic";
        try {
            books = qr.query(sql,new BeanListHandler<Book_Basic>(Book_Basic.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    @Override
    public List<Book_Basic> selectBookByLikeName(String likeName) {
        List<Book_Basic> books = null;
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "select * from book_basic where book_title like '%" + likeName + "%'";
        try {
            books = qr.query(sql,new BeanListHandler<Book_Basic>(Book_Basic.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }
}
