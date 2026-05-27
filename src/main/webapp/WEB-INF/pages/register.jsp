<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setAttribute("pageTitle", "Register - AcademiaHub");
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
    <div class="form-card" style="max-width: 520px;">
        <h2>Create Account</h2>
        <p class="form-card-subtitle">Join AcademiaHub — Islington College's academic portal</p>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="message-error">⚠ <%= request.getAttribute("errorMessage") %></p>
        <% } %>

        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" required placeholder="Your full name">
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required placeholder="you@islington.edu.np">
            </div>

            <div class="register-grid">
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Create password">
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Repeat password">
                </div>
            </div>

            <div class="form-group">
                <label for="role">Role</label>
                <select id="role" name="role" required>
                    <option value="" disabled selected>Select your role…</option>
                    <option value="student">Student</option>
                    <option value="faculty">Faculty</option>
                    <option value="admin">Admin</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Create Account →</button>
        </form>

        <p class="form-footer">Already have an account? <a href="${pageContext.request.contextPath}/login">Sign in here</a></p>
    </div>
</main>

<footer class="site-footer">
    <div class="container">
        <p>&copy; 2026 AcademiaHub &bull; Islington College &bull; All rights reserved.</p>
    </div>
</footer>
</body>
</html>