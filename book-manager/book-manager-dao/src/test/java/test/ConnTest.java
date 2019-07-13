package test;

import com.book.util.JDBCUtils;
import org.junit.Test;

public class ConnTest {
    @Test
    public void ConnTest(){
        System.out.println("连接测试！");
        System.out.println(JDBCUtils.getDataSource());
    }
}
