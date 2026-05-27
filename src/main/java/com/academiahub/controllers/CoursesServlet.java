package com.academiahub.controllers;

import com.academiahub.service.CourseService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/courses")
public class CoursesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final CourseService courseService = new CourseService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            request.setAttribute("courses", courseService.getAllCourses());
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Could not load courses. Please try again later.");
        }

        request.getRequestDispatcher("/WEB-INF/pages/courses.jsp").forward(request, response);
    }
}
