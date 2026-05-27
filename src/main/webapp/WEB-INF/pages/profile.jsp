<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.academiahub.model.UserModel" %>

<%
    UserModel profileUser = (UserModel) session.getAttribute("loggedInUser");
    request.setAttribute("pageTitle", "Profile - AcademiaHub");
%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/includes/head.jsp" %>

<body>
<%@ include file="/WEB-INF/includes/navbar.jsp" %>

<main class="page-content">
    <div class="container">

        <div class="page-header">
            <h2>👤 My Profile</h2>
            <p class="page-subtitle">View and update your account information.</p>
            <div class="gold-divider"></div>
        </div>

        <div class="profile-layout">
            <!-- Avatar Card -->
            <div class="profile-avatar-card">
                <div class="avatar-circle">
                    <%= profileUser.getFullName().substring(0,1).toUpperCase() %>
                </div>
                <h3><%= profileUser.getFullName() %></h3>
                <span class="role-badge"><%= profileUser.getRole() %></span>
                <p class="profile-email">✉ <%= profileUser.getEmail() %></p>

                <div style="margin-top: 24px; padding-top: 20px; border-top: 1px solid var(--border);">
                    <div style="display:flex; flex-direction:column; gap:10px;">
                        <div style="background: rgba(255,255,255,0.03); border: 1px solid var(--border); border-radius: 8px; padding: 10px 14px; font-size:12.5px; color: var(--text-muted); text-align:left;">
                            <span style="display:block; font-size:10px; text-transform:uppercase; letter-spacing:0.5px; margin-bottom:3px; color: var(--text-muted);">Member Since</span>
                            <span style="color: var(--text-secondary); font-weight:500;">AY 2025–2026</span>
                        </div>
                        <div style="background: rgba(255,255,255,0.03); border: 1px solid var(--border); border-radius: 8px; padding: 10px 14px; font-size:12.5px; color: var(--text-muted); text-align:left;">
                            <span style="display:block; font-size:10px; text-transform:uppercase; letter-spacing:0.5px; margin-bottom:3px; color: var(--text-muted);">Institution</span>
                            <span style="color: var(--text-secondary); font-weight:500;">Islington College</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Edit Form Card -->
            <div class="profile-form-card">
                <h3>✏️ Edit Information</h3>

                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p class="message-error">⚠ <%= request.getAttribute("errorMessage") %></p>
                <% } %>
                <% if (request.getAttribute("successMessage") != null) { %>
                    <p class="message-success">✓ <%= request.getAttribute("successMessage") %></p>
                <% } %>

                <form action="<%= request.getContextPath() %>/profile" method="post">
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" id="fullName" name="fullName" value="<%= profileUser.getFullName() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" value="<%= profileUser.getEmail() %>" disabled>
                        <small class="field-note">🔒 Email address cannot be changed.</small>
                    </div>
                    <div class="form-group">
                        <label for="role">Role</label>
                        <input type="text" id="role" value="<%= profileUser.getRole() %>" disabled>
                    </div>

                    <div style="border-top: 1px solid var(--border); margin: 24px 0 20px;"></div>
                    <h4 style="font-size:14px; color: var(--text-secondary); margin-bottom:16px; font-weight:500;">Change Password</h4>
                    <div class="form-group">
                        <label for="currentPassword">Current Password</label>
                        <input type="password" id="currentPassword" name="currentPassword" placeholder="Enter current password">
                    </div>
                    <div class="register-grid">
                        <div class="form-group">
                            <label for="newPassword">New Password</label>
                            <input type="password" id="newPassword" name="newPassword" placeholder="New password">
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password">
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary" style="width: auto; padding: 11px 32px; margin-top: 4px;">
                        Save Changes →
                    </button>
                </form>
            </div>
        </div>
    </div>
</main>

<footer class="site-footer">
    <div class="container">
        <p>&copy; 2026 AcademiaHub &bull; Islington College &bull; All rights reserved.</p>
    </div>
</footer>
</body>
</html>