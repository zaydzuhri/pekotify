<?php
    function echo_album_detail($album = "Album 1", $img = "img/template.jpg", $artist = "artist", $year = 2021, $duration = 100, $song_num = 2, $genre = "") {
        $minutes = floor($duration/60);
        $seconds = $duration%60;
        $dur = sprintf("%02d:%02d",$minutes,$seconds);
        $img = "file/album_img/" . $img;
        $html = <<<"EOT"
        <div class="detail-header">
            <table>
            <tr>
                <th style="width:20%"></th>
                <th style="width:80%"></th>
            </tr>
            <tr>
                <td>
                    <img class="album-detail-img" src="$img" alt="album cover">
                </td>
                <td class="album-detail-title">
                    <h1 id="album-name">$album</h1>
                    <div class="below-album-title">
                        <h3>$artist</h3>
                        <p>&nbsp$year</p>
                    </div>
                    <div class="below-album-title">
                        <h3>$song_num songs,&nbsp</h3>
                        <p>$minutes min $seconds sec</p>
                    </div>
                    <div class="below-album-title">
                        <h3>$genre</h3>
                    </div>
                    
                </td>
            </tr>
            </table>
        </div>
        <br>
        <br>
        <script>
            var scroll = document.querySelector('#album-name').scrollWidth;
            var newFontSize = Math.round((40/scroll) * 1700)
            console.log(newFontSize + "px");
            if (document.querySelector('#album-name').scrollWidth > document.querySelector('.album-detail-title').offsetWidth) {
                document.getElementById('album-name').style.fontSize = newFontSize + "px";        
            }  
        </script> 
    EOT;
    echo $html;
    }
    
?>
