var audio;
var current_time = document.getElementById('time-progress');
const slider = document.getElementById('seek-slider');

let rAF = null;

audio = new Audio(document.getElementById('path-lagu').value);
audio.addEventListener('loadedmetadata', () => {
    slider.max = Math.floor(audio.duration);
});

slider.addEventListener('change', () => {
    audio.currentTime = slider.value;
    current_time.textContent = calculateTime(slider.value);
})

audio.addEventListener('timeupdate', () => {
    slider.value = Math.floor(audio.currentTime);
    current_time.textContent = calculateTime(slider.value);
})

audio.addEventListener('ended', () => {
    slider.value = 0;
    current_time.textContent = calculateTime(0);
    stopSong();
})

slider.addEventListener('input', () => {
    current_time.textContent = calculateTime(slider.value);
})

const setSliderMax = () => {
    slider.max = Math.floor(audio.duration);
}


const calculateTime = (secs) => {
    const minutes = Math.floor(secs / 60);
    const seconds = Math.floor(secs % 60);
    const returnedSeconds = seconds < 10 ? `0${seconds}` : `${seconds}`;
    const returnedMinutes = minutes < 10 ? `0${minutes}` : `${minutes}`;
    return `${returnedMinutes}:${returnedSeconds}`;
}


function playSong() {
    var plays = 0;
    if (document.getElementById('is-guest').value == 1) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                plays = parseInt(this.responseText);
                if (plays < 4) {
                    audio.play();
                    document.getElementById('play_button').style = "display: none";
                    document.getElementById('stop_button').style = "";
                } else {
                    alert("You have reached the limit of 3 plays per day as a guest.\nLog in to continue listening to music.");
                }
            }
        }
        xhttp.open("GET", "backend/guest-play.php?title=" + document.getElementById('title-lagu').value, true);
        xhttp.send();
    } else {
        audio.play();
        document.getElementById('play_button').style = "display: none";
        document.getElementById('stop_button').style = "";
    }
};

function stopSong() {
    audio.pause();
    document.getElementById('play_button').style = "";
    document.getElementById('stop_button').style = "display: none"
}