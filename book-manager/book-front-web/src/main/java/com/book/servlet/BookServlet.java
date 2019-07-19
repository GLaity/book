package com.book.servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.book.pojo.*;
import com.book.service.IAdviceService;
import com.book.service.IBookService;
import com.book.service.IUserBookShelfService;
import com.book.service.IUserService;
import com.book.service.impl.AdviceServiceImpl;
import com.book.service.impl.BookServiceImpl;
import com.book.service.impl.IUserServiceImpl;
import com.book.service.impl.UserBookShelfServiceImpl;

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


@WebServlet("/book")
public class BookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String method = req.getParameter("_method");
        if(method == null){
            execute(req, resp);
        } else {
            switch (method){
                case "advice":
                    advice(req,resp);
                    break;
                case "addAdvice" :
                    addAdvice(req, resp);
                    break;
            }
        }

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
        HttpSession session = req.getSession();

        User_Account user = (User_Account)session.getAttribute("user");
        Vip_Account userVip = (Vip_Account) session.getAttribute("userVip");
        int flag=0;
        int isBought = 0;
        IUserBookShelfService userCollectedService = new UserBookShelfServiceImpl();

        IBookService bookService = new BookServiceImpl();
        Book_Basic bookBasic = bookService.findBookBasicById(bookId);
        Book_Extend bookExtend = bookService.findBookExtendById(bookId);
        Book_Type bookType = bookService.fintBookTypeByTypeId(bookBasic.getType_Id());
        List<String> bookDir = bookService.getBookDir(bookId);

        if(user!=null){
            List<Book_Basic> bookBasicsList = userCollectedService.queryUserCollectList(user.getUser_Id());
            if(bookBasicsList==null){
                flag=0;
            }else{
                for(Book_Basic tempBookBasic : bookBasicsList){
                    if(tempBookBasic.getBook_Id()==bookId){
                        flag=1;
                    }
                }
            }

            List<Book_Basic> bookBoughtList = userCollectedService.queryUserBoughtList(user.getUser_Id());
            if (bookBoughtList == null){
                if(userVip.getVip_Balance() >= bookBasic.getBook_Price()){
                    isBought = 0;
                } else {
                    isBought = 2;
                }
            } else {
                if(userVip.getVip_Balance() >= bookBasic.getBook_Price()){
                    for(Book_Basic tempBookBasic : bookBoughtList){
                        if(tempBookBasic.getBook_Id()==bookId){
                            isBought = 1;
                        }
                    }
                } else {
                    isBought = 2;
                }

            }
        }


        req.setAttribute("bookBasic",bookBasic);
        req.setAttribute("bookType",bookType);
        req.setAttribute("bookExtend",bookExtend);
        req.setAttribute("bookDir",bookDir);

        req.setAttribute("flag",flag);
        req.setAttribute("isBought",isBought);

        req.getRequestDispatcher("bookDetails.jsp").forward(req,resp);
        return null;
    }
    public String advice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        IAdviceService adviceService = new AdviceServiceImpl();
        IUserService userService = new IUserServiceImpl();
        List<Advice> adviceList = adviceService.findAdviceByBook(bookId);
        List<JSONObject> json = new ArrayList<>();
        for (Advice advice:adviceList){
            User_Account user = userService.findUserById(advice.getUser_Id());
//            adviceUserList.add(userService.findUserById(advice.getUser_Id()));
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("userName",user.getUser_Username());
            jsonObject.put("adviceText", advice.getAdvice_Text());
            jsonObject.put("adviceDate",advice.getAdvice_Date());
            json.add(jsonObject);
        }
        String dataStr = JSON.toJSONString(json);
        PrintWriter out = resp.getWriter();
        out.print(dataStr);
        return null;
    }

    public String addAdvice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String param = req.getParameter("param");
        JSONObject json = JSON.parseObject(param);
        String adviceText = json.getString("adviceText");
        int adviceLevel = Integer.valueOf(json.getString("adviceLevel"));
        int bookId = Integer.valueOf(json.getString("bookId"));

        HttpSession session = req.getSession();
        User_Account user = (User_Account) session.getAttribute("user");
        IAdviceService adviceService = new AdviceServiceImpl();
        Advice advice = new Advice();
        advice.setUser_Id(user.getUser_Id());
        advice.setBook_Id(bookId);
        advice.setAdvice_Level(adviceLevel);
        advice.setAdvice_Text(adviceText);
        adviceService.addAdvice(advice);

        advice(req, resp);

        return null;
    }

}
