package com.book.read.impl;

import com.book.dao.IBookContendDao;
import com.book.dao.impl.BookContendDaoImpl;
import com.book.pojo.Book_Contend;
import com.book.read.IBookReadService;

public class BookReadServiceImpl implements IBookReadService {
    public String readTargetBook(int BookId, int ChapterId) {
        IBookContendDao bookContendDao = new BookContendDaoImpl();
        Book_Contend book = null;
        book = bookContendDao.findBookContend(BookId);
        String ChapterIdStr = null;
        if (0 <= ChapterId && 9>= ChapterId){
            ChapterIdStr = "000" + ChapterId;
        }else if (10 <= ChapterId && 99>= ChapterId){
            ChapterIdStr = "00" + ChapterId;
        }else if (100 <= ChapterId && 999>= ChapterId){
            ChapterIdStr = "0" + ChapterId;
        }else{
            ChapterIdStr = ChapterId + "";
        }

        String path = book.getBook_Contend()+ "/" +ChapterIdStr + ".txt";
        return path;
    }
}
