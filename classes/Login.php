<?php
require_once '../config.php';

class Login extends DBConnection {
    private $settings;

    public function __construct() {
        global $_settings;
        $this->settings = $_settings;
        parent::__construct();
        ini_set('display_error', 1);
    }

    public function __destruct() {
        parent::__destruct();
    }

    public function index() {
        echo "<h1>Access Denied</h1> <a href='".base_url."'>Go Back.</a>";
    }

    public function login() {
        extract($_POST);
        
        // Check if the role is selected
        if(empty($role)) {
            return json_encode(array('status'=>'error', 'message' => 'Please select a role'));
        }
    
        // Record IP address
        $this->recordLoginAttempt($_SERVER['REMOTE_ADDR']);
    
        // Check number of login attempts from the IP address
        $attempts_left = 3 - $this->getLoginAttempts($_SERVER['REMOTE_ADDR']);
    
        if($this->exceedsLoginAttempts($_SERVER['REMOTE_ADDR'])) {
            $remaining_time = $this->getRemainingTime($_SERVER['REMOTE_ADDR']);
            return json_encode(array('status'=>'error', 'message' => "Too many login attempts. Please try again in $remaining_time seconds."));
        }
    
        // Use prepared statement to prevent SQL injection
        $stmt = $this->conn->prepare("SELECT * from users where username = ? and password = md5(?) and role = ?");
        $stmt->bind_param("sss", $username, $password, $role);
        $stmt->execute();
        $result = $stmt->get_result();
    
        if($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            // Set user data in session excluding password
            foreach($row as $k => $v) {
                if(!is_numeric($k) && $k != 'password') {
                    $this->settings->set_userdata($k, $v);
                }
            }
            // Return success status
            return json_encode(array('status'=>'success', 'role' => $row['role']));
        } else {
            // Return incorrect login status with remaining attempts
            return json_encode(array('status'=>'incorrect', 'attempts_left' => $attempts_left, 'last_qry'=>"SELECT * from users where username = '$username' and password = md5('$password') "));
        }
    }
    
    private function recordLoginAttempt($ip_address) {
        $stmt = $this->conn->prepare("INSERT INTO login_attempts (ip_address) VALUES (?)");
        $stmt->bind_param("s", $ip_address);
        $stmt->execute();
    }
    
    private function exceedsLoginAttempts($ip_address) {
        $max_attempts = 3; // Set maximum number of attempts to 3
        $stmt = $this->conn->prepare("SELECT COUNT(*) AS attempts FROM login_attempts WHERE ip_address = ? AND last_attempt >= NOW() - INTERVAL 20 SECOND");
        $stmt->bind_param("s", $ip_address);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return ($row['attempts'] >= $max_attempts); // Changed condition to >=
    }
    
    private function getLoginAttempts($ip_address) {
        $stmt = $this->conn->prepare("SELECT COUNT(*) AS attempts FROM login_attempts WHERE ip_address = ? AND last_attempt >= NOW() - INTERVAL 20 SECOND");
        $stmt->bind_param("s", $ip_address);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row['attempts'];
    }

    private function getRemainingTime($ip_address) {
        $stmt = $this->conn->prepare("SELECT TIMESTAMPDIFF(SECOND, MAX(last_attempt), NOW() - INTERVAL 20 SECOND) AS remaining_time FROM login_attempts WHERE ip_address = ?");
        $stmt->bind_param("s", $ip_address);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return max(0, 1 - $row['remaining_time']); // Adjust 30 seconds according to your requirement
    }

    public function logout() {
        if($this->settings->sess_des()) {
            redirect('index.php');
        }
    }


    function login_user() {
        extract($_POST);

		//admin' or 1=1#
       //tt' or 1=1#
        // Use prepared statement to prevent SQL injection
        $stmt = $this->conn->prepare("SELECT * from clients where email = ? and password = md5(?)");  //Separating SQL code from data
        $stmt->bind_param("ss", $email, $password);  //user input treated as data rather than executable SQL code
        $stmt->execute();
        $result = $stmt->get_result();

        if($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            foreach($row as $k => $v) {
                $this->settings->set_userdata($k, $v);
            }
            $this->settings->set_userdata('login_type', 1);
            $resp['status'] = 'success';
        } else {
            $resp['status'] = 'incorrect';
        }

        if($this->conn->error) {
            $resp['status'] = 'failed';
            $resp['_error'] = $this->conn->error;
        }
        return json_encode($resp);
    }
}

$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$auth = new Login();
switch ($action) {
    case 'login':
        echo $auth->login();
        break;
    case 'login_user':
        echo $auth->login_user();
        break;
    case 'logout':
        echo $auth->logout();
        break;
    default:
        echo $auth->index();
        break;
}
?>
