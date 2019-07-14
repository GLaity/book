package com.book.dao;

import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Extend;

import java.util.List;

public interface IBookExtendDao {
    //新增书籍扩展信息
    void insertBook(int book_Id);
    //根据id查询是否完结查询书籍
    boolean isEnd(int book_Id);
    //根据收藏量查询书籍
    List<Integer> selectBookByCollected(int low, int height);
    //根据浏览量查询书籍
    List<Integer> selectBookVisited(int low,int height);
    //根据购买量查询书籍
    List<Integer> selectBookBought(int low,int height);

    //根据id查询书籍信息
    Book_Extend selectBookById(int book_Id);
    //根据id更新书的浏览量
    void updateBookVisitById(int book_Id);
    //根据id更新书的收藏量
    void updateBookCollectBy(int book_Id);
    //根据id更新书的购买量
    void updateBookBoughtBy(int book_Id);

}
