package com.book.dao;

import com.book.pojo.Book_Type;

import java.util.List;

public interface IBookTypeDao {
    Book_Type selectAllBookTypeById(int type_Id);
    List<Book_Type> selectAllBookType();
}
