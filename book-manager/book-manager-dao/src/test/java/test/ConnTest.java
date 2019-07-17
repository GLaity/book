package test;


import com.book.util.JDBCUtils;
public class ConnTest {
    public static void main(String[] args) {
        JDBCUtils jdbcUtils = new JDBCUtils();
        System.out.println(jdbcUtils.getDataSource());
    }
}
