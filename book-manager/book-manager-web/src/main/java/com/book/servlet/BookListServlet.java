package com.book.servlet;

//@WebServlet("/user")
//public class BookListServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        IUserService iUserService =new IUserServiceImpl();
//        List<User_Account> users = iUserService.findAll();
//        req.setAttribute("userList",users);
//        System.out.println(users.size());
//        req.getRequestDispatcher("userinformation.jsp").forward(req,resp);
//    }
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        doGet(req,resp);
//    }
//}
