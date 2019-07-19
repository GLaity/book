package com.book.service.impl;

import com.book.dao.IBookDirDao;
import com.book.dao.impl.BookDirDaoImpl;
import com.book.service.IBookDirService;

import java.io.IOException;
import java.util.List;

public class BookDirServiceImpl implements IBookDirService {
    public List<String> getBookDir(int BookId) {
        IBookDirDao bookDir = new BookDirDaoImpl();
        List<String> dirList = bookDir.getBookDir(BookId);
        return dirList;
    }

    public void setBookDir(int BookId) throws IOException {
        IBookDirDao bookDir = new BookDirDaoImpl();
        bookDir.setBookDir(BookId);
    }

    public void updateBookDir(int BookId) {

    }
}
