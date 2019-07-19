package com.book.service.impl;

import com.book.dao.IBookContendDao;
import com.book.dao.IBookExtendDao;
import com.book.dao.IUserBookShelfDao;
import com.book.dao.impl.BookContendDaoImpl;
import com.book.dao.impl.BookExtendImpl;
import com.book.dao.impl.UserBookShelfImpl;
import com.book.pojo.Book_Basic;
import com.book.pojo.User_Book_Bought;
import com.book.pojo.User_Book_Collection;
import com.book.service.IUserBookShelfService;

import java.util.List;

public class UserBookShelfServiceImpl implements IUserBookShelfService {
    @Override
    public void addUserCollect(User_Book_Collection userBookCollection) {
        IUserBookShelfDao userBookShelfDao = new UserBookShelfImpl();
        userBookShelfDao.insertUserCollect(userBookCollection);
    }

    @Override
    public List<Book_Basic> queryUserCollectList(int userId) {
        IUserBookShelfDao userBookShelfDao = new UserBookShelfImpl();
        List<Book_Basic> bookBasic = userBookShelfDao.countUserCollectList(userId);
        return bookBasic;
    }

    @Override
    public void removeCollected(int userId, int bookId) {
        IUserBookShelfDao userBookShelfDao = new UserBookShelfImpl();
        userBookShelfDao.deleteUserCollect(userId,bookId);
        IBookExtendDao bookExtendDao = new BookExtendImpl();
        bookExtendDao.reduceBookCollected(bookId);
    }

    @Override
    public void addUserBought(int userId, int bookId) {
        IUserBookShelfDao userBookShelfDao = new UserBookShelfImpl();
        User_Book_Bought userBookBought = new User_Book_Bought();
        userBookBought.setBook_Id(bookId);
        userBookBought.setUser_Id(userId);
        userBookShelfDao.insertUserBought(userBookBought);
    }

    @Override
    public List<Book_Basic> queryUserBoughtList(int userId) {
        IUserBookShelfDao userBookShelfDao = new UserBookShelfImpl();
        List<Book_Basic> bookBasic = userBookShelfDao.countUserBoughtList(userId);
        return bookBasic;
    }

    @Override
    public void removeBought(int userId, int bookId) {
        IUserBookShelfDao userBookShelfDao = new UserBookShelfImpl();
        userBookShelfDao.deleteUserBought(userId,bookId);
    }
}
