<?php
    function echo_song($no = "0", $title = "title", $img = "dummy.jpg", $artist = "artist", $album="album", $year = "year", $genre = "genre", $id = "0") {
        $full_img_path = "file/song_img/" . $img;
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
            <td class="table-right">
                <p class="song-info">$genre</p>
            </td>
        <tr>
    EOT;
 
    echo $html;
 }

?>

