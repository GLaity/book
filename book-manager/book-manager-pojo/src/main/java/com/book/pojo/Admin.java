package com.book.pojo;

public class Admin {
    private String admin_Id;
    private String admin_Password;

    public Admin() {
    }

    public Admin(String admin_Id, String admin_Password) {
        this.admin_Id = admin_Id;
        this.admin_Password = admin_Password;
    }

    public String getAdmin_Id() {
        return admin_Id;
    }

    public void setAdmin_Id(String admin_Id) {
        this.admin_Id = admin_Id;
    }

    public String getAdmin_Password() {
        return admin_Password;
    }

    public void setAdmin_Password(String admin_Password) {
        this.admin_Password = admin_Password;
    }
}
