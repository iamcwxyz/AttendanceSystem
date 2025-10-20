# Attendance Management System

## Overview
A comprehensive PHP-based attendance management system with PostgreSQL database. Features separate admin and student portals with QR code-based attendance tracking.

## Project Architecture

### Technology Stack
- **Backend**: PHP 8.2 with PDO
- **Database**: PostgreSQL (Neon-backed)
- **Frontend**: HTML5, CSS3, JavaScript
- **QR Code**: API-based QR code generation
- **Session Management**: PHP native sessions

### Directory Structure
```
├── admin/              # Admin portal pages
├── student/            # Student portal pages
├── config/             # Database and session configuration
├── includes/           # Reusable PHP components
├── assets/             # CSS and JS files
├── uploads/            # Student profile pictures
├── qrcodes/            # Generated QR codes
└── index.php           # Landing page
```

## Features

### Admin Dashboard
- Full CRUD operations for student records
- CSV import/export for student data
- Course management
- Event creation with QR codes
- Attendance tracking and reporting
- System settings configuration

### Student Portal
- Registration with Student ID validation
- Profile management with picture upload
- Event listing and attendance marking
- QR code scanning for attendance
- Personal statistics and attendance history

## Database Schema

### Tables
1. **admins** - Admin user accounts
2. **courses** - Academic courses
3. **students** - Student information
4. **events** - Attendance events
5. **event_courses** - Event-course relationships
6. **attendance** - Attendance records
7. **settings** - System configuration

## Admin Credentials
- **Email**: deejay.cristobal@protonmail.com
- **Password**: Dj*0100010001001010

## Key Features Implementation

### Student Registration Flow
1. Student enters Student ID
2. System validates if ID exists in database
3. If found and not registered: shows pre-filled data
4. Student completes editable fields (age, email, birthday)
5. Student uploads profile picture
6. System marks as registered

### Event & Attendance System
1. Admin creates event and selects target courses
2. System generates unique QR code for event
3. Students can scan QR or manually mark attendance
4. Tracks time in/time out for each student
5. Admin can export attendance data as CSV

### QR Code System
- Generated using external QR code API
- Encodes event ID and metadata
- Students scan to mark attendance
- Manual fallback option available

## Recent Changes
- Initial project setup (Oct 17, 2025)
- Database schema created with all tables
- Admin and student authentication implemented
- Complete CRUD operations for students
- CSV import/export functionality
- Event management with QR codes
- Attendance tracking system
- Responsive UI with modern design

## Usage Notes
- System uses PostgreSQL database
- File uploads stored in `/uploads` directory
- QR codes generated on-demand via API
- Session-based authentication for security
