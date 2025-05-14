package com.javaweb.controller;

import com.javaweb.dao.ReportDAO;
import com.javaweb.model.Report;
import com.javaweb.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/list-report", "/report"})
public class ReportController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý cho admin xem danh sách report
        String action = request.getParameter("action");
        String idStr = request.getParameter("id");
        if ("delete".equals(action) && idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                ReportDAO dao = new ReportDAO();
                dao.deleteReportById(id);
            } catch (NumberFormatException ignored) {}
            response.sendRedirect(request.getContextPath() + "/admin/list-report");
            return;
        }
        String dishName = request.getParameter("dishName");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        ReportDAO reportDAO = new ReportDAO();
        List<Report> reports = reportDAO.filterReports(dishName, fromDate, toDate);
        request.setAttribute("reports", reports);
        request.getRequestDispatcher("/views/admin/ReportListView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý báo cáo review từ người dùng
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        String reviewIdStr = request.getParameter("reviewId");
        String reason = request.getParameter("reason");
        String otherReason = request.getParameter("reasonOther");
        System.out.println("[DEBUG] POST /report: reviewIdStr=" + reviewIdStr + ", reason=" + reason + ", otherReason=" + otherReason + ", userId=" + user.getId());
        
        if ("Khác".equals(reason) && otherReason != null && !otherReason.trim().isEmpty()) {
            reason = otherReason.trim();
        }
        
        String referer = request.getHeader("referer");
        String dishId = request.getParameter("id");
        String redirectUrl = request.getContextPath() + "/";
        if (referer != null && referer.contains("detail?id=")) {
            int idx = referer.indexOf("detail?id=");
            redirectUrl = referer.substring(idx > 0 ? idx - 1 : idx);
        } else if (dishId != null) {
            redirectUrl = request.getContextPath() + "/detail?id=" + dishId;
        }
        
        // Nếu thiếu reviewId hoặc không hợp lệ thì chỉ redirect, không parseInt
        if (reviewIdStr == null || reviewIdStr.trim().isEmpty() || reason == null || reason.trim().isEmpty()) {
            System.out.println("[DEBUG] Invalid report data - reviewIdStr: " + reviewIdStr + ", reason: " + reason);
            response.sendRedirect(redirectUrl);
            return;
        }
        
        try {
            int reviewId = Integer.parseInt(reviewIdStr);
            ReportDAO dao = new ReportDAO();
            Report report = new Report();
            report.setReviewId(reviewId);
            report.setUserId(user.getId());
            report.setReason(reason);
            report.setCreateDate(new Date(System.currentTimeMillis()));
            System.out.println("[DEBUG] Adding report: " + report);
            dao.addReport(report);
            System.out.println("[DEBUG] Report added successfully");
        } catch (NumberFormatException e) {
            System.out.println("[DEBUG] Error parsing reviewId: " + e.getMessage());
            // Nếu lỗi, chỉ redirect lại detail
        }
        response.sendRedirect(redirectUrl);
    }
} 