package com.book.dao;

import com.book.pojo.Book_Basic;
import com.book.pojo.User_Book_Bought;
import com.book.pojo.User_Book_Collection;

import java.util.List;

public interface IUserBookShelfDao {
    //新增数据
    void insertUserCollect(User_Book_Collection userBookCollection);
    //根据用户id查询收藏的书的id
    //统计用户收藏书的列表
    List<Book_Basic> countUserCollectList(int userId);
    //删除收藏
    void deleteUserCollect(int userId,int bookId);

    //新增数据
    void insertUserBought(User_Book_Bought userBookCollection);
    //根据用户id查询收藏的书的id
    //统计用户收藏书的列表
    List<Book_Basic> countUserBoughtList(int userId);
    //删除收藏
    void deleteUserBought(int userId,int bookId);

}
