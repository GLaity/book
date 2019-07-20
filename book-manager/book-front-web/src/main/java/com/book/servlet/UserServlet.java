package com.book.servlet;


import com.book.pojo.Count_Account;
import com.book.pojo.User_Account;
import com.book.pojo.Vip_Account;
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
            case "quit":
                quit(req,resp);
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

        if(user==null){
            resp.sendRedirect("login.jsp");
        }else{
            Count_Account countAccount = userService.findUserCountById(user.getUser_Id());
            Vip_Account userVip = userService.findBalance(user.getUser_Id());
            session.setAttribute("user",user);
            session.setAttribute("countAccount",countAccount);
            session.setAttribute("userVip",userVip);
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
    public void quit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        HttpSession session = req.getSession();
        session.removeAttribute("user");
        session.removeAttribute("countAccount");
        session.removeAttribute("userVip");
        resp.sendRedirect("/");
    }
}
