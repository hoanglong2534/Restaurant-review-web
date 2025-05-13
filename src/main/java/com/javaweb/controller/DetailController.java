package com.javaweb.controller;

import com.javaweb.dao.DishDAO;
import com.javaweb.dao.ReviewDAO;
import com.javaweb.model.Dish;
import com.javaweb.model.Review;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;

@WebServlet("/detail")
public class DetailController extends HttpServlet {
    private DishDAO dishDAO = new DishDAO();
    private ReviewDAO reviewDAO = new ReviewDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        Dish dish = null;
        List<Review> reviews = new ArrayList<>();
        String error = null;
        if (id != null && !id.isEmpty()) {
            try {
                int dishId = Integer.parseInt(id);
                dish = dishDAO.getDishById(dishId);
                if (dish != null) {
                    reviews = reviewDAO.getReviewsForDish(dishId);
                } else {
                    error = "Không tìm thấy món ăn!";
                }
            } catch (NumberFormatException e) {
                error = "ID món ăn không hợp lệ!";
            }
        } else {
            error = "Thiếu ID món ăn!";
        }
        request.setAttribute("dish", dish);
        request.setAttribute("reviews", reviews);
        request.setAttribute("error", error);
        request.getRequestDispatcher("/views/public/DetailView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle review submission
        String dishId = request.getParameter("dishId");
        String content = request.getParameter("content");
        String rating = request.getParameter("rating");
        String image = request.getParameter("image");
        
        // Get user from session
        Object userObj = request.getSession().getAttribute("user");
        if (userObj == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        try {
            Review review = new Review();
            review.setDishId(Integer.parseInt(dishId));
            review.setUserId(((com.javaweb.model.User)userObj).getId());
            review.setContent(content);
            review.setStar(Integer.parseInt(rating));
            review.setImage(image);
            review.setStatus("chuaphanhoi");
            
            if (reviewDAO.addReview(review)) {
                response.sendRedirect(request.getContextPath() + "/detail?id=" + dishId);
            } else {
                request.setAttribute("error", "Không thể thêm đánh giá. Vui lòng thử lại!");
                request.getRequestDispatcher("/views/public/DetailView.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại!");
            request.getRequestDispatcher("/views/public/DetailView.jsp").forward(request, response);
        }
    }
}