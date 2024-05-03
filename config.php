<?php
define('base_url', 'http://localhost/charity/');
ob_start();
ini_set('date.timezone', 'Asia/Manila');
date_default_timezone_set('Asia/Manila');
session_start();

// Set session timeout duration (in seconds)
$session_timeout = 1000; // 15 seconds

// Check if session variable for last activity exists and if the session is older than the timeout duration
if (isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity'] > $session_timeout)) {
    session_unset();     // Unset all session variables
    session_destroy();   // Destroy the session data
    redirect('admin/login.php'); // Redirect to login page after session timeout
}

// Update last activity time stamp
$_SESSION['last_activity'] = time();

require_once('initialize.php');
require_once('config.php'); // Make sure initialize.php includes config.php
require_once('classes/DBConnection.php');
require_once('classes/SystemSettings.php');
$db = new DBConnection;
$conn = $db->conn;

function redirect($url = '') {
    if (!empty($url)) {
        // Make sure base_url is defined before using it here
        echo '<script>location.href="' . base_url . $url . '"</script>';
        exit; // It's good practice to exit after redirecting to prevent further execution
    }
}

function validate_image($file) {
    if (!empty($file)) {
        if (is_file(base_app . $file)) {
            return base_url . $file;
        } else {
            return base_url . 'dist/img/no-image-available.png';
        }
    } else {
        return base_url . 'dist/img/no-image-available.png';
    }
}

function isMobileDevice() {
    $aMobileUA = array(
        '/iphone/i' => 'iPhone',
        '/ipod/i' => 'iPod',
        '/ipad/i' => 'iPad',
        '/android/i' => 'Android',
        '/blackberry/i' => 'BlackBerry',
        '/webos/i' => 'Mobile'
    );

    foreach ($aMobileUA as $sMobileKey => $sMobileOS) {
        if (preg_match($sMobileKey, $_SERVER['HTTP_USER_AGENT'])) {
            return true;
        }
    }
    return false;
}
ob_end_flush();
?>
