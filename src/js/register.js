var validName = false;
var validUsername = false;
var validEmail = false;
var validPassword = false;

function validate() {
    console.log(validName, validUsername, validEmail, validPassword);
    if (validName && validUsername && validEmail && validPassword) {
        document.getElementById("submit").disabled = false;
    } else {
        document.getElementById("submit").disabled = true;
    }
}

function debounce(func, timeout = 300) {
    let timer;
    return (...args) => {
        clearTimeout(timer);
        timer = setTimeout(() => { func.apply(this, args); }, timeout);
    };
}

function matchPassword() {
    var password = document.getElementById('password').value;
    var confirm_password = document.getElementById('confpassword').value;
    if (password.length === 0) {
        document.getElementById('password').style = 'border: 2px solid #eb505f';
        document.getElementById('password-warning').innerHTML = 'Enter a password.';
        document.getElementById('password-warning').style = 'color: #eb505f; font-size: 12px; padding-top: 5px; font-weight: normal';
        validPassword = false;
        validate();
    } else if (password == confirm_password) {
        document.getElementById('confpassword').style = 'border: 1px solid #ff';
        document.getElementById('confpassword-warning').innerHTML = '';
        document.getElementById('password').style = 'border: 2px solid #ff';
        document.getElementById('password-warning').innerHTML = '';
        validPassword = true;
        validate();
    } else {
        document.getElementById('confpassword').style = 'border: 2px solid #eb505f';
        document.getElementById('confpassword-warning').innerHTML = 'Passwords do not match.';
        document.getElementById('confpassword-warning').style = 'color: #eb505f; font-size: 12px; padding-top: 5px; font-weight: normal';
        validPassword = false;
        validate();
    }
}

function checkUsername() {
    var username = document.getElementById('username').value;
    if (username.match(/^[a-zA-Z0-9_]+$/)) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                if (this.responseText == 'true') {
                    document.getElementById('username').style = 'border: 2px solid #49e08b';
                    document.getElementById('username-warning').innerHTML = '';
                    validUsername = true;
                    validate();
                } else {
                    document.getElementById('username').style = 'border: 2px solid #eb505f';
                    document.getElementById('username-warning').innerHTML = 'Username already exists.';
                    document.getElementById('username-warning').style = 'color: #eb505f; font-size: 12px; padding-top: 5px; font-weight: normal';
                    validUsername = false;
                    validate();
                }
            }
        }
        xhttp.open('GET', '../backend/username-check.php?username=' + username, true);
        xhttp.send();
    } else {
        document.getElementById('username').style = 'border: 2px solid #eb505f';
        document.getElementById('username-warning').innerHTML = 'Username must consist of the alphabet, numbers, and underscore.';
        document.getElementById('username-warning').style = 'color: #eb505f; font-size: 12px; padding-top: 5px; font-weight: normal';
        validUsername = false;
        validate();
    }
}

const debouncedCheckUsername = debounce(() => checkUsername());

function checkEmail() {
    var email = document.getElementById('email').value;
    if (email.match(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/)) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                if (this.responseText == 'true') {
                    document.getElementById('email').style = 'border: 2px solid #49e08b';
                    document.getElementById('email-warning').innerHTML = '';
                    validEmail = true;
                    validate();
                } else {
                    document.getElementById('email').style = 'border: 2px solid #eb505f';
                    document.getElementById('email-warning').innerHTML = 'This email is already used by an account.';
                    document.getElementById('email-warning').style = 'color: #eb505f; font-size: 12px; padding-top: 5px; font-weight: normal';
                    validEmail = false;
                    validate();
                }
            }
        }
        xhttp.open('GET', '../backend/email-check.php?email=' + email, true);
        xhttp.send();
    } else {
        document.getElementById('email').style = 'border: 2px solid #eb505f';
        document.getElementById('email-warning').innerHTML = 'Invalid email address.';
        document.getElementById('email-warning').style = 'color: #eb505f; font-size: 12px; padding-top: 5px; font-weight: normal';
        validEmail = false;
        validate();
    }
}

const debouncedCheckEmail = debounce(() => checkEmail());

function checkName() {
    var name = document.getElementById('name').value;
    if (name.length === 0) {
        document.getElementById('name').style = 'border: 2px solid #eb505f';
        document.getElementById('name-warning').innerHTML = 'Enter a name for your account.';
        document.getElementById('name-warning').style = 'color: #eb505f; font-size: 12px; padding-top: 5px; font-weight: normal';
        validName = false;
        validate();
    } else {
        document.getElementById('name').style = 'border: 2px solid #ff';
        document.getElementById('name-warning').innerHTML = '';
        validName = true;
        validate();
    }
}