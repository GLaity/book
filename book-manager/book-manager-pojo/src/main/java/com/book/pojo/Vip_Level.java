package com.book.pojo;


public class Vip_Level {
    private int vip_Id;
    private String vip_Level;
    private double vip_Balance;

    public Vip_Level() {
    }

    public Vip_Level(int vip_Id, String vip_Level, double vip_Balance) {
        this.vip_Id = vip_Id;
        this.vip_Level = vip_Level;
        this.vip_Balance = vip_Balance;
    }

    public int getVip_Id() {
        return vip_Id;
    }

    public void setVip_Id(int vip_Id) {
        this.vip_Id = vip_Id;
    }

    public String getVip_Level() {
        return vip_Level;
    }

    public void setVip_Level(String vip_Level) {
        this.vip_Level = vip_Level;
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
        Vip_Level vip_level = (Vip_Level) o;
        return vip_Id == vip_level.vip_Id &&
                Double.compare(vip_level.vip_Balance, vip_Balance) == 0 &&
                vip_Level.equals(vip_level.vip_Level);
    }


    @Override
    public String toString() {
        return "Vip_Level{" +
                "vip_Id=" + vip_Id +
                ", vip_Level='" + vip_Level + '\'' +
                ", vip_Balance=" + vip_Balance +
                '}';
    }
}
