<?php session_start() ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/img/pekotify.png">
    <title>Edit Song - Pekotify</title>
    <link rel="stylesheet" href="css/style.css"> 
    <link rel="stylesheet" href="css/sidenav.css"> 
    <link rel="stylesheet" href="css/song-detail.css"> 
    <link rel="stylesheet" href="css/add-page.css">
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
                $sql = "SELECT song.judul as judul, song.image_path as image_path, song.penyanyi as penyanyi, album.judul as judul_album, song.tanggal_terbit as tahun_terbit, song.genre as genre, song.duration as duration, lyrics, audio_path, song.album_id FROM song INNER JOIN album ON album.album_id=song.album_id WHERE song_id=" . $_GET['id'];
                $stmt = $db->prepare($sql);
                $stmt->execute();
                $result = $stmt->get_result();
                $data = $result->fetch_assoc();
                $id = $_GET['id'];
                $name = $data['judul'];
                $duration = $data['duration'];
                $minutes = $duration/60;
                $seconds = $duration%60;
                $dur = sprintf("%02d:%02d",$minutes,$seconds);
                $artist = $data['penyanyi'];
                $album = $data['judul_album'];
                $year = $data['tahun_terbit'];
                $genre = $data['genre'];
                $img = $data['image_path'];
                $lyrics = $data['lyrics'];
                $album_id = $data['album_id'];
                $audio = $data['audio_path'];
                $full_img_path = "file/song_img/" . $img;
                $full_song_path = "file/song/" . $audio;
            ?>
            <div class="edit-button" onClick="addSong();">Save</div>
            <form id="album-form" method="POST" action="backend/delete-song.php" enctype="multipart/form-data">      
                <input name="song-id" value=<?php echo $id ?> type="hidden"></input>
                <input name="song-img" value=<?php echo $full_img_path ?> type="hidden"></input>
                <input name="song-path" value=<?php echo $full_song_path ?> type="hidden"></input>
                <input name="album-id" value=<?php echo $album_id ?> type="hidden"></input>
                <div class="delete-button" onclick="this.parentNode.submit();">Delete</div>
            </form>
            <div class="detail-header">
                <table>
                <tr>
                    <th style="width:20%"></th>
                    <th style="width:80%"></th>
                </tr>
                <tr>
                    <td>
                        <img class="song-detail-img" src="<?php echo "file/song_img/" . $img ?>" alt="album cover">
                        <p>Song Cover Upload</p>
                        <input type="file" id="uploaded_photo" name="uploaded_file[]" accept="image/*" class="input-file" form="form-submit-lagu" required>
                        <p>Song Upload</p>
                        <input type="file" id="uploaded_audio" name="uploaded_file[]" accept="audio/*" class="input-file" form="form-submit-lagu" required>
                    </td>
                    <td class="song-detail-title">
                        <form enctype="multipart/form-data" id="form-submit-lagu" action="backend/update-song.php" class="song-form" method="POST">
                            <input type="hidden" name="audio_duration" id="audio_duration" value = <?php echo $duration?>>
                            <input type="hidden" name="id" value="<?php echo $id ?>">
                            <input type="hidden" name="nama-artist" value="<?php echo $artist ?>">
                            <p>Title</p>
                            <input type="text" name="nama-lagu" value="<?php echo $name ?>">
                            <p>Album</p>
                            <div class="dropdown-option">
                                <div class="drop-button">
                                    Album List
                                </div>
                                <div class="dropdown-content">
                                    <?php                                        
                                        $query_result = mysqli_query($db,"SELECT * FROM album");
                                        if (mysqli_num_rows($query_result) > 0) {
                                            while($row = mysqli_fetch_assoc($query_result)) {
                                                $img_path = "file/album_img" . "/" . $row['image_path'];
                                                if ($row['album_id'] == $album_id) {
                                                    $data = "<div class='album-content-data' onclick='setAlbum(" . $row['album_id'] .")'>" . '<input type="radio" name="album-option" value="' . $row['album_id'] .'" id=album-option-id-' . $row["album_id"] . ' checked="checked"><label for="album-option-' . $row['album_id'] .'">' . '<img src="' . $img_path .'">'. $row['judul'] .'</label></div>';
                                                } else {
                                                    $data = "<div class='album-content-data' onclick='setAlbum(" . $row['album_id'] .")'>" . '<input type="radio" name="album-option" value="' . $row['album_id'] .'" id=album-option-id-' . $row["album_id"] . '><label for="album-option-' . $row['album_id'] .'">' . '<img src="' . $img_path .'">'. $row['judul'] .'</label></div>';
                                                }
                                                echo $data;
                                                
                                            }
                                        } else {
                                            echo "0 results";
                                        }
                                    ?>
                                </div>
                            </div>
                            <p>Release Date</p>
                            <input type="date" name="tanggal-rilis-lagu" id="input-tanggal-rilis-lagu" value="<?php echo $year ?>">                            
                            <p>Genre</p>
                            <input type="text" name="genre-lagu" value="<?php echo $genre ?>">
                            <p>Lyrics</p>
                            <textarea name="lirik-lagu" id="" cols="30" rows="10"><?php echo $lyrics ?></textarea>
                        </form>
                    </td>
                </tr>
                </table>
            </div>
        </div>
    </div>
    <script src="js/add-song.js" type="text/javascript"></script>
</body>
</html>