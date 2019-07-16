package com.book.servlet;


import com.book.pojo.Count_Account;
import com.book.pojo.User_Account;
import com.book.service.IUserService;
import com.book.service.impl.IUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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
        User_Account user = userService.loginService(username,password);
        Count_Account countAccount = userService.findUserCountById(user.getUser_Id());
        if(user==null){

            resp.sendRedirect("login.jsp");
        }else{

            session.setAttribute("user",user);
            session.setAttribute("countAccount",countAccount);
            resp.sendRedirect("/");
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
