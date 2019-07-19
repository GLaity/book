package com.book.servlet;

import com.alibaba.fastjson.JSON;
import com.book.pojo.Advice;
import com.book.pojo.User_Account;
import com.book.service.IAdviceService;
import com.book.service.IUserService;
import com.book.service.impl.AdviceServiceImpl;
import com.book.service.impl.IUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
@WebServlet("/read.do")
public class ReaderControlServlet extends HttpServlet {
    IUserService iUserService =new IUserServiceImpl();
    IAdviceService iAdviceService =new AdviceServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String method =req.getParameter("_method");
                    switch (method){
                        case "add":
                            add(req,resp);
                            break;
                        case "update":
                            update(req, resp);
                            break;
                        case "getList":
                            execute(req, resp);
                            break;
                        case "remove":
                            remove(req, resp);
                            break;
                    }
                }
//        switch (fun){
//            case "add":
//               add(req,resp);
//                break;
//            case "getList":
//                getList(req,resp);
//                break;
//            case "update":
//                update(req,resp);
//                break;
//            case "remove":
//                remove(req,resp);
//                break;
//        }

    private void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User_Account> users = iUserService.findAll();
        req.setAttribute("userList",users);
        req.getRequestDispatcher("userinformation.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
    private void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName =req.getParameter("userName");
        String userDate =req.getParameter("userDate");
        String userPwb =req.getParameter("userPassword");
        String userTel =req.getParameter("userTel");
        String userEmail =req.getParameter("userEmail");
        User_Account user_account =new User_Account();
        user_account.setUser_Username(userName);
        user_account.setUser_Password(userPwb);
        user_account.setUser_Email(userEmail);
        user_account.setUser_Date(userDate);
        user_account.setUser_Tel(userTel);
        iUserService.initUser(user_account);
        execute(req, resp);
    }
    private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId =Integer.valueOf(req.getParameter("userId"));
//        PrintWriter out =resp.getWriter();
        User_Account user_account =iUserService.findUserById(userId);
        user_account.setUser_Username(req.getParameter("userName"));
        user_account.setUser_Password(req.getParameter("userPassword"));
        user_account.setUser_Tel(req.getParameter("userTel"));
        user_account.setUser_Email(req.getParameter("useEmail"));
        iUserService.modifyUser(user_account);
        execute(req, resp);
    }
    private void remove(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int userId =Integer.valueOf(req.getParameter("userId"));
//        String userId =req.getParameter("userId");
        iUserService.removeUser(userId);
        execute(req, resp);
    }
    }