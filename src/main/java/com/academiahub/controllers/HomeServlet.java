package com.academiahub.controllers;

import com.academiahub.service.AnnouncementService;
import com.academiahub.service.CourseService;
import com.academiahub.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final CourseService       courseService       = new CourseService();
    private final AnnouncementService announcementService = new AnnouncementService();
    private final UserService         userService         = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            request.setAttribute("courseCount",       courseService.getCourseCount());
            request.setAttribute("announcementCount", announcementService.getAnnouncementCount());
            request.setAttribute("userCount",         userService.getUserCount());
            List<?> recentList = announcementService.getAllAnnouncements();
            if (recentList.size() > 3) recentList = recentList.subList(0, 3);
            request.setAttribute("recentAnnouncements", recentList);
        } catch (SQLException e) {
            request.setAttribute("courseCount", 0);
            request.setAttribute("announcementCount", 0);
            request.setAttribute("userCount", 0);
        }

        request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
    }
}
