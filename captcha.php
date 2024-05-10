<?php
// Start the session to store the CAPTCHA code
require_once('config.php'); // Include your config file

// Function to generate a random string for CAPTCHA
function generateCaptchaCode($length = 6) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $captcha_code = '';
    $char_length = strlen($characters);

    // Generate random characters
    for ($i = 0; $i < $length; $i++) {
        $captcha_code .= $characters[rand(0, $char_length - 1)];
    }

    return $captcha_code;
}

// Generate CAPTCHA code and store it in the session
$captcha_code = generateCaptchaCode();
$_SESSION['captcha'] = $captcha_code;

// Create a blank image with dimensions
$image_width = 120;
$image_height = 40;
$image = imagecreatetruecolor($image_width, $image_height);

// Define colors
$background_color = imagecolorallocate($image, 255, 255, 255); // White background
$text_color = imagecolorallocate($image, 0, 0, 0); // Black text

// Fill the image with the background color
imagefilledrectangle($image, 0, 0, $image_width, $image_height, $background_color);

// Add random lines to the image for noise
for ($i = 0; $i < 6; $i++) {
    imageline($image, rand(0, $image_width), rand(0, $image_height), rand(0, $image_width), rand(0, $image_height), $text_color);
}

// Add text to the image
$text_size = 40;
$text_x = 40; // Adjust horizontal position
$text_y = $image_height - 30; // Adjust vertical position to leave space for lines
imagestring($image, $text_size, $text_x, $text_y, $captcha_code, $text_color);

// Set the content type header to display the image
header('Content-Type: image/png');

// Output the image as PNG
imagepng($image);

// Free up memory
imagedestroy($image);
?>
