package com.javaweb.model;

import java.sql.Date;

public class Review {
    private int id;
    private String content;
    private int star;
    private String image;
    private Date createDate;
    private String status;
    private int userId;
    private int dishId;
    private String dishName;
    private String userFullName;

    public Review() {}

    public Review(int id, String content, int star, String image, Date createDate, String status, int userId, int dishId) {
        this.id = id;
        this.content = content;
        this.star = star;
        this.image = image;
        this.createDate = createDate;
        this.status = status;
        this.userId = userId;
        this.dishId = dishId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public int getStar() { return star; }
    public void setStar(int star) { this.star = star; }
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
    public Date getCreateDate() { return createDate; }
    public void setCreateDate(Date createDate) { this.createDate = createDate; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public int getDishId() { return dishId; }
    public void setDishId(int dishId) { this.dishId = dishId; }
    public String getDishName() { return dishName; }
    public void setDishName(String dishName) { this.dishName = dishName; }
    public String getUserFullName() { return userFullName; }
    public void setUserFullName(String userFullName) { this.userFullName = userFullName; }
} 