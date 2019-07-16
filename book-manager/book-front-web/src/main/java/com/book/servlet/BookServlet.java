package com.book.servlet;

import com.book.dao.IBookDao;
import com.book.dao.impl.BookDaoImpl;
import com.book.pojo.Advice;
import com.book.pojo.Book_Basic;
import com.book.service.IAdviceService;
import com.book.service.impl.AdviceServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;


@WebServlet("/book")
public class BookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        execute(req, resp);


//        String method = req.getParameter("_method");
//        if(method == null){
//            execute(req, resp);
//        }
//        try {
//            String forwardPath =  (String)this.getClass().getMethod(method,HttpServletRequest.class,HttpServletResponse.class).invoke(this,req,resp);
//            if(forwardPath != null){
//                req.getRequestDispatcher(forwardPath).forward(req,resp);
//            }
//
//        } catch (IllegalAccessException e) {
//            e.printStackTrace();
//        } catch (InvocationTargetException e) {
//            e.printStackTrace();
//        } catch (NoSuchMethodException e) {
//            e.printStackTrace();
//        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }


    public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bookId = Integer.valueOf(req.getParameter("bookId"));

        IBookDao bookDao = new BookDaoImpl();
        Book_Basic bookBasic = bookDao.selectBookById(bookId);
        req.setAttribute("bookBasic",bookBasic);

        IAdviceService adviceService = new AdviceServiceImpl();
        List<Advice> adviceList = adviceService.findAdviceByBook(bookId);
        req.setAttribute("adviceList",adviceList);

        req.getRequestDispatcher("bookDetails.jsp").forward(req,resp);
        return null;
    }

    public String addadvice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String adviceText = req.getParameter("adviceText");
        int adviceLevel = Integer.valueOf(req.getParameter("adviceLevel"));
        System.out.println(adviceText);
        System.out.println(adviceLevel);
        resp.sendRedirect("/advice");
        return null;
    }

}
