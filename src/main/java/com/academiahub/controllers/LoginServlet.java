package com.academiahub.controllers;

import com.academiahub.model.UserModel;
import com.academiahub.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("loggedInUser") != null) {
            res.sendRedirect(req.getContextPath() + "/home");
            return;
        }
        req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String email    = req.getParameter("email");
        String password = req.getParameter("password");
        if (email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            req.setAttribute("errorMessage", "All fields are required.");
            req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, res);
            return;
        }
        try {
            UserModel user = userService.authenticate(email.trim(), password);
            if (user != null) {
                req.getSession().setAttribute("loggedInUser", user);
                res.sendRedirect(req.getContextPath() + "/home");
            } else {
                req.setAttribute("errorMessage", "Invalid credentials. Please try again.");
                req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, res);
            }
        } catch (SQLException e) {
            req.setAttribute("errorMessage", "Something went wrong. Please try again later.");
            req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, res);
        }
    }
}
