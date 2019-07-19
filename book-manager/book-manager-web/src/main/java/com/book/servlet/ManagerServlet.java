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

@WebServlet("/login.do")
public class ManagerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("adminName");
        String password = req.getParameter("password");
        if(username.equals("zyp")&&(password.equals("123456"))) {
            List<User_Account> users=getList(req, resp);
            for (User_Account user_account:users){
                System.out.println(user_account);
            }
            req.setAttribute("userList",users);
            req.getRequestDispatcher("userinformation.jsp").forward(req,resp);
        }
        else {
            resp.sendRedirect("login.jsp");
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    public List<User_Account> getList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        IUserService iUserService =new IUserServiceImpl();
        List<User_Account>userList=iUserService.findAll();
        return userList;
    }
}
