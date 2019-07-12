package com.book.servlet;

import com.admin.dao.AdminDao;
import com.admin.dao.AdminDaoImpl;
import com.book.pojo.Admin;
import com.book.util.CookieUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login.do")
public class AdminLoginCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String adminName =req.getParameter("adminName");
        String pwd =req.getParameter("password");
       HttpSession session =req.getSession();
       AdminDao adminDao=new AdminDaoImpl();
        Admin admin =adminDao.selectPwdById(adminName);
        System.out.println(adminName+"--"+pwd+"--"+admin);
        if (admin!=null){
            //Cookie cookie = CookieUtil.createCookie("info",adminName+"#"+pwd,7*24*60*60,req.getContextPath());
            //resp.addCookie(cookie);
            session.setAttribute("adminName",adminName);
            resp.sendRedirect("/userinformation.jsp");//req.getContextPath()+
        }else {
            resp.sendRedirect("/index.jsp");//req.getContextPath()+
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
