package test;

import com.book.dao.IBookContendDao;
import com.book.dao.IBookDao;
import com.book.dao.impl.BookContendDaoImpl;
import com.book.dao.impl.BookDaoImpl;
import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Contend;
import org.junit.Test;

import java.util.List;

public class WolfTest {
    @Test
    public void bookBasicTest(){
        Book_Basic book = new Book_Basic();
//        book.setBook_Id(2);
        book.setBook_Title("万古天帝X3!");
        book.setBook_Context("0.0紫寰王朝，东极大陆一个疆域辽阔，武道、术法都颇为繁荣的人类国度。时则盛夏，烈日炎炎。");
        book.setType_Id(2);
        book.setWriter_Id("习风");
        book.setBook_Createdate("2019.07.12");
        IBookDao bookDao = new BookDaoImpl();
        bookDao.insertBook(book);
//        bookDao.updateBook(book);
    }
    @Test
    public void bookSelectTest(){
        Book_Basic book = null;
        IBookDao bookDao = new BookDaoImpl();
        book = bookDao.selectBookById(1);
        System.out.println(book.getBook_Context());
        List<Book_Basic> books = null;
        books = bookDao.selectBookByType(2);
        System.out.println(books.get(1).getBook_Context());
    }

    @Test
    public void bookContendTest(){
//        Book_Contend contend = new Book_Contend(2,"D:\\Download\\万古天帝");
        IBookContendDao bookContendDao = new BookContendDaoImpl();
//        bookContendDao.insertBookContend(contend);
//        bookContendDao.deleteBookContend(2);
        Book_Contend contend2 = bookContendDao.findBookContend(1);
        System.out.println(contend2.getBook_Id());
    }

}
