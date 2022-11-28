<?php
    function echo_music_player($title = "Song 1", $artist = "Artist 1", $duration = 100, $image_path = "img/template.jpg", $song_path = "dummy") {
        $minutes = $duration/60;
        $seconds = $duration%60;
        $dur = sprintf("%02d:%02d",$minutes,$seconds);
        $progress = sprintf("%02d:%02d",0,0);
        $image_path = "file/song_img/" . $image_path;
        $song_path = "file/song/" . $song_path;
        $isGuest = isset($_SESSION['isGuest']) ? $_SESSION['isGuest'] : 0;
        
        $html = <<<"EOT"
        <div class="player-wrapper">
            <div class="player-img">
                <input type="hidden" value="$song_path" id="path-lagu"></input>
                <input type="hidden" value="$title" id="title-lagu"></input>
                <input type="hidden" value="$isGuest" id="is-guest"></input>
                <img src="$image_path">
            </div>
            <div class="music-player">
                <div class="player-song-info">
                    <h4>$title</h4>
                    <p>$artist</p>
                </div>
                <div class="play-info">
                    <img id="play_button" src="img/play_button 2.png" onclick="playSong()">
                    <img id="stop_button" src="img/stop_button 2.png" style="display: none" onclick="stopSong()">
                    <div class="song-progress">
                        <span id="time-progress">$progress</span>
                        <input type="range" class="prog-bar" id="seek-slider" max="100" value="0"></input>
                        <span>$dur</span>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="../js/play-song.js"></script>
        
    EOT;
 
    echo $html;
 }

?>

