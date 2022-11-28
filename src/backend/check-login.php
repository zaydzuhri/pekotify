<?php
include "../config.php";
$username = $_POST['username'];
$password = $_POST['password'];

$stmt = $db->prepare(
    "SELECT * FROM user WHERE username = ?"
);

if ($stmt) {
    $stmt->bind_param("s", $username);
    if ($stmt->execute()) {
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            if (password_verify($password, $row['password'])) {
                session_start();
                $_SESSION['username'] = $row['username'];
                $_SESSION['name'] = $row['name'];
                $_SESSION['email'] = $row['email'];
                $_SESSION['isAdmin'] = $row['isAdmin'];        
                header("location: ../home.php");
            } else {
                header("location: ../login.php?error=true");
            }
        } else {
            header("location: ../login.php?error=true");
        }
    }
}
?>