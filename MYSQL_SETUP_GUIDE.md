# MySQL Setup Guide for XAMPP

## Step 1: Install XAMPP
1. Download XAMPP from https://www.apachefriends.org/
2. Install XAMPP on your computer
3. Start Apache and MySQL services from XAMPP Control Panel

## Step 2: Import Database

### Method 1: Using phpMyAdmin (Recommended)
1. Open your browser and go to: `http://localhost/phpmyadmin`
2. Click on "New" in the left sidebar to create a new database
3. Enter database name: `attendance_system`
4. Select Collation: `utf8mb4_unicode_ci`
5. Click "Create"
6. Select the newly created database from the left sidebar
7. Click "Import" tab at the top
8. Click "Choose File" and select `database_mysql.sql`
9. Click "Go" at the bottom to import
10. Wait for success message

### Method 2: Using MySQL Command Line
1. Open Command Prompt/Terminal
2. Navigate to XAMPP's MySQL bin folder:
   ```
   cd C:\xampp\mysql\bin
   ```
3. Login to MySQL:
   ```
   mysql -u root -p
   ```
   (Press Enter when asked for password - default is empty)
4. Import the SQL file:
   ```
   source path/to/database_mysql.sql
   ```

## Step 3: Configure the Application

### Update Database Configuration
Open `config/database.php` and replace its content with the MySQL configuration:

```php
<?php
function getDBConnection() {
    $host = 'localhost';
    $port = 3306;
    $dbname = 'attendance_system';
    $user = 'root';
    $password = '';  // Leave empty for default XAMPP
    
    try {
        $dsn = "mysql:host=$host;port=$port;dbname=$dbname;charset=utf8mb4";
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

**OR** simply copy the provided `config/database_mysql.php` file to `config/database.php`

## Step 4: Copy Project Files to XAMPP

1. Copy all project files to XAMPP's htdocs folder:
   ```
   C:\xampp\htdocs\attendance_system\
   ```

2. Make sure these folders are writable:
   - `uploads/` - for student profile pictures
   - `qrcodes/` - for event QR codes

3. Create folders if they don't exist:
   ```
   mkdir uploads
   mkdir qrcodes
   ```

## Step 5: Access the Application

1. Open your browser
2. Go to: `http://localhost/attendance_system`
3. You should see the welcome page with Admin/Student login options

## Login Credentials

### Admin Login
- **Email**: deejay.cristobal@protonmail.com
- **Password**: Dj*0100010001001010

### Student Login (after registration)
- **Student ID**: Use any of these IDs to register first:
  - 2024-00001
  - 2024-00002
  - 2024-00003
  - 2024-00004
  - 2024-00005
- **Password**: Set during registration

## Database Information

### Tables Created:
1. **admins** - Admin accounts
2. **courses** - Course list (BSCS, BSIT, BSBA)
3. **students** - Student information
4. **events** - Attendance events
5. **event_courses** - Event-course relationships
6. **attendance** - Attendance records
7. **settings** - System settings

### Sample Data Included:
- 1 Admin account (ready to use)
- 3 Courses (BSCS, BSIT, BSBA)
- 5 Sample students (need to complete registration)
- Default system settings

## Troubleshooting

### Error: "Access denied for user 'root'@'localhost'"
- Check if MySQL is running in XAMPP Control Panel
- Verify username and password in `config/database.php`

### Error: "Unknown database 'attendance_system'"
- Database not created or imported properly
- Re-run the import process in phpMyAdmin

### Error: "Table doesn't exist"
- Import was incomplete
- Drop all tables and re-import `database_mysql.sql`

### Error: "Can't write to uploads folder"
- Set folder permissions to writable (777 on Linux/Mac)
- On Windows, ensure the folder is not read-only

### QR Codes not generating
- Check internet connection (uses online API)
- Ensure `qrcodes/` folder exists and is writable

## File Structure

```
attendance_system/
├── admin/              # Admin portal pages
├── student/            # Student portal pages
├── config/             # Database & session configuration
├── includes/           # Reusable components
├── assets/
│   └── css/           # Stylesheets
├── uploads/           # Student photos (writable)
├── qrcodes/           # Event QR codes (writable)
├── database_mysql.sql # Database import file
└── index.php          # Landing page
```

## Next Steps

1. Login as admin
2. Add more courses if needed
3. Add students (manually or via CSV)
4. Create events
5. Students can register and mark attendance

## Security Notes

- Change default MySQL password in production
- Update admin password after first login
- Enable HTTPS for production deployment
- Set proper folder permissions
- Backup database regularly

## Support

If you encounter issues:
1. Check XAMPP error logs: `C:\xampp\apache\logs\error.log`
2. Check PHP errors in browser
3. Verify all services are running in XAMPP
4. Ensure database was imported successfully
