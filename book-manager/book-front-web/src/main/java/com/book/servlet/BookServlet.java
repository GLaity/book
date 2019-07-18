package com.book.servlet;

import com.book.pojo.Advice;
import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Extend;
import com.book.pojo.User_Account;
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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/book")
public class BookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String method = req.getParameter("_method");
        if(method == null){
            execute(req, resp);
        } else {
            switch (method){
                case "addAdvice" :
                    addAdvice(req, resp);
                    break;
            }
        }

//        try {
//            String forwardPath =  (String)this.getClass().getMethod(method,HttpServletRequest.class,HttpServletResponse.class).invoke(this,req,resp);
//            if(forwardPath != null){
//                req.getRequestDispatcher(forwardPath).forward(req,resp);
//            }
//
//        } catch (IllegalAccessException e) {
//            e.printStackTrace();
//        } catch (InvocationTargetException e) {
//            e.printStackTrace();
//        } catch (NoSuchMethodException e) {
//            e.printStackTrace();
//        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }


    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        IBookService bookService = new BookServiceImpl();
        IUserService userService = new IUserServiceImpl();
        Book_Basic bookBasic = bookService.findBookBasicById(bookId);
        Book_Extend bookExtend = bookService.findBookExtendById(bookId);
        List<String> bookDir = bookService.getBookDir(bookId);
        req.setAttribute("bookBasic",bookBasic);
        req.setAttribute("bookExtend",bookExtend);
        req.setAttribute("bookDir",bookDir);

        IAdviceService adviceService = new AdviceServiceImpl();
        List<Advice> adviceList = adviceService.findAdviceByBook(bookId);
        List<User_Account> adviceUserList = new ArrayList<>();
        for (Advice advice:adviceList){
            adviceUserList.add(userService.findUserById(advice.getUser_Id()));
        }
        req.setAttribute("adviceUserList", adviceUserList);
        req.setAttribute("adviceList",adviceList);

        req.getRequestDispatcher("bookDetails.jsp").forward(req,resp);
        return null;
    }

    public String addAdvice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String adviceText = req.getParameter("adviceText");
        int adviceLevel = Integer.valueOf(req.getParameter("adviceLevel"));
        int bookId = Integer.parseInt(req.getParameter("bookId"));

        System.out.println(bookId);
        HttpSession session = req.getSession();
        User_Account user = (User_Account) session.getAttribute("user");
        if(user == null){
            resp.sendRedirect("login.jsp");
        }else {
//            System.out.println(adviceText);
//            System.out.println(adviceLevel);
            IAdviceService adviceService = new AdviceServiceImpl();
            Advice advice = new Advice();
            advice.setUser_Id(user.getUser_Id());
            advice.setBook_Id(bookId);
            advice.setAdvice_Level(adviceLevel);
            advice.setAdvice_Text(adviceText);
            adviceService.addAdvice(advice);
            execute(req, resp);
        }

        return null;
    }

}
