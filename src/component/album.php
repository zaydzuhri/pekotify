<?php
    function echo_album($name = "name", $img = "img/template.jpg", $artist = "artist",  $year = "year", $genre = "genre", $id = "0") {
        $full_img_path = "file/album_img/" . $img;
        $html = <<<"EOT"
        <div class="album" onClick="window.location = 'album-detail.php?id=$id'";>
            <img class="album-img" src="$full_img_path" alt="album cover">
            <p class="album-name">$name</p>
            <p class="album-info">$year • $artist • $genre</p>
        </div>
    EOT;
 
    echo $html;
 }

?>

