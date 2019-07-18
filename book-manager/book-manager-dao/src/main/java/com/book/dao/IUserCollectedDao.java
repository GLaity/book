package com.book.dao;

import com.book.pojo.Book_Basic;
import com.book.pojo.User_Book_Collection;

import java.util.List;

public interface IUserCollectedDao {
    //新增数据
    void insertUserCollect(User_Book_Collection userBookCollection);
    //根据用户id查询收藏的书的id
    //统计用户收藏书的列表
    List<Book_Basic> countUserCollectList(int userId);
}
