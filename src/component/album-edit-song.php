<?php
    function echo_song_edit($no = "0", $title = "title", $img = "dummy.jpg", $artist = "artist", $album="album", $year = "year", $genre = "genre", $id = "0", $song_path = "", $album_id = 0) {
        $full_img_path = "file/song_img/" . $img;
        $full_song_path = "file/song/" . $song_path;
        $html = <<<"EOT"
        <tr class="song" onClick="window.location = 'song-detail.php?id=$id';">
            <td  class="table-left">
                <p class="song-no">$no</p>
            </td>
            <td class="song-title-img">
                <img class="song-img" src="$full_img_path" alt="album cover">
                <div class="song-title-artist song-info">
                    <p class="song-title">$title</p>
                    <p class="song-artist">$artist</p>
                </div>
            </td>
            <td>
                <p class="song-info">$album</p>
            </td>
            <td>
                <p class="song-info">$year</p>
            </td>
            <td>
                <p class="song-info">$genre</p>
            </td>
            <td class="table-right">
                <form id="album-form" method="POST" action="backend/delete-song.php" enctype="multipart/form-data">      
                    <input name="song-id" value=$id type="hidden"></input>
                    <input name="song-img" value=$full_img_path type="hidden"></input>
                    <input name="song-path" value=$full_song_path type="hidden"></input>
                    <input name="album-id" value=$album_id type="hidden"></input>
                    <div class="song-delete-button" onclick="this.parentNode.submit(); event.stopPropagation()"><p>delete</p></div>
                </form>    
            </td>
        <tr>
    EOT;
 
    echo $html;
 }

?>

