<?php
require_once 'config/database.php';
require_once 'config/session.php';

if (!isset($_SESSION['temp_student_id'])) {
    header('Location: student_check.php');
    exit();
}

$db = getDBConnection();
$stmt = $db->prepare("
    SELECT s.*, c.course_name, c.course_code 
    FROM students s
    LEFT JOIN courses c ON s.course_id = c.id
    WHERE s.id = ?
");
$stmt->execute([$_SESSION['temp_student_id']]);
$student = $stmt->fetch();

if (!$student || $student['is_registered']) {
    header('Location: student_check.php');
    exit();
}

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $age = $_POST['age'] ?? '';
    $email = trim($_POST['email'] ?? '');
    $birthday = $_POST['birthday'] ?? '';
    $password = $_POST['password'] ?? '';
    $confirm_password = $_POST['confirm_password'] ?? '';
    
    if ($password !== $confirm_password) {
        $error = 'Passwords do not match';
    } elseif (strlen($password) < 6) {
        $error = 'Password must be at least 6 characters';
    } else {
        $profile_picture = null;
        
        if (isset($_FILES['profile_picture']) && $_FILES['profile_picture']['error'] === UPLOAD_ERR_OK) {
            $allowed_types = ['image/jpeg', 'image/png', 'image/jpg'];
            $file_type = $_FILES['profile_picture']['type'];
            
            if (in_array($file_type, $allowed_types)) {
                $file_ext = pathinfo($_FILES['profile_picture']['name'], PATHINFO_EXTENSION);
                $new_filename = 'student_' . $student['id'] . '_' . time() . '.' . $file_ext;
                $upload_path = 'uploads/' . $new_filename;
                
                if (move_uploaded_file($_FILES['profile_picture']['tmp_name'], $upload_path)) {
                    $profile_picture = $new_filename;
                }
            } else {
                $error = 'Only JPG, JPEG, and PNG files are allowed';
            }
        }
        
        if (empty($error)) {
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            
            $update_stmt = $db->prepare("
                UPDATE students 
                SET age = ?, email = ?, birthday = ?, password = ?, 
                    profile_picture = ?, is_registered = true, updated_at = CURRENT_TIMESTAMP
                WHERE id = ?
            ");
            
            if ($update_stmt->execute([$age, $email, $birthday, $hashed_password, $profile_picture, $student['id']])) {
                unset($_SESSION['temp_student_id']);
                $success = 'Registration completed successfully! You can now login.';
                header('refresh:2;url=student_login.php');
            } else {
                $error = 'Registration failed. Please try again.';
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complete Registration</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container">
        <div class="registration-form">
            <h2>Complete Your Registration</h2>
            
            <?php if ($error): ?>
                <div class="alert alert-error"><?php echo htmlspecialchars($error); ?></div>
            <?php endif; ?>
            
            <?php if ($success): ?>
                <div class="alert alert-success"><?php echo htmlspecialchars($success); ?></div>
            <?php endif; ?>
            
            <form method="POST" action="" enctype="multipart/form-data">
                <div class="form-row">
                    <div class="form-group readonly-field">
                        <label>Student ID:</label>
                        <input type="text" value="<?php echo htmlspecialchars($student['student_id']); ?>" readonly>
                    </div>
                    
                    <div class="form-group readonly-field">
                        <label>Name:</label>
                        <input type="text" value="<?php echo htmlspecialchars($student['name']); ?>" readonly>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group readonly-field">
                        <label>Course:</label>
                        <input type="text" value="<?php echo htmlspecialchars($student['course_name'] ?? 'N/A'); ?>" readonly>
                    </div>
                    
                    <div class="form-group readonly-field">
                        <label>Section:</label>
                        <input type="text" value="<?php echo htmlspecialchars($student['section'] ?? 'N/A'); ?>" readonly>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="age">Age: *</label>
                        <input type="number" id="age" name="age" min="1" max="100" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="birthday">Birthday: *</label>
                        <input type="date" id="birthday" name="birthday" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email">Email: *</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="profile_picture">Profile Picture: *</label>
                    <input type="file" id="profile_picture" name="profile_picture" accept="image/*" required>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="password">Password: *</label>
                        <input type="password" id="password" name="password" required minlength="6">
                    </div>
                    
                    <div class="form-group">
                        <label for="confirm_password">Confirm Password: *</label>
                        <input type="password" id="confirm_password" name="confirm_password" required>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary">Complete Registration</button>
            </form>
        </div>
    </div>
</body>
</html>
