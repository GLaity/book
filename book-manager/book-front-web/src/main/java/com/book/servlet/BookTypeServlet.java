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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/booktype")
public class BookTypeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("_method");
        switch (method){
            case "type":
                bookType(req, resp);
        }

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    //获取类别中的所有书
    public void bookType(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int typeId = Integer.valueOf(req.getParameter("typeId"));
        IBookService bookService = new BookServiceImpl();
        Book_Type bookType = bookService.fintBookTypeByTypeId(typeId);
        List<Book_Basic> bookBasicList = bookService.findBookByTypeId(typeId);

        List<String> pathList = new ArrayList<>();
        for(Book_Basic book_basic : bookBasicList){

            pathList.add(bookService.findPathById(book_basic.getBook_Id()));
        }
        req.setCharacterEncoding("UTF-8");
        req.setAttribute("pathList",pathList);
        req.setAttribute("bookType",bookType);
        req.setAttribute("bookBasicList",bookBasicList);
        req.getRequestDispatcher("type.jsp").forward(req,resp);
    }
}
