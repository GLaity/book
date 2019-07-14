package com.book.dao;

import com.book.pojo.Book_Contend;

public interface IBookContendDao {
    //新增小说路径
    void insertBookContend(Book_Contend contend);
    //更新小说路径
    void updateBookContend(Book_Contend contend);
    //删除小说路径
    void deleteBookContend(int BookId);
    //查询小说路径
    Book_Contend findBookContend(int BookId);
//    String findBookContend(int BookId);
}
