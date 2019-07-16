package jdbctest;

import com.book.dao.IBookDirDao;
import com.book.dao.impl.BookDirDaoImpl;
import com.book.pojo.Advice;
import com.book.service.IAdviceService;
import com.book.service.IBookService;
import com.book.service.impl.AdviceServiceImpl;
import com.book.service.impl.BookServiceImpl;
import org.junit.Test;

import java.io.IOException;
import java.util.List;

public class ConTest {

//    @Test
//    public void findTest(){
//        IAdviceService adviceService = new AdviceServiceImpl();
//        List<Advice> adviceList = adviceService.findAdviceAll();
//        for(Advice advice:adviceList){
//            System.out.println(advice);
//        }
//    }
//    @Test
//    public void dirTest(){
//        IBookService bookService = new BookServiceImpl();
//        IBookDirDao bookDirDao = new BookDirDaoImpl();
//        try {
//            bookDirDao.setBookDir(1);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        List<String> dirList = bookService.getBookDir(1);
//
//        for(String dir:dirList){
//            System.out.println(dir);
//        }
//    }
}
