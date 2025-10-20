# 🚀 Quick Start Guide for XAMPP

## ⚡ Fast Setup (5 Minutes)

### Step 1: Import Database (2 minutes)
1. Start **XAMPP Control Panel**
2. Start **Apache** and **MySQL**
3. Click **Admin** button next to MySQL (opens phpMyAdmin)
4. Click **New** → Enter `attendance_system` → Click **Create**
5. Select `attendance_system` database → Click **Import** tab
6. Choose file: **`database_mysql.sql`** → Click **Go**
7. ✅ Wait for "Import has been successfully finished"

### Step 2: Copy Files (1 minute)
Copy entire project folder to:
```
C:\xampp\htdocs\attendance_system\
```

### Step 3: Update Database Config (1 minute)
Replace content of **`config/database.php`** with:

```php
<?php
function getDBConnection() {
    $host = 'localhost';
    $dbname = 'attendance_system';
    $user = 'root';
    $password = '';  // Empty for default XAMPP
    
    try {
        $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8mb4";
        $pdo = new PDO($dsn, $user, $password, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false
        ]);
        return $pdo;
    } catch (PDOException $e) {
        die('Database connection failed: ' . $e->getMessage());
    }
}
?>
```

### Step 4: Access Application (1 minute)
Open browser and go to:
```
http://localhost/attendance_system
```

## 🔑 Login Credentials

### Admin Login
```
Email: deejay.cristobal@protonmail.com
Password: Dj*0100010001001010
```

### Student Registration
First register using one of these Student IDs:
- `2024-00001` (Juan Dela Cruz - BSCS)
- `2024-00002` (Maria Santos - BSIT)
- `2024-00003` (Pedro Reyes - BSCS)
- `2024-00004` (Ana Garcia - BSBA)
- `2024-00005` (Jose Rizal - BSIT)

Then login with:
```
Student ID: [your student ID]
Password: [password you set during registration]
```

## 📁 What's Included

✅ **Database**: Complete MySQL database with sample data
✅ **Admin Account**: Pre-configured and ready to use
✅ **Sample Courses**: BSCS, BSIT, BSBA
✅ **Sample Students**: 5 students ready for registration
✅ **All Features**: CRUD, CSV import/export, QR codes, attendance tracking

## 🎯 Test the System

### As Admin:
1. Login with admin credentials
2. Go to **Students** → View sample students
3. Go to **Courses** → See pre-loaded courses
4. Go to **Events** → Create a new event
5. Select courses and generate QR code
6. Go to **Attendance** → Export attendance data

### As Student:
1. Click **Register here**
2. Enter Student ID: `2024-00001`
3. Complete registration form
4. Login with Student ID and password
5. View dashboard statistics
6. Mark attendance for events

## ⚠️ Common Issues

**Can't connect to database?**
→ Make sure MySQL is running in XAMPP
→ Check database name is `attendance_system`
→ Verify username is `root` and password is empty

**Page shows blank?**
→ Check Apache is running
→ View `C:\xampp\apache\logs\error.log` for errors

**Upload folder errors?**
→ Create folders: `uploads/` and `qrcodes/`
→ Make sure they're writable

## 📊 Database Structure

```
attendance_system (Database)
├── admins (1 record)
├── courses (3 records)
├── students (5 records)
├── events (0 records - create your own)
├── event_courses (link table)
├── attendance (0 records)
└── settings (2 records)
```

## 🔒 Student Login Details

**Important:** Student login uses:
- **Username**: Student ID number (e.g., `2024-00001`)
- **Password**: Set by student during registration
- **Not email-based** - Students login with their Student ID

## 📝 Quick Admin Tasks

**Add a Student:**
1. Admin → Students → Add Student
2. Enter: Student ID, Name, Course, Section
3. Student can now register

**Create an Event:**
1. Admin → Events → Create Event
2. Fill: Event name, date, time
3. Select courses (checkboxes)
4. QR code generated automatically

**Export Attendance:**
1. Admin → Attendance
2. Select Event from dropdown
3. Click "Export to CSV"
4. Download attendance report

## 🎨 Features Overview

| Feature | Admin | Student |
|---------|-------|---------|
| Manage Students | ✅ | ❌ |
| Manage Courses | ✅ | ❌ |
| Create Events | ✅ | ❌ |
| View Attendance | ✅ | ✅ |
| Mark Attendance | ❌ | ✅ |
| QR Code Scan | ❌ | ✅ |
| CSV Import/Export | ✅ | ❌ |
| Profile Update | ❌ | ✅ |

## 📞 Need Help?

Check detailed documentation:
- **Full Setup Guide**: `MYSQL_SETUP_GUIDE.md`
- **User Manual**: `USAGE_GUIDE.md`

---

**That's it! You're ready to use the system! 🎉**
