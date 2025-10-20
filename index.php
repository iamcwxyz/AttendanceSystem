<?php
require_once 'config/session.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance System - Home</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container">
        <div class="welcome-box">
            <h1>Welcome to Attendance Management System</h1>
            <p>Please select your role to continue</p>
            
            <div class="role-selection">
                <a href="admin_login.php" class="role-btn admin-btn">
                    <h3>Admin Login</h3>
                    <p>Manage students, events, and attendance</p>
                </a>
                
                <a href="student_login.php" class="role-btn student-btn">
                    <h3>Student Login</h3>
                    <p>Mark attendance and view events</p>
                </a>
            </div>
            
            <div class="register-link">
                <p>New student? <a href="student_check.php">Register here</a></p>
            </div>
        </div>
    </div>
</body>
</html>
