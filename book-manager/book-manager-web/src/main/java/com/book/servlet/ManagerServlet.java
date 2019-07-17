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

@WebServlet("/managerlogin.do")
public class ManagerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String method = req.getParameter("_method");
//        switch (method){
//            case "login":
//                login(req, resp);
//                break;
//        }

        //AdminService adminService =new AdminServiceImpl();
       // Admin admin =adminService.adminLogin(username,password);
       // System.out.println(admin.getAdmin_Name());
//        System.out.println(admin.getAdmin_Password());


            System.out.println("登录成功");
//            HttpSession session = req.getSession();
            IUserService iUserService =new IUserServiceImpl();

//            for (User_Account user_account :users){
//                System.out.println(user_account.getUser_Username());
//            }

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

    }
}
