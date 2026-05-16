package com.academiahub.service;

import com.academiahub.config.DBConfig;
import com.academiahub.model.UserModel;
import java.sql.*;

public class UserService {

    public UserModel authenticate(String email, String password) throws SQLException {
        String sql = "SELECT user_id, full_name, email, role FROM users WHERE email=? AND password=?";
        try (Connection c = DBConfig.getConnection();
             PreparedStatement s = c.prepareStatement(sql)) {
            s.setString(1, email);
            s.setString(2, password);
            try (ResultSet rs = s.executeQuery()) {
                if (rs.next()) {
                    UserModel u = new UserModel();
                    u.setUserId(rs.getInt("user_id"));
                    u.setFullName(rs.getString("full_name"));
                    u.setEmail(rs.getString("email"));
                    u.setRole(rs.getString("role"));
                    return u;
                }
            }
        }
        return null;
    }

    public boolean register(UserModel user) throws SQLException {
        String sql = "INSERT INTO users (full_name, email, password, role) VALUES (?,?,?,?)";
        try (Connection c = DBConfig.getConnection();
             PreparedStatement s = c.prepareStatement(sql)) {
            s.setString(1, user.getFullName());
            s.setString(2, user.getEmail());
            s.setString(3, user.getPassword());
            s.setString(4, "user");
            return s.executeUpdate() > 0;
        }
    }

    public boolean emailExists(String email) throws SQLException {
        String sql = "SELECT COUNT(*) FROM users WHERE email=?";
        try (Connection c = DBConfig.getConnection();
             PreparedStatement s = c.prepareStatement(sql)) {
            s.setString(1, email);
            try (ResultSet rs = s.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }
}
