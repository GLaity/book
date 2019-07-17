package com.book.pojo;


public class User_Advice {
    private int user_Id;
    private int advice_Id;

    public User_Advice() {
    }

    public User_Advice(int user_Id, int advice_Id) {
        this.user_Id = user_Id;
        this.advice_Id = advice_Id;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;
    }

    public int getAdvice_Id() {
        return advice_Id;
    }

    public void setAdvice_Id(int advice_Id) {
        this.advice_Id = advice_Id;
    }

}
