<?php session_start() ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/img/pekotify.png">
    <title>User List - Pekotify</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/sidenav.css">
    <link rel="stylesheet" href="css/user-list.css">
</head>
<body>
    <div class="container">
        <?php 
            include "component/sidenav.php";
            include "config.php";
            echo_sidenav(); 
        ?>
        <div class="user-list">
            <h1>User List</h1>
            <table class="user-table">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Email</th>
                </tr>
                <?php
                    $query = "SELECT * FROM user";
                    $result = mysqli_query($db, $query);
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr>";
                        echo "<td>" . $row['user_id'] . "</td>";
                        echo "<td>" . $row['name'] . "</td>";
                        echo "<td>" . $row['username'] . "</td>";
                        echo "<td>" . $row['email'] . "</td>";
                        echo "</tr>";
                    }
                ?>
            </table>
        </div>
    </div>
</body>
</html>