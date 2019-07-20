package com.book.servlet;

import com.book.dao.IAdviceDao;
import com.book.dao.impl.AdviceDaoImpl;
import com.book.pojo.Advice;
import com.book.pojo.Book_Basic;
import com.book.pojo.User_Account;
import com.book.pojo.User_Cost;
import com.book.service.IAdviceService;
import com.book.service.IBookService;
import com.book.service.IUserService;
import com.book.service.impl.AdviceServiceImpl;
import com.book.service.impl.BookServiceImpl;
import com.book.service.impl.IUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("advice.do")
public class AdivceControlerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fun = request.getParameter("_method");
        switch (fun){
            case "getadvice":
                try {
                    getadvice(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                delete(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    private void getadvice(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        IAdviceService adviceService = new AdviceServiceImpl();
        IBookService bookService=new BookServiceImpl();
        IUserService userService = new IUserServiceImpl();
        Book_Basic book_basic=new Book_Basic();
        List<Advice> advices = adviceService.findAdviceAll();
        List<String> bookTitles=new ArrayList<>();
        List<String> username=new ArrayList<>();
        for (Advice advice:advices){
//            numCollected.add(bookService.findBookExtendById(bookBasic.getBook_Id()).getBook_Collected());
            username.add(userService.findUserById(advice.getUser_Id()).getUser_Username());
            int bookId=advice.getBook_Id();
//            User_Account user = userService.findUserById(advice.getUser_Id());
//            username.add(user.getUser_Username());
            book_basic =bookService.findBookBasicById(bookId);
            String bookTitle =book_basic.getBook_Title();
            bookTitles.add(bookTitle);
        }
        request.setAttribute("username",username);
        request.setAttribute("bookTitles",bookTitles);
        request.setAttribute("advices",advices);
        request.getRequestDispatcher("adviceControler.jsp").forward(request,response);
    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adviceId = Integer.valueOf(request.getParameter("adviceId"));
        IAdviceService adviceService = new AdviceServiceImpl();
        adviceService.removeAdvice(adviceId);
        List<Advice> advices = adviceService.findAdviceAll();
        request.setAttribute("advices",advices);
        request.getRequestDispatcher("adviceControler.jsp").forward(request,response);
    }
}
