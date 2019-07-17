import com.book.util.JDBCUtils;

public class JDBCTest {
    public static void main(String[] args) {
        JDBCUtils jdbcUtils =new JDBCUtils();
        System.out.println(jdbcUtils.getDataSource());
    }
}
