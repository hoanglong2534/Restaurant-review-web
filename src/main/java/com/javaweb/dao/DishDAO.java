package com.javaweb.dao;

import com.javaweb.model.Dish;
import com.javaweb.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DishDAO {
    public List<Dish> getAllDishes() {
        List<Dish> dishes = new ArrayList<>();
        String sql = "SELECT * FROM dish";
        try (
            Connection conn = DBConnection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)
        ) {
            while (rs.next()) {
                Dish dish = new Dish();
                dish.setId(rs.getInt("id"));
                dish.setName(rs.getString("name"));
                dish.setDescription(rs.getString("description"));
                dish.setPrice(rs.getInt("price"));
                dish.setImage(rs.getString("image"));
                dishes.add(dish);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dishes;
    }

    public Dish getDishById(int id) {
        String sql = "SELECT * FROM dish WHERE id = ?";
        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, id);
            System.out.println("DEBUG: Query dish id = " + id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    System.out.println("DEBUG: Found dish id = " + id);
                    Dish dish = new Dish();
                    dish.setId(rs.getInt("id"));
                    dish.setName(rs.getString("name"));
                    dish.setDescription(rs.getString("description"));
                    dish.setPrice(rs.getInt("price"));
                    dish.setImage(rs.getString("image"));
                    return dish;
                } else {
                    System.out.println("DEBUG: NOT FOUND dish id = " + id);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
} 