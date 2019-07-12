package com.book.servlet;

import com.book.pojo.Advice;
import com.book.service.IAdviceService;
import com.book.service.impl.AdviceServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/advice")
public class AdviceServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        IAdviceService adviceService = new AdviceServiceImpl();
        List<Advice> adviceList = adviceService.findAdviceAll();
        req.setAttribute("adviceList",adviceList);
        req.getRequestDispatcher("bookdetails.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
