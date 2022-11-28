<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/img/pekotify.png">
    <title>Log In - Pekotify</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="login-column">
        <div class="login-box">
            <div class="logo">
                <img src="img/pekotify.png" alt="logo" id="logo-img">
                <p>Pekotify</p>
            </div>
            <p class="login-text">To continue, log in to Pekotify</p>
            <?php 
            if (isset($_GET['error'])) {
                if ($_GET['error'] == "true") {
                    echo '<div class="login-warning"><p>Incorrect username or password.</p></div>';
                }
            }
            ?>
            <form action="backend/check-login.php" method="post">
                <div class="login-form">
                    <div class="field">
                        <p>Username</p>
                        <input type="text" name="username" class="username" placeholder="Username" id="username">
                    </div>
                    <div class="field">
                        <p>Password</p>
                        <input type="password" name="password" class="password" placeholder="Password" id="password">
                    </div>
                    <input type="submit" value="LOG IN" class="submit">
                </div>
            </form>
        </div>
        <div class="register-box">
            <p class="register-text">Don't have an account?</p>
            <form action="register.php">
                <input type="submit" value="SIGN UP FOR PEKOTIFY" class="register">
            </form>
            <p class="guest-text"><a href="guest-login.php">Continue as a guest</a></p>
        </div>
    </div>
</body>
</html>