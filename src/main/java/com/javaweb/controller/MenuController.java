package com.javaweb.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.javaweb.dao.DishDAO;
import com.javaweb.model.Dish;
import java.util.List;

@WebServlet("")
public class MenuController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DishDAO dishDAO = new DishDAO();
        List<Dish> dishes = dishDAO.getAllDishes();
        request.setAttribute("dishes", dishes);
        request.getRequestDispatcher("/views/public/MenuView.jsp").forward(request, response);
    }
} 