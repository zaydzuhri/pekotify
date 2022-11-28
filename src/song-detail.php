<?php session_start() ?>
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
    <link rel="stylesheet" href="css/song-detail.css"> 
    <link rel="stylesheet" href="css/music-player.css"> 
</head>
<body>
    <div class="container">
        <?php 
            include "component/sidenav.php";
            echo_sidenav(); 
        ?>
        <div class="song-detail">
            <?php
                include "component/song-detail.php";
                require_once "config.php";
                $sql = "SELECT song.judul as judul, song.image_path as image_path, song.penyanyi as penyanyi, album.judul as judul_album, YEAR(song.tanggal_terbit) as tahun_terbit, song.genre as genre, song.duration as duration, lyrics, audio_path, song.album_id FROM song INNER JOIN album ON album.album_id=song.album_id WHERE song_id=" . $_GET['id'];
                $stmt = $db->prepare($sql);
                $stmt->execute();
                $result = $stmt->get_result();
                $data = $result->fetch_assoc();
                echo_song_detail($data['judul'], $data['image_path'], $data['penyanyi'], $data['judul_album'], $data['tahun_terbit'], $data['genre'], $data['duration'], $data['lyrics'], $data['album_id']);

                if ($_SESSION['isAdmin']) {
                    $id = $_GET['id'];
                    $button = <<<"EOT"
                    <div><div class="edit-button" onClick="window.location = 'song-edit.php?id=$id';">Edit</div></div> 
                    EOT;
                    echo $button;
                }
            ?>
        </div>
    </div>
    <?php
        include "component/music-player.php";
        echo_music_player($data['judul'], $data['penyanyi'],$data['duration'],$data['image_path'], $data['audio_path']);
    ?>

</body>
</html>