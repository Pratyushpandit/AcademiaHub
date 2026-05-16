package com.academiahub.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DBConfig handles all database connection setup for AcademiaHub.
 *
 * XAMPP Setup:
 *   - Start Apache and MySQL from the XAMPP Control Panel.
 *   - Open phpMyAdmin at http://localhost/phpmyadmin
 *   - Create a database named: academiahub
 *   - Run the SQL in schema.sql to create the required tables.
 *
 * Default XAMPP credentials are used below.
 * Change DB_PASS if you have set a MySQL root password.
 */
public class DBConfig {

    private static final String DRIVER  = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL  = "jdbc:mysql://localhost:3306/academiahub?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASS = ""; // XAMPP default: empty password

    /**
     * Returns a new database connection.
     * The caller is responsible for closing the connection after use.
     * Use try-with-resources or a finally block to ensure it is closed.
     *
     * @return a live Connection to the academiahub database
     * @throws SQLException if the driver is not found or the connection fails
     */
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName(DRIVER);
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC driver not found: " + e.getMessage(), e);
        }
    }

    // Prevent instantiation — this class is used statically only.
    private DBConfig() {}
}
