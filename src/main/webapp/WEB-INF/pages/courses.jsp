<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.academiahub.model.CourseModel" %>
<%@ page import="java.util.List" %>

<%
    List<CourseModel> courses = (List<CourseModel>) request.getAttribute("courses");
    request.setAttribute("pageTitle", "Courses - AcademiaHub");
%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/includes/head.jsp" %>

<body>
<%@ include file="/WEB-INF/includes/navbar.jsp" %>

<main class="page-content">
    <div class="container">

        <div class="page-header">
            <h2>📚 Courses</h2>
            <p class="page-subtitle">All available courses for the current academic year.</p>
            <div class="gold-divider"></div>
        </div>

        <!-- Search / Filter bar -->
        <div class="filter-bar">
            <span class="search-icon">🔍</span>
            <input type="text" id="courseSearch" placeholder="Search courses, instructors, codes…" onkeyup="filterCourses()">
        </div>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="message-error">⚠ <%= request.getAttribute("errorMessage") %></p>
        <% } %>

        <% if (courses != null && !courses.isEmpty()) { %>
        <div class="courses-grid" id="coursesGrid">
            <% for (CourseModel c : courses) { %>
            <div class="course-card" data-search="<%= c.getCourseName().toLowerCase() %> <%= c.getCourseCode().toLowerCase() %> <%= c.getInstructor().toLowerCase() %>">
                <div class="course-card-top">
                    <span class="course-code"><%= c.getCourseCode() %></span>
                    <span class="course-credits"><%= c.getCredits() %> Cr</span>
                </div>
                <h3 class="course-name"><%= c.getCourseName() %></h3>
                <div class="course-details">
                    <p><span>👨‍🏫</span> <%= c.getInstructor() %></p>
                    <p><span>📅</span> <%= c.getSchedule() %></p>
                    <p><span>📍</span> <%= c.getRoom() %></p>
                </div>
            </div>
            <% } %>
        </div>
        <% } else { %>
        <div class="empty-box">
            <p>📚</p>
            <p>No courses available at the moment.</p>
            <p style="font-size:13px; color: var(--text-muted);">Check back later or contact your administrator.</p>
        </div>
        <% } %>

    </div>
</main>

<footer class="site-footer">
    <div class="container">
        <p>&copy; 2026 AcademiaHub &bull; Islington College &bull; All rights reserved.</p>
    </div>
</footer>

<script>
function filterCourses() {
    const q = document.getElementById('courseSearch').value.toLowerCase();
    document.querySelectorAll('.course-card').forEach(card => {
        const match = card.dataset.search.includes(q);
        card.style.display = match ? '' : 'none';
    });
}
</script>
</body>
</html>