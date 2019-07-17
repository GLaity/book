import com.book.dao.IBookDao;
import com.book.dao.impl.BookDaoImpl;
import com.book.pojo.Book_Basic;

import java.util.List;

public class AdminTest {
    public static void main(String[] args) {
        IBookDao iBookDao=new BookDaoImpl();
        List<Book_Basic> books=iBookDao.selectAllBook();
        for (Book_Basic book:books){
            System.out.println(book.getBook_Title());
        }
    }
}
