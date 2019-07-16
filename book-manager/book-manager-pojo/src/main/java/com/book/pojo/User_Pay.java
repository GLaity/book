package com.book.pojo;


public class User_Pay {
    private int user_Id;
    private int pay_Id;
    private String pay_Date;
    private double pay_Money;
    private String pay_Other;

    public User_Pay() {
    }

    public User_Pay(int user_Id, int pay_Id, String pay_Date, double pay_Money, String pay_Other) {
        this.user_Id = user_Id;
        this.pay_Id = pay_Id;
        this.pay_Date = pay_Date;
        this.pay_Money = pay_Money;
        this.pay_Other = pay_Other;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;
    }

    public int getPay_Id() {
        return pay_Id;
    }

    public void setPay_Id(int pay_Id) {
        this.pay_Id = pay_Id;
    }

    public String getPay_Date() {
        return pay_Date;
    }

    public void setPay_Date(String pay_Date) {
        this.pay_Date = pay_Date;
    }

    public double getPay_Money() {
        return pay_Money;
    }

    public void setPay_Money(double pay_Money) {
        this.pay_Money = pay_Money;
    }

    public String getPay_Other() {
        return pay_Other;
    }

    public void setPay_Other(String pay_Other) {
        this.pay_Other = pay_Other;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User_Pay user_pay = (User_Pay) o;
        return user_Id == user_pay.user_Id &&
                pay_Id == user_pay.pay_Id &&
                Double.compare(user_pay.pay_Money, pay_Money) == 0 &&
                pay_Date.equals(user_pay.pay_Date) &&
                pay_Other.equals(user_pay.pay_Other);
    }

    @Override
    public String toString() {
        return "User_Pay{" +
                "user_Id=" + user_Id +
                ", pay_Id=" + pay_Id +
                ", pay_Date='" + pay_Date + '\'' +
                ", pay_Money=" + pay_Money +
                ", pay_Other='" + pay_Other + '\'' +
                '}';
    }
}
