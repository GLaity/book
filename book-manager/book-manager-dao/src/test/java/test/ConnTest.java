package test;

import com.book.util.JDBCUtils;
<<<<<<< HEAD

public class ConnTest {
    public static void main(String[] args) {
        JDBCUtils jdbcUtils =new JDBCUtils();
        System.out.println(jdbcUtils.getDataSource());
=======
import org.junit.Test;

public class ConnTest {
    @Test
    public void ConnTest(){
        System.out.println("连接测试！");
        System.out.println(JDBCUtils.getDataSource());
>>>>>>> remotes/origin/Wolf
    }
}
