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
        IAdviceDao adviceDao = new AdviceDaoImpl();
        Advice li = new Advice();
        li.setAdvice_Text("hao");
        li.setAdvice_Level(3);
//        li.setAdvice_Date("2019-02-02");
        li.setBook_Id(1111);
        li.setUser_Id(1212);
        try {
            adviceDao.insertAdvice(li);
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
