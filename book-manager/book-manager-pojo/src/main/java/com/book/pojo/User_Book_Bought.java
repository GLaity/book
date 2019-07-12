package com.book.pojo;


public class User_Book_Bought {
    private int user_Id;
    private int book_Id;
    public User_Book_Bought() {
    }

    public User_Book_Bought(int user_Id, int book_Id) {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User_Book_Bought that = (User_Book_Bought) o;
        return user_Id == that.user_Id &&
                book_Id == that.book_Id;
    }


    @Override
    public String toString() {
        return "User_Book_Collection{" +
                "user_Id=" + user_Id +
                ", book_Id=" + book_Id +
                '}';
    }
}

