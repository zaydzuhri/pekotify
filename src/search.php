<?php session_start() ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/img/pekotify.png">
    <title>Pekotify</title>
    <link rel="stylesheet" href="css/style.css"> 
    <link rel="stylesheet" href="css/sidenav.css"> 
    <link rel="stylesheet" href="css/search.css"> 
    <link rel="stylesheet" href="css/song.css"> 
    <link rel="stylesheet" href="css/album.css"> 
    <link rel="stylesheet" href="css/artist.css"> 
    <link rel="stylesheet" href="css/music-player.css"> 
</head>
<body>
    <div class="container">
        <?php 
            require_once "component/sidenav.php";
            echo_sidenav(); 
        ?>
        <div class="search">
            <div class="search-input">
                <input type="text" id="search-bar" placeholder="What do you want to listen to?" onkeydown="debounce(search)()">
                <button class="search-button" onclick="search()">Search</button>
            </div>
            <div id="search-elements-container">
            </div>
        </div>
    </div>
    <script src="js/search.js"></script>
    <script>
        document.cookie="query=";
        document.cookie="page=1";
        document.cookie="sort-by-value=song.tanggal_terbit";
        document.cookie="filter-genre-value=all";
        searchSong();
        function search() {
            var input, query, type;
            input = document.getElementById('search-bar');
            query = input.value.toLowerCase();
            type = document.getElementById('search-type-value').value;
            document.cookie="query=" + query;
            if (query !== ""){
                if (type == "song") {
                    searchSong();
                } else if (type == "album") {
                    searchAlbum();
                } else if (type == "artist") {
                    searchArtist();
                } else if (type == "release") {
                    searchRelease();
                }
            }
        }
    </script>
</body>
</html>