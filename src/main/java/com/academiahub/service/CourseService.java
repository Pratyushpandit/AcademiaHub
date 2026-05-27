package com.academiahub.service;

import com.academiahub.config.DBConfig;
import com.academiahub.model.CourseModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseService {

    public List<CourseModel> getAllCourses() throws SQLException {
        List<CourseModel> courses = new ArrayList<>();
        String sql = "SELECT * FROM courses ORDER BY course_code";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                CourseModel c = new CourseModel();
                c.setCourseId(rs.getInt("course_id"));
                c.setCourseCode(rs.getString("course_code"));
                c.setCourseName(rs.getString("course_name"));
                c.setInstructor(rs.getString("instructor"));
                c.setSchedule(rs.getString("schedule"));
                c.setRoom(rs.getString("room"));
                c.setCredits(rs.getInt("credits"));
                courses.add(c);
            }
        }
        return courses;
    }

    public int getCourseCount() throws SQLException {
        String sql = "SELECT COUNT(*) FROM courses";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        }
        return 0;
    }
}
