package com.book.servlet;

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
import java.util.List;

@WebServlet("/manager")
public class ManagerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("_method");
        switch (method){
            case "login":
                login(req, resp);
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
        IUserService iUserService =new IUserServiceImpl();
        List<User_Account> users=iUserService.findAll();
        HttpSession session = req.getSession();
        users.get(2).getUser_Id();
        System.out.println(users);
        if(username.equals("admin")&&password.equals("123")){
            req.setAttribute("userList",users);
            req.getRequestDispatcher("userinformation.jsp").forward(req,resp);

        }else{
            req.setAttribute("userList",users);
            req.getRequestDispatcher("userinformation.jsp").forward(req,resp);
        }
    }
}