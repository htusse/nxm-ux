-- ============================================
-- NXM UX TSA - Database Schema
-- ============================================
-- Database: nxm_tsa
-- Table: contact_submissions
-- Created: January 21, 2026
-- ============================================

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS nxm_tsa
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

-- Use the database
USE nxm_tsa;

-- Drop table if exists (for clean installation)
DROP TABLE IF EXISTS contact_submissions;

-- Create contact_submissions table
CREATE TABLE contact_submissions (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    ip_address VARCHAR(45) DEFAULT NULL,
    user_agent TEXT DEFAULT NULL,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_submitted_at (submitted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Verify table creation
-- ============================================
SHOW TABLES;
DESCRIBE contact_submissions;
SELECT COUNT(*) as total_submissions FROM contact_submissions;

-- ============================================
-- Query Examples
-- ============================================

-- Get all submissions
-- SELECT * FROM contact_submissions ORDER BY submitted_at DESC;

-- Get submissions by email
-- SELECT * FROM contact_submissions WHERE email = 'john.doe@example.com';

-- Get recent submissions (last 7 days)
-- SELECT * FROM contact_submissions 
-- WHERE submitted_at >= DATE_SUB(NOW(), INTERVAL 7 DAY)
-- ORDER BY submitted_at DESC;

-- Count submissions by date
-- SELECT DATE(submitted_at) as submission_date, COUNT(*) as count
-- FROM contact_submissions
-- GROUP BY DATE(submitted_at)
-- ORDER BY submission_date DESC;

-- ============================================
-- End of SQL Script
-- ============================================
