package com.book.dao;

import com.book.pojo.Book_Basic;

import java.util.List;

public interface IBookTypeDao {
    //根据小说类别Id获取小说列表
    List<Book_Basic> selectBookByTypeId(int TypeId);
}
