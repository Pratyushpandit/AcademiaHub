package com.academiahub.service;

import com.academiahub.config.DBConfig;
import com.academiahub.model.AnnouncementModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AnnouncementService {

    public List<AnnouncementModel> getAllAnnouncements() throws SQLException {
        List<AnnouncementModel> list = new ArrayList<>();
        String sql = "SELECT * FROM announcements ORDER BY posted_date DESC";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                AnnouncementModel a = new AnnouncementModel();
                a.setAnnouncementId(rs.getInt("announcement_id"));
                a.setTitle(rs.getString("title"));
                a.setContent(rs.getString("content"));
                a.setPostedBy(rs.getString("posted_by"));
                a.setPostedDate(rs.getString("posted_date"));
                a.setCategory(rs.getString("category"));
                list.add(a);
            }
        }
        return list;
    }

    public int getAnnouncementCount() throws SQLException {
        String sql = "SELECT COUNT(*) FROM announcements";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        }
        return 0;
    }
}
