<?php
require_once('config.php'); // Include your config file

// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verify the captcha response
    if (isset($_POST['captcha']) && $_POST['captcha'] == $_SESSION['captcha']) {
        // CAPTCHA verification passed, process the form data
        
        // Retrieve form data
        $name = $_POST['name'];
        $password = $_POST['password'];
        $avatar = ''; // Initialize avatar variable
        
        // Check if a new avatar file was uploaded
        if(isset($_FILES['img']) && $_FILES['img']['tmp_name'] != ''){
            $fname = 'uploads/'.strtotime(date('y-m-d H:i')).'_'.$_FILES['img']['name'];
            $move = move_uploaded_file($_FILES['img']['tmp_name'],'../'. $fname);
            if($move){
                // Update the avatar file path
                $avatar = $fname;
                // Remove the old avatar file if it exists
                if(isset($_SESSION['userdata']['avatar']) && is_file('../'.$_SESSION['userdata']['avatar']) && $_SESSION['userdata']['id'] == $id)
                    unlink('../'.$_SESSION['userdata']['avatar']);
            }
        }

        function customHash($password) {
            // Custom hashing algorithm
            $hash = 0;
            $len = strlen($password);
            
            for ($i = 0; $i < $len; $i++) {
                $hash += ord($password[$i]);
            }
            
            return $hash;
        }
        
        // Hash the password if it's not empty
        if (!empty($password)) {
            $password = customHash($password);
        }
        
        // Prepare and execute the SQL query to update user profile
        $userId = $_settings->userdata('id');
        $sql = "UPDATE users SET name='$name'";
        if(!empty($password)){
            $sql .= ", password='$password'";
        }
        if(!empty($avatar)){
            $sql .= ", avatar='$avatar'";
        }
        $sql .= " WHERE id='$userId'";

        if (mysqli_query($conn, $sql)) {
            // Redirect to donor.php with success message
            header("Location: donor.php?success=1");
            exit();
        } else {
            // Redirect to account.php with error message if update fails
            header("Location: account.php?error=update_failed");
            exit();
        }
    } else {
        // Redirect back to the form with an error message if CAPTCHA is not clicked
        header("Location: account.php?error=captcha_not_clicked");
        exit();
    }
}

// Generate a random captcha code and store it in the session
$_SESSION['captcha'] = rand(1000, 9999);
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #001f3f;
        }

        .card {
            height: 610px;
            width: 450px;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f0f0f0;
        }

        .card-content {
            padding: 0 10px; /* Add padding to the card content */
        }

        .user-img {
            border-radius: 50%;
            width: 130px; /* Adjust size as needed */
            height: 130px; /* Adjust size as needed */
            margin: 30px auto 40px; /* Center the image horizontally and add spacing below */
            display: block;
        }

        form {
            text-align: center; /* Center the form elements */
        }

        h2 {
            text-align: center; /* Center the form elements */
        }
        label {
            font-weight: bold;
        }

        button {
            border: none;
            border-radius: 20px; /* Make button round */
            background-color: #0d6efd;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
            font-weight: bold;
            height: 40px;
        }

        button:hover {
            background-color: #001f3f; /* Darker green color on hover */
        }

        .edit-avatar-button {
            display: block;
            margin: 0 auto 20px; /* Center the button horizontally and add spacing below */
            padding: 10px 20px;
            border: none;
            border-radius: 20px; /* Make button round */
            background-color: #0d6efd;
            color: white;
            cursor: pointer;
            font-weight: bold;
        }

        .edit-avatar-button:hover {
            background-color: #001f3f; /* Darker blue color on hover */
        }

        input[type="text"],
        input[type="password"] {
            width: 60%;
            height: 32px; /* Adjust the height of the input field */
            padding: 10px; /* Add padding to the input field */
            margin-bottom: 5px; /* Add spacing between input fields */
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }


    </style>
</head>
<body>
<div class="card">
    <!-- Other card content -->
    <div class="card-content">
        <h2>Edit Profile</h2>

        <form action="account.php" method="POST" onsubmit="return validateForm()">

            <!-- Avatar image and edit button -->
            <div class="avatar-container">
                <input type="file" id="avatarInput" style="display: none;">
                <img src="<?php echo validate_image($_settings->userdata('avatar')); ?>" id="avatarPreview" class="img-circle elevation-2 user-img" alt="User Image">
                <button class="edit-avatar-button" onclick="document.getElementById('avatarInput').click()">Choose Image</button>
            </div>

            <!-- Name input field -->
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<?php echo ucwords($_settings->userdata('name')); ?>" required><br><br>

            <!-- Password input field -->
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<?php echo $_settings->userdata('password'); ?>" required><br><br>

            <!-- Display the CAPTCHA image -->
            <img src="captcha.php" alt="CAPTCHA Image"><br><br>

            <!-- CAPTCHA field -->
            <label for="captcha">Enter Captcha:</label>
            <input type="text" id="captcha" name="captcha" required><br><br>

            <!-- Input fields for user information -->

            <!-- Submit button -->
            <button type="submit">Update Profile</button>
        </form>

    </div>
</div>

<!-- JavaScript to handle file input -->
<script>
    const avatarInput = document.getElementById('avatarInput');
    const avatarPreview = document.getElementById('avatarPreview');

    avatarInput.addEventListener('change', function(event) {
        const file = event.target.files[0];
        const reader = new FileReader();

        reader.onload = function(e) {
            avatarPreview.src = e.target.result;
        };

        reader.readAsDataURL(file);
    });
</script>

<script>
    function validateForm() {
        var captchaResponse = document.getElementById('g-recaptcha-response').value;
        if (!captchaResponse) {
            alert('Please complete the CAPTCHA verification.');
            return false; // Prevent form submission
        }
        return true; // Allow form submission
    }
</script>


</body>
</html>

