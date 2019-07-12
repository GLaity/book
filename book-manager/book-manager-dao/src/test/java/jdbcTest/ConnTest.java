package jdbcTest;

import com.book.pojo.Admin;
import com.book.util.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;


public class ConnTest {
    @Test
    public void demoTest(){
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        List<Admin> li = null;
        try {
            li = qr.query("select * from `admin`", new BeanListHandler<>(Admin.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(li.get(0)==null){
            return;
        }
        System.out.println(li.get(0).getAdmin_Id());
    }
}
