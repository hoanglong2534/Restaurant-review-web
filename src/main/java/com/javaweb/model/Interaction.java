package com.javaweb.model;

import java.sql.Date;

public class Interaction {
    private int id;
    private String type;
    private Date date;
    private int userId;
    private int reviewId;

    public Interaction() {}

    public Interaction(int id, String type, Date date, int userId, int reviewId) {
        this.id = id;
        this.type = type;
        this.date = date;
        this.userId = userId;
        this.reviewId = reviewId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public int getReviewId() { return reviewId; }
    public void setReviewId(int reviewId) { this.reviewId = reviewId; }
} 