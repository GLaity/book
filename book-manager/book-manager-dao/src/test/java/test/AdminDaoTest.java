package test;

import com.admin.dao.AdminDao;
import com.admin.dao.AdminDaoImpl;
import com.book.pojo.Admin;

public class AdminDaoTest {

    public static void main(String[] args) {
       AdminDao adminDao=new AdminDaoImpl();
        Admin admin =new Admin();
       admin=adminDao.selectPwdById("00001");
        System.out.println(admin);

    }
}
