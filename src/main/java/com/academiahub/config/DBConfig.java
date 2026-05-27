package com.academiahub.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DBConfig handles all database connection setup for AcademiaHub.
 *
 * XAMPP Setup:
 *   1. Open XAMPP Control Panel
 *   2. Start Apache and MySQL
 *   3. Go to http://localhost/phpmyadmin
 *   4. Create a database named: academiahub
 *   5. Run schema.sql to create the tables
 */
public class DBConfig {

    private static final String DRIVER  = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL  = "jdbc:mysql://localhost:3306/academiahub?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASS = ""; // XAMPP default: empty password

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName(DRIVER);
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC driver not found: " + e.getMessage(), e);
        }
    }

    private DBConfig() {}
}
