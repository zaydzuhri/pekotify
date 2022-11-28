<?php
  require_once "../config.php";
  $nama_album = $_POST['nama-album'];
  $nama_artist = $_POST['nama-artist'];
  $tanggal_rilis = $_POST['tanggal-rilis'];
  $genre = $_POST['genre'];
  $uploaddir = '../file/album_img/'. $nama_artist.'/';
  $file_name = $_FILES['uploaded_photo']['name'];
  $file_ext = pathinfo($file_name, PATHINFO_EXTENSION);
  $back_error = "<a href='../add-page.php'>Back to add-page</a>";


  $upload_path = $uploaddir . $nama_album . ".".$file_ext;

  if(!file_exists($upload_path) && $nama_album != NULL && $nama_artist != NULL && $genre != NULL && $tanggal_rilis != NULL){
    if(!file_exists($uploaddir)){
      mkdir($uploaddir,0777,true);
    }
    if (move_uploaded_file($_FILES['uploaded_photo']['tmp_name'], $upload_path)) {
      $stmt = $db->prepare("INSERT INTO album (judul, total_duration, penyanyi, image_path, tanggal_terbit, genre) VALUES (?,?,?,?,?,?)");
      $album_photo_dir = $_POST['nama-artist'] ."/". $nama_album . "." . $file_ext;
      $duration = 0;
      if($stmt){
        $stmt->bind_param("sissss", $_POST["nama-album"], $duration, $nama_artist, $album_photo_dir, $tanggal_rilis, $genre);
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
        echo "Error upload\n";
        echo $back_error;
    }
  }else{
    if($nama_album == NULL){
      echo "Album's name must not be empty<br>";
    }
    if($nama_artist == NULL){
      echo "Artist's name must not be empty<br>";
    }
    if($genre == NULL){
      echo "Genre must not be empty<br>";
    }
    if($tanggal_rilis == NULL){
      echo "Release date must not be empty<br>";
    }
    if(file_exists($upload_path)){
      echo "Album already existed!<br>";
    }
    echo $back_error;
  }
?>