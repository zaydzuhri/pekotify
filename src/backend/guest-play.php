<?php
session_start();
$title = $_GET['title'];
$plays = $_SESSION['plays'];
if ($title != $_SESSION['lastGuestPlay']) {
    $plays++;
    $_SESSION['plays'] = $plays;
    $_SESSION['lastGuestPlay'] = $title;
}
echo $plays;
?>