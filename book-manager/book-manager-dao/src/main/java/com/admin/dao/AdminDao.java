package com.admin.dao;

import com.book.pojo.Admin;

public interface AdminDao {
    public Admin selectPwdById(String adminid);
}
