<?php
require_once "../config.php";
$username = $_REQUEST['username'];

$stmt = $db->prepare(
    "SELECT * FROM user WHERE username = ?"
);

if ($stmt) {
    $stmt->bind_param("s", $username);
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