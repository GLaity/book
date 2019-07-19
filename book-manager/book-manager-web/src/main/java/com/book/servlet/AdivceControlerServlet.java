package com.book.servlet;

import com.book.dao.IAdviceDao;
import com.book.dao.impl.AdviceDaoImpl;
import com.book.pojo.Advice;
import com.book.service.IAdviceService;
import com.book.service.impl.AdviceServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("advice.do")
public class AdivceControlerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fun = request.getParameter("_method");
        switch (fun){
            case "getadvice":
                try {
                    getadvice(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                delete(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    private void getadvice(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        IAdviceService adviceService = new AdviceServiceImpl();
        List<Advice> advices = adviceService.findAdviceAll();
        request.setAttribute("advices",advices);
        request.getRequestDispatcher("adviceControler.jsp").forward(request,response);
    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adviceId = Integer.valueOf(request.getParameter("adviceId"));
        IAdviceService adviceService = new AdviceServiceImpl();
        adviceService.removeAdvice(adviceId);
        List<Advice> advices = adviceService.findAdviceAll();
        request.setAttribute("advices",advices);
        request.getRequestDispatcher("adviceControler.jsp").forward(request,response);
    }
}
