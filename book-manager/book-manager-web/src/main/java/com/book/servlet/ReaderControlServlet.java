package com.book.servlet;

import com.book.pojo.User_Account;
import com.book.service.IUserService;
import com.book.service.impl.IUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/reader.do")
public class ReaderControlServlet extends HttpServlet {
    IUserService iUserService =new IUserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fun = req.getParameter("_method");
        switch (fun){
            case "add":
                add(req,resp);
                break;

            case "getList":
                getList(req,resp);
                break;

            case "update":
                update(req,resp);
                break;

            case "remove":
                remove(req,resp);
                break;
        }
    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId =Integer.valueOf(req.getParameter("userId"));
        String userName =req.getParameter("userName");
        String userPwb =req.getParameter("userPassword");
        User_Account user_account=new User_Account(userName,userPwb);
        iUserService.addUser(user_account);
        req.getRequestDispatcher("/userinformation.jsp").forward(req,resp);
    }

    private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId =Integer.valueOf(req.getParameter("userId"));
        User_Account user_account =iUserService.findUserById(userId);
        user_account.setUser_Username(req.getParameter("userName"));
        user_account.setUser_Date(req.getParameter("userdate"));
        user_account.setUser_Password(req.getParameter("userPassword"));
        user_account.setUser_Tel(req.getParameter("userTel"));
        user_account.setUser_Email(req.getParameter("useEmail"));
        iUserService.modifyUser(user_account);
        req.getRequestDispatcher("/userinformation.jsp").forward(req,resp);
    }

    private void remove(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int userId =Integer.valueOf(req.getParameter("userId"));
        iUserService.removeUser(userId);
        req.getRequestDispatcher("/userinformation.jsp").forward(req,resp);
    }

    private void getList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User_Account> users=iUserService.findAll();
        req.setAttribute("userList",users);
        req.getRequestDispatcher("/userinformation.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            doGet(req,resp);
    }
}
