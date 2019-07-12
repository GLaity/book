package com.book.pojo;

public class Advice {
    private int advice_Id;
    private String advice_Text;
    private int advice_Level;
    private String Date;
    private int user_Id;
    private int book_Id;

    public Advice() {
    }

    public Advice(int advice_Id, String advice_Text, int advice_Level, String date, int user_Id, int book_Id) {
        this.advice_Id = advice_Id;
        this.advice_Text = advice_Text;
        this.advice_Level = advice_Level;
        Date = date;
        this.user_Id = user_Id;
        this.book_Id = book_Id;
    }

    public int getAdvice_Id() {
        return advice_Id;
    }

    public void setAdvice_Id(int advice_Id) {
        this.advice_Id = advice_Id;
    }

    public String getAdvice_Text() {
        return advice_Text;
    }

    public void setAdvice_Text(String advice_Text) {
        this.advice_Text = advice_Text;
    }

    public int getAdvice_Level() {
        return advice_Level;
    }

    public void setAdvice_Level(int advice_Level) {
        this.advice_Level = advice_Level;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;
    }

    public int getBook_Id() {
        return book_Id;
    }

    public void setBook_Id(int book_Id) {
        this.book_Id = book_Id;
    }
}
