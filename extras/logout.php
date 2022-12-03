<?php
session_start();

// destroy the session
session_destroy();
header('Location: /learn-php/13_sessions.php');
