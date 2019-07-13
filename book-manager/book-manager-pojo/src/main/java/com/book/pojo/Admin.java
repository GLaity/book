package com.book.pojo;

public class Admin {
    private String adminId;
    private  String adminName;
    private String adminPassword;

    public Admin() {
    }

    public Admin(String adminId) {
        this.adminId = adminId;
    }

    public Admin(String adminId,String adminName, String adminPassword) {
        this.adminId = adminId;
        this.adminName=adminName;
        this.adminPassword = adminPassword;
    }

    public String getAdmin_Id() {
        return adminId;
    }

    public void setAdmin_Id(String adminId) {
        this.adminId = adminId;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId='" + adminId + '\'' +
                ", adminname='" + adminName + '\'' +
                ", adminPassword='" + adminPassword + '\'' +
                '}';
    }
}
