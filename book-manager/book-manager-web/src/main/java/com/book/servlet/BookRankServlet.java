package com.book.servlet;

import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Extend;
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

@WebServlet("bookRank")
public class BookRankServlet extends HttpServlet {
    IBookService bookService = new BookServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fun = request.getParameter("_method");
        switch (fun){
            case "visit":
                bookVisited(request,response);
                break;
            case "collect":
                bookCollested(request,response);
                break;
            case "bought":
                bookBought(request,response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    private void bookCollested(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Book_Basic> queueBookCollected = bookService.queueByCollected();
        List<Book_Basic> queueBookCollected = bookService.queueAllByCollected();
        List<Integer> numCollected = new ArrayList<>();
        for (Book_Basic bookBasic:queueBookCollected){
            numCollected.add(bookService.findBookExtendById(bookBasic.getBook_Id()).getBook_Collected());
        }
        request.setAttribute("title","收藏量排行");
        request.setAttribute("queueBook",queueBookCollected);
        request.setAttribute("num",numCollected);
        request.getRequestDispatcher("bookRank.jsp").forward(request,response);
    }
    private void bookVisited(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Book_Basic> queueBookVisited = bookService.queueByVisited();
        List<Book_Basic> queueBookVisited = bookService.queueAllByVisited();
        List<Integer> numVisited = new ArrayList<>();
        for (Book_Basic bookBasic:queueBookVisited){
            numVisited.add(bookService.findBookExtendById(bookBasic.getBook_Id()).getBook_Visited());
        }
        request.setAttribute("title","浏览量排行");
        request.setAttribute("queueBook",queueBookVisited);
        request.setAttribute("num",numVisited);
        request.getRequestDispatcher("bookRank.jsp").forward(request,response);
    }
    private void bookBought(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Book_Basic> queueBookBought = bookService.queueByBought();
        List<Book_Basic> queueBookBought = bookService.queueAllByBought();
        List<Integer> numBought = new ArrayList<>();
        for (Book_Basic bookBasic:queueBookBought){
            numBought.add(bookService.findBookExtendById(bookBasic.getBook_Id()).getBook_Bought());
        }
        request.setAttribute("title","销量排行");
        request.setAttribute("queueBook", queueBookBought);
        request.setAttribute("num",numBought);
        request.getRequestDispatcher("bookRank.jsp").forward(request,response);
    }
}
