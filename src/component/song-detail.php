<?php
    function echo_song_detail($name = "name", $img = "img/template.jpg", $artist = "artist", $album = "album 1",  $year = "year", $genre = "genre", $duration = 100, $lyric = "No Data", $album_id = 0) {
        $minutes = $duration/60;
        $seconds = $duration%60;
        $img = "file/song_img/" . $img;
        $dur = sprintf("%02d:%02d",$minutes,$seconds);
        $html = <<<"EOT"
        <div class="detail-header">
            <table>
            <tr>
                <th style="width:20%"></th>
                <th style="width:80%"></th>
            </tr>
            <tr>
                <td>
                    <img class="song-detail-img" src="$img" alt="album cover">
                </td>
                <td class="song-detail-title" id="song-detail-title">
                    <h1 id="song-name">$name</h1>
                    <p>$dur</p>
                    <h2>$artist</h2>
                    <h2><a href="album-detail.php?id=$album_id">$album</a></h2>
                    <h2>$year</h2>
                    <h2>$genre</h2>
                </td>
            </tr>
            </table>
        </div>
        <div class="play-section">
            <br>
        </div>
        <div class="lyric-section">
            <br>
            <h1>Lyrics</h1>
            <br>
            <p>$lyric</p>
        </div>
        <script>
            var scroll = document.querySelector('#song-name').scrollWidth;
            var newFontSize = Math.round((40/scroll) * 1700)
            console.log(newFontSize + "px");
            if (document.querySelector('#song-name').scrollWidth > document.querySelector('.song-detail-title').offsetWidth) {
                document.getElementById('song-name').style.fontSize = newFontSize + "px";        
            }  
        </script>   
        
    EOT;
    echo $html;
    }
    
?>
