-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pekotify
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(64) NOT NULL,
  `penyanyi` varchar(128) NOT NULL,
  `total_duration` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `tanggal_terbit` date NOT NULL,
  `genre` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'あくたんのこと好きすぎ☆ソング/For The Win (2022 ver.)', '湊あくあ', 296, '湊あくあ/あくたんのこと好きすぎソング.jpg','2022-01-24','J-pop');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `song_id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(64) NOT NULL,
  `penyanyi` varchar(128) DEFAULT NULL,
  `tanggal_terbit` date NOT NULL,
  `genre` varchar(64) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `audio_path` varchar(255) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `lyrics` varchar(3625) DEFAULT NULL,
  PRIMARY KEY (`song_id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'あくたんのこと好きすぎ☆ソング','湊あくあ','2022-01-24','J-pop',296,'湊あくあ/あくたんのこと好きすぎソング.mp3','湊あくあ/あくたんのこと好きすぎソング.jpg',1,'「あたし、湊あくあ。\r\n職業、スーパーウルトラ何でもパーフェクトなメイドさん。\r\n今日もご主人の為に・・・ 精一杯、頑張っちゃうぞ～～～～！」\r\n\r\n\r\nラブラブ！ ラブラブ！ メイドさんだゾ！ Yeah～～～！\r\n\r\n\r\n＼あくあ　あくあ　あくあ　あくあ／\r\n「あくたんのこと？｣＼好・き・す・ぎ❤／\r\n＼あくあ　あくあ　あくあ　あくあ／\r\n「よくできました～❤」\r\n\r\n\r\nドジっ娘メイドは　てんてこまい\r\nお掃除洗濯ホラ　汗だくだく (ぱぁ～)\r\nお料理コゲたら　てへぺろ\r\n許してご主人～！ (ごめんなさ～い！)\r\n\r\n\r\nゲームばかりして　怒ってる？\r\nプリティNEKOフェイスで　誤魔化すにゃん ( にゃ〜ん)\r\n\r\n\r\nお昼寝は　メイドの性\r\nゴキゲンな夢みて (Fu-Fu)　すやや～\r\n(遅刻！遅刻！寝坊はダメダメ　じゃっじゃーん！)\r\n\r\n\r\nエプロンカチューシャは　ハンドメイド (う～～～清楚！)\r\nトイレは行かないよ　アイドルメイド (う～～～清楚！)\r\n「あ～っご主人、 にやついてる〜〜！w」\r\nダメダメ❤\r\n\r\n\r\nメイド服脱いだら　ただの女の子だけど\r\nご主人との思い出　作れますか？\r\nずっと仲良くしてね (Yeah)\r\n\r\n\r\n遥か未来で　しわくちゃになったって\r\n思い出してくれるよね？\r\nこの (ラブ×３) Chu☆ (Chu☆)\r\nオムライス (どうぞ！) たんとお食べ❤\r\n\r\n\r\n＼あくあ　あくあ　あくあ　あくあ／\r\n「あくたんのこと？｣＼好・き・す・ぎ❤／\r\n＼あくあ　あくあ　あくあ　あくあ／\r\n「さっすがご主人❤」\r\n\r\n\r\nポンコツメイドは　年中無休\r\n朝から晩まで　やる事だらけ (はぁ～)\r\n歌って踊って　どったんばったん\r\n構ってご主人～！　(かまって～！)\r\n\r\n\r\n陰キャップは　取れないけど\r\n猫耳の手も借りて　頑張るにゃん (にゃ～ん )\r\n\r\n\r\nおかえりなさい　ご主人様\r\nってたまにはサービス (Fu-Fu)　イイでしょ？\r\n(ナイスゥ！ナイスゥ！ ベリベリグッジョブ　じゃっじゃーん！)\r\n\r\n\r\nゲームに負けたなら　台パンメイド (う～～～清楚！)\r\nタラタラしていたらお仕置きメイド (う～～～清楚！)\r\n「あれ、ご主人、怒っちゃった～！？w」\r\nヤ・ダ･ヤ・ダ❤\r\n\r\n\r\nメイド服を着たら　もっと女の子になる\r\n隣で笑って　遊びたいの\r\nギュッと仲良くしてね (Yeah)\r\n\r\n\r\n星降る夜に　まごころ　誓いましょう\r\nイタズラだってご愛嬌\r\nこの (萌え×３) Kyun☆ (Kyun☆)\r\n上目遣い (ね〜ぇ) イチコロでしょ？ (ヒュ～～～～)\r\n\r\n\r\nはわわ、お帰りご主人！　(う～清楚！)\r\nお砂糖、お醤油、間違えちゃった～！　(う～清楚 ！ )\r\nごはん？ お風呂？ それともあくあ？　(う～～～ 清楚 ！ )\r\nメイドったらメイド！ メイドなんです。　(う～～～清楚 ！ )\r\n\r\n\r\n紅茶はニガテ　水ならオッケー！ (う～～～清楚！？)\r\nこたつでカニ鍋　やっぱ鍋！ (う～～～清楚！？)\r\n壊れたテレビは　叩けば治る！ (う～～～清楚！？)\r\n低気圧ヤバ　一生寝てよう･･･ (う～～～清楚！？)\r\n\r\n\r\nお隣さん　お向かいさん　世界の皆さん　お前さん\r\n銀河一のLOVEを込めて　いっくよ〜！\r\n(おいしくなーれ萌え萌えキュン❤)\r\n(おいしくなーれ萌え萌えキュン❤)\r\n\r\n\r\n泣いて　凹んで　笑って\r\n夢を追いかけています\r\nおとぎ話だって　言わせないよ\r\nずっとあたしを見てて\r\n恋をしちゃったら　消えるのマーメイド\r\n泡になったらゴメンね　でも···\r\n\r\n\r\nあわわわ！ あわわわ！\r\nドジっ子なんだもん～！ (しゅわわ～ )\r\n\r\n\r\nメイド服消えたら　ただの女の子だけど\r\nあなたとの思い出　作れますか？\r\nずっと仲良くしてね (Yeah)\r\n\r\n\r\n遥か未来で　しわくちゃになったって\r\n思い出してくれるよね？\r\nこの (ラブ×３) Chu☆ (Chu☆)\r\nオムライス (どうぞ！) たんとお食べ❤\r\n\r\n\r\n「なんちゃって♪」\r\n(わ～～～)');
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-24 14:18:47
INSERT INTO `user` VALUES (
    0, 'admin@admin.com', 'admin', 'admin', 'Administrator', 1
);