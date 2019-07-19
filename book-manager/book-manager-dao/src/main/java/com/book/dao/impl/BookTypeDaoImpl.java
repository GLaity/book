package com.book.dao.impl;

import com.book.dao.IBookTypeDao;
import com.book.pojo.Book_Basic;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import com.book.pojo.Book_Type;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import java.sql.SQLException;
import java.util.List;

public class BookTypeDaoImpl implements IBookTypeDao {

    @Override
    public List<Book_Basic> selectBookByTypeId(int TypeId) {
        List<Book_Basic> books = null;
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "select book_id,book_title from book_basic where type_id=?";
        return null;
    }




    @Override
    public Book_Type selectAllBookTypeById(int type_Id) {
        String sql = "select * from book_type where type_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        Book_Type book_type = null;
        try {
            book_type = qr.query(sql,new BeanHandler<>(Book_Type.class),type_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book_type;
    }

    @Override
    public List<Book_Type> selectAllBookType() {
        String sql = "select * from book_type";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        List<Book_Type> bookList = null;
        try {
            bookList = qr.query(sql,new BeanListHandler<Book_Type>(Book_Type.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }


}
