package com.book.servlet;

import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Type;
import com.book.service.IBookService;
import com.book.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/list")
public class BookListServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String condition = req.getParameter("condition");
        if(condition == null){
            execute(req,resp);
        } else {
            switch (condition){
                case "search":
                    String keyName = req.getParameter("value");
                    search(req,resp,keyName);
                    break;
                case "type":
                    int typeId = Integer.valueOf(req.getParameter("value"));
                    type(req, resp, typeId);
                    break;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void execute(HttpServletRequest req, HttpServletResponse resp) throws  ServletException,IOException {
        IBookService bookService = new BookServiceImpl();
        List<Book_Basic> bookBasicList = bookService.findBookBasicAll();
        req.setAttribute("bookBasicList",bookBasicList);
        req.getRequestDispatcher("bookList.jsp").forward(req,resp);
    }

    public void type(HttpServletRequest req, HttpServletResponse resp, int typeId) throws  ServletException,IOException {
        IBookService bookService = new BookServiceImpl();
        List<Book_Basic> bookBasicList = bookService.findBookByTypeId(typeId);
        Book_Type bookType = bookService.fintBookTypeByTypeId(typeId);
        req.setAttribute("bookType",bookType);
        req.setAttribute("bookBasicList",bookBasicList);
        req.getRequestDispatcher("bookList.jsp").forward(req,resp);
    }

    public void search(HttpServletRequest req, HttpServletResponse resp, String  keyName) throws  ServletException,IOException {
        IBookService bookService = new BookServiceImpl();
        List<Book_Basic> bookBasicList = bookService.findBookBySearchName(keyName);
        req.setAttribute("keyName",keyName);
        req.setAttribute("bookBasicList",bookBasicList);
        req.getRequestDispatcher("bookList.jsp").forward(req,resp);
    }
}
