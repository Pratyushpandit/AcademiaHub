package com.academiahub.controllers;

import com.academiahub.model.UserModel;
import com.academiahub.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String email    = req.getParameter("email");
        String password = req.getParameter("password");
        String confirm  = req.getParameter("confirmPassword");

        if (fullName == null || fullName.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            req.setAttribute("errorMessage", "All fields are required.");
            req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, res);
            return;
        }
        if (!password.equals(confirm)) {
            req.setAttribute("errorMessage", "Passwords do not match.");
            req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, res);
            return;
        }
        try {
            if (userService.emailExists(email.trim())) {
                req.setAttribute("errorMessage", "An account with this email already exists.");
                req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, res);
                return;
            }
            UserModel u = new UserModel();
            u.setFullName(fullName.trim());
            u.setEmail(email.trim());
            u.setPassword(password);
            if (userService.register(u)) {
                res.sendRedirect(req.getContextPath() + "/login?registered=true");
            } else {
                req.setAttribute("errorMessage", "Registration failed. Please try again.");
                req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, res);
            }
        } catch (SQLException e) {
            req.setAttribute("errorMessage", "Something went wrong. Please try again later.");
            req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, res);
        }
    }
}
