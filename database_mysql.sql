-- ============================================
-- Attendance Management System - MySQL Database
-- For XAMPP Import
-- ============================================

-- Create database (optional - you can create it manually in phpMyAdmin)
CREATE DATABASE IF NOT EXISTS attendance_system;
USE attendance_system;

-- Drop existing tables if they exist
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS event_courses;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS settings;
DROP TABLE IF EXISTS admins;

-- ============================================
-- Table: admins
-- ============================================
CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert admin account
-- Email: deejay.cristobal@protonmail.com
-- Password: Dj*0100010001001010
INSERT INTO admins (email, password) VALUES
('deejay.cristobal@protonmail.com', '$2y$10$GbkF5QXDMmQCkzsqiT1TfuURPHe9aeZlh/wQgc7yp9Qsm0e7xCZqG');

-- ============================================
-- Table: courses
-- ============================================
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    course_code VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert sample courses
INSERT INTO courses (course_name, course_code) VALUES
('Bachelor of Science in Computer Science', 'BSCS'),
('Bachelor of Science in Information Technology', 'BSIT'),
('Bachelor of Science in Business Administration', 'BSBA');

-- ============================================
-- Table: students
-- ============================================
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    course_id INT,
    section VARCHAR(50),
    year VARCHAR(20),
    age INT,
    email VARCHAR(255),
    birthday DATE,
    profile_picture VARCHAR(255),
    password VARCHAR(255),
    is_registered TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create index for faster lookups
CREATE INDEX idx_students_student_id ON students(student_id);

-- Insert sample students (not yet registered)
INSERT INTO students (student_id, name, course_id, section, year, is_registered) VALUES
('2024-00001', 'Juan Dela Cruz', 1, 'A', '3rd Year', 0),
('2024-00002', 'Maria Santos', 2, 'B', '2nd Year', 0),
('2024-00003', 'Pedro Reyes', 1, 'A', '4th Year', 0),
('2024-00004', 'Ana Garcia', 3, 'C', '1st Year', 0),
('2024-00005', 'Jose Rizal', 2, 'B', '3rd Year', 0);

-- ============================================
-- Table: events
-- ============================================
CREATE TABLE events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    qr_code VARCHAR(500),
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES admins(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create index for faster date queries
CREATE INDEX idx_events_date ON events(event_date);

-- ============================================
-- Table: event_courses (Many-to-Many relationship)
-- ============================================
CREATE TABLE event_courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    course_id INT NOT NULL,
    UNIQUE KEY unique_event_course (event_id, course_id),
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Table: attendance
-- ============================================
CREATE TABLE attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    student_id INT NOT NULL,
    time_in TIMESTAMP NULL,
    time_out TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_event_student (event_id, student_id),
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create indexes for faster attendance queries
CREATE INDEX idx_attendance_event ON attendance(event_id);
CREATE INDEX idx_attendance_student ON attendance(student_id);

-- ============================================
-- Table: settings
-- ============================================
CREATE TABLE settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    setting_key VARCHAR(100) UNIQUE NOT NULL,
    setting_value TEXT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert default settings
INSERT INTO settings (setting_key, setting_value) VALUES
('system_name', 'Attendance Management System'),
('qr_enabled', 'true');

-- ============================================
-- Sample Event Data (Optional)
-- ============================================
-- Uncomment to add sample event

-- INSERT INTO events (event_name, event_date, start_time, end_time, created_by) VALUES
-- ('Orientation Day', '2025-01-15', '08:00:00', '12:00:00', 1);

-- Make the event available for BSCS and BSIT courses
-- INSERT INTO event_courses (event_id, course_id) VALUES
-- (1, 1),
-- (1, 2);

-- ============================================
-- End of SQL File
-- ============================================

-- Verify tables created
SHOW TABLES;
