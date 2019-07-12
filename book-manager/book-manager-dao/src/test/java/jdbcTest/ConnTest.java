package jdbcTest;

import com.book.dao.IAdviceDao;
import com.book.dao.impl.AdviceDaoImpl;
import com.book.pojo.Admin;
import com.book.pojo.Advice;
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
        List<Advice> li = null;
        try {
            li = qr.query("select * from advice", new BeanListHandler<>(Advice.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(li.get(0)==null){
            return;
        }
        System.out.println(li.get(0));
    }
    @Test
    public void demo1Test(){
        IAdviceDao adviceDao = new AdviceDaoImpl();
        List<Advice> adviceList = null;
        try {
            adviceList = adviceDao.selectAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for(Advice advice:adviceList){
            System.out.println(advice);
        }
    }
}
