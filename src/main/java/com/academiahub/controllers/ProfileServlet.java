package com.academiahub.controllers;

import com.academiahub.model.UserModel;
import com.academiahub.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String fullName = request.getParameter("fullName");

        if (fullName == null || fullName.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Name cannot be empty.");
            request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
            return;
        }

        UserModel user = (UserModel) session.getAttribute("loggedInUser");
        user.setFullName(fullName.trim());
        session.setAttribute("loggedInUser", user);
        request.setAttribute("successMessage", "Profile updated successfully.");
        request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
    }
}
