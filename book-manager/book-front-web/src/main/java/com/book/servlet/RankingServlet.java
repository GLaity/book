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

@WebServlet("/ranking")
public class RankingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        IBookService bookService = new BookServiceImpl();
        List<Book_Basic> queueBookVisited = bookService.queueByVisited();
        List<Book_Basic> queueBookCollected = bookService.queueByCollected();
        List<Book_Basic> queueBookBought = bookService.queueByBought();
        List<Integer> numVisited = new ArrayList<>();
        List<Integer> numCollected = new ArrayList<>();
        List<Integer> numBought = new ArrayList<>();
        for (Book_Basic bookBasic:queueBookVisited){
            numVisited.add(bookService.findBookExtendById(bookBasic.getBook_Id()).getBook_Visited());
        }
        for (Book_Basic bookBasic:queueBookCollected){
            numCollected.add(bookService.findBookExtendById(bookBasic.getBook_Id()).getBook_Collected());
        }
        for (Book_Basic bookBasic:queueBookBought){
            numBought.add(bookService.findBookExtendById(bookBasic.getBook_Id()).getBook_Bought());
        }
        req.setAttribute("queueBookVisited",queueBookVisited);
        req.setAttribute("queueBookCollected",queueBookCollected);
        req.setAttribute("queueBookBought", queueBookBought);
        req.setAttribute("numVisited",numVisited);
        req.setAttribute("numCollected",numCollected);
        req.setAttribute("numBought",numBought);
        req.getRequestDispatcher("ranking.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
