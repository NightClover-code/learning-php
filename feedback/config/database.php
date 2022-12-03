<?php
require_once __DIR__ . '/../vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(dirname(__DIR__));
$dotenv->load();

// Create connection
$conn = new mysqli(
  $_ENV['DB_HOST'],
  $_ENV['DB_USER'],
  $_ENV['DB_PASSWORD'],
  $_ENV['DB_NAME']
);

// check connection
if ($conn->connect_error) {
  die('Connection Failed: ' . $conn->connect_error);
}