<?php session_start();?>
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
    <link rel="stylesheet" href="css/home.css"> 
    <link rel="stylesheet" href="css/song.css"> 
    <link rel="stylesheet" href="css/music-player.css"> 
</head>
<body>
    <div class="container">
        <?php 
            require_once "component/sidenav.php";
            echo_sidenav(); 
        ?>
        <div class="home">
            <h1>Welcome, <?php echo $_SESSION['name'];?></h1>
                <table class="song-container" cellspacing="0" cellpadding="0">
                <tr>
                    <th class="song-no-header"> <p class="song-no"># </p></th>
                    <th class="song-title-header">TITLE</th>
                    <th class="song-album-header">ALBUM</th>
                    <th class="song-year-header">YEAR</th>
                    <th class="song-genre-header">GENRE</th>
                </tr>
                <tr style="height: 12px"></tr>
                <?php
                    require_once "config.php";
                    require_once "component/song.php";
                    $sql = "SELECT * FROM (SELECT song_id, song.judul AS song_title, song.image_path, song.penyanyi, album.judul AS album_title, YEAR(song.tanggal_terbit), song.genre FROM song LEFT JOIN album ON song.album_id = album.album_id ORDER BY song_id DESC LIMIT 10) q ORDER BY song_title ASC";
                    $stmt = $db->prepare($sql);
                    $stmt->execute();
                    $result = $stmt->get_result();
                    $i = 0;
                    while ($row = $result->fetch_assoc()) {
                        $i++;
                        echo_song($i, $row["song_title"], $row["image_path"], $row["penyanyi"], $row["album_title"], $row["YEAR(song.tanggal_terbit)"], $row["genre"], $row["song_id"]);
                    }
                ?>
                </table>
        </div>
       
    </div>
</body>
</html>