<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.academiahub.model.UserModel" %>
<% UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - AcademiaHub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<header class="site-header">
    <div class="container header-inner">
        <h1 class="site-logo">AcademiaHub</h1>
        <nav class="site-nav">
            <span class="nav-user">Welcome, <%= loggedInUser.getFullName() %></span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline">Sign Out</a>
        </nav>
    </div>
</header>
<main class="main-content">
    <div class="container">
        <h2>Dashboard</h2>
        <p>You are signed in. Use the navigation to access application features.</p>
    </div>
</main>
<footer class="site-footer">
    <div class="container"><p>&copy; 2025 AcademiaHub. All rights reserved.</p></div>
</footer>
</body>
</html>
