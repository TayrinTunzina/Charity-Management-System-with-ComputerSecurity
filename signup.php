<?php
// Start the session
session_start();

// Include the initialization file
require_once("initialize.php");

// Check if the user is already logged in, redirect to donor.php if so
if (isset($_SESSION['user_id'])) {
    header("Location: donor.php");
    exit();
}

// Function to generate a random verification token
function generateVerificationToken() {
    return bin2hex(random_bytes(16)); // Generate a 32-character hexadecimal token
}

// Function to send verification email
function sendVerificationEmail($email, $token) {
    // Construct the verification link
    $verificationLink = "http://example.com/verify.php?token=$token";

    // Email subject
    $subject = "Account Verification";

    // Email message
    $message = "Dear user,\r\n\r\n";
    $message .= "Please click on the following link to verify your account:\r\n";
    $message .= "$verificationLink\r\n\r\n";
    $message .= "Best regards,\r\nYour Website Team";

    // Additional headers
    $headers = "From: Your Website <noreply@example.com>\r\n";
    $headers .= "Reply-To: noreply@example.com\r\n";
    $headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

    // Send the email
    if (mail($email, $subject, $message, $headers)) {
        // Email sent successfully
        return true;
    } else {
        // Email sending failed
        return false;
    }
}

// Function to check if the email already exists in the database
function emailExists($email) {
    global $conn; // Access the global database connection variable

    // Prepare and execute the SQL query to check if the email exists
    $sql = "SELECT * FROM users WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    // Return true if the email exists, false otherwise
    return $result->num_rows > 0;
}

// Function to store verification token in the database
function storeVerificationToken($email, $token) {
    global $conn;
    $sql = "INSERT INTO verification_tokens (email, token, expiry_time) VALUES (?, ?, DATE_ADD(NOW(), INTERVAL 1 DAY))";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $token);
    $stmt->execute();
}

// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Validate form data (you can add more validation rules as needed)
    if (empty($name) || empty($email) || empty($password)) {
        $error = "All fields are required.";
    } elseif (strlen($password) < 6) {
        $error = "Password must be at least 6 characters long.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Invalid email format.";
    } elseif (emailExists($email)) {
        $error = "Email already exists. Please use a different email.";
    } else {
        // Generate verification token
        $token = generateVerificationToken();

        // Store verification token in the database
        storeVerificationToken($email, $token);

        // Send verification email
        if (sendVerificationEmail($email, $token)) {
            // Email sent successfully
            // Redirect to a success page or display a success message
            header("Location: signup_success.php");
            exit();
        } else {
            // Email sending failed
            $error = "Failed to send verification email. Please try again later.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
</head>
<body>
    <h2>Sign Up</h2>
    <?php if (isset($error)) echo "<p>$error</p>"; ?>
    <form action="" method="POST">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>
        <button type="submit">Sign Up</button>
    </form>
</body>
</html>
