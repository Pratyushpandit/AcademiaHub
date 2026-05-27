<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.academiahub.model.AnnouncementModel" %>
<%@ page import="java.util.List" %>

<%
    List<AnnouncementModel> announcements = (List<AnnouncementModel>) request.getAttribute("announcements");
    request.setAttribute("pageTitle", "Announcements - AcademiaHub");
%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/includes/head.jsp" %>

<body>
<%@ include file="/WEB-INF/includes/navbar.jsp" %>

<main class="page-content">
    <div class="container">

        <div class="page-header">
            <h2>📢 Announcements</h2>
            <p class="page-subtitle">Stay up to date with the latest news and notices.</p>
            <div class="gold-divider"></div>
        </div>

        <!-- Category filter tabs -->
        <div class="filter-tabs" style="display:flex; gap:8px; margin-bottom:28px; flex-wrap:wrap;">
            <button class="filter-tab active" onclick="filterAnn('all', this)">All</button>
            <button class="filter-tab" onclick="filterAnn('academic', this)">Academic</button>
            <button class="filter-tab" onclick="filterAnn('general', this)">General</button>
            <button class="filter-tab" onclick="filterAnn('urgent', this)">Urgent</button>
            <button class="filter-tab" onclick="filterAnn('event', this)">Events</button>
            <button class="filter-tab" onclick="filterAnn('exam', this)">Exams</button>
        </div>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="message-error">⚠ <%= request.getAttribute("errorMessage") %></p>
        <% } %>

        <% if (announcements != null && !announcements.isEmpty()) { %>
        <div class="announcements-list" id="annList">
            <% for (AnnouncementModel a : announcements) {
                String cat = a.getCategory() != null ? a.getCategory().toLowerCase() : "general";
            %>
            <div class="ann-card" data-category="<%= cat %>">
                <div class="ann-card-header">
                    <span class="badge badge-<%= cat %>"><%= a.getCategory() %></span>
                    <span class="ann-date">📅 <%= a.getPostedDate() %></span>
                </div>
                <h3 class="ann-card-title"><%= a.getTitle() %></h3>
                <p class="ann-card-content"><%= a.getContent() %></p>
                <p class="ann-card-footer">👤 Posted by <strong><%= a.getPostedBy() %></strong></p>
            </div>
            <% } %>
        </div>
        <div id="annEmpty" style="display:none">
            <div class="empty-box"><p>🔍</p><p>No announcements in this category.</p></div>
        </div>
        <% } else { %>
        <div class="empty-box">
            <p>📢</p>
            <p>No announcements at the moment.</p>
            <p style="font-size:13px; color:var(--text-muted);">Check back later.</p>
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
function filterAnn(cat, btn) {
    document.querySelectorAll('.filter-tab').forEach(t => t.classList.remove('active'));
    btn.classList.add('active');
    
    const cards = document.querySelectorAll('.ann-card');
    let visible = 0;
    cards.forEach(c => {
        const show = cat === 'all' || c.dataset.category === cat;
        c.style.display = show ? '' : 'none';
        if (show) visible++;
    });
    
    const empty = document.getElementById('annEmpty');
    if (empty) empty.style.display = visible === 0 ? '' : 'none';
}
</script>
</body>
</html>