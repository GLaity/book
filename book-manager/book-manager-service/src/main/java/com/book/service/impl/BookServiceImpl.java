package com.book.service.impl;

import com.book.dao.IBookContendDao;
import com.book.dao.IBookDao;
import com.book.dao.IBookDirDao;
import com.book.dao.IBookExtendDao;
import com.book.dao.IBookTypeDao;
import com.book.dao.impl.BookContendDaoImpl;
import com.book.dao.impl.BookDaoImpl;
import com.book.dao.impl.BookDirDaoImpl;
import com.book.dao.impl.BookExtendImpl;
import com.book.dao.impl.BookTypeDaoImpl;
import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Contend;
import com.book.pojo.Book_Extend;
import com.book.pojo.Book_Type;
import com.book.service.IBookService;

import java.util.List;

public class BookServiceImpl implements IBookService {
    IBookDao bookDao = new BookDaoImpl();
    IBookContendDao bookContendDao = new BookContendDaoImpl();
    IBookExtendDao bookExtendDao = new BookExtendImpl();
    IBookTypeDao bookTypeDao = new BookTypeDaoImpl();
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

    @Override
    public List<Book_Basic> findBookBasicAll() {
        return bookDao.selectAllBook();
    }

    @Override
    public List<Book_Basic> findBookByTypeId(int typeId) {
        List<Book_Basic> books = bookDao.selectBookByType(typeId);
        return books;
    }

    @Override
    public List<Book_Basic> findBookBySearchName(String  searchName) {
        return bookDao.selectBookByLikeName(searchName);
    }

    @Override
    public List<Book_Type> findBookType() {
        List<Book_Type> book_typeList = bookTypeDao.selectAllBookType();
        return book_typeList;
    }

    @Override
    public Book_Type fintBookTypeByTypeId(int type_Id) {
        Book_Type book_type = bookTypeDao.selectAllBookTypeById(type_Id);
        return  book_type;
    }

    @Override
    public String findPathById(int bookId) {
        Book_Contend contend = bookContendDao.findBookContend(bookId);
        String path = contend.getBook_Contend();
        return path;
    }
}
