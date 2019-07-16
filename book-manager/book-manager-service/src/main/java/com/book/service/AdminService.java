package com.book.service;

import com.admin.dao.AdminDao;
import com.book.pojo.Admin;

public interface AdminService {
    public Admin adminLogin(String adminName,String passWord);
}
