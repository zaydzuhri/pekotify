<?php
  include "../config.php";
  $id = $_POST['id'];
  $sql = "SELECT * FROM song WHERE song_id = ?";
  $stmt = $db->prepare($sql);
  $stmt->bind_param("i",$id);
  $stmt->execute();
  $result = $stmt->get_result();
  $data = $result->fetch_assoc();
  $audio_duration = $_POST['audio_duration'];

  $nama_lagu = $_POST['nama-lagu'];
  $tanggal_rilis_lagu = $_POST['tanggal-rilis-lagu'];
  
  $id_album = $_POST['album-option'];
  $genre = $_POST['genre-lagu'];
  $nama_artist = $_POST['nama-artist'];
  $uploaddir = '../file/song_img/'. $nama_artist.'/';
  $songuploaddir = '../file/song/'. $nama_artist.'/';
  $file_name = $_FILES['uploaded_file']['name'][0];
  $file_ext = pathinfo($file_name, PATHINFO_EXTENSION);
  $old_file_ext = pathinfo($data['image_path'], PATHINFO_EXTENSION);
  $audio_name = $_FILES['uploaded_file']['name'][1];
  $audio_ext = pathinfo($audio_name, PATHINFO_EXTENSION);
  $old_audio_ext = pathinfo($data['audio_path'], PATHINFO_EXTENSION);
  $back_error = "<a href='../song-edit.php?id=$id'>Back to edit-page</a>";
  $lyrics = $_POST['lirik-lagu'];

  $old_upload_path = $uploaddir . $nama_lagu . ".".$old_file_ext;
  $upload_path = $uploaddir . $nama_lagu . ".".$file_ext;
  $song_upload_path = $songuploaddir . $nama_lagu . ".".$audio_ext;
  $old_song_upload_path = $songuploaddir . $nama_lagu . ".".$old_audio_ext;
  

  if($id_album != NULL  && $nama_lagu != NULL && $nama_artist != NULL && $genre != NULL && $tanggal_rilis_lagu != NULL){
    if($file_name != ""){
      if (move_uploaded_file($_FILES['uploaded_file']['tmp_name'][0], $upload_path)){
        if($old_file_ext != $file_ext){
          unlink($old_upload_path);
        }
        $stmt = $db->prepare("UPDATE song SET image_path = ? WHERE song_id = ?");
        $song_photo_dir = $_POST['nama-artist'] ."/". $nama_lagu . "." . $file_ext;
        $stmt->bind_param("si", $song_photo_dir, $id);
        $stmt->execute();  
      }else{
        echo 'Song Cover Upload failed <br>';
      }  
    }
    if($audio_name != ""){
      if (move_uploaded_file($_FILES['uploaded_file']['tmp_name'][1], $song_upload_path)){
        if($old_audio_ext != $audio_ext){
          unlink($old_song_upload_path);
        }
        $stmt = $db->prepare("UPDATE song SET audio_path = ? WHERE song_id = ?");
        $song_audio_dir = $_POST['nama-artist'] ."/". $nama_lagu . "." . $audio_ext;
        $stmt->bind_param("si", $song_audio_dir,$id);
        $stmt->execute();  
      }else{
        echo 'Song File Upload failed <br>';
      }
    }
    $stmt = $db->prepare("UPDATE song SET duration = ?, judul = ?, tanggal_terbit = ?, genre = ?, album_id = ?, lyrics = ? WHERE song_id = ?");
    $stmt->bind_param("isssisi", $audio_duration,$nama_lagu, $tanggal_rilis_lagu, $genre, $id_album, $lyrics, $id);
    $stmt->execute();
    header("location: ../song-detail.php?id=$id");
    echo $back_error;
  }else{
    if($nama_lagu == NULL){
        echo "Song's name must not be empty<br>";
    }
    if($genre == NULL){
        echo "Genre must not be empty<br>";
    }
    if($tanggal_rilis_lagu == NULL){
        echo "Release date must not be empty<br>";
    }
    if($file_name == NULL){
      $stmt = $db->prepare("UPDATE song SET judul = ?, tanggal_terbit = ?, genre = ?, album_id = ?, lyrics = ? WHERE song_id = ?");
      if($stmt){
        $stmt->bind_param("sssisi", $nama_lagu, $tanggal_rilis_lagu, $genre, $id_album, $lyrics, $id);
        if($stmt->execute()){
          header("location: ../song-detail.php?id=$id");
        }else{
          echo $db->error;
          echo $back_error;  
        }
      }else{
        echo $db->error;
        echo $back_error;
      }
    }
    if(file_exists($upload_path)){
        echo "Song cover already existed!<br>";
    }
    echo "id $id_album<br>";
    echo $back_error;
  }
?>