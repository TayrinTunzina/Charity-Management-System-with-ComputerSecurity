<!-- ?php 
// if (session_status() == PHP_SESSION_NONE) {
//     session_start();
// }

if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') 
    $link = "https"; 
else
    $link = "http"; 
$link .= "://"; 
$link .= $_SERVER['HTTP_HOST']; 
$link .= $_SERVER['REQUEST_URI'];

// Check if the user is not logged in and not on the login page
if(!isset($_SESSION['userdata']) && !strpos($link, 'login.php')){
    redirect('login.php');
}

// Check if the user is logged in and on the login page
if(isset($_SESSION['userdata']) && strpos($link, 'login.php')){
    redirect('index.php');
}

// Check if the user is logged in and has a specific role (e.g., admin or donor)
if(isset($_SESSION['userdata'])){
    $role = $_SESSION['userdata']['role'];
    if($role == 'admin'){
        redirect('admin/dashboard.php');
    } elseif($role == 'donor'){
        redirect('donor/dashboard.php');
    }
} -->
