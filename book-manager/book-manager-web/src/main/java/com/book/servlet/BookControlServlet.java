package com.book.servlet;

import com.book.pojo.Book_Basic;
import com.book.service.IBookService;
import com.book.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/book.do")
public class BookControlServlet extends HttpServlet {
    IBookService bookService = new BookServiceImpl();
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
            default:
                break;
        }
        List<Book_Basic> books = bookService.findBookBasicAll();
        request.setAttribute("bookList",books);
        request.getRequestDispatcher("bookControler.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


    private void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book_Basic> books = bookService.findBookBasicAll();
        request.setAttribute("bookList",books);
        request.getRequestDispatcher("bookControler.jsp").forward(request,response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Book_Basic book = (Book_Basic) request.getAttribute("Book");
        String bookPath = "D:\\Download\\" + book.getBook_Title();
        bookService.insertNewBook(book,bookPath);
        request.getRequestDispatcher("addproduct.jsp").forward(request,response);
    }
    private void remove(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        int bookId = Integer.valueOf(request.getAttribute("deleteBook"));
//        int empno = Integer.valueOf(req.getParameter("empno"));
        int bookId = Integer.valueOf(request.getParameter("bookId"));
        bookService.deleteBook(bookId);
        getList(request, response);
//        request.getRequestDispatcher("bookControler.jsp").forward(request,response);
    }
    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.valueOf(request.getParameter("bookId"));
        Book_Basic book_basic = bookService.findBookBasicById(bookId);
         book_basic.setBook_Title(request.getParameter("title"));
         book_basic.setType_Id(Integer.valueOf(request.getParameter("typeID")));
         book_basic.setBook_Context(request.getParameter("bookContext"));
         book_basic.setBook_Createdate(request.getParameter("creatDate"));
         bookService.updateBookInformation(book_basic);
        request.getRequestDispatcher("editbook.jsp").forward(request,response);
    }
}
