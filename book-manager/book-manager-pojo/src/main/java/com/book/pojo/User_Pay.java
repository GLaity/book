package com.book.pojo;


public class User_Pay {
    private int user_Id;
    private int pay_Id;
    private String pay_Date;
    private double pay_Money;
    private String pay_Other;

    public User_Pay() {
    }

    public User_Pay(int user_Id, int pay_Id, String pay_Date, double pay_Money, String pay_Other) {
        this.user_Id = user_Id;
        this.pay_Id = pay_Id;
        this.pay_Date = pay_Date;
        this.pay_Money = pay_Money;
        this.pay_Other = pay_Other;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;
    }

    public int getPay_Id() {
        return pay_Id;
    }

    public void setPay_Id(int pay_Id) {
        this.pay_Id = pay_Id;
    }

    public String getPay_Date() {
        return pay_Date;
    }

    public void setPay_Date(String pay_Date) {
        this.pay_Date = pay_Date;
    }

    public double getPay_Money() {
        return pay_Money;
    }

    public void setPay_Money(double pay_Money) {
        this.pay_Money = pay_Money;
    }

    public String getPay_Other() {
        return pay_Other;
    }

    public void setPay_Other(String pay_Other) {
        this.pay_Other = pay_Other;
    }
}
