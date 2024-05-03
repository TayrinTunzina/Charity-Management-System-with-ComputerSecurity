

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

function updateDonationProgress($blog_id, $amount, $conn) {
    // Retrieve the current fund raised for the blog
    $query = "SELECT fund_raised FROM donations WHERE blog_id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $blog_id);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($fund_raised);
    $stmt->fetch();

    // Calculate the new fund raised amount
    $new_fund_raised = $fund_raised + $amount;

    // Update the donation amount in the database
    $update_query = "UPDATE donations SET fund_raised = ? WHERE blog_id = ?";
    $update_stmt = $conn->prepare($update_query);
    $update_stmt->bind_param("di", $new_fund_raised, $blog_id);
    $update_stmt->execute();
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
