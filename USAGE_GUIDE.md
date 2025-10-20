# Attendance Management System - User Guide

## System Overview
A comprehensive web-based attendance tracking system with separate portals for administrators and students.

## Getting Started

### Admin Access
**Login Credentials:**
- Email: `deejay.cristobal@protonmail.com`
- Password: `Dj*0100010001001010`

**URL:** Click "Admin Login" on the home page

### Student Access
Students must first be added to the system by an admin before they can register.

## Admin Functions

### 1. Student Management
- **Add Students**: Navigate to Students → Add Student
  - Enter Student ID and Name (required)
  - Assign Course and Section (optional)
- **Edit Students**: Click "Edit" next to any student
- **Delete Students**: Click "Delete" (with confirmation)
- **Import Students**: Use CSV file with format:
  ```
  student_id,name,course_code,section
  2024-00001,John Doe,BSCS,A
  ```
- **Export Students**: Download all student data as CSV

### 2. Course Management
- Add new courses with Course Name and Course Code
- Courses are used to organize students and restrict events

### 3. Event Management
- **Create Event**:
  1. Enter event name, date, and time range
  2. Select which courses can attend (checkbox)
  3. System automatically generates QR code
- **View Event**: See details and download QR code
- **Edit Event**: Modify details and course assignments
- **Delete Event**: Remove event completely

### 4. Attendance Tracking
- Select an event to view attendance records
- Export specific event attendance to CSV
- View time in/time out for each student

### 5. System Settings
- Change system name
- Enable/disable QR code attendance

## Student Registration Process

1. **Check Eligibility**:
   - Click "Register here" on home page
   - Enter your Student ID
   - If found in system, proceed to registration
   - If not found, wait for admin to add you

2. **Complete Registration**:
   - Pre-filled fields (read-only): Student ID, Name, Course, Section
   - Fill in: Age, Email, Birthday
   - Upload profile picture (required)
   - Set password
   - Submit to complete registration

3. **Login**:
   - Use Student ID and password to login

## Student Functions

### 1. Dashboard
- View statistics:
  - Total events available
  - Events attended
  - Attendance rate percentage
- See upcoming events

### 2. Mark Attendance
Two methods available:
- **QR Code Scanning**: Use camera to scan event QR code
- **Manual Entry**: Click "Mark Time In" button

**Time In/Out Process**:
1. Mark Time In when arriving at event
2. Mark Time Out when leaving event
3. Both times are recorded in the system

### 3. Profile Management
- Update: Age, Email, Birthday
- Change profile picture
- Read-only fields: Student ID, Name, Course, Section

### 4. View Events
- See all events available for your course
- Check attendance status for each event
- Access attendance marking page

### 5. Attendance History
- View complete attendance record
- See time in/out for all events attended
- Check completion status

## Sample Data Included

**Courses:**
- BSCS - Bachelor of Science in Computer Science
- BSIT - Bachelor of Science in Information Technology
- BSBA - Bachelor of Science in Business Administration

**Sample Students** (not yet registered):
- Student ID: 2024-00001 (BSCS, Section A)
- Student ID: 2024-00002 (BSIT, Section B)
- Student ID: 2024-00003 (BSCS, Section A)
- Student ID: 2024-00004 (BSBA, Section C)
- Student ID: 2024-00005 (BSIT, Section B)

## Tips for Using the System

### For Admins:
1. Add courses before adding students
2. Create events ahead of time
3. Download and print QR codes for physical posting
4. Export attendance regularly for backup
5. Use CSV import for bulk student additions

### For Students:
1. Complete registration as soon as possible
2. Test QR scanning before actual events
3. Always mark both time in AND time out
4. Keep profile information updated
5. Check dashboard regularly for new events

## Troubleshooting

**Student can't register:**
- Verify Student ID is correct
- Check with admin if you're in the system
- Ensure you haven't already registered

**QR code not scanning:**
- Use manual attendance option
- Ensure good lighting
- Try different camera angle

**Can't login:**
- Verify credentials are correct
- Ensure you've completed registration
- Clear browser cache and try again

## Security Notes

- All passwords are encrypted
- Sessions expire on logout
- Profile pictures stored securely
- Admin access is restricted

## Support

Contact your system administrator for:
- Account issues
- Missing student records
- Technical problems
- Feature requests
