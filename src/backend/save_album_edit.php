<?php
    include "../config.php";
    $nama_album = $_POST['name'];
    $tanggal_rilis_album = $_POST['tanggal-rilis'];
    $id_album = $_POST['album-id'];
    $stmt = $db->prepare("SELECT penyanyi from album WHERE album_id=".$id_album);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = $result->fetch_assoc();
    $nama_artist = $data['penyanyi'];
    $genre = $_POST['genre'];
    $uploaddir = '../file/album_img/'. $nama_artist.'/';
    $file_name = $_FILES['uploaded_file']['name'];
    $back_error = "<a href='../album-edit.php?id=$id_album'>Back to add-page</a>";
    $path_lama = "../" . $_POST['img-lama'];
    
    if($file_name != ""){
        
        $file_ext = pathinfo($file_name, PATHINFO_EXTENSION);
        $upload_path = $uploaddir . $nama_album . ".".$file_ext;

        if($_FILES['uploaded_file']['tmp_name'] != NULL && $id_album != NULL && $file_name != NULL && $nama_album != NULL && $genre != NULL && $tanggal_rilis_album != NULL){
            unlink($upload_path);    
            if (move_uploaded_file($_FILES['uploaded_file']['tmp_name'], $upload_path)) {
                $stmt = $db->prepare("UPDATE album SET judul = ?, genre = ?, tanggal_terbit = ?, image_path = ? WHERE album_id = $id_album");
                $album_photo_dir = $nama_artist ."/". $nama_album . "." . $file_ext;
                if($stmt){
                    $stmt->bind_param("ssss", $nama_album, $genre, $tanggal_rilis_album, $album_photo_dir);
                    if($stmt->execute()){
                        header("location: ../album-detail.php?id=" . $id_album);
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
            if($genre == NULL){
                echo "Genre must not be empty<br>";
            }
            if($tanggal_rilis_album == NULL){
                echo "Release date must not be empty<br>";
            }
            if($_FILES['uploaded_file']['tmp_name'] == NULL){
                echo "Upload FAILED";
            }
            echo $back_error;
        }
    }else{
        if($nama_album != NULL && $genre != NULL && $tanggal_rilis_album != NULL){
            $stmt = $db->prepare("UPDATE album SET judul = ?, genre = ?, tanggal_terbit = ? WHERE album_id = $id_album");
            $stmt->bind_param("sss", $nama_album, $genre, $tanggal_rilis_album);
            $stmt->execute();
            header("location: ../album-detail.php?id=" . $id_album);
        }
    }
?>