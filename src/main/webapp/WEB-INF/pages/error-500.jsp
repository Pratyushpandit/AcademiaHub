<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Server Error - AcademiaHub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<header class="site-header"><div class="container"><h1 class="site-logo">AcademiaHub</h1></div></header>
<main class="main-content">
    <div class="error-card">
        <h2>500 &mdash; Internal Server Error</h2>
        <p>An unexpected error has occurred. Please try again later.</p>
        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Return to Home</a>
    </div>
</main>
<footer class="site-footer"><div class="container"><p>&copy; 2025 AcademiaHub. All rights reserved.</p></div></footer>
</body>
</html>
