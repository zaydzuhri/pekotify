<h1>Add Entry</h1>
<div class="add-type">
    <button onclick="addAlbumPage()" class="add-type-btn">Add Album</button>
    <button onclick="addSongPage()" class="add-type-btn active-btn" disabled>Add Song</button>
</div>
<div class="add-song-section">
    <div class="add-song">
        <form id="form-submit-lagu" enctype="multipart/form-data" action="backend/add-song.php" method="POST" required>
            <div class="add-song-form-container">
            <div class="add-song-form-vertical">
            <h2>
                Song's name
            </h2>
            <input type="text" name="nama-lagu" id="input-nama-lagu" class="input-text">
            <h2>
                Song's artist
            </h2>
            <input type="text" name="nama-artist" id="input-nama-artist-lagu" class="input-text">
            <h2>
                Song's album
            </h2>
            <div class="dropdown-option">
                <div class="drop-button">
                    Album List
                </div>
                <div class="dropdown-content">
                    <?php
                        require_once "../config.php";
                        $query_result = mysqli_query($db,"SELECT * FROM album");
                        if (mysqli_num_rows($query_result) > 0) {
                            while($row = mysqli_fetch_assoc($query_result)) {
                                $img_path = "file/album_img" . "/" . $row['image_path'];
                                $data = "<div class='album-content-data' onclick='setAlbum(" . $row['album_id'] .")'>" . '<input type="radio" name="album-option" value="' . $row['album_id'] .'"  id=album-option-id-' . $row["album_id"] . '><label for="album-option-' . $row['album_id'] .'">' . '<img src="' . $img_path .'">'. $row['judul'] .'</label></div>';
                                echo $data;
                                
                            }
                        } else {
                            echo "0 results";
                        }
                    ?>
                </div>
            </div>
            <h2>
                Song's release date
            </h2>
            <input type="date" name="tanggal-rilis-lagu" id="input-tanggal-rilis-lagu" class="input-text">
            <h2>
                Song's genre
            </h2>
            <input type="text" name="genre-lagu" id="input-genre-lagu" class="input-text">
            <input type="hidden" id="audio_duration" name="audio-duration">
            
            <h2>
                Song's cover photo
            </h2>
                        
            
            <input type="hidden" name="MAX_FILE_SIZE" value="100000000" />
            <input type="file" id="uploaded_photo" name="uploaded_file[]" accept="image/*" class="input-file" required>
            <h2>
                Song file
            </h2>
        
            <input type="file" id="uploaded_audio" name="uploaded_file[]" accept="audio/*" class="input-file" required>
            <br>
            </div>
            <div class="add-song-lyrics">
                <h2>
                    Song's lyrics
                </h2>
                <textarea name="lirik-lagu" id="input-lirik-lagu" class="input-text"></textarea>
            </div>
            </div>
            <div class="button" onclick="addSong()">Upload Song</div>
            
        </form>
    </div>
</div>