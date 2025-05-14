package com.javaweb.model;

import java.sql.Date;

public class Comment {
    private int id;
    private String content;
    private Date createDate;
    private int userId;
    private int reviewId;
    private String userFullName;

    public Comment() {}

    public Comment(int id, String content, Date createDate, int userId, int reviewId) {
        this.id = id;
        this.content = content;
        this.createDate = createDate;
        this.userId = userId;
        this.reviewId = reviewId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public Date getCreateDate() { return createDate; }
    public void setCreateDate(Date createDate) { this.createDate = createDate; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public int getReviewId() { return reviewId; }
    public void setReviewId(int reviewId) { this.reviewId = reviewId; }
    public String getUserFullName() { return userFullName; }
    public void setUserFullName(String userFullName) { this.userFullName = userFullName; }
} 