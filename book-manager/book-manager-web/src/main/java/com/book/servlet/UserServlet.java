package com.book.servlet;


import com.book.pojo.User_Account;
import com.book.service.user.IUserService;
import com.book.service.user.impl.IUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("_method");
        switch (method){
            case "login":
                login(req, resp);
                break;
            case "register":
                register(req,resp);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        IUserService userService = new IUserServiceImpl();
        User_Account user = null;
        user = userService.loginService(username,password);
        if(user==null){
            System.out.println("登陆失败");
            resp.sendRedirect("login.jsp");
        }else{
            System.out.println("登录成功");
            session.setAttribute("user",user);
            resp.sendRedirect("index.jsp");
        }

    }
    public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        IUserService userService = new IUserServiceImpl();
        User_Account user = new User_Account();
        user.setUser_Username(username);
        user.setUser_Password(password);
        userService.addUser(user);
        resp.sendRedirect("/login.jsp");
    }
}
