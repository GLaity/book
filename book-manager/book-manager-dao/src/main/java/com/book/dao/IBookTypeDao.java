package com.book.dao;


import com.book.pojo.Book_Basic;

import com.book.pojo.Book_Type;

import java.util.List;

public interface IBookTypeDao {
    //根据小说类别Id获取小说列表
    List<Book_Basic> selectBookByTypeId(int TypeId);

    Book_Type selectAllBookTypeById(int type_Id);
    List<Book_Type> selectAllBookType();

}
