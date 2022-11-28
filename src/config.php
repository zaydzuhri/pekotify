<?php
define('DB_SERVER', 'host.docker.internal:3306');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'pekotify');


try {
    $db = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
    if (!$db) {
        die("ERROR: Could not connect. " . mysqli_connect_error());
    }
} catch (Exception $e) {
    echo $e->getMessage();
}
