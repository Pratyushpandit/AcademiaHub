package com.academiahub.controllers;

import com.academiahub.model.UserModel;
import com.academiahub.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/forgotpassword")
public class ForgotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.getRequestDispatcher("/WEB-INF/pages/forgotpassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Basic validation
        if (email == null || email.trim().isEmpty() ||
            oldPassword == null || oldPassword.trim().isEmpty() ||
            newPassword == null || newPassword.trim().isEmpty() ||
            confirmPassword == null || confirmPassword.trim().isEmpty()) {
            
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("/WEB-INF/pages/forgotpassword.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "New passwords do not match.");
            request.getRequestDispatcher("/WEB-INF/pages/forgotpassword.jsp").forward(request, response);
            return;
        }

        email = email.trim().toLowerCase();

        try {
            // Check if account exists
            if (!userService.emailExists(email)) {
                request.setAttribute("errorMessage", "No account found with this email address.");
                request.getRequestDispatcher("/WEB-INF/pages/forgotpassword.jsp").forward(request, response);
                return;
            }

            // Verify old password is correct
            UserModel user = userService.authenticate(email, oldPassword);
            if (user == null) {
                request.setAttribute("errorMessage", "Current password is incorrect.");
                request.getRequestDispatcher("/WEB-INF/pages/forgotpassword.jsp").forward(request, response);
                return;
            }

            // Change password
            boolean updated = userService.changePassword(email, newPassword);

            if (updated) {
                request.setAttribute("successMessage", "Password changed successfully! You can now login with your new password.");
            } else {
                request.setAttribute("errorMessage", "Failed to update password. Please try again.");
            }

            request.getRequestDispatcher("/WEB-INF/pages/forgotpassword.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong. Please try again later.");
            request.getRequestDispatcher("/WEB-INF/pages/forgotpassword.jsp").forward(request, response);
        }
    }
}