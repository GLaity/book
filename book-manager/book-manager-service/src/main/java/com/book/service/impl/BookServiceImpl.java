package com.book.service.impl;

import com.book.dao.IBookContendDao;
import com.book.dao.IBookDao;
import com.book.dao.impl.BookContendDaoImpl;
import com.book.dao.impl.BookDaoImpl;
import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Contend;
import com.book.service.IBookService;

public class BookServiceImpl implements IBookService {
    IBookDao bookDao = new BookDaoImpl();
    IBookContendDao bookContendDao = new BookContendDaoImpl();

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
}
