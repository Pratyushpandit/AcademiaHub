<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - AcademiaHub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<header class="site-header">
    <div class="container"><h1 class="site-logo">AcademiaHub</h1></div>
</header>
<main class="main-content">
    <div class="form-card">
        <h2>Sign In</h2>
        <% if (request.getParameter("registered") != null) { %>
            <p class="message-success">Registration successful. Please sign in.</p>
        <% } %>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="message-error"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>
            <button type="submit" class="btn btn-primary">Sign In</button>
        </form>
        <p class="form-footer">No account? <a href="${pageContext.request.contextPath}/register">Register here</a></p>
    </div>
</main>
<footer class="site-footer">
    <div class="container"><p>&copy; 2025 AcademiaHub. All rights reserved.</p></div>
</footer>
</body>
</html>
