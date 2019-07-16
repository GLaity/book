package com.book.service.admin.impl;

import com.admin.dao.AdminDao;
import com.admin.dao.AdminDaoImpl;
import com.book.pojo.Admin;
import com.book.service.AdminService;

public class AdminServiceImpl implements AdminService {
    public Admin adminLogin(String adminName, String passWord) {
        Admin admin=new Admin();
        AdminDao adminDao =new AdminDaoImpl();
        admin =adminDao.selectPwdByName(adminName);
        if (admin!=null){
            if (passWord.equals(admin.getAdmin_Password())){
                return admin;
            }else{
                return null;
            }
        }
        else {
            return null;
        }

    }
}
