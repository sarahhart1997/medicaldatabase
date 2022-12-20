<?php

// Store database info
$servername = "localhost:8080";
$username = "root";
$password = "hskid1";
$dbname = "Newark_Medical";

// Check to see if MySQLi is installed on your computer
if (!function_exists('mysqli_init') && !extension_loaded('mysqli')) {
    echo 'We don\'t have mysqli!!!';
} else {
    echo 'Phew we have it!';
}
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

$conn = new \MySQLi($servername, $username, $password, $dbname);
?>

