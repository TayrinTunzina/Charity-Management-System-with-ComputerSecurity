<?php  

require_once('config.php');

if (isset($_POST['username']) && isset($_POST['password']) && isset($_POST['role'])) {

    function test_input($data) {
      $data = trim($data);
      $data = stripslashes($data);
      $data = htmlspecialchars($data);
      return $data;
    }

    $username = test_input($_POST['username']);
    $password = test_input($_POST['password']);
    $role = test_input($_POST['role']);

    if (empty($username)) {
        header("Location: index.php?error=User Name is Required");
        exit();
    } elseif (empty($password)) {
        header("Location: index.php?error=Password is Required");
        exit();
    } else {

        // Hashing the password
        $password = md5($password);
        
        $sql = "SELECT * FROM users WHERE username='$username' AND password='$password' AND role='$role'";
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) === 1) {
            // Fetch user data
            $row = mysqli_fetch_assoc($result);
            // Store user data in session
            $_SESSION['name'] = $row['name'];
            $_SESSION['id'] = $row['id'];
            $_SESSION['role'] = $row['role'];
            $_SESSION['username'] = $row['username'];
            // Redirect based on user role
            if ($role == 'admin') {
                header("Location: admin/index.php");
                exit();
            } elseif ($role == 'donor') {
                header("Location: user_index.php");
                exit();
            }
        } else {
            header("Location: index.php?error=Incorrect Username or Password");
            exit();
        }

    }
    
} else {
    header("Location: index.php");
    exit();
} 
?>