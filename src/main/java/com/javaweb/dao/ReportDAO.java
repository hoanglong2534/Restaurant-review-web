package com.javaweb.dao;

import com.javaweb.model.Report;
import com.javaweb.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReportDAO {
    private Connection connection;

    public ReportDAO() {
        try {
            connection = DBConnection.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Report> getAllReports() {
        List<Report> reports = new ArrayList<>();
        String query = "SELECT r.*, rv.content AS reviewContent, rv.image AS reviewImage, rv.star, rv.createDate AS reviewDate, " +
                "u.fullName AS reporterName, " +
                "ur.fullName AS reviewerName, d.name AS dishName " +
                "FROM report r " +
                "LEFT JOIN review rv ON r.reviewId = rv.id " +
                "LEFT JOIN user u ON r.userId = u.id " +
                "LEFT JOIN user ur ON rv.userId = ur.id " +
                "LEFT JOIN dish d ON rv.dishId = d.id";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Report report = new Report();
                report.setId(rs.getInt("id"));
                report.setReason(rs.getString("reason"));
                report.setStatus(rs.getString("status"));
                Timestamp ts = rs.getTimestamp("createDate");
                if (ts != null) report.setCreateDate(new java.sql.Date(ts.getTime()));
                report.setReviewId(rs.getInt("reviewId"));
                report.setUserId(rs.getInt("userId"));
                report.setDishName(rs.getString("dishName"));
                report.setReviewContent(rs.getString("reviewContent"));
                report.setReviewImage(rs.getString("reviewImage"));
                report.setReviewerName(rs.getString("reviewerName"));
                report.setReporterName(rs.getString("reporterName"));
                // Log dữ liệu để debug
                System.out.println("Report: id=" + report.getId()
                    + ", dishName=" + report.getDishName()
                    + ", reviewerName=" + report.getReviewerName()
                    + ", reporterName=" + report.getReporterName()
                    + ", reviewContent=" + report.getReviewContent()
                    + ", reviewImage=" + report.getReviewImage()
                    + ", reason=" + report.getReason()
                    + ", createDate=" + report.getCreateDate());
                // Có thể set thêm các trường phụ vào report nếu cần
                reports.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reports;
    }

    public List<Report> filterReports(String dishName, String fromDate, String toDate) {
        List<Report> reports = new ArrayList<>();
        StringBuilder query = new StringBuilder("SELECT r.*, rv.content AS reviewContent, rv.image AS reviewImage, rv.star, rv.createDate AS reviewDate, " +
                "u.fullName AS reporterName, " +
                "ur.fullName AS reviewerName, d.name AS dishName " +
                "FROM report r " +
                "LEFT JOIN review rv ON r.reviewId = rv.id " +
                "LEFT JOIN user u ON r.userId = u.id " +
                "LEFT JOIN user ur ON rv.userId = ur.id " +
                "LEFT JOIN dish d ON rv.dishId = d.id WHERE 1=1");
        List<Object> params = new ArrayList<>();
        if (dishName != null && !dishName.trim().isEmpty()) {
            query.append(" AND d.name LIKE ?");
            params.add("%" + dishName.trim() + "%");
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
                Report report = new Report();
                report.setId(rs.getInt("id"));
                report.setReason(rs.getString("reason"));
                report.setStatus(rs.getString("status"));
                Timestamp ts = rs.getTimestamp("createDate");
                if (ts != null) report.setCreateDate(new java.sql.Date(ts.getTime()));
                report.setReviewId(rs.getInt("reviewId"));
                report.setUserId(rs.getInt("userId"));
                report.setDishName(rs.getString("dishName"));
                report.setReviewContent(rs.getString("reviewContent"));
                report.setReviewImage(rs.getString("reviewImage"));
                report.setReviewerName(rs.getString("reviewerName"));
                report.setReporterName(rs.getString("reporterName"));
                reports.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reports;
    }

    public boolean deleteReportById(int id) {
        String query = "DELETE FROM report WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void addReport(Report report) {
        String query = "INSERT INTO report (reviewId, userId, reason, createDate) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, report.getReviewId());
            ps.setInt(2, report.getUserId());
            ps.setString(3, report.getReason());
            ps.setDate(4, report.getCreateDate());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} 