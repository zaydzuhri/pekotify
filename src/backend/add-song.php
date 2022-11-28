<?php
  include "../config.php";
  $nama_lagu = $_POST['nama-lagu'];
  $nama_artist = $_POST['nama-artist'];
  $tanggal_rilis_lagu = $_POST['tanggal-rilis-lagu'];
  $id_album = $_POST['album-option'];
  $genre = $_POST['genre-lagu'];
  $uploaddir = '../file/song_img/'. $nama_artist.'/';
  $songuploaddir = '../file/song/'. $nama_artist.'/';
  $file_name = $_FILES['uploaded_file']['name'][0];
  $file_ext = pathinfo($file_name, PATHINFO_EXTENSION);
  $audio_name = $_FILES['uploaded_file']['name'][1];
  $audio_ext = pathinfo($audio_name, PATHINFO_EXTENSION);
  $back_error = "<a href='../add-page.php'>Back to add-page</a>";
  $lyrics = $_POST['lirik-lagu'];
  $audio_duration = $_POST['audio-duration'];
  

  $upload_path = $uploaddir . $nama_lagu . ".".$file_ext;
  $song_upload_path = $songuploaddir . $nama_lagu . ".".$audio_ext;

  

  if($id_album != NULL && $file_name != NULL && !file_exists($song_upload_path) && !file_exists($upload_path) && $nama_lagu != NULL && $nama_artist != NULL && $genre != NULL && $tanggal_rilis_lagu != NULL){
    if(!file_exists($uploaddir)){
      mkdir($uploaddir,0777,true);
    }
    if(!file_exists($songuploaddir)){
      mkdir($songuploaddir,0777,true);
    }
    if (move_uploaded_file($_FILES['uploaded_file']['tmp_name'][0], $upload_path) && move_uploaded_file($_FILES['uploaded_file']['tmp_name'][1], $song_upload_path)) {
      $stmt = $db->prepare("INSERT INTO song (judul, penyanyi, tanggal_terbit, genre, duration, audio_path, image_path, album_id, lyrics) VALUES (?,?,?,?,?,?,?,?,?)");
      $song_photo_dir = $_POST['nama-artist'] ."/". $nama_lagu . "." . $file_ext;
      $song_dir = $_POST['nama-artist'] ."/". $nama_lagu . "." . $audio_ext;
      if($stmt){
        $stmt->bind_param("ssssissss", $nama_lagu, $nama_artist, $tanggal_rilis_lagu, $genre, $audio_duration, $song_dir, $song_photo_dir, $id_album, $lyrics);
        if($stmt->execute()){
          header("location: ../add-page.php");
        }else{
          echo $db->error;
          echo $back_error;  
        }
      }else{
        echo $db->error;
        echo $back_error;
      }
    } else {
        echo "Error upload<br>";
        print_r($_FILES);
        echo $back_error;
    }
  }else{
    if($nama_lagu == NULL){
        echo "Song's name must not be empty<br>";
    }
    if($nama_artist == NULL){
        echo "Artist's name must not be empty<br>";
    }
    if($genre == NULL){
        echo "Genre must not be empty<br>";
    }
    if($tanggal_rilis_lagu == NULL){
        echo "Release date must not be empty<br>";
    }
    if($file_name == NULL){
        echo "Cover photo must be uploaded<br>";
    }
    if($audio_name == NULL){
        echo "Song file must be uploaded<br>";
  }
    if(file_exists($song_upload_path)){
        echo "Song file already existed!<br>";
    }
    if(file_exists($upload_path)){
        echo "Song cover already existed!<br>";
    }
    echo $back_error;
  }
?>