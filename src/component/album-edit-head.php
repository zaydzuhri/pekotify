<?php
    function echo_album_edit_head($album = "Album 1", $img = "img/template.jpg", $artist = "artist", $year = 2021, $duration = 100, $song_num = 2, $genre = "") {
        $minutes = floor($duration/60);
        $seconds = $duration%60;
        $dur = sprintf("%02d:%02d",$minutes,$seconds);
        $img = "file/album_img/" . $img;
        $album_id = $_GET['id'];
        $html = <<<"EOT"
        <div class="detail-header">
            <table>
            <tr>
                <th style="width:20%"></th>
                <th style="width:80%"></th>
            </tr>
            <tr>
            <form id="album-form" method="POST" action="backend/save_album_edit.php" class="song-form" enctype="multipart/form-data">
                <td>
                    <img class="album-detail-img" src="$img" alt="album cover" form="album-form">
                    <input type="hidden" name="MAX_FILE_SIZE" value="100000000">
                    <input type="file" id="uploaded_photo" name="uploaded_file" accept="image/*" class="input-file" value="$img" form="album-form">
                </td>
                <td class="album-detail-title">
                    <input type="hidden" name="img-lama" value=$img form="album-form">
                    <input type="hidden" name="album-id" value=$album_id form="album-form">
                    <input type="hidden" name="penyanyi" value=$artist form="album-form">
                    <p>Title</p>
                    <input type="text" name="name" value="$album" form="album-form">
                    <p>Genre</p>
                    <input type="text" name="genre" value="$genre" form="album-form">
                    <p>Release Date</p>
                    <input type="date" name="tanggal-rilis" value="$year" form="album-form">
                    
                </td>
            </form>
            </tr>

            </table>
        </div>
        <br>
        <br>
        
    EOT;
    echo $html;
    }
    
?>
