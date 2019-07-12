package com.book.pojo;

public class Book_Extend {
    private int book_Id;
    private int book_IsEnd;
    private int book_Bought;
    private int book_Collected;
    private int book_Visited;
    private int book_Chapters;

    public Book_Extend() {
    }

    public Book_Extend(int book_Id, int book_IsEnd, int book_Bought, int book_Collected, int book_Visited, int book_Chapters) {
        this.book_Id = book_Id;
        this.book_IsEnd = book_IsEnd;
        this.book_Bought = book_Bought;
        this.book_Collected = book_Collected;
        this.book_Visited = book_Visited;
        this.book_Chapters = book_Chapters;
    }

    public int getBook_Id() {
        return book_Id;
    }

    public void setBook_Id(int book_Id) {
        this.book_Id = book_Id;
    }

    public int getBook_IsEnd() {
        return book_IsEnd;
    }

    public void setBook_IsEnd(int book_IsEnd) {
        this.book_IsEnd = book_IsEnd;
    }

    public int getBook_Bought() {
        return book_Bought;
    }

    public void setBook_Bought(int book_Bought) {
        this.book_Bought = book_Bought;
    }

    public int getBook_Collected() {
        return book_Collected;
    }

    public void setBook_Collected(int book_Collected) {
        this.book_Collected = book_Collected;
    }

    public int getBook_Visited() {
        return book_Visited;
    }

    public void setBook_Visited(int book_Visited) {
        this.book_Visited = book_Visited;
    }

    public int getBook_Chapters() {
        return book_Chapters;
    }

    public void setBook_Chapters(int book_Chapters) {
        this.book_Chapters = book_Chapters;
    }
}
