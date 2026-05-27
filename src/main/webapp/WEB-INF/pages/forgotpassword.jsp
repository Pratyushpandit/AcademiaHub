<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Change Password - AcademiaHub");
%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/includes/head.jsp" %>

<body>

<header class="site-header">
    <div class="container">
        <div class="header-inner">
            <div class="logo-area">
                <span class="logo-icon">🎓</span>
                <span class="site-logo">AcademiaHub</span>
            </div>
        </div>
    </div>
</header>

<main class="main-content">
    <div class="form-card" style="max-width: 480px;">
        <h2>🔑 Change Password</h2>
        <p class="form-card-subtitle">Enter your current password to set a new one</p>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="message-error">⚠ <%= request.getAttribute("errorMessage") %></p>
        <% } %>
        <% if (request.getAttribute("successMessage") != null) { %>
            <p class="message-success">✓ <%= request.getAttribute("successMessage") %></p>
        <% } %>

        <form action="${pageContext.request.contextPath}/forgotpassword" method="post">

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required
                       placeholder="you@islington.edu.np">
            </div>

            <div class="form-group">
                <label for="oldPassword">Current Password</label>
                <input type="password" id="oldPassword" name="oldPassword" required
                       placeholder="Enter your current password">
            </div>

            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" id="newPassword" name="newPassword" required
                       placeholder="Enter new password">
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required
                       placeholder="Confirm new password">
            </div>

            <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 10px;">
                Update Password →
            </button>
        </form>

        <p class="form-footer" style="margin-top: 25px;">
            <a href="${pageContext.request.contextPath}/login">← Back to Login</a>
        </p>
    </div>
</main>

<footer class="site-footer">
    <div class="container">
        <p>&copy; 2026 AcademiaHub &bull; Islington College &bull; All rights reserved.</p>
    </div>
</footer>

</body>
</html>