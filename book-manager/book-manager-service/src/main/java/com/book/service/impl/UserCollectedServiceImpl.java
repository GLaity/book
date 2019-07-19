package com.book.service.impl;

import com.book.dao.IBookContendDao;
import com.book.dao.IBookExtendDao;
import com.book.dao.IUserBookShelfDao;
import com.book.dao.impl.BookContendDaoImpl;
import com.book.dao.impl.BookExtendImpl;
import com.book.dao.impl.UserBookShelfImpl;
import com.book.pojo.Book_Basic;
import com.book.pojo.User_Book_Collection;
import com.book.service.IUserCollectedService;

import java.util.List;

public class UserCollectedServiceImpl implements IUserCollectedService {
    @Override
    public void addUserCollect(User_Book_Collection userBookCollection) {
        IUserBookShelfDao userCollectedDao = new UserBookShelfImpl();
        userCollectedDao.insertUserCollect(userBookCollection);
    }

    @Override
    public List<Book_Basic> queryUserCollectList(int userId) {
        IUserBookShelfDao userCollectedDao = new UserBookShelfImpl();
        List<Book_Basic> bookBasic = userCollectedDao.countUserCollectList(userId);
        return bookBasic;
    }

    @Override
    public void removeCollected(int userId, int bookId) {
        IUserBookShelfDao userCollectedDao = new UserBookShelfImpl();
        userCollectedDao.deleteUserCollect(userId,bookId);
        IBookExtendDao bookExtendDao = new BookExtendImpl();
        bookExtendDao.reduceBookCollected(bookId);
    }
}
