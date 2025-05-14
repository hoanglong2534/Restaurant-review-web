package com.javaweb.controller;

import com.javaweb.dao.ReportDAO;
import com.javaweb.model.Report;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/list-report")
public class ReportController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String idStr = request.getParameter("id");
        if ("delete".equals(action) && idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                ReportDAO dao = new ReportDAO();
                List<Report> reports = dao.filterReports(null, null, null);
                Integer reviewId = null;
                for (Report r : reports) {
                    if (r.getId() == id) {
                        reviewId = r.getReviewId();
                        break;
                    }
                }
                if (reviewId != null) {
                    dao.deleteCommentsByReviewId(reviewId);
                    dao.deleteReviewById(reviewId);
                }
                if (id > 0) dao.deleteReportById(id);
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
} 