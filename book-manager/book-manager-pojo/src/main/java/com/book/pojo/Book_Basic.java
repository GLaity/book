package com.book.pojo;

public class Book_Basic {
    private int book_Id;
    private String book_Title;
    private String book_Context;
    private int type_Id;
    private String writer_Id;
    private String book_Createdate;

    public Book_Basic() {
    }

    public Book_Basic(int book_Id, String book_Title, String book_Context, int type_Id, String writer_Id, String book_Createdate) {
        this.book_Id = book_Id;
        this.book_Title = book_Title;
        this.book_Context = book_Context;
        this.type_Id = type_Id;
        this.writer_Id = writer_Id;
        this.book_Createdate = book_Createdate;
    }

    public int getBook_Id() {
        return book_Id;
    }

    public void setBook_Id(int book_Id) {
        this.book_Id = book_Id;
    }

    public String getBook_Title() {
        return book_Title;
    }

    public void setBook_Title(String book_Title) {
        this.book_Title = book_Title;
    }

    public String getBook_Context() {
        return book_Context;
    }

    public void setBook_Context(String book_Context) {
        this.book_Context = book_Context;
    }

    public int getType_Id() {
        return type_Id;
    }

    public void setType_Id(int type_Id) {
        this.type_Id = type_Id;
    }

    public String getWriter_Id() {
        return writer_Id;
    }

    public void setWriter_Id(String writer_Id) {
        this.writer_Id = writer_Id;
    }

    public String getBook_Createdate() {
        return book_Createdate;
    }

    public void setBook_Createdate(String book_Createdate) {
        this.book_Createdate = book_Createdate;
    }

    @Override
    public String toString() {
        return "Book_Basic{" +
                "book_Id=" + book_Id +
                ", book_Title='" + book_Title + '\'' +
                ", book_Context='" + book_Context + '\'' +
                ", type_Id=" + type_Id +
                ", writer_Id='" + writer_Id + '\'' +
                ", book_Createdate='" + book_Createdate + '\'' +
                '}';
    }
}
