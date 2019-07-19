package com.book.service;

import java.io.IOException;
import java.util.List;

public interface IBookDirService {
    //获取目标书籍目录
    List<String> getBookDir(int BookId);
    //生成目标书籍目录
    void setBookDir(int BookId) throws IOException;
    //更新目标书籍目录
    void updateBookDir(int BookId);
}
