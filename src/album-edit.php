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
    <link rel="stylesheet" href="css/album-edit-head.css"> 
    <link rel="stylesheet" href="css/music-player.css"> 
    <link rel="stylesheet" href="css/album-edit-song.css"> 
    <link rel="stylesheet" href="css/song.css">
</head>
<body>
    <div class="container">
        <?php 
            require_once "component/sidenav.php";
            echo_sidenav(); 
        ?>
        
        <div class="album-detail">
            <?php
                require_once "component/album-edit-head.php";
                require_once "config.php";
                $sql = "SELECT * FROM (SELECT album.album_id as album_id, COUNT(song_id) as jumlah_lagu FROM song INNER JOIN album on song.album_id = album.album_id GROUP BY album.album_id) q1 WHERE q1.album_id=" . $_GET['id'];
                $stmt = $db->prepare($sql);
                $stmt->execute();
                $result = $stmt->get_result();
                $data = $result->fetch_assoc();
                $song_num = $data['jumlah_lagu'];

                $sql = "SELECT album_id, judul, image_path, penyanyi, tanggal_terbit, total_duration, genre FROM album WHERE album_id=" . $_GET['id'];
                $stmt = $db->prepare($sql);
                $stmt->execute();
                $result = $stmt->get_result();
                $data = $result->fetch_assoc();
                echo_album_edit_head($data['judul'], $data['image_path'], $data['penyanyi'], $data['tanggal_terbit'], $data['total_duration'], $song_num, $data['genre']);
            ?>
            <div class="edit-button" onclick="javascript:getElementById('album-form').submit()">Save</div>
            <form id="delete-album-form" method="POST" action="backend/delete-album.php" enctype="multipart/form-data">      
                <input name="album-id" value=<?php echo $data['album_id']?> type="hidden"></input>
                
                <div class="delete-button" onclick="this.parentNode.submit();">Delete</div>
            </form>
            <table class="song-container" cellspacing="0" cellpadding="0">
                <tr>
                    <th style="width: 6%" > <p class="song-no"># </p></th>
                    <th style="width: 35%">TITLE</th>
                    <th style="width: 24%">ALBUM</th>
                    <th style="width: 12%">YEAR</th>
                    <th style="width: 18%">GENRE</th>
                    <th style="width: 5%"></th>
                </tr>
                <tr style="height: 12px"></tr>
                <?php
                    require_once "component/album-edit-song.php";
                    require_once "config.php";
                    $query_result = mysqli_query($db,"SELECT song_id, judul, image_path, audio_path, penyanyi, YEAR(tanggal_terbit) AS tahun, genre, album_id FROM song where album_id =". $_GET['id']);
                    if (mysqli_num_rows($query_result) > 0) {
                        $i = 1;
                        while($row = mysqli_fetch_assoc($query_result)) {
                            echo_song_edit($i, $row['judul'], $row['image_path'], $row['penyanyi'], $data['judul'], $row['tahun'], $row['genre'], $row['song_id'], $row['audio_path'], $row['album_id']);
                            $i++;
                        }
                    }
                    
                ?>
            </table>
        </div>
        
    </div>
    <script></script>
</body>
</html>