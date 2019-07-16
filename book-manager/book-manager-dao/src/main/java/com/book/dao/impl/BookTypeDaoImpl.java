package com.book.dao.impl;

import com.book.dao.IBookTypeDao;
import com.book.pojo.Book_Basic;
import com.book.util.JDBCUtils;
import com.sun.org.apache.bcel.internal.generic.Select;
import org.apache.commons.dbutils.QueryRunner;

import java.util.List;

public class BookTypeDaoImpl implements IBookTypeDao {

    @Override
    public List<Book_Basic> selectBookByTypeId(int TypeId) {
        List<Book_Basic> books = null;
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        String sql = "select book_id,book_title from book_basic where type_id=?";
        return null;
    }
//    List<Book_Basic> books = null;
//    QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
//    String sql = "select * from book_basic where type_id=?";
//        try {
//        books = qr.query(sql,new BeanListHandler<Book_Basic>(Book_Basic.class),type_Id);
//    } catch (SQLException e) {
//        e.printStackTrace();
//    }
//        return books;
}
