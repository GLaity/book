package com.book.dao.impl;

import com.book.dao.IBookExtendDao;
import com.book.pojo.Book_Extend;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookExtendImpl implements IBookExtendDao {

    @Override
    public void insertBook(int book_Id) {
        String sql = "insert into book_extend values (?,0,0,0,0.0)";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,book_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean isEnd(int book_Id) {
        String sql ="select book_isend from book_extend where book_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        int flag = 2;
        try {
            flag = qr.query(sql,new BeanHandler<>(Integer.class),book_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(flag==1) {
            return true;
        }
        return false;
    }

    @Override
    public List<Integer> selectBookByCollected(int low, int height) {
        String sql = "select book_id from book_extend where book_collected between ? and ?";
        return selectBook(sql,low,height);
    }

    @Override
    public List<Integer> selectBookVisited(int low, int height) {
        String sql = "select book_id from book_extend where book_visited between ? and ?";
        return selectBook(sql,low,height);
    }

    @Override
    public List<Integer> selectBookBought(int low, int height) {
        String sql = "select book_id from book_extend where book_bought between ? and ?";
        return selectBook(sql,low,height);
    }

    @Override
    public Book_Extend selectBookById(int book_Id) {
        String sql = "select * from book_extend where book_id=?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        Book_Extend book_extend = null;
        try {
            book_extend = qr.query(sql,new BeanHandler<>(Book_Extend.class),book_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book_extend;
    }

    @Override
    public void updateBookVisitById(int book_Id) {
        String sql = "update book_extend set book_visited=? where book_id=?";
        IBookExtendDao bookExtendDao = new BookExtendImpl();
        Book_Extend book_extend = bookExtendDao.selectBookById(book_Id);
        updateBook(sql,book_extend.getBook_Visited(),book_Id);
    }

    @Override
    public void updateBookCollectBy(int book_Id) {
        String sql = "update book_extend set book_collected=? where book_id=?";
        IBookExtendDao bookExtendDao = new BookExtendImpl();
        Book_Extend book_extend = bookExtendDao.selectBookById(book_Id);
        updateBook(sql,book_extend.getBook_Collected(),book_Id);
    }

    @Override
    public void updateBookBoughtBy(int book_Id) {
        String sql = "update book_extend set book_bought=? where book_id=?";
        IBookExtendDao bookExtendDao = new BookExtendImpl();
        Book_Extend book_extend = bookExtendDao.selectBookById(book_Id);
        updateBook(sql,book_extend.getBook_Bought(),book_Id);
    }
//
    private List<Integer> selectBook(String sql,int low,int height){
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        List<Integer> arr = null;
        try {
            arr = qr.query(sql,new BeanListHandler<>(Integer.class),low,height);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }
    @Override
    public List<Integer> queueByVisited() {
        String sql = "select book_id from book_extend order by book_visited desc limit 8";
        List<Object[]> tempList = null;
        List<Integer> bookIdList = new ArrayList<>();
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            tempList = qr.query(sql, new ArrayListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (Object[] ob:tempList){
            bookIdList.add(Integer.valueOf(String.valueOf(ob[0])));
        }
        return bookIdList;
    }

    @Override
    public List<Integer> queueByCollected() {
        String sql = "select book_id from book_extend order by book_collected desc limit 8";
        List<Object[]> tempList = null;
        List<Integer> bookIdList = new ArrayList<>();
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            tempList = qr.query(sql, new ArrayListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (Object[] ob:tempList){
            bookIdList.add(Integer.valueOf(String.valueOf(ob[0])));
        }
        return bookIdList;
    }

    @Override
    public List<Integer> queueByBought() {
        String sql = "select book_id from book_extend order by book_bought desc limit 8";
        List<Object[]> tempList = null;
        List<Integer> bookIdList = new ArrayList<>();
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            tempList = qr.query(sql, new ArrayListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (Object[] ob:tempList){
            bookIdList.add(Integer.valueOf(String.valueOf(ob[0])));
        }
        return bookIdList;
    }

    private void updateBook(String sql, int num,int book_Id){
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        try {
            qr.update(sql,num+1,book_Id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
