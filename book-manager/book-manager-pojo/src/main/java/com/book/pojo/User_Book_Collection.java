package com.book.pojo;


public class User_Book_Collection {
    private int user_Id;
    private int book_Id;

    public User_Book_Collection() {
    }

    public User_Book_Collection(int user_Id, int book_Id) {
        this.user_Id = user_Id;
        this.book_Id = book_Id;
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
