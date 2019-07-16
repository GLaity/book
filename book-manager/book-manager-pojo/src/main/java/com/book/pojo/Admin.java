package com.book.pojo;

public class Admin {
    private String admin_Id;
    private  String admin_Name;
    private String admin_Password;

    public Admin() {
    }

    public Admin(String admin_Id, String admin_Name, String admin_Password) {
        this.admin_Id = admin_Id;
        this.admin_Name = admin_Name;
        this.admin_Password = admin_Password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "admin_Id='" + admin_Id + '\'' +
                ", admin_Name='" + admin_Name + '\'' +
                ", admin_Password='" + admin_Password + '\'' +
                '}';
    }

    public String getAdmin_Id() {
        return admin_Id;
    }

    public void setAdmin_Id(String admin_Id) {
        this.admin_Id = admin_Id;
    }

    public String getAdmin_Name() {
        return admin_Name;
    }

    public void setAdmin_Name(String admin_Name) {
        this.admin_Name = admin_Name;
    }

    public String getAdmin_Password() {
        return admin_Password;
    }

    public void setAdmin_Password(String admin_Password) {
        this.admin_Password = admin_Password;
    }
}
