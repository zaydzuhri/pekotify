<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/img/pekotify.png">
    <title>Pekotify</title>
    <link rel="stylesheet" href="css/style.css"> 
    <link rel="stylesheet" href="css/sidenav.css"> 
    <link rel="stylesheet" href="css/albums.css"> 
    <link rel="stylesheet" href="css/album.css"> 
    <link rel="stylesheet" href="css/music-player.css"> 
</head>
<body>
    <div class="container">
        <?php 
            require_once "component/sidenav.php";
            echo_sidenav(); 
        ?>
        <div class="albums">
            <h1>Albums</h1>
            <div class="album-container">
            <?php
                require_once "component/album.php";
                require_once "config.php";
                $query_result = mysqli_query($db,"SELECT * FROM album");
                if (mysqli_num_rows($query_result) > 0) {
                    while($row = mysqli_fetch_assoc($query_result)) {
                    echo_album($row['judul'], $row['image_path'], $row['penyanyi'], $row['tanggal_terbit'], $row['genre'], $row['album_id']);
                    }
                }
            ?>
            </div>
        </div>
    </div>
</body>
</html>