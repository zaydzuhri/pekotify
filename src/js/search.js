function searchSong() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("search-elements-container").innerHTML =
        this.responseText;
    }
  };
  xhttp.open("GET", "component/search-song.php", true);
  xhttp.send();
}
function searchRelease() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("search-elements-container").innerHTML =
        this.responseText;
    }
  };
  xhttp.open("GET", "component/search-release.php", true);
  xhttp.send();
}
function searchArtist() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("search-elements-container").innerHTML =
        this.responseText;
    }
  };
  xhttp.open("GET", "component/search-artist.php", true);
  xhttp.send();
}
function searchAlbum() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("search-elements-container").innerHTML =
        this.responseText;
    }
  };
  xhttp.open("GET", "component/search-album.php", true);
  xhttp.send();
}

function debounce(func, timeout = 300) {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => {
      func.apply(this, args);
    }, timeout);
  };
}

function showSongResult() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("search-elements-container").innerHTML =
        this.responseText;
    }
  };
  xhttp.open("GET", "component/search-song-result.php", true);
  xhttp.send();
}

function setPage(page) {
  document.cookie = "page=" + page;
  type = document.getElementById('search-type-value').value;
  if (type == "release") {
    searchRelease();
  } else if (type == "artist") {
    searchArtist();
  } else {
    searchSong();
  }
}

function setSortBy() {
  document.cookie =
    "sort-by-value=" + document.getElementById("sort-by-value").value;
  search();
}
function setFilterGenre() {
  document.cookie =
    "filter-genre-value=" + document.getElementById("filter-genre-value").value;
  search();
}
