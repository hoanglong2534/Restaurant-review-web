package com.javaweb.dao;

import com.javaweb.model.Review;
import com.javaweb.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
    private Connection connection;

    public ReviewDAO() {
        try {
            connection = DBConnection.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();
        String query = "SELECT r.*, d.name AS dishName, u.fullName AS userFullName FROM review r " +
                "LEFT JOIN dish d ON r.dishId = d.id " +
                "LEFT JOIN user u ON r.userId = u.id";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("id"));
                review.setImage(rs.getString("image"));
                review.setContent(rs.getString("content"));
                review.setStar(rs.getInt("star"));
                java.sql.Timestamp ts = rs.getTimestamp("createDate");
                if (ts != null) review.setCreateDate(new java.sql.Date(ts.getTime()));
                review.setStatus(rs.getString("status"));
                review.setUserId(rs.getInt("userId"));
                review.setDishId(rs.getInt("dishId"));
                review.setDishName(rs.getString("dishName"));
                review.setUserFullName(rs.getString("userFullName"));
                reviews.add(review);
                System.out.println("Review: id=" + review.getId()
                    + ", dishId=" + review.getDishId() + ", dishName=" + review.getDishName()
                    + ", userId=" + review.getUserId() + ", userFullName=" + review.getUserFullName()
                    + ", content=" + review.getContent());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public List<Review> filterReviews(String dishName, String star, String status, String fromDate, String toDate) throws SQLException {
        List<Review> reviews = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT r.*, d.name AS dishName, u.fullName AS userFullName FROM review r " +
                "LEFT JOIN dish d ON r.dishId = d.id " +
                "LEFT JOIN user u ON r.userId = u.id WHERE 1=1");
        List<Object> params = new ArrayList<>();
        if (dishName != null && !dishName.trim().isEmpty()) {
            query.append(" AND d.name LIKE ?");
            params.add("%" + dishName.trim() + "%");
        }
        if (star != null && !star.trim().isEmpty()) {
            query.append(" AND r.star = ?");
            params.add(Integer.parseInt(star.trim()));
        }
        if (status != null && !status.trim().isEmpty()) {
            query.append(" AND r.status = ?");
            params.add(status.trim());
        }
        if (fromDate != null && !fromDate.trim().isEmpty()) {
            query.append(" AND DATE(r.createDate) >= ?");
            params.add(fromDate.trim());
        }
        if (toDate != null && !toDate.trim().isEmpty()) {
            query.append(" AND DATE(r.createDate) <= ?");
            params.add(toDate.trim());
        }
        try (PreparedStatement ps = connection.prepareStatement(query.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("id"));
                review.setImage(rs.getString("image"));
                review.setContent(rs.getString("content"));
                review.setStar(rs.getInt("star"));
                java.sql.Timestamp ts = rs.getTimestamp("createDate");
                if (ts != null) review.setCreateDate(new java.sql.Date(ts.getTime()));
                review.setStatus(rs.getString("status"));
                review.setDishName(rs.getString("dishName"));
                review.setUserFullName(rs.getString("userFullName"));
                reviews.add(review);
            }
        }
        return reviews;
    }
} 