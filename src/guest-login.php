<?php
    session_start();
    $_SESSION['isGuest'] = 1;
    $_SESSION['lastGuestPlay'] = "";    
    if (!isset($_SESSION['plays']) || !isset($_SESSION['lastGuestReset'])) {
        $_SESSION['lastGuestReset'] = date("d");
        $_SESSION['plays'] = 0;
    } else {
        if (date("d") != $_SESSION['lastGuestReset']) {
            $_SESSION['lastGuestReset'] = date("d");
            $_SESSION['plays'] = 0;
        }
    }
    $_SESSION['name'] = "Guest";     
    $_SESSION['isAdmin'] = 0;
    header("Location: home.php");
?>