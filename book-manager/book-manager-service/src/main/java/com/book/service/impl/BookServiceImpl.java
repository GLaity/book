package com.book.service.impl;

import com.book.dao.IBookContendDao;
import com.book.dao.IBookDao;
import com.book.dao.IBookDirDao;
import com.book.dao.IBookExtendDao;
import com.book.dao.impl.BookContendDaoImpl;
import com.book.dao.impl.BookDaoImpl;
import com.book.dao.impl.BookDirDaoImpl;
import com.book.dao.impl.BookExtendImpl;
import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Contend;
import com.book.pojo.Book_Extend;
import com.book.service.IBookService;

import java.util.List;

public class BookServiceImpl implements IBookService {
    IBookDao bookDao = new BookDaoImpl();
    IBookContendDao bookContendDao = new BookContendDaoImpl();
    IBookExtendDao bookExtendDao = new BookExtendImpl();
    IBookDirDao bookDirDao = new BookDirDaoImpl();

    public void insertNewBook(Book_Basic book, String bookPath) {
        int bookId = book.getBook_Id();
        Book_Contend book_contend = new Book_Contend(bookId,bookPath);
        bookDao.insertBook(book);
        bookContendDao.insertBookContend(book_contend);

    }

    public void updateBookInformation(Book_Basic book) {
        bookDao.insertBook(book);
    }

    public void updateBookAllInformation(Book_Basic book,String bookPath){
        int bookId = book.getBook_Id();
        Book_Contend book_contend = new Book_Contend(bookId,bookPath);
        bookDao.updateBook(book);
        bookContendDao.updateBookContend(book_contend);
    }

    public void deleteBook(int bookId) {
        bookContendDao.deleteBookContend(bookId);
        bookDao.deleteBookById(bookId);
    }

    @Override
    public List<String> getBookDir(int bookId) {
        return bookDirDao.getBookDir(bookId);
    }

    @Override
    public Book_Basic findBookBasicById(int bookId) {
        return bookDao.selectBookById(bookId);
    }

    @Override
    public Book_Extend findBookExtendById(int bookId) {
        return bookExtendDao.selectBookById(bookId);
    }
}
