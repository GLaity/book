package com.book.servlet;

import com.book.dao.IBookDirDao;
import com.book.dao.impl.BookDirDaoImpl;
import com.book.pojo.Book_Basic;
import com.book.pojo.User_Account;
import com.book.pojo.User_Book_Collection;
import com.book.service.IBookReadService;
import com.book.service.IBookService;
import com.book.service.IUserBookShelfService;
import com.book.service.impl.BookReadServiceImpl;
import com.book.service.impl.BookServiceImpl;
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
        if (user != null){
            bookVisitedList.add(bookBasic);
            session.setAttribute("bookVisitedList",bookVisitedList);
            req.setAttribute("bookBasic",bookBasic);
            req.setAttribute("bookId",bookId);
            req.setAttribute("chapterId",chapterId);

            String path = bookReadService.readTargetBook(bookId,chapterId);
            req.setAttribute("path",path);
            req.getRequestDispatcher("/bookRead.jsp").forward(req,resp);
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

        req.setAttribute("bookBasic",bookBasic);

        req.setAttribute("bookId",bookId);
        req.setAttribute("path",path);
        if(chapterId >= 100){
            req.setAttribute("chapterId",chapterId);
            req.getRequestDispatcher("/bookRead.jsp").forward(req,resp);
        } else {
            req.setAttribute("chapterId",chapterId+1);
            req.getRequestDispatcher("/bookRead.jsp").forward(req,resp);
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
        IUserBookShelfService userCollectedService = new UserBookShelfServiceImpl();
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
}
