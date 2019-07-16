package com.book.dao;

import java.io.IOException;
import java.util.List;

public interface IBookDirDao {
    //获取目标书籍目录
    List<String> getBookDir(int BookId);
    //生成目标书籍目录
    void setBookDir(int BookId) throws IOException;
    //更新目标书籍目录
    void updateBookDir(int BookId);
}
