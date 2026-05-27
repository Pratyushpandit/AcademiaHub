package com.academiahub.controllers;

import com.academiahub.service.AnnouncementService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/announcements")
public class AnnouncementsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final AnnouncementService announcementService = new AnnouncementService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            request.setAttribute("announcements", announcementService.getAllAnnouncements());
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Could not load announcements. Please try again later.");
        }

        request.getRequestDispatcher("/WEB-INF/pages/announcements.jsp").forward(request, response);
    }
}
