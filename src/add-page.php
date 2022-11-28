<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/img/pekotify.png">
    <title>Add Entry - Pekotify</title>
    <link rel="stylesheet" href="css/style.css"> 
    <link rel="stylesheet" href="css/sidenav.css"> 
    <link rel="stylesheet" href="css/music-player.css">
    <link rel="stylesheet" href="css/add-page.css"> 
    <link rel="stylesheet" href="css/albums.css"> 
    <link rel="stylesheet" href="css/album.css"> 
    <link rel="stylesheet" href="css/song.css"> 
</head>
<body>
    <div class="container">
        <?php 
            require_once "component/sidenav.php";
            echo_sidenav(); 
        ?>
        <div id="add-page" class="add-page">
        </div>
    </div>
    <script src="js/add-song.js"></script>
    <script>
        addAlbumPage();
    </script>
</body>
</html>