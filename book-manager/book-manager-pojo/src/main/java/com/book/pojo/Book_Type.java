package com.book.pojo;

public class Book_Type {
    private int type_Id;
    private String type_Name;

    public Book_Type() {
    }

    public Book_Type(int type_Id, String type_Name) {
        this.type_Id = type_Id;
        this.type_Name = type_Name;
    }

    public int getType_Id() {
        return type_Id;
    }

    public void setType_Id(int type_Id) {
        this.type_Id = type_Id;
    }

    public String getType_Name() {
        return type_Name;
    }

    public void setType_Name(String type_Name) {
        this.type_Name = type_Name;
    }
}
