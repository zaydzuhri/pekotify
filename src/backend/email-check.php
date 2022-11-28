<?php
require_once "../config.php";
$email = $_REQUEST['email'];

$stmt = $db->prepare(
    "SELECT * FROM user WHERE email = ?"
);

if ($stmt) {
    $stmt->bind_param("s", $email);
    if ($stmt->execute()) {
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            exit("false");
        } else {
            exit("true");
        }
    } else {
        echo $db->error;  
    }
} else {
    echo $db->error;
}
?>