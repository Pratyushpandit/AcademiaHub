<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Not Found - AcademiaHub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<header class="site-header"><div class="container"><h1 class="site-logo">AcademiaHub</h1></div></header>
<main class="main-content">
    <div class="error-card">
        <h2>404 &mdash; Page Not Found</h2>
        <p>The page you are looking for does not exist or has been moved.</p>
        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Return to Home</a>
    </div>
</main>
<footer class="site-footer"><div class="container"><p>&copy; 2025 AcademiaHub. All rights reserved.</p></div></footer>
</body>
</html>
