package com.javaweb.model;

import java.sql.Date;

public class Statistic {
    private int id;
    private int avgStar;
    private int sumRpt;
    private int sumItr;
    private Date createDate;
    private int dishId;

    public Statistic() {}

    public Statistic(int id, int avgStar, int sumRpt, int sumItr, Date createDate, int dishId) {
        this.id = id;
        this.avgStar = avgStar;
        this.sumRpt = sumRpt;
        this.sumItr = sumItr;
        this.createDate = createDate;
        this.dishId = dishId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getAvgStar() { return avgStar; }
    public void setAvgStar(int avgStar) { this.avgStar = avgStar; }
    public int getSumRpt() { return sumRpt; }
    public void setSumRpt(int sumRpt) { this.sumRpt = sumRpt; }
    public int getSumItr() { return sumItr; }
    public void setSumItr(int sumItr) { this.sumItr = sumItr; }
    public Date getCreateDate() { return createDate; }
    public void setCreateDate(Date createDate) { this.createDate = createDate; }
    public int getDishId() { return dishId; }
    public void setDishId(int dishId) { this.dishId = dishId; }
} 