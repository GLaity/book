package com.book.pojo;


public class Vip_Account {
    private int user_Id;
    private int vip_Id;
    private double vip_Balance;

    public Vip_Account() {
    }

    public Vip_Account(int user_Id, int vip_Id, double vip_Balance) {
        this.user_Id = user_Id;
        this.vip_Id = vip_Id;
        this.vip_Balance = vip_Balance;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;
    }

    public int getVip_Id() {
        return vip_Id;
    }

    public void setVip_Id(int vip_Id) {
        this.vip_Id = vip_Id;
    }

    public double getVip_Balance() {
        return vip_Balance;
    }

    public void setVip_Balance(double vip_Balance) {
        this.vip_Balance = vip_Balance;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Vip_Account that = (Vip_Account) o;
        return user_Id == that.user_Id &&
                vip_Id == that.vip_Id &&
                Double.compare(that.vip_Balance, vip_Balance) == 0;
    }

    @Override
    public String toString() {
        return "Vip_Account{" +
                "user_Id=" + user_Id +
                ", vip_Id=" + vip_Id +
                ", vip_Balance=" + vip_Balance +
                '}';
    }
}
