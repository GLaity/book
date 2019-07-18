package com.book.servlet;

import com.book.dao.IBookDirDao;
import com.book.pojo.Advice;
import com.book.pojo.Book_Basic;
import com.book.pojo.User_Account;
import com.book.service.IAdviceService;
import com.book.service.IBookService;
import com.book.service.impl.AdviceServiceImpl;
import com.book.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/personal")
public class PersonalServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("_method");
        if(method == null){
            execute(req, resp);
        } else {
            switch (method) {
                case "deleteAdvice":
                    deleteAdvice(req, resp);
                    break;

            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User_Account userAccount = (User_Account) session.getAttribute("user");
        IAdviceService adviceService = new AdviceServiceImpl();
        IBookService bookService = new BookServiceImpl();
        List<Advice> adviceList = adviceService.findAdviceByUser(userAccount.getUser_Id());
        List<Book_Basic> bookAdviceList = new ArrayList<>();
        for (Advice advice:adviceList){

            bookAdviceList.add(bookService.findBookBasicById(advice.getBook_Id()));
        }
        req.setAttribute("adviceList",adviceList);
        req.setAttribute("bookAdviceList",bookAdviceList);
        req.getRequestDispatcher("user.jsp").forward(req,resp);
    }

    public void deleteAdvice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        IAdviceService adviceService = new AdviceServiceImpl();
        int adviceId = Integer.valueOf(req.getParameter("adviceId"));
        adviceService.removeAdvice(adviceId);
        execute(req, resp);
    }
}
