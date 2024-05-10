<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Authentication</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">


</head>
<body>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <?php
require_once('config.php'); // Include your config file

// Define the Caesar Cipher encryption function
function caesarCipherEncrypt($plaintext, $shift) {
    $result = '';

    // Loop through each character in the plaintext
    $length = strlen($plaintext);
    for ($i = 0; $i < $length; $i++) {
        $char = $plaintext[$i];

        // Encrypt uppercase letters
        if (ctype_upper($char)) {
            $result .= chr(((ord($char) - 65 + $shift) % 26) + 65);
        }
        // Encrypt lowercase letters
        else if (ctype_lower($char)) {
            $result .= chr(((ord($char) - 97 + $shift) % 26) + 97);
        }
        // Keep non-alphabetic characters unchanged
        else {
            $result .= $char;
        }
    }

    return $result;
}

// Function to update donation progress with Caesar Cipher encryption
function updateDonationProgress($blog_id, $amount, $conn) {
    // Encrypt the amount using Caesar Cipher with a shift of 3
    $encrypted_amount = caesarCipherEncrypt($amount, 3);
    echo "Encrypted Amount: " . $encrypted_amount . "<br>";

    // Retrieve the current fund raised for the blog
    $query = "SELECT fund_raised FROM donations WHERE blog_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $blog_id);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($fund_raised);
    $stmt->fetch();

    // Calculate the new fund raised amount
    $new_fund_raised = $fund_raised + $encrypted_amount;
    echo "New Fund Raised: " . $new_fund_raised . "<br>";

    // Update the donation amount in the database
    $update_query = "UPDATE donations SET fund_raised = ? WHERE blog_id = ?";
    $update_stmt = $conn->prepare($update_query);
    $update_stmt->bind_param("di", $new_fund_raised, $blog_id);
    $update_stmt->execute();

    // Debugging: Check if the update query was successful
    if ($update_stmt->affected_rows > 0) {
        echo "Amount updated successfully!";
    } else {
        echo "Error updating amount: " . $conn->error;
    }
}



$checkotp = $_POST['checkotp'];
$otp = $_POST['otp'];

if ($checkotp == $otp) {
    // OTP verified, proceed with donation update
    if(isset($_POST['amount'], $_POST['blog_id'])) {
        $amount = $_POST['amount'];
        $blog_id = $_POST['blog_id'];

        // Call function to update donation and progress bar
        updateDonationProgress($blog_id, $amount, $conn);
    }

    // Display SweetAlert for successful payment
    echo "<script>
            Swal.fire({
                icon: 'success',
                title: 'Payment successful!',
                text: 'Thanks for donating!',
                confirmButtonText: 'OK'
            }).then(() => {
                window.location.replace('donor.php');
            });
        </script>";
} else {
    // Incorrect OTP, show alert
    echo "<script>
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Incorrect OTP!',
                confirmButtonText: 'OK'
            }).then(() => {
                window.location.replace('index.php');
            });
        </script>";
}
?>


</body>
</html>
