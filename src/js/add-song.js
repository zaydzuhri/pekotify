function addSongPage() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("add-page").innerHTML =
          this.responseText;
      }
    };
    xhttp.open("GET", "component/add-song.php", true);
    xhttp.send();
}

function addAlbumPage() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("add-page").innerHTML =
          this.responseText;
      }
    };
    xhttp.open("GET", "component/add-album.php", true);
    xhttp.send();
}



async function addSong(){
  var form = document.getElementById("form-submit-lagu");  
  try{
      var audio_file = document.getElementById("uploaded_audio");
      const audio = new Audio(
          URL.createObjectURL(audio_file.files[0])
      );
      const sleep = ms => new Promise(r => setTimeout(r, ms));
      await sleep(1000);
      document.getElementById("audio_duration").value = audio.duration;
      
    }catch(err){
      console.log(err);
    }finally{
      form.submit();
    }
    
    
}

function setAlbum(id){
    document.getElementById("album-option-id-" + id).checked = true;
}