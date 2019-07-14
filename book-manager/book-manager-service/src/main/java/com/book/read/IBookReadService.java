package com.book.read;

public interface IBookReadService {
    //根据书籍ID，章节号返回文本路径
    String readTargetBook(int BookId,int ChapterId);

}
