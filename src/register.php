<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/img/pekotify.png">
    <title>Sign Up - Pekotify</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
    <div class="register-column">
        <div class="register-box">
            <div class="logo">
                <img src="img/pekotify.png" alt="logo" id="logo-img">
                <p>Pekotify</p>
            </div>
            <p class="register-text">Sign up for free to start listening.</p>
            <form action="backend/add-user.php" method="post">
                <div class="register-form">
                    <div class="field">
                        <p>Name</p>
                        <input type="text" name="name" class="text" placeholder="Enter your name" id="name" onkeyup="checkName()" required>
                        <p id="name-warning"></p>
                    </div>
                    <div class="field">
                        <p>Username</p>
                        <input type="text" name="username" class="text" placeholder="Enter a username" id="username" onkeyup="debouncedCheckUsername()" required>
                        <p id="username-warning"></p>
                    </div>
                    <div class="field">
                        <p>Email</p>
                        <input type="text" name="email" class="text" placeholder="Enter an email" id="email" onkeyup="debouncedCheckEmail()" required>
                        <p id="email-warning"></p>
                    </div>
                    <div class="field">
                        <p>Password</p>
                        <input type="password" name="password" class="text" placeholder="Enter a password" id="password" onkeyup="matchPassword()" required>
                        <p id="password-warning"></p>
                    </div>
                    <div class="field">
                        <p>Confirm Password</p>
                        <input type="password" name="confpassword" class="text" placeholder="Confirm your password" id="confpassword" onkeyup="matchPassword()" required>
                        <p id="confpassword-warning"></p>
                    </div>
                    <p class="terms-text">By clicking on sign-up, you agree to Pekotify's <a href="https://www.youtube.com/channel/UC1DCedRgGHBdm81E1llLhOQ">Terms and Conditions</a>.
                    <br><br>To learn more about how Pekotify collects, uses, shares and protects your personal data, please see Pekotify's <a href="https://twitter.com/usadapekora">Privacy Policy</a>.</p>
                    <input type="submit" value="SIGN UP" class="submit" id="submit" disabled="True">
                </div>
            </form>
            <p class="login-text">Have an account? <a href="login.php">Log in</a></p>
        </div>
    </div>
    <script src="js/register.js"></script>
</body>
</html>