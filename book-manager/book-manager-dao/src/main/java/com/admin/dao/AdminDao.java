package com.admin.dao;

import com.book.pojo.Admin;

public interface AdminDao {
    public Admin selectPwdByNameAndPwd(String adminName, String passwword);
    public Admin selectPwdByName(String adminName);
}
