package com.book.pojo;

public class Count_Account {
    private int user_Id;
    private int count_TotalVisit;
    private int count_TotalBought;
    private int count_TotalTime;
    private double count_TotalPay;

    public Count_Account() {
    }

    public Count_Account(int user_Id, int count_TotalVisit, int count_TotalBought, int count_TotalTime, double count_TotalPay) {
        this.user_Id = user_Id;
        this.count_TotalVisit = count_TotalVisit;
        this.count_TotalBought = count_TotalBought;
        this.count_TotalTime = count_TotalTime;
        this.count_TotalPay = count_TotalPay;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;
    }

    public int getCount_TotalVisit() {
        return count_TotalVisit;
    }

    public void setCount_TotalVisit(int count_TotalVisit) {
        this.count_TotalVisit = count_TotalVisit;
    }

    public int getCount_TotalBought() {
        return count_TotalBought;
    }

    public void setCount_TotalBought(int count_TotalBought) {
        this.count_TotalBought = count_TotalBought;
    }

    public int getCount_TotalTime() {
        return count_TotalTime;
    }

    public void setCount_TotalTime(int count_TotalTime) {
        this.count_TotalTime = count_TotalTime;
    }

    public double getCount_TotalPay() {
        return count_TotalPay;
    }

    public void setCount_TotalPay(double count_TotalPay) {
        this.count_TotalPay = count_TotalPay;
    }
}
