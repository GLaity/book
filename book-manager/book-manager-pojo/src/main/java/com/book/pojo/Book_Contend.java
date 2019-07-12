package com.book.pojo;

public class Book_Contend {
    private int book_Id;
    private String book_Contend;

    public Book_Contend() {
    }

    public Book_Contend(int book_Id, String book_Contend) {
        this.book_Id = book_Id;
        this.book_Contend = book_Contend;
    }

    public int getBook_Id() {
        return book_Id;
    }

    public void setBook_Id(int book_Id) {
        this.book_Id = book_Id;
    }

    public String getBook_Contend() {
        return book_Contend;
    }

    public void setBook_Contend(String book_Contend) {
        this.book_Contend = book_Contend;
    }
}
