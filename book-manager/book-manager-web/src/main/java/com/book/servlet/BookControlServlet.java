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

import static com.sun.javafx.fxml.expression.Expression.add;

@WebServlet("/book.do")
public class BookControlServlet extends HttpServlet {
    IBookDao bookDao = new BookDaoImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fun = request.getParameter("_method");
        switch (fun){
            case "getList":
                getList(request,response);
                break;
            case "add":
                add(request,response);
                break;
            case "remove":
                remove(request,response);
                break;
            case "update":
                update(request,response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


    private void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book_Basic> books = bookDao.selectAllBook();
        request.setAttribute("bookList",books);
        request.getRequestDispatcher("/addBook.jsp").forward(request,response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Book_Basic book = (Book_Basic) request.getAttribute("Book");
        bookDao.insertBook(book);
        request.getRequestDispatcher("/addBook.jsp").forward(request,response);
    }


    private void remove(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        int bookId = Integer.valueOf(request.getAttribute("deleteBook"));
        int bookId = Integer.valueOf(request.getParameter("bookId"));
        bookDao.deleteBookById(bookId);
        response.sendRedirect("/");
    }
    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.valueOf(request.getParameter("bookId"));
        List<Book_Basic> bookList = bookDao.selectAllBook();
        Book_Basic book = bookDao.selectBookById(bookId);
        request.setAttribute("book",book);
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("/add.jsp").forward(request,response);
    }


}
