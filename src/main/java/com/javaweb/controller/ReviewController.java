package com.javaweb.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.javaweb.dao.ReviewDAO;
import com.javaweb.model.Review;
import java.util.List;
import java.sql.SQLException;

@WebServlet("/admin/list-review")
public class ReviewController extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String dishName = request.getParameter("dishName");
            String star = request.getParameter("star");
            String status = request.getParameter("status");
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");

            ReviewDAO reviewDAO = new ReviewDAO();
            try {
                List<Review> reviews = reviewDAO.filterReviews(dishName, star, status, fromDate, toDate);
                request.setAttribute("reviews", reviews);
                request.getRequestDispatcher("/views/admin/ReviewListView.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi lọc danh sách đánh giá");
            }
        }

}
