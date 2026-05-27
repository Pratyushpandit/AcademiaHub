package com.academiahub.service;

import com.academiahub.config.DBConfig;
import com.academiahub.model.UserModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

public class UserService {

    // 🔐 LOGIN
    public UserModel authenticate(String email, String password) throws SQLException {
        String sql = "SELECT user_id, full_name, email, role FROM users WHERE email = ? AND password = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    UserModel user = new UserModel();
                    user.setUserId(rs.getInt("user_id"));
                    user.setFullName(rs.getString("full_name"));
                    user.setEmail(rs.getString("email"));
                    user.setRole(rs.getString("role"));
                    return user;
                }
            }
        }
        return null;
    }

    // 📝 REGISTER
    public boolean register(UserModel user) throws SQLException {
        String sql = "INSERT INTO users (full_name, email, password, role) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFullName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, "user");

            return stmt.executeUpdate() > 0;
        }
    }

    // 📧 CHECK EMAIL EXISTS
    public boolean emailExists(String email) throws SQLException {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }

    // 🔑 CHANGE PASSWORD
    public boolean changePassword(String email, String newPassword) throws SQLException {
        String sql = "UPDATE users SET password = ? WHERE email = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, newPassword);
            stmt.setString(2, email);

            return stmt.executeUpdate() > 0;
        }
    }

    // 🔄 INITIATE PASSWORD RESET
    public boolean initiatePasswordReset(String email) throws SQLException {
        if (!emailExists(email)) {
            return false;
        }

        String resetToken = UUID.randomUUID().toString();

        String sql = "UPDATE users SET reset_token = ?, reset_token_expiry = DATE_ADD(NOW(), INTERVAL 1 HOUR) WHERE email = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, resetToken);
            stmt.setString(2, email);

            boolean success = stmt.executeUpdate() > 0;

            if (success) {
                System.out.println("✅ Reset token generated for email: " + email);
                System.out.println("🔑 Token: " + resetToken);   // Remove this in production
            }

            return success;
        }
    }

    // 🔍 VALIDATE RESET TOKEN (for future use)
    public boolean isValidResetToken(String token) throws SQLException {
        String sql = "SELECT COUNT(*) FROM users WHERE reset_token = ? AND reset_token_expiry > NOW()";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, token);

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }

    // 📊 USER COUNT
    public int getUserCount() throws SQLException {
        String sql = "SELECT COUNT(*) FROM users";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
}