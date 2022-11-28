<?php
    require_once "../config.php";
    $album_id = $_POST['album-id'];
    $sql = "SELECT * FROM album WHERE album_id=$album_id";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = $result->fetch_assoc();
    $album_image_path = "../file/album_img/" . $data['image_path']; 
    
    $sql = "SELECT * FROM song WHERE album_id = ". $data['album_id'];
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $result = $stmt->get_result();
    while ($row = $result->fetch_assoc()) {
        $song_img = "../file/song_img/" . $row['image_path'];
        $song_file = "../file/song/" . $row['audio_path'];
        $song_id = $row['song_id'];
        unlink($song_img);
        unlink($song_file);
        $sql = $db->prepare("DELETE FROM song WHERE song_id = ?");
        $sql->bind_param("i",$song_id);
        $sql->execute();
    }
    unlink($album_image_path);
    $sql = $db->prepare("DELETE FROM album WHERE album_id = ?");
    $sql->bind_param("i",$album_id);
    $sql->execute();
    header("location: ../home.php");
?>  