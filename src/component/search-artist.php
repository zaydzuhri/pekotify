
<input type="hidden" id="search-type-value" value="artist"">
<div class="search-type">
    <button onclick="searchSong()" class="search-type-btn">Songs</button>
    <button onclick="searchRelease()" class="search-type-btn">Release Year</button>
    <button onclick="searchArtist()" class="search-type-btn active-btn" disabled>Artists</button>
    <button onclick="searchAlbum()" class="search-type-btn">Albums</button>
</div>




<div class="modifier-container">
    <div class="filter-container">
        <label for="filter-genre">Filter genre: </label>
        <select id="filter-genre-value" onchange="setFilterGenre()">
            <option value="all">All</option>
            <?php
                $selected_genre = $_COOKIE['filter-genre-value'];
                require_once "../config.php";
                $sql = "SELECT DISTINCT genre FROM song;";
                $result = $db->query($sql);
                while($row = $result->fetch_assoc()) {
                    if ($row['genre'] == $selected_genre) { $selected = "selected"; } else { $selected = ""; }
                    echo "<option value='" . $row['genre'] . "'" . $selected . ">" . $row['genre'] . "</option>";
                }
            ?>
        </select>
    </div>
    <div class="sort-container">
        <label for="sort-by">Sort by: </label>
        <?php
            if ($_COOKIE['sort-by-value'] == "song.judul") { $selected_sort_judul = "selected"; } else { $selected_sort_judul = ""; }
            if ($_COOKIE['sort-by-value'] == "song.tanggal_terbit") { $selected_sort_tanggal_terbit = "selected"; } else { $selected_sort_tanggal_terbit = ""; }
        ?>
        <select id="sort-by-value" onchange="setSortBy()">
            <option value="song.judul" <?php echo $selected_sort_judul ?>>Title</option>
            <option value="song.tanggal_terbit" <?php echo $selected_sort_tanggal_terbit ?>>Release Date</option>
        </select>
    </div>
</div>
<?php
    require_once "../config.php";
    require_once "song.php";
    $page = $_COOKIE["page"];
    $song_per_page = 5;

    $left_id_limit = ($page - 1) * $song_per_page;
    $right_id_limit = $left_id_limit + $song_per_page;

    $previous = $page - 1;
    $next = $page + 1;
    $number_of_pages = 0;
    $search_query = "%" . $_COOKIE["query"] . "%";
    $sort_by = $_COOKIE["sort-by-value"];
    $filter_genre = $_COOKIE["filter-genre-value"];
    if ($search_query !== "%%"){
        $row_count_query = "SELECT COUNT(*) FROM song WHERE penyanyi LIKE ?";
        if ($filter_genre !== "all"){
            $row_count_query = "SELECT COUNT(*) FROM song WHERE penyanyi LIKE ? AND genre = '$filter_genre'";
        }
        $stmt = $db->prepare($row_count_query);
        $stmt->bind_param("s", $search_query);
        $stmt->execute();
        $result = $stmt->get_result();
        $number_of_pages = ceil($result->fetch_assoc()['COUNT(*)'] / $song_per_page);

        $sql = "SELECT song_id, song.judul AS song_title, song.image_path, song.penyanyi, album.judul AS album_title, YEAR(song.tanggal_terbit), song.genre FROM song LEFT JOIN album ON song.album_id = album.album_id WHERE song.penyanyi LIKE ? ORDER BY $sort_by DESC LIMIT $song_per_page OFFSET $left_id_limit";
        if ($filter_genre !== "all"){
            $sql = "SELECT song_id, song.judul AS song_title, song.image_path, song.penyanyi, album.judul AS album_title, YEAR(song.tanggal_terbit), song.genre FROM song LEFT JOIN album ON song.album_id = album.album_id WHERE song.penyanyi LIKE ? AND song.genre = '$filter_genre' ORDER BY $sort_by DESC LIMIT $song_per_page OFFSET $left_id_limit";
        }
        $stmt = $db->prepare($sql);
        $stmt->bind_param("s", $search_query);
        $stmt->execute();
        $result = $stmt->get_result();
    }
?>
<div class="search-result">
<?php
    $html_result = <<<EOT
        <table class="song-container" cellspacing="0" cellpadding="0">
        <tr>
            <th class="song-no-header"> <p class="song-no"># </p></th>
            <th class="song-title-header">TITLE</th>
            <th class="song-album-header">ALBUM</th>
            <th class="song-year-header">YEAR</th>
            <th class="song-genre-header">GENRE</th>
        </tr>
        EOT;
        if ($search_query !== "%%" and $result->num_rows > 0) {
            echo $html_result;
        }
        ?>
        <tr style="height: 12px"></tr>
            <?php
                $i = ($page - 1) * $song_per_page;
                while ($row = $result->fetch_assoc()) {
                    $i++;
                    echo_song($i, $row["song_title"], $row["image_path"], $row["penyanyi"], $row["album_title"], $row["YEAR(song.tanggal_terbit)"], $row["genre"], $row["song_id"]);
                }
            ?>
        </table>
        <div class="song-page">
            <ul class="pagination">
                <li class="song-page-item">
                    <?php if($page > 1){ echo "<a class='song-page-link' onclick='setPage($previous)'>Previous</a>";} ?>
                </li>
                <?php 
                for($x=1;$x<=$number_of_pages;$x++){
                    ?> 
                    <li class="song-page-item"><a class="song-page-link <?php if ($x == $page) { echo "song-page-link-current"; } else { echo "song-page-link-notcurrent"; }?>" <?php if ($x != $page) { echo "onclick='setPage($x)'";} ?>><?php echo $x; ?></a></li>
                    <?php
                }
                ?>				
                <li class="song-page-item">
                    <?php if($page < $number_of_pages){ echo "<a class='song-page-link' onclick='setPage($next)'>Next</a>";} ?>
                </li>
            </ul>
        </div>
    </div>