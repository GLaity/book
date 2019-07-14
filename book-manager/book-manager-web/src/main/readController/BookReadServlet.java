import com.book.read.IBookReadService;
import com.book.read.impl.BookReadServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/read.do")
public class BookReadServlet extends HttpServlet {
    IBookReadService bookReadService = new BookReadServiceImpl();
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
        }
//        bookReadService.readTargetBook();
//        int BookId = Integer.valueOf(req.getParameter("bookId"));
//        int ChapterId = Integer.valueOf(req.getParameter("chapterId"));
//        String path = bookReadService.readTargetBook(1,0001);
//        String path = bookReadService.readTargetBook(BookId,ChapterId);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    public void start(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        int chapterId = 1;
        req.setAttribute("bookId",bookId);
        req.setAttribute("chapterId",chapterId);
        String path = bookReadService.readTargetBook(bookId,chapterId);
        req.setAttribute("path",path);
        req.getRequestDispatcher("/bookRead.jsp").forward(req,resp);
    }

    public void last(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        int chapterId = Integer.valueOf(req.getParameter("chapterId"))-1;
        if(chapterId <= 0){
            return;
        }
        String path = bookReadService.readTargetBook(bookId,chapterId);
        req.setAttribute("bookId",bookId);
        req.setAttribute("chapterId",chapterId);
        req.setAttribute("path",path);
        req.getRequestDispatcher("/bookRead.jsp").forward(req,resp);
    }

    public void next(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int bookId = Integer.valueOf(req.getParameter("bookId"));
        int chapterId = Integer.valueOf(req.getParameter("chapterId"))+1;
        if(chapterId >= 10){
            return;
        }
        String path = bookReadService.readTargetBook(bookId,chapterId);
        req.setAttribute("bookId",bookId);
        req.setAttribute("chapterId",chapterId);
        req.setAttribute("path",path);
        req.getRequestDispatcher("/bookRead.jsp").forward(req,resp);
    }

    public void dir(HttpServletRequest req, HttpServletResponse resp){
        System.out.println("dir");
    }
}
