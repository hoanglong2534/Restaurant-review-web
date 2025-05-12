package com.javaweb.controller;

import com.javaweb.dao.DishDAO;
import com.javaweb.model.Dish;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/detail")
public class DetailController extends HttpServlet {
    private DishDAO dishDAO = new DishDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            try {
                int dishId = Integer.parseInt(id);
                Dish dish = dishDAO.getDishById(dishId);
                if (dish != null) {
                    request.setAttribute("dish", dish);
                    request.getRequestDispatcher("/views/public/DetailView.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                // ignore, redirect below
            }
        }
        response.sendRedirect(request.getContextPath() + "/");
    }
}