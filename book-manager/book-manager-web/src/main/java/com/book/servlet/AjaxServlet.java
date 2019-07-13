package com.book.servlet;

import com.book.pojo.User_Account;
import com.book.service.user.IUserService;
import com.book.service.user.impl.IUserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/check")
public class AjaxServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        IUserService userService = new IUserServiceImpl();
        User_Account user = null;
        user = userService.findUserByUsername(username);
        String msg = "";
        if(user!=null){
            msg="0";
        }
        PrintWriter out = resp.getWriter();
        out.print(msg);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
