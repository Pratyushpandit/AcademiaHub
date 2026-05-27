<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setAttribute("pageTitle", "Login - AcademiaHub");
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
    <div class="form-card">
        <h2>Welcome Back</h2>
        <p class="form-card-subtitle">Sign in to your AcademiaHub account</p>

        <% if (request.getParameter("registered") != null) { %>
            <p class="message-success">✓ Registration successful. Please sign in.</p>
        <% } %>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="message-error">⚠ <%= request.getAttribute("errorMessage") %></p>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required placeholder="you@islington.edu.np">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>
            <button type="submit" class="btn btn-primary">Sign In →</button>
        </form>

        <p class="form-footer">No account? <a href="${pageContext.request.contextPath}/register">Register here</a></p>
    </div>
</main>

<footer class="site-footer">
    <div class="container">
        <p>&copy; 2026 AcademiaHub &bull; Islington College &bull; All rights reserved.</p>
    </div>
</footer>
</body>
</html>