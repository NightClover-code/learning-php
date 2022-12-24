<?php
// Create connection
$conn = new mysqli(
  'localhost',
  'test',
  '12345',
  'chat',
);

// check connection
if ($conn->connect_error) {
  die('Connection Failed: ' . $conn->connect_error);
}
?>