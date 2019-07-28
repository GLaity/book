package com.book.servlet;

import com.book.pojo.Book_Basic;
import com.book.service.IBookService;
import com.book.service.impl.BookServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;



@WebServlet("book.do")
public class BookControlServlet extends HttpServlet {
    IBookService bookService = new BookServiceImpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fun = request.getParameter("_method");
        switch (fun){
            case "getList":
                getList(request,response);
                break;
            case "add":
                add(request,response);
                break;
            case "save":
                save(request,response);
                break;
            case "saveadd":
                saveadd(request,response);
                break;
            case "remove":
                remove(request,response);
                break;
            case "update":
                update(request,response);
                break;
            default:
                break;
        }
//        List<Book_Basic> books = bookService.findBookBasicAll();
//        request.setAttribute("bookList",books);
//        request.getRequestDispatcher("bookControler.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("addBook.jsp").forward(request,response);
    }
    private void saveadd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DiskFileItemFactory factory = new DiskFileItemFactory(1*1024*1024,(File)this.getServletContext().getAttribute("javax.servlet.context.tempdir"));
        // 创建servletFileUpload  处理器
        ServletFileUpload sfu = new ServletFileUpload(factory);
        // 通过处理器解析请求
        List<FileItem> list = null;
        try {
            list=sfu.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        // 遍历请求中的属性
        for(FileItem fi : list){
            if(!fi.isFormField()){// 判断是否是文件上传项
                String  fieldName =  fi.getFieldName();
                System.out.println("fieldName=" + fieldName);//上传组件的name属性
                String  name =  fi.getName();//文件名称
                System.out.println("name="+name);
                String  contentType = fi.getContentType();//文件类型
                System.out.println("contentType="+contentType);
                long size = fi.getSize();//文件大小
                System.out.println("size="+size);
                // 上传文件
                //确定文件保存的目录
                File  file = new File(this.getServletContext().getRealPath("/upload"));
                if(!file.exists()){
                    file.mkdirs();
                }
                try {
                    fi.write(new File(file,name));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }


        Book_Basic book = new Book_Basic();
        book.setBook_Title(request.getParameter("name"));
        book.setWriter_Id(request.getParameter("author"));
        book.setBook_Price(Double.parseDouble(request.getParameter("price")));
        book.setBook_Context(request.getParameter("context"));
        book.setType_Id(Integer.valueOf(request.getParameter("type")));
//        book.setBook_Createdate(date(NOW()));
        String booksrc = request.getParameter("booksrc");
        String fileinput = request.getParameter("fileinput");
//        System.out.println(booksrc);
//        System.out.println(fileinput);
//        System.out.println(book);
//        String bookPath = "D:\\Download\\" + book.getBook_Title();
        bookService.insertNewBook(book,fileinput);
        List<Book_Basic> books = bookService.findBookBasicAll();
        request.setAttribute("bookList",books);
        request.getRequestDispatcher("bookControler.jsp").forward(request,response);

    }
    private void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book_Basic> books = bookService.findBookBasicAll();
        request.setAttribute("bookList",books);
        request.getRequestDispatcher("bookControler.jsp").forward(request,response);
    }

    private void remove(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        int bookId = Integer.valueOf(request.getAttribute("deleteBook"));
//        int empno = Integer.valueOf(req.getParameter("empno"));
        int bookId = Integer.valueOf(request.getParameter("bookId"));
        bookService.deleteBook(bookId);
        getList(request, response);
//        request.getRequestDispatcher("bookControler.jsp").forward(request,response);
    }
    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.valueOf(request.getParameter("bookId"));
        Book_Basic book_basic = bookService.findBookBasicById(bookId);
        request.setAttribute("bookBasic",book_basic);
        request.getRequestDispatcher("editbook.jsp").forward(request,response);
    }
    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        Book_Basic book = new Book_Basic();
        book.setBook_Id(Integer.valueOf(request.getParameter("bookId")));
        book.setBook_Title(request.getParameter("name"));
        book.setWriter_Id(request.getParameter("author"));
        book.setBook_Price(Double.parseDouble(request.getParameter("price")));
        book.setBook_Context(request.getParameter("context"));
        book.setType_Id(Integer.valueOf(request.getParameter("type")));
        bookService.updateBookInformation(book);
        List<Book_Basic> books = bookService.findBookBasicAll();
        request.setAttribute("bookList",books);
        request.getRequestDispatcher("bookControler.jsp").forward(request,response);
    }
}
