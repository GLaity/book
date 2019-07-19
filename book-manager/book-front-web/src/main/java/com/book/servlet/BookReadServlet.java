package com.book.servlet;

import com.book.dao.IBookDao;
import com.book.dao.IBookDirDao;
import com.book.dao.IUserDao;
import com.book.dao.impl.BookDaoImpl;
import com.book.dao.impl.BookDirDaoImpl;
import com.book.dao.impl.UserDaoImpl;
import com.book.pojo.*;
import com.book.pojo.Book_Basic;
import com.book.pojo.User_Account;
import com.book.pojo.User_Book_Collection;
import com.book.service.IBookReadService;
import com.book.service.IBookService;
import com.book.service.IUserBookShelfService;
import com.book.service.IUserService;
import com.book.service.impl.BookReadServiceImpl;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/read.do")
public class BookReadServlet extends HttpServlet {
    IBookReadService bookReadService = new BookReadServiceImpl();
    IBookService bookService = new BookServiceImpl();
    IUserService userService = new IUserServiceImpl();
    IUserBookShelfService userBookShelfService = new UserBookShelfServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fun = req.getParameter("_method");
        switch (fun){
            case "start":
                start(req,resp);
                break;
            case "last":
                last(req, resp);
                break;
            case "next":
                next(req, resp);
                break;
            case "dir":
                dir(req,resp);
                break;
            case "collection":
                collection(req, resp);
                break;
            case "buy":
                buy(req,resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    public void start(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        int chapterId = Integer.valueOf(req.getParameter("chapterId"));
        HttpSession session = req.getSession();
        User_Account user = (User_Account) session.getAttribute("user");
        Book_Basic bookBasic = bookService.findBookBasicById(bookId);

        List<Book_Basic> bookVisitedList = (List<Book_Basic>) session.getAttribute("bookVisitedList");

        if (bookVisitedList == null){
            bookVisitedList = new ArrayList<>();
            session.setAttribute("bookVisitedList",bookVisitedList);
        }
        if (user != null ){
            List<Book_Basic> bookBoughtList = userBookShelfService.queryUserBoughtList(user.getUser_Id());
            Boolean flag = false;
            for (Book_Basic temp:bookBoughtList){
                if (temp.getBook_Id() == bookBasic.getBook_Id()){
                    flag = true;
                }
            }
            if (flag || chapterId <= 5){
                userService.modifyTotalVisit(user.getUser_Id());
                bookVisitedList.add(bookBasic);
                session.setAttribute("bookVisitedList",bookVisitedList);
                req.setAttribute("bookBasic",bookBasic);
                req.setAttribute("bookId",bookId);
                req.setAttribute("chapterId",chapterId);

                String path = bookReadService.readTargetBook(bookId,chapterId);
                req.setAttribute("path",path);
                req.getRequestDispatcher("/bookRead.jsp").forward(req,resp);
            } else {
                resp.sendRedirect("/book?bookId="+bookId);
            }
        } else {
            resp.sendRedirect("login.jsp");
        }

    }

    public void last(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        int chapterId = Integer.valueOf(req.getParameter("chapterId"));
        String path = bookReadService.readTargetBook(bookId,chapterId-1);
        Book_Basic bookBasic = bookService.findBookBasicById(bookId);
        System.out.println(bookBasic.getBook_Title());
        req.setAttribute("bookBasic",bookBasic);

        req.setAttribute("bookId",bookId);
        req.setAttribute("path",path);
        if(chapterId <= 1){
            req.setAttribute("chapterId",chapterId);
            req.getRequestDispatcher("/bookRead.jsp").forward(req,resp);
        }else{
            req.setAttribute("chapterId",chapterId-1);
            req.getRequestDispatcher("/bookRead.jsp").forward(req,resp);
        }
    }

    public void next(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        int chapterId = Integer.valueOf(req.getParameter("chapterId"));
        String path = bookReadService.readTargetBook(bookId,chapterId+1);
        Book_Basic bookBasic = bookService.findBookBasicById(bookId);

        HttpSession session = req.getSession();
        User_Account user = (User_Account) session.getAttribute("user");
        List<Book_Basic> bookBoughtList = userBookShelfService.queryUserBoughtList(user.getUser_Id());
        Boolean flag = false;
        for (Book_Basic temp:bookBoughtList){
            if (temp.getBook_Id() == bookBasic.getBook_Id()){
                flag = true;
            }
        }
        req.setAttribute("bookBasic",bookBasic);
        req.setAttribute("bookId",bookId);
        req.setAttribute("path",path);
        if (flag || chapterId <= 4){
            if (chapterId >= 100 ){
                req.setAttribute("chapterId",chapterId);
                req.getRequestDispatcher("/bookRead.jsp").forward(req,resp);
            } else {
                req.setAttribute("chapterId",chapterId+1);
                req.getRequestDispatcher("/bookRead.jsp").forward(req,resp);
            }
        } else {
            resp.sendRedirect("/book?bookId="+bookId);
        }
    }

    public void dir(HttpServletRequest req, HttpServletResponse resp){
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        IBookDirDao bookDirDao = new BookDirDaoImpl();
        List<String> dir = bookDirDao.getBookDir(bookId);
    }
    public void collection(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        int userId = Integer.valueOf(req.getParameter("userId"));
//        IUserBookShelfService userCollectedService = new UserBookShelfServiceImpl();
        addCollected(userId,bookId);
        resp.sendRedirect("/book?bookId="+bookId);
    }

    //添加收藏信息
    public void addCollected(int userId,int bookId){
        IUserBookShelfService userCollectedService = new UserBookShelfServiceImpl();
        bookService = new BookServiceImpl();
        bookService.modifyCollectedById(bookId);
        User_Book_Collection userBookCollection = new User_Book_Collection();
        userBookCollection.setUser_Id(userId);
        userBookCollection.setBook_Id(bookId);
        userCollectedService.addUserCollect(userBookCollection);
    }

    public void buy(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        User_Account user = (User_Account) session.getAttribute("user");
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        IUserService userService = new IUserServiceImpl();
        userService.buyBook(user.getUser_Id(),bookId);
        Vip_Account userVip = userService.findBalance(user.getUser_Id());
        Count_Account countAccount = userService.findUserCountById(user.getUser_Id());
        session.setAttribute("userVip",userVip);
        session.setAttribute("countAccount",countAccount);
        resp.sendRedirect("/book?bookId="+bookId);
    }
}
