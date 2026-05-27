<%@ page import="com.academiahub.model.UserModel" %>
<%
    UserModel navUser = (UserModel) session.getAttribute("loggedInUser");
    String currentPage = request.getServletPath();
%>
<header class="site-header">
    <div class="container header-inner">
        <div class="logo-area">
            <span class="logo-icon">&#127979;</span>
            <a href="<%= request.getContextPath() %>/home" class="site-logo">AcademiaHub</a>
        </div>
        <nav class="site-nav">
            <a href="<%= request.getContextPath() %>/home"          class="nav-link <%= currentPage.contains("home")          ? "active" : "" %>">&#127968; Dashboard</a>
            <a href="<%= request.getContextPath() %>/courses"       class="nav-link <%= currentPage.contains("courses")       ? "active" : "" %>">&#128218; Courses</a>
            <a href="<%= request.getContextPath() %>/announcements" class="nav-link <%= currentPage.contains("announcements") ? "active" : "" %>">&#128226; Announcements</a>
            <a href="<%= request.getContextPath() %>/profile"       class="nav-link <%= currentPage.contains("profile")       ? "active" : "" %>">&#128100; Profile</a>
        </nav>
        <div class="header-right">
            <span class="user-badge"><%= navUser != null ? navUser.getFullName() : "" %></span>
            <a href="<%= request.getContextPath() %>/logout" class="btn btn-outline-sm">Sign Out</a>
        </div>
    </div>
</header>
