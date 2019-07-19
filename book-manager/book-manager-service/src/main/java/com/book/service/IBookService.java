package com.book.service;

import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Extend;
import com.book.pojo.Book_Type;

import java.util.List;

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

    List<String> getBookDir(int bookId);

    Book_Basic findBookBasicById(int bookId);
    Book_Extend findBookExtendById(int bookId);
    List<Book_Basic> findBookBasicAll();
    List<Book_Basic> findBookByTypeId(int typeId);
    List<Book_Basic> findBookBySearchName(String searchName);
    List<Book_Basic> queueByVisited();
    List<Book_Basic> queueByCollected();
    List<Book_Basic> queueByBought();

    List<Book_Basic> queueAllByVisited();
    List<Book_Basic> queueAllByCollected();
    List<Book_Basic> queueAllByBought();

    //根据类型id返回书籍信息
    List<Book_Type> findBookType();
    Book_Type fintBookTypeByTypeId(int type_Id);
    String findPathById(int bookId);
    //根据书的id更改收藏量浏览量    待写：购买量
    void modifyCollectedById(int bookId);
    void modifyVisitedById(int bookId);
    void modifyboughtById(int bookId);

    //根据小说id返回书籍章节数
    int findBookChapterByBookId(int bookId);
    //返回全部小说章节数
    List<Book_Extend> findAllBookChapters();
    //返回全部小说排行信息
    List<Book_Extend> findAllBookExtend();

}
