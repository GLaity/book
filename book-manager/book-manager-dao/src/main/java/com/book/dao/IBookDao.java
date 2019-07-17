package com.book.dao;

import com.book.pojo.Book_Basic;

import java.util.List;

public interface IBookDao {
    //新增书籍
    public void insertBook(Book_Basic book);
    //更新书籍信息
    public void updateBook(Book_Basic book);
    //下架书籍
    public void deleteBookById(int book_Id);
    //根据ID 查询书籍
    public Book_Basic selectBookById(int book_Id);
    //根据分类 查询书籍
    public List<Book_Basic> selectBookByType(int type_Id);
    //查询全部书籍
    public  List<Book_Basic> selectAllBook();



}