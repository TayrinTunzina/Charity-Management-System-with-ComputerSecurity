<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php'; // Include PHPMailer autoload.php file

$to = $_POST['email']; // Get the email address from the form
$otp = $_POST['otp']; // Get the OTP from the form

$amount = $_POST['amount'];// Retrieve the amount from the form data
$blog_id = $_POST['blog_id'];

// Instantiation and passing `true` enables exceptions
$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->isSMTP(); // Set mailer to use SMTP
    $mail->Host = 'smtp.gmail.com'; // Specify main and backup SMTP servers
    $mail->SMTPAuth = true; // Enable SMTP authentication
    $mail->Username = 'tayrin.namira@gmail.com'; // SMTP username
    $mail->Password = 'vkqd ufmw lush raiw'; // SMTP password
    $mail->SMTPSecure = 'tls'; // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 587; // TCP port to connect to

    //Recipients
    $mail->setFrom('noreply@gmail.com', 'Charity Jet');
    $mail->addAddress($to); // Add a recipient

    //Content
    $mail->isHTML(true); // Set email format to HTML
    $mail->Subject = 'OTP Verification';
    // $mail->Body = 'Your OTP for verification is: ' . $otp;
    // Amount to the email body
    $mail->Body = 'Your OTP for verification is: ' . $otp . '<br>Donation ID: ' . $blog_id . '<br>Amount: ' . $amount;

    $mail->send();
    $message = 'Message has been sent';
} catch (Exception $e) {
    $message = 'Message could not be sent. Mailer Error: ' . $mail->ErrorInfo;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP</title>

    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
    }

    .card {
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #f9f9f9;
        box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
    }

    .message {
        margin-bottom: 20px;
        padding: 10px;
        border-radius: 5px;
    }

    .success {
        background-color: #d4edda;
        border-color: #c3e6cb;
        color: #155724;
    }

    .error {
        background-color: #f8d7da;
        border-color: #f5c6cb;
        color: #721c24;
    }

    label {
        display: block;
        margin-bottom: 10px;
    }

    input[type="number"] {
        width: calc(100% - 22px);
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    button[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: calc(100% - 22px);
    }

    button[type="submit"]:hover {
        background-color: #45a049;
    }
    </style>
</head>

<body>

    <div class="card">
        <?php if (isset($message)) : ?>
            <div class="message <?php echo $message ? 'success' : 'error'; ?>">
                <?php echo $message; ?>
            </div>
        <?php endif; ?>
        <form action="submitotp.php" method="POST"> <!-- Change action to submit.php -->
            <!-- Add hidden input fields for blog_id and amount -->
            <input type="hidden" name="blog_id" value="<?php echo $blog_id; ?>">
            <input type="hidden" name="amount" value="<?php echo $amount; ?>">

            <p>OTP sent to the email ID</p>
            <input type="number" name="checkotp" placeholder="Enter OTP">
            <input type="hidden" name="otp" value="<?php echo $otp; ?>">
            <button type="submit"> Verify</button>
        </form>
    </div>

</body>
</html>
