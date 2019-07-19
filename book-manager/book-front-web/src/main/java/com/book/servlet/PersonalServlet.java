package com.book.servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.book.pojo.Advice;
import com.book.pojo.Book_Basic;
import com.book.pojo.User_Account;
import com.book.pojo.User_Cost;
import com.book.service.IAdviceService;
import com.book.service.IBookService;
import com.book.service.IUserBookShelfService;
import com.book.service.IUserCostService;
import com.book.service.impl.AdviceServiceImpl;
import com.book.service.impl.BookServiceImpl;
import com.book.service.impl.UserBookShelfServiceImpl;
import com.book.service.impl.UserCostServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/personal")
public class PersonalServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("_method");
        if(method == null){
            execute(req, resp);
        } else {
            switch (method) {
                case "myAdvice":
                    myAdvice(req, resp);
                    break;
                case "deleteAdvice":
                    deleteAdvice(req, resp);
                    break;
                case "myCollected":
                    myCollected(req, resp);
                    break;
                case "deleteCollected":
                    deleteCollected(req, resp);
                case "mybought":
                    mybought(req,resp);
                case "myCost":
                    myCost(req, resp);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("user.jsp").forward(req,resp);
    }
    //收藏
    public void myCollected(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        User_Account user = (User_Account)session.getAttribute("user");
        IUserBookShelfService userCollectedService = new UserBookShelfServiceImpl();
        List<Book_Basic> bookBasicsList = userCollectedService.queryUserCollectList(user.getUser_Id());
        List<JSONObject> json = new ArrayList<>();
        for(Book_Basic bookBasic :bookBasicsList){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("bookName",bookBasic.getBook_Title());
            jsonObject.put("bookId",bookBasic.getBook_Id());
            json.add(jsonObject);
        }
        String dataStr = JSON.toJSONString(json);
        PrintWriter out = resp.getWriter();
        out.print(dataStr);
        System.out.println(dataStr);

    }
    public void myAdvice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        User_Account userAccount = (User_Account) session.getAttribute("user");
        IAdviceService adviceService = new AdviceServiceImpl();
        IBookService bookService = new BookServiceImpl();
        List<Advice> adviceList = adviceService.findAdviceByUser(userAccount.getUser_Id());
        List<Book_Basic> bookAdviceList = new ArrayList<>();
        for (Advice advice:adviceList){
            bookAdviceList.add(bookService.findBookBasicById(advice.getBook_Id()));
        }
        List<JSONObject> json = new ArrayList<>();
        for (Advice advice:adviceList){
            JSONObject jsonObject = new JSONObject();
            Book_Basic book = bookService.findBookBasicById(advice.getBook_Id());
            jsonObject.put("adviceId", advice.getAdvice_Id());
            jsonObject.put("bookId", advice.getBook_Id());
            jsonObject.put("bookName", book.getBook_Title());
            jsonObject.put("writer", book.getWriter_Id());
            jsonObject.put("adviceDate", advice.getAdvice_Date());
            jsonObject.put("adviceText", advice.getAdvice_Text());
            json.add(jsonObject);
        }
        String dataStr = JSON.toJSONString(json);
        PrintWriter out = resp.getWriter();
        out.print(dataStr);

    }

    public void myCost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        User_Account user = (User_Account)session.getAttribute("user");
        IUserCostService userCostService = new UserCostServiceImpl();
        List<User_Cost> userCostsList =  userCostService.findUserCostByUser(user.getUser_Id());
        IBookService bookService = new BookServiceImpl();
        List<JSONObject> json = new ArrayList<>();
        for (User_Cost  userCost:userCostsList){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("bookId",userCost.getBook_Id());
            jsonObject.put("costDate",userCost.getCost_Date());
            jsonObject.put("costMoney",userCost.getCost_Money());
            jsonObject.put("bookName",bookService.findBookBasicById(userCost.getBook_Id()).getBook_Title());
            jsonObject.put("WriterName",bookService.findBookBasicById(userCost.getBook_Id()).getWriter_Id());
            json.add(jsonObject);

        }
        String dataStr = JSON.toJSONString(json);
        PrintWriter out = resp.getWriter();
        out.print(dataStr);
    }
    public void mybought(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        User_Account user = (User_Account)session.getAttribute("user");
        IUserBookShelfService userBookShelfService = new UserBookShelfServiceImpl();
        List<Book_Basic> bookBasicsList = userBookShelfService.queryUserBoughtList(user.getUser_Id());
        List<JSONObject> json = new ArrayList<>();
        for(Book_Basic bookBasic :bookBasicsList){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("bookName",bookBasic.getBook_Title());
            jsonObject.put("bookId",bookBasic.getBook_Id());
            json.add(jsonObject);
        }

        String dataStr = JSON.toJSONString(json);
        PrintWriter out = resp.getWriter();
        out.print(dataStr);
        System.out.println(dataStr);
    }
    public void deleteAdvice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        IAdviceService adviceService = new AdviceServiceImpl();
        int adviceId = Integer.valueOf(req.getParameter("adviceId"));
        adviceService.removeAdvice(adviceId);
    }
    public void deleteCollected(HttpServletRequest req, HttpServletResponse resp){
        IUserBookShelfService userCollectedService = new UserBookShelfServiceImpl();
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        HttpSession session = req.getSession();
        User_Account user = (User_Account)session.getAttribute("user");
        userCollectedService.removeCollected(user.getUser_Id(),bookId);
    }
}
