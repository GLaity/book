package com.book.servlet;

import com.book.dao.IBookDirDao;
import com.book.dao.IUserCollectedDao;
import com.book.dao.impl.BookDirDaoImpl;
import com.book.dao.impl.UserCollectedImpl;
import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Contend;
import com.book.pojo.User_Account;
import com.book.pojo.User_Book_Collection;
import com.book.service.IBookReadService;
import com.book.service.IBookService;
import com.book.service.IUserCollectedService;
import com.book.service.impl.BookReadServiceImpl;
import com.book.service.impl.BookServiceImpl;
import com.book.service.impl.UserCollectedServiceImpl;

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
        Book_Basic bookBasic = bookService.findBookBasicById(bookId);
        req.setAttribute("bookBasic",bookBasic);
        req.setAttribute("bookId",bookId);
        req.setAttribute("chapterId",chapterId);
        String path = bookReadService.readTargetBook(bookId,chapterId);
        req.setAttribute("path",path);
        req.getRequestDispatcher("/bookRead.jsp").forward(req,resp);
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
        IUserCollectedService userCollectedService = new UserCollectedServiceImpl();
        List<Book_Basic> bookBasics = userCollectedService.queryUserCollectList(userId);
        if(bookBasics==null){
            addCollected(userId,bookId);
            resp.sendRedirect("/book?bookId="+bookId);
            System.out.println(8);
        }else{
            int flag=0;
            for(Book_Basic bookBasic : bookBasics){
                if(bookBasic.getBook_Id()==bookId){
                    flag=1;
                }
            }
            if(flag==0){
                addCollected(userId,bookId);
                req.setAttribute("flag",flag);
                resp.sendRedirect("/book?bookId="+bookId);
                System.out.println(flag);
            }else if(flag==1){
                req.setAttribute("flag",flag);
                System.out.println(flag);
            }
        }



    }
    //添加收藏信息
    public void addCollected(int userId,int bookId){
        IUserCollectedService userCollectedService = new UserCollectedServiceImpl();
        bookService = new BookServiceImpl();
        bookService.modifyCollectedById(bookId);
        User_Book_Collection userBookCollection = new User_Book_Collection();
        userBookCollection.setUser_Id(userId);
        userBookCollection.setBook_Id(bookId);
        userCollectedService.addUserCollect(userBookCollection);
    }
}
