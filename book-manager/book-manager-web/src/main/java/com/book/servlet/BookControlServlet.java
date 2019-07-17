package com.book.servlet;

import com.book.dao.IBookDao;
import com.book.dao.impl.BookDaoImpl;
import com.book.pojo.Book_Basic;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/book.do")
public class BookControlServlet extends HttpServlet {
    IBookDao bookDao = new BookDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fun = req.getParameter("_method");
        switch (fun){
            case "getList":
                getList(req,resp);
                break;
            case "add":
                add(req,resp);
                break;
            case "remove":
                remove(req,resp);
                break;
            case "update":
                update(req,resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
    private void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Book_Basic book = (Book_Basic) req.getAttribute("Book");
        bookDao.insertBook(book);
        req.getRequestDispatcher("/userinformation.jsp").forward(req,resp);
    }
    private void getList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book_Basic> books = bookDao.selectAllBook();
        req.setAttribute("bookList",books);
        req.getRequestDispatcher("/bookControler.jsp").forward(req,resp);
    }
    private void remove(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        bookDao.deleteBookById(bookId);
        req.getRequestDispatcher("/bookControler.jsp").forward(req,resp);
    }
    private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        Book_Basic book_basic=bookDao.selectBookById(bookId);
        book_basic.setBook_Title(req.getParameter("title"));
        book_basic.setType_Id(Integer.valueOf(req.getParameter("typeID")));
        book_basic.setBook_Context(req.getParameter("bookContext"));
        book_basic.setBook_Createdate(req.getParameter("creatDate"));
        bookDao.updateBook(book_basic);
        req.getRequestDispatcher("/editbook.jsp").forward(req,resp);
    }
}
