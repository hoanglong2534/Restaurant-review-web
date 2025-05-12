package com.javaweb.filter;

import com.javaweb.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*"})
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false);

        // Kiểm tra đã đăng nhập chưa
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String uri = request.getRequestURI();

        // Phân quyền cho các trang admin
        if (uri.endsWith("/admin") || uri.endsWith("/admin/list-review")) {
            if (!"admin".equals(user.getRole()) && !"staff".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
        } else if (uri.endsWith("/admin/statistic") || uri.endsWith("/admin/list-report")) {
            if (!"admin".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/admin");
                return;
            }
        }

        // Nếu hợp lệ, cho đi tiếp
        filterChain.doFilter(servletRequest, servletResponse);
    }
} 