package jdbctest;

import com.admin.service.AdminService;
import com.admin.service.impl.AdminServiceImpl;
import com.book.pojo.Admin;

public class ConTest {

//    @Test
//    public void findTest(){
//        IAdviceService adviceService = new AdviceServiceImpl();
//        List<Advice> adviceList = adviceService.findAdviceAll();
//        for(Advice advice:adviceList){
//            System.out.println(advice);
//        }
//    }
public static void main(String[] args) {
    AdminService adminService =new AdminServiceImpl();
    Admin admin=adminService.adminLogin("zyp","123456");
    System.out.println(admin.toString());
}
}
