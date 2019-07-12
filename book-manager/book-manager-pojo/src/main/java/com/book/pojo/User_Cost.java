package com.book.pojo;


public class User_Cost {
    private int user_Id;
    private int book_Id;
    private int cost_Id;
    private String cost_Date;
    private double cost_Money;
    private String cost_Other;

    public User_Cost() {
    }

    public User_Cost(int user_Id, int book_Id, int cost_Id, String cost_Date, double cost_Money, String cost_Other) {
        this.user_Id = user_Id;
        this.book_Id = book_Id;
        this.cost_Id = cost_Id;
        this.cost_Date = cost_Date;
        this.cost_Money = cost_Money;
        this.cost_Other = cost_Other;
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

    public int getCost_Id() {
        return cost_Id;
    }

    public void setCost_Id(int cost_Id) {
        this.cost_Id = cost_Id;
    }

    public String getCost_Date() {
        return cost_Date;
    }

    public void setCost_Date(String cost_Date) {
        this.cost_Date = cost_Date;
    }

    public double getCost_Money() {
        return cost_Money;
    }

    public void setCost_Money(double cost_Money) {
        this.cost_Money = cost_Money;
    }

    public String getCost_Other() {
        return cost_Other;
    }

    public void setCost_Other(String cost_Other) {
        this.cost_Other = cost_Other;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User_Cost user_cost = (User_Cost) o;
        return user_Id == user_cost.user_Id &&
                book_Id == user_cost.book_Id &&
                cost_Id == user_cost.cost_Id &&
                Double.compare(user_cost.cost_Money, cost_Money) == 0 &&
                cost_Date.equals(user_cost.cost_Date) &&
                cost_Other.equals(user_cost.cost_Other);
    }


    @Override
    public String toString() {
        return "User_Cost{" +
                "user_Id=" + user_Id +
                ", book_Id=" + book_Id +
                ", cost_Id=" + cost_Id +
                ", cost_Date='" + cost_Date + '\'' +
                ", cost_Money=" + cost_Money +
                ", cost_Other='" + cost_Other + '\'' +
                '}';
    }
}
