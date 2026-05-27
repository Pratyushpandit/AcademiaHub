<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.academiahub.model.UserModel" %>
<%@ page import="com.academiahub.model.AnnouncementModel" %>
<%@ page import="java.util.List" %>

<%
    UserModel user = (UserModel) session.getAttribute("loggedInUser");
    int courseCount = request.getAttribute("courseCount") != null ? (int) request.getAttribute("courseCount") : 0;
    int announcementCount = request.getAttribute("announcementCount") != null ? (int) request.getAttribute("announcementCount") : 0;
    int userCount = request.getAttribute("userCount") != null ? (int) request.getAttribute("userCount") : 0;
    List<AnnouncementModel> recent = (List<AnnouncementModel>) request.getAttribute("recentAnnouncements");
    
    request.setAttribute("pageTitle", "Dashboard - AcademiaHub");
%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/includes/head.jsp" %>

<body>
<%@ include file="/WEB-INF/includes/navbar.jsp" %>

<main class="page-content">
    <div class="container">

        <div class="page-header">
            <h2>Welcome back, <%= user.getFullName() %> 👋</h2>
            <p class="page-subtitle">Here is your academic overview for today.</p>
            <div class="gold-divider"></div>
        </div>

        <!-- Stats Cards -->
        <div class="stats-grid">
            <div class="stat-card stat-blue">
                <div class="stat-icon-wrap">📚</div>
                <div class="stat-info">
                    <span class="stat-number"><%= courseCount %></span>
                    <span class="stat-label">Total Courses</span>
                </div>
            </div>
            <div class="stat-card stat-green">
                <div class="stat-icon-wrap">📢</div>
                <div class="stat-info">
                    <span class="stat-number"><%= announcementCount %></span>
                    <span class="stat-label">Announcements</span>
                </div>
            </div>
            <div class="stat-card stat-purple">
                <div class="stat-icon-wrap">👥</div>
                <div class="stat-info">
                    <span class="stat-number"><%= userCount %></span>
                    <span class="stat-label">Registered Students</span>
                </div>
            </div>
            <div class="stat-card stat-orange">
                <div class="stat-icon-wrap">🎓</div>
                <div class="stat-info">
                    <span class="stat-number">AY 25/26</span>
                    <span class="stat-label">Academic Year</span>
                </div>
            </div>
        </div>

        <div class="dashboard-grid">

            <!-- Recent Announcements -->
            <div class="dash-card">
                <div class="dash-card-header">
                    <h3>📢 Recent Announcements</h3>
                    <a href="<%= request.getContextPath() %>/announcements" class="view-all">View All →</a>
                </div>
                <div class="dash-card-body">
                    <% if (recent != null && !recent.isEmpty()) {
                        for (AnnouncementModel a : recent) { %>
                    <div class="announcement-item">
                        <span class="badge badge-<%= a.getCategory() != null ? a.getCategory().toLowerCase() : "general" %>"><%= a.getCategory() %></span>
                        <p class="ann-title"><%= a.getTitle() %></p>
                        <p class="ann-meta">Posted by <%= a.getPostedBy() %> &bull; <%= a.getPostedDate() %></p>
                    </div>
                    <% }
                    } else { %>
                    <p class="empty-state">No announcements yet.</p>
                    <% } %>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="dash-card">
                <div class="dash-card-header">
                    <h3>⚡ Quick Links</h3>
                </div>
                <div class="dash-card-body">
                    <div class="quick-links">
                        <a href="<%= request.getContextPath() %>/courses" class="quick-link-btn">
                            <span>📚</span> Browse Courses
                        </a>
                        <a href="<%= request.getContextPath() %>/announcements" class="quick-link-btn">
                            <span>📢</span> View Announcements
                        </a>
                        <a href="<%= request.getContextPath() %>/profile" class="quick-link-btn">
                            <span>👤</span> Edit Profile
                        </a>
                        <a href="<%= request.getContextPath() %>/logout" class="quick-link-btn quick-link-danger">
                            <span>🚪</span> Sign Out
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</main>

<footer class="site-footer">
    <div class="container">
        <p>&copy; 2026 AcademiaHub &bull; Islington College &bull; All rights reserved.</p>
    </div>
</footer>
</body>
</html>