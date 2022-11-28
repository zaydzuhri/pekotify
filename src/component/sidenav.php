<?php
    function echo_sidenav() {
        $name = $_SESSION['name'];
        $isAdmin = 0;
        if (isset($_SESSION['username'])) {
            $isAdmin = $_SESSION['isAdmin'];
        }
        if ($isAdmin) {
            $html = <<<"EOT"
                <nav class="sidenav">
                    <div class="logo">
                        <img src="img/pekotify.png" alt="logo" id="logo-img">
                        <p>Pekotify</p>
                    </div>
                    <a href="home.php"><img class="nav-icon" src="../img/icon/home.png">Home</a>
                    <a href="search.php"><img class="nav-icon" src="../img/icon/search.png">Search</a>
                    <a href="albums.php"><img class="nav-icon" src="../img/icon/albums.png">Albums</a>
                    <a href="add-page.php"><img class="nav-icon" src="../img/icon/add.png">Add</a>
                    <a href="user-list.php"><img class="nav-icon" src="../img/icon/users.png">Users</a>
                    <a href="logout.php"><img class="nav-icon" src="../img/icon/log-out.png">Log Out</a>
                </nav>
                <div class="content-margin"></div>
            EOT;
        } else { 
            if (isset($_SESSION['isGuest'])) {
                $html = <<<"EOT"
                    <nav class="sidenav">
                        <div class="logo">
                            <img src="img/pekotify.png" alt="logo" id="logo-img">
                            <p>Pekotify</p>
                        </div>
                        <a href="home.php"><img class="nav-icon" src="../img/icon/home.png">Home</a>
                        <a href="search.php"><img class="nav-icon" src="../img/icon/search.png">Search</a>
                        <a href="albums.php"><img class="nav-icon" src="../img/icon/albums.png">Albums</a>
                        <a href="logout.php"><img class="nav-icon" src="../img/icon/log-out.png">Log Out</a>
                    </nav>
                    <div class="content-margin"></div>
                EOT;
            } else {
                $html = <<<"EOT"
                    <nav class="sidenav">
                        <div class="logo">
                            <img src="img/pekotify.png" alt="logo" id="logo-img">
                            <p>Pekotify</p>
                        </div>
                        <a href="home.php"><img class="nav-icon" src="../img/icon/home.png">Home</a>
                        <a href="search.php"><img class="nav-icon" src="../img/icon/search.png">Search</a>
                        <a href="albums.php"><img class="nav-icon" src="../img/icon/albums.png">Albums</a>
                        <a href="logout.php"><img class="nav-icon" src="../img/icon/log-out.png">Log Out</a>
                    </nav>
                    <div class="content-margin"></div>
                EOT;
            }
        }
 
    echo $html;
 }

?>

