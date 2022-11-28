<h1>Add Entry</h1>
<div class="add-type">
    <button onclick="addAlbumPage()" class="add-type-btn active-btn" disabled>Add Album</button>
    <button onclick="addSongPage()" class="add-type-btn">Add Song</button>
</div>
<div class="add-album-section">
    <div class="add-album">
        <form enctype="multipart/form-data" action="backend/add-album.php" method="POST" required>
            <h2>
                Album's name
            </h2>
            <input type="text" name="nama-album"  id="input-nama-album" class="input-text" required>
            <h2>
                Album's artist
            </h2>
            <input type="text" name="nama-artist" id="input-nama-artist-album" class="input-text" required>
            <h2>
                Album's release date
            </h2>
            <input type="date" name="tanggal-rilis" id="input-tanggal-rilis-album" class="input-text" required>
            <h2>
                Album's genre
            </h2>
            <input type="text" name="genre" id="input-genre-album" class="input-text" required>
            <h2>
                Album's cover photo
            </h2>
        
            <input type="hidden" name="MAX_FILE_SIZE" value="10000000" />
            <input type="file" name="uploaded_photo" accept="image/*" class="input-file" required>
            <br>
            <div class="button" onclick="this.parentNode.submit();">Create Album</div>
            
        </form>
        
    </div>
    <div class = "available-album-section">
        <h1>Available album</h1>
        <div class="available-album">

            <?php
                require_once "album.php";
                require_once "../config.php";
                $query_result = mysqli_query($db,"SELECT * FROM album");
                if (mysqli_num_rows($query_result) > 0) {
                    while($row = mysqli_fetch_assoc($query_result)) {
                    echo_album($row['judul'], $row['image_path'], $row['penyanyi'], $row['tanggal_terbit'], $row['genre'], $row['album_id']);
                    }
                } else {
                    echo "0 results";
                }
            ?>
        </div>
    </div>
    
</div>