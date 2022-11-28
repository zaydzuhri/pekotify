<?php
    require_once "../config.php";
    $song_id = $_POST['song-id'];
    $stmt = $db->prepare("SELECT * FROM song WHERE song_id = $song_id");
    $stmt->execute();
    $result = $stmt->get_result();
    $data = $result->fetch_assoc();

    $song_img = "../file/song_img/" . $data['image_path'];
    $song_path = "../file/song/" . $data['audio_path'];
    $album_id = $data['album_id'];
    unlink($song_img);
    unlink($song_path);
    $sql = $db->prepare("DELETE FROM song WHERE song_id = ?");
    $sql->bind_param("i",$song_id);
    $sql->execute();
    header("location: ../album-edit.php?id=$album_id");
?>