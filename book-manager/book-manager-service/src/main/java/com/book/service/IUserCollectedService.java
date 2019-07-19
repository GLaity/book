package com.book.service;

import com.book.pojo.Book_Basic;
import com.book.pojo.User_Book_Collection;

import java.util.List;

public interface IUserCollectedService {
    //添加收藏信息
    void addUserCollect(User_Book_Collection userBookCollection);

    //查询用户收藏书的列表
    List<Book_Basic> queryUserCollectList(int userId);

    void removeCollected(int userId,int bookId);
}
