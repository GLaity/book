package com.book.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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
        HttpSession session = req.getSession();
        if(username.equals("admin")&&password.equals("123")){
            resp.sendRedirect("userinformation.jsp");
        }else{
            resp.sendRedirect("userinformation.jsp");
        }
    }
}
