package java.com.book.servlet;
import com.book.pojo.Admin;
import com.book.service.AdminService;

import javax.servlet.ServletException;
import com.book.service.admin.impl.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/admin")
public class AdminLoginCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("doPost");
//        String method = req.getParameter("_method");
//        switch (method) {
//            case "login":
//                login(req, resp);
//        }
        String adminName=req.getParameter("adminName");
        HttpSession session = req.getSession();
        String pwd =req.getParameter("password");
        Admin admin=null;
        AdminService adminService=new AdminServiceImpl();
        if (admin!=null){
            resp.getWriter().write("欢迎登录"+admin.getAdmin_Name());
            session.setAttribute("adminName",adminName);
            resp.sendRedirect("userinformation.jsp");
        }else {
            resp.getWriter().write("重新登录");
            resp.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
    public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    }
}
