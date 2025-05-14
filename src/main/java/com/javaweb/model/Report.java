package com.javaweb.model;

import java.io.Serializable;
import java.sql.Date;

public class Report implements Serializable {
    private int id;
    private String reason;
    private String status;
    private Date createDate;
    private int reviewId;
    private int userId;
    private String dishName;
    private String reviewContent;
    private String reviewImage;
    private String reviewerName;
    private String reviewerAvatar;
    private String reporterName;
    private String reporterAvatar;

    public Report() {}

    public Report(int id, String reason, String status, Date createDate, int userId, int reviewId) {
        this.id = id;
        this.reason = reason;
        this.status = status;
        this.createDate = createDate;
        this.userId = userId;
        this.reviewId = reviewId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Date getCreateDate() { return createDate; }
    public void setCreateDate(Date createDate) { this.createDate = createDate; }
    public int getReviewId() { return reviewId; }
    public void setReviewId(int reviewId) { this.reviewId = reviewId; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public String getDishName() { return dishName; }
    public void setDishName(String dishName) { this.dishName = dishName; }
    public String getReviewContent() { return reviewContent; }
    public void setReviewContent(String reviewContent) { this.reviewContent = reviewContent; }
    public String getReviewImage() { return reviewImage; }
    public void setReviewImage(String reviewImage) { this.reviewImage = reviewImage; }
    public String getReviewerName() { return reviewerName; }
    public void setReviewerName(String reviewerName) { this.reviewerName = reviewerName; }
    public String getReviewerAvatar() { return reviewerAvatar; }
    public void setReviewerAvatar(String reviewerAvatar) { this.reviewerAvatar = reviewerAvatar; }
    public String getReporterName() { return reporterName; }
    public void setReporterName(String reporterName) { this.reporterName = reporterName; }
    public String getReporterAvatar() { return reporterAvatar; }
    public void setReporterAvatar(String reporterAvatar) { this.reporterAvatar = reporterAvatar; }
} 