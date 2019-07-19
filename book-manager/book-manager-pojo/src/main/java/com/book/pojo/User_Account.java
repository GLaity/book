package com.book.pojo;

public class User_Account {
    private int user_Id;
    private String user_Username;
    private String user_Password;
    private String user_Date;
    private String user_Tel;
    private String user_Email;
    private String user_Photo;

    public User_Account() {
    }

    public User_Account(String user_Username, String user_Password) {
        this.user_Username = user_Username;
        this.user_Password = user_Password;
    }

    public User_Account(String user_Username, String user_Password, String user_Tel, String user_Email, String user_Photo) {
        this.user_Username = user_Username;
        this.user_Password = user_Password;
        this.user_Tel = user_Tel;
        this.user_Email = user_Email;
        this.user_Photo = user_Photo;
    }
    public User_Account(String user_Username, String user_Password, String user_Date, String user_Tel, String user_Email, String user_Photo) {
        this.user_Username = user_Username;
        this.user_Password = user_Password;
        this.user_Date = user_Date;
        this.user_Tel = user_Tel;
        this.user_Email = user_Email;
        this.user_Photo = user_Photo;
    }

    public User_Account(int user_Id, String user_Username, String user_Password, String user_Date, String user_Tel, String user_Email, String user_Photo) {
        this.user_Id = user_Id;
        this.user_Username = user_Username;
        this.user_Password = user_Password;
        this.user_Date = user_Date;
        this.user_Tel = user_Tel;
        this.user_Email = user_Email;
        this.user_Photo = user_Photo;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;
    }

    public String getUser_Username() {
        return user_Username;
    }

    public void setUser_Username(String user_Username) {
        this.user_Username = user_Username;
    }

    public String getUser_Password() {
        return user_Password;
    }

    public void setUser_Password(String user_Password) {
        this.user_Password = user_Password;
    }

    public String getUser_Date() {
        return user_Date;
    }

    public void setUser_Date(String user_Date) {
        this.user_Date = user_Date;
    }

    public String getUser_Tel() {
        return user_Tel;
    }

    public void setUser_Tel(String user_Tel) {
        this.user_Tel = user_Tel;
    }

    public String getUser_Email() {
        return user_Email;
    }

    public void setUser_Email(String user_Email) {
        this.user_Email = user_Email;
    }

    public String getUser_Photo() {
        return user_Photo;
    }

    public void setUser_Photo(String user_Photo) {
        this.user_Photo = user_Photo;
    }

    @Override
    public String toString() {
        return "User_Account{" +
                "user_Id=" + user_Id +
                ", user_Username='" + user_Username + '\'' +
                ", user_Password='" + user_Password + '\'' +
                ", user_Date='" + user_Date + '\'' +
                ", user_Tel='" + user_Tel + '\'' +
                ", user_Email='" + user_Email + '\'' +
                ", user_Photo='" + user_Photo + '\'' +
                '}';
    }
}
