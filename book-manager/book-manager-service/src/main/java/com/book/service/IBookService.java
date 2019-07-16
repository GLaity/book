package com.book.service;

import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Extend;
import com.book.pojo.Book_Type;

import java.awt.print.Book;
import java.util.List;

public interface IBookService {
    //上传新书
    void insertNewBook(Book_Basic book, String bookPath);

    //更新书籍信息
    void updateBookInformation(Book_Basic book);

    //更新书籍全部信息
    void updateBookAllInformation(Book_Basic book, String bookPath);

    //下架书籍
    void deleteBook(int bookId);

    Book_Basic findBookBasicById(int bookId);
    Book_Extend findBookExtendById(int bookId);

    List<Book_Basic> findBookByTypeId(int typeId);

    //根据类型id返回书籍信息
    List<Book_Type> findBookType();
    Book_Type fintBookTypeByTypeId(int type_Id);
    String findPathById(int bookId);


}
