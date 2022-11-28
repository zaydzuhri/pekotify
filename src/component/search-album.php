<input type="hidden" id="search-type-value" value="album">
<div class="search-type">
    <button onclick="searchSong()" class="search-type-btn">Songs</button>
    <button onclick="searchRelease()" class="search-type-btn">Release Year</button>
    <button onclick="searchArtist()" class="search-type-btn">Artists</button>
    <button onclick="searchAlbum()" class="search-type-btn active-btn" disabled>Albums</button>
</div>
<div class="search-result">
    <div class="album-container">
        <?php
            require_once "album.php";
            require_once "../config.php";
            $page = 1;
            $album_per_page = 10;

            $left_id_limit = ($page - 1) * $album_per_page;
            $right_id_limit = $left_id_limit + $album_per_page;

            $previous = $page - 1;
            $next = $page + 1;
            $number_of_pages = 0;

            $search_query = "%" . $_COOKIE["query"] . "%";

            if ($search_query !== "%%"){
                $sql = "SELECT * FROM album WHERE judul LIKE ?";
                $stmt = $db->prepare($sql);
                $stmt->bind_param("s", $search_query);
                $stmt->execute();
                $result = $stmt->get_result();
                $number_of_pages = ceil($result->num_rows / $album_per_page);
                $i = ($page - 1) * $album_per_page;
                while($row = $result->fetch_assoc()) {
                    echo_album($row['judul'], $row['image_path'], $row['penyanyi'], $row['tanggal_terbit'], $row['genre'], $row['album_id']);
                }
            }
        ?>
    </div>
</div>




