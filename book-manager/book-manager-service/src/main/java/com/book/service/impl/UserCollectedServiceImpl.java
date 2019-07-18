package com.book.service.impl;

import com.book.dao.IUserCollectedDao;
import com.book.dao.impl.UserCollectedImpl;
import com.book.pojo.Book_Basic;
import com.book.pojo.User_Book_Collection;
import com.book.service.IUserCollectedService;

import java.util.List;

public class UserCollectedServiceImpl implements IUserCollectedService {
    @Override
    public void addUserCollect(User_Book_Collection userBookCollection) {
        IUserCollectedDao userCollectedDao = new UserCollectedImpl();
        userCollectedDao.insertUserCollect(userBookCollection);
    }

    @Override
    public List<Book_Basic> queryUserCollectList(int userId) {
        IUserCollectedDao userCollectedDao = new UserCollectedImpl();
        List<Book_Basic> bookBasic = userCollectedDao.countUserCollectList(userId);
        return bookBasic;
    }
}
