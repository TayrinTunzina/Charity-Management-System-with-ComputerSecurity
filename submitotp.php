

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
    $checkotp = $_POST['checkotp'];
    $otp = $_POST['otp'];

    if ($checkotp == $otp) {
        echo "<script>alert('OTP verified');</script>";
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
        echo "<script>alert('Incorrect OTP');</script>";
    }
    ?>

</body>
</html>
