package com.admin.service.impl;

import com.admin.dao.AdminDao;
import com.admin.dao.AdminDaoImpl;
import com.admin.service.AdminService;
import com.book.pojo.Admin;

public class AdminServiceImpl implements AdminService {
    @Override
    public Admin adminLogin(String adminName, String passWord) {
        Admin admin=null;
        AdminDao adminDao =new AdminDaoImpl();
        admin=adminDao.selectPwdByNameAndPwd(adminName,passWord);
        if (admin!=null){
            if (passWord.equals(admin.getAdmin_Password())){
                return admin;
            }else {
                return null;
            }
        }
        return admin;
    }
}
