package com.book.pojo;

public class Reply {
    private int reply_Id;
    private int reply_Text;
    private int reply_Date;
    private int advice_Id;

    public Reply() {
    }

    public Reply(int reply_Id, int reply_Text, int reply_Date, int advice_Id) {
        this.reply_Id = reply_Id;
        this.reply_Text = reply_Text;
        this.reply_Date = reply_Date;
        this.advice_Id = advice_Id;
    }

    public int getReply_Id() {
        return reply_Id;
    }

    public void setReply_Id(int reply_Id) {
        this.reply_Id = reply_Id;
    }

    public int getReply_Text() {
        return reply_Text;
    }

    public void setReply_Text(int reply_Text) {
        this.reply_Text = reply_Text;
    }

    public int getReply_Date() {
        return reply_Date;
    }

    public void setReply_Date(int reply_Date) {
        this.reply_Date = reply_Date;
    }

    public int getAdvice_Id() {
        return advice_Id;
    }

    public void setAdvice_Id(int advice_Id) {
        this.advice_Id = advice_Id;
    }
}
