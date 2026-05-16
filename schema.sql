-- AcademiaHub Database Schema
-- Run this in phpMyAdmin (http://localhost/phpmyadmin)
-- or paste it into the SQL tab after selecting the academiahub database.

CREATE DATABASE IF NOT EXISTS academiahub;
USE academiahub;

CREATE TABLE IF NOT EXISTS users (
    user_id    INT AUTO_INCREMENT PRIMARY KEY,
    full_name  VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    role       VARCHAR(20)  NOT NULL DEFAULT 'user',
    created_at TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
);
