<?php
    session_start();
    $plays = 0;
    $lastGuestReset = 0;
    if (isset($_SESSION['plays'])) { 
        $plays = $_SESSION['plays'];
    }
    if (isset($_SESSION['lastGuestReset'])) {
        $lastGuestReset = $_SESSION['lastGuestReset'];
    }
    session_destroy();
    session_start();
    $_SESSION['plays'] = $plays;
    $_SESSION['lastGuestReset'] = $lastGuestReset;
    header("location: login.php");
?>