-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2022 at 08:50 AM
-- Server version: 8.0.31
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pekotify`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `album_id` int NOT NULL,
  `judul` varchar(64) NOT NULL,
  `penyanyi` varchar(128) NOT NULL,
  `total_duration` int NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `tanggal_terbit` date NOT NULL,
  `genre` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`album_id`, `judul`, `penyanyi`, `total_duration`, `image_path`, `tanggal_terbit`, `genre`) VALUES
(1, 'あくたんのこと好きすぎ☆ソング/For The Win (2022 ver.)', '湊あくあ', 296, '湊あくあ/あくたんのこと好きすぎソング.jpg', '2022-01-24', 'J-pop'),
(2, 'Still Still Stellar', 'Hoshimachi Suisei', 3018, 'Hoshimachi Suisei/Still Still Stellar.jpg', '2021-09-29', 'J-Pop'),
(3, 'Your Mori', 'Calliope Mori', 836, 'Calliope Mori/Your Mori.jpg', '2021-09-29', 'J-Rap'),
(4, 'ぽいずにゃ～しんどろーむ', '猫又おかゆ', 708, '猫又おかゆ/ぽいずにゃ～しんどろーむ.jpg', '2021-08-03', 'J-Pop'),
(5, 'REFLECT', 'Gawr Gura', 5105, 'Gawr Gura/REFLECT.jpg', '2021-05-21', 'Electropop'),
(6, 'Shiny Smily Story', 'hololive IDOL PROJECT', 5360, 'hololive IDOL PROJECT/Shiny Smily Story.jpg', '2019-09-16', 'Idol');

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

CREATE TABLE `song` (
  `song_id` int NOT NULL,
  `judul` varchar(64) NOT NULL,
  `penyanyi` varchar(128) DEFAULT NULL,
  `tanggal_terbit` date NOT NULL,
  `genre` varchar(64) DEFAULT NULL,
  `duration` int NOT NULL,
  `audio_path` varchar(255) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `album_id` int DEFAULT NULL,
  `lyrics` varchar(3625) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `song`
--

INSERT INTO `song` (`song_id`, `judul`, `penyanyi`, `tanggal_terbit`, `genre`, `duration`, `audio_path`, `image_path`, `album_id`, `lyrics`) VALUES
(1, 'あくたんのこと好きすぎ☆ソング', '湊あくあ', '2022-01-24', 'J-pop', 296, '湊あくあ/あくたんのこと好きすぎソング.mp3', '湊あくあ/あくたんのこと好きすぎソング.jpg', 1, '「あたし、湊あくあ。\r\n職業、スーパーウルトラ何でもパーフェクトなメイドさん。\r\n今日もご主人の為に・・・ 精一杯、頑張っちゃうぞ～～～～！」\r\n\r\n\r\nラブラブ！ ラブラブ！ メイドさんだゾ！ Yeah～～～！\r\n\r\n\r\n＼あくあ　あくあ　あくあ　あくあ／\r\n「あくたんのこと？｣＼好・き・す・ぎ❤／\r\n＼あくあ　あくあ　あくあ　あくあ／\r\n「よくできました～❤」\r\n\r\n\r\nドジっ娘メイドは　てんてこまい\r\nお掃除洗濯ホラ　汗だくだく (ぱぁ～)\r\nお料理コゲたら　てへぺろ\r\n許してご主人～！ (ごめんなさ～い！)\r\n\r\n\r\nゲームばかりして　怒ってる？\r\nプリティNEKOフェイスで　誤魔化すにゃん ( にゃ〜ん)\r\n\r\n\r\nお昼寝は　メイドの性\r\nゴキゲンな夢みて (Fu-Fu)　すやや～\r\n(遅刻！遅刻！寝坊はダメダメ　じゃっじゃーん！)\r\n\r\n\r\nエプロンカチューシャは　ハンドメイド (う～～～清楚！)\r\nトイレは行かないよ　アイドルメイド (う～～～清楚！)\r\n「あ～っご主人、 にやついてる〜〜！w」\r\nダメダメ❤\r\n\r\n\r\nメイド服脱いだら　ただの女の子だけど\r\nご主人との思い出　作れますか？\r\nずっと仲良くしてね (Yeah)\r\n\r\n\r\n遥か未来で　しわくちゃになったって\r\n思い出してくれるよね？\r\nこの (ラブ×３) Chu☆ (Chu☆)\r\nオムライス (どうぞ！) たんとお食べ❤\r\n\r\n\r\n＼あくあ　あくあ　あくあ　あくあ／\r\n「あくたんのこと？｣＼好・き・す・ぎ❤／\r\n＼あくあ　あくあ　あくあ　あくあ／\r\n「さっすがご主人❤」\r\n\r\n\r\nポンコツメイドは　年中無休\r\n朝から晩まで　やる事だらけ (はぁ～)\r\n歌って踊って　どったんばったん\r\n構ってご主人～！　(かまって～！)\r\n\r\n\r\n陰キャップは　取れないけど\r\n猫耳の手も借りて　頑張るにゃん (にゃ～ん )\r\n\r\n\r\nおかえりなさい　ご主人様\r\nってたまにはサービス (Fu-Fu)　イイでしょ？\r\n(ナイスゥ！ナイスゥ！ ベリベリグッジョブ　じゃっじゃーん！)\r\n\r\n\r\nゲームに負けたなら　台パンメイド (う～～～清楚！)\r\nタラタラしていたらお仕置きメイド (う～～～清楚！)\r\n「あれ、ご主人、怒っちゃった～！？w」\r\nヤ・ダ･ヤ・ダ❤\r\n\r\n\r\nメイド服を着たら　もっと女の子になる\r\n隣で笑って　遊びたいの\r\nギュッと仲良くしてね (Yeah)\r\n\r\n\r\n星降る夜に　まごころ　誓いましょう\r\nイタズラだってご愛嬌\r\nこの (萌え×３) Kyun☆ (Kyun☆)\r\n上目遣い (ね〜ぇ) イチコロでしょ？ (ヒュ～～～～)\r\n\r\n\r\nはわわ、お帰りご主人！　(う～清楚！)\r\nお砂糖、お醤油、間違えちゃった～！　(う～清楚 ！ )\r\nごはん？ お風呂？ それともあくあ？　(う～～～ 清楚 ！ )\r\nメイドったらメイド！ メイドなんです。　(う～～～清楚 ！ )\r\n\r\n\r\n紅茶はニガテ　水ならオッケー！ (う～～～清楚！？)\r\nこたつでカニ鍋　やっぱ鍋！ (う～～～清楚！？)\r\n壊れたテレビは　叩けば治る！ (う～～～清楚！？)\r\n低気圧ヤバ　一生寝てよう･･･ (う～～～清楚！？)\r\n\r\n\r\nお隣さん　お向かいさん　世界の皆さん　お前さん\r\n銀河一のLOVEを込めて　いっくよ〜！\r\n(おいしくなーれ萌え萌えキュン❤)\r\n(おいしくなーれ萌え萌えキュン❤)\r\n\r\n\r\n泣いて　凹んで　笑って\r\n夢を追いかけています\r\nおとぎ話だって　言わせないよ\r\nずっとあたしを見てて\r\n恋をしちゃったら　消えるのマーメイド\r\n泡になったらゴメンね　でも···\r\n\r\n\r\nあわわわ！ あわわわ！\r\nドジっ子なんだもん～！ (しゅわわ～ )\r\n\r\n\r\nメイド服消えたら　ただの女の子だけど\r\nあなたとの思い出　作れますか？\r\nずっと仲良くしてね (Yeah)\r\n\r\n\r\n遥か未来で　しわくちゃになったって\r\n思い出してくれるよね？\r\nこの (ラブ×３) Chu☆ (Chu☆)\r\nオムライス (どうぞ！) たんとお食べ❤\r\n\r\n\r\n「なんちゃって♪」\r\n(わ～～～)'),
(2, 'Stellar Stellar', 'Hoshimachi Suisei', '2021-09-29', 'J-Pop', 301, 'Hoshimachi Suisei/Stellar Stellar.mp3', 'Hoshimachi Suisei/Stellar Stellar.jpg', 2, 'だって僕は星だから\r\nStellar-stellar\r\nきっと君はもう気づいていた\r\n僕の心の奥で描いた\r\nそれが これから話す 陳腐なモノローグさ\r\nずっと言えない言葉があった\r\n壊せない壁があったんだ ずっとさ\r\nふっと香り立つ朝の匂いが\r\nどうしようもなく憎らしくて\r\n部屋の隅で 膝を抱えて震えていた\r\n太陽なんていらないから\r\n明けないでいて\r\nその手を伸ばして 誰かに届くように\r\n僕だって君と同じ 特別なんかじゃないから\r\nそうさ 僕は夜を歌うよ Stellar-stellar\r\nありったけの輝きで\r\n今宵 音楽は ずっと ずっと 止まない\r\nそうだ 僕がずっとなりたかったのは\r\n待ってるシンデレラじゃないさ\r\n迎えに行く王子様だ\r\nだって僕は星だから\r\nなんて ありふれた話なんだ\r\n理想だけ書き連ねていた\r\nノートの隅に眠る ほんのワンシーンだ\r\nきっとあの星も泣いてるんだ\r\n明日なんて来ないままでいて\r\nその手を伸ばして 誰かに届くように\r\n本当に大切なものは\r\n目に見えないみたいなんだ\r\nそうさ 僕は夜を歌うよ Stellar-sellar\r\nありのまま考えないで\r\n今宵 音楽はきっときっと止まない\r\nそうだ 僕がずっとなりたかったのは\r\nあえかなヒロインじゃないさ\r\n救いに行くヒーローだ\r\n夢見がちなおとぎ話\r\nおとぎ話\r\nそうさ 僕は夜を歌うよ Stellar-stellar\r\nありったけの輝きで\r\n今宵 音楽はずっとずっと止まない\r\nそうさ 僕は愛を歌うよ Stellar-stellar\r\n世界 宇宙の真ん中で\r\n今宵 音楽はきっときっと止まない\r\nそうだ 僕がずっとなりたかったのは\r\n待ってるシンデレラじゃないさ\r\n迎えに行く王子様だ\r\nだって僕は星だから\r\nそうだ僕は星だった\r\nStellar stellar'),
(3, 'Next Color Planet', 'Hoshimachi Suisei', '2021-09-29', 'J-Pop', 301, 'Hoshimachi Suisei/Next Color Planet.mp3', 'Hoshimachi Suisei/Next Color Planet.jpg', 2, '星が揺らいで\r\n夢を見ている\r\n焦がれたその音が待ってるの\r\nキラめくカラー\r\n秘めてる日々に\r\n伝えるこのメロディ\r\n窓からのぞいた\r\n雨の降る街並みを\r\n弾ける音だから\r\nポケットに詰め込んで\r\nLet\'s dance now\r\n君の好きな（ちょっとcoolでpopなparty song）\r\nキラーチューンのステップに乗せて\r\n魔法のような（もっとvivid, passion, shiny ray）\r\nライトが私を照らしてる\r\n星を紡いで\r\n夢を描くよ\r\n焦がれたその声が呼んでるの\r\nキラめくカラー\r\nまとった君に\r\n届けるこのメロディ\r\nこのままじゃね終われない（終わらない）\r\nSpecialなstage踊り明かすの（明かそう）\r\nこのままじっとしてられない（そうさせない）\r\n走り出そうよ\r\n明日は晴れるから\r\nまだ目が覚めない\r\nカーテンを開いても\r\n憂鬱そうだって\r\nコメットが流れたら\r\nLet\'s show now\r\nいつも着てた（ちょっとtrendbaseなgirly style）\r\nショーウィンドウの服着替えて\r\n魔法のような（もっとcoolでpopなparty time）\r\nドレスがふわりってひるがえる\r\n満天の星空にほら\r\n浮かべてみて明日のビジョン\r\nそこで見える\r\nそこで見えるなら\r\nもっと飛べるよ\r\n満開の笑顔ならほら\r\n歌ってみてこのトキメキ\r\nそこで会える\r\nそこで会えるから\r\nだってきっと世界は変わるから！\r\n明日は晴れるから\r\n星を紡いで\r\n夢を描くよ\r\n焦がれたその声が呼んでるの\r\nキラめくカラー\r\nまとった君に\r\n届けるこのメロディ\r\nこのままじゃね終われない（終わらない）\r\nSpecialなstage踊り明かすの（明かそう）\r\nこのままじっとしてられない（そうさせない）\r\n走り出そうよ\r\n世界は変わるから\r\n明日は晴れるから\r\nLa-la-la-la-la-la\r\n(La-la, la-la-la-la-la-la-la)\r\nLa-la-la-la-la\r\n(La-la, la-la-la-la-la-la-la)\r\nLa-la-la-la-la-la\r\n(La-la-la-la-la)\r\n明日も会えるから！'),
(4, '天球、彗星は夜を跨いで', 'Hoshimachi Suisei', '2021-09-29', 'J-Pop', 256, 'Hoshimachi Suisei/天球、彗星は夜を跨いで.mp3', 'Hoshimachi Suisei/天球、彗星は夜を跨いで.jpg', 2, '灯りがひとつ\r\n灯った　灯った\r\n天を彩った鋲が\r\n綺麗だ\r\n僕の吐いた\r\n白い息のように、\r\n消してしまえたらな\r\n\r\n押し殺して\r\n深く沈んだ\r\n泣き声さえ、\r\n聞こえているから\r\n君を刺した\r\n不安も苦痛も、\r\n僕の青色で　\r\n塗り潰して\r\n\r\n全部涙になって\r\n星の海を\r\n流れていった\r\n果てしない闇の中に\r\nそっと\r\n青を添えたら　ほら\r\n\r\n彗星が\r\n僕の頭上を飛んだ\r\n誰もいない\r\n夜の空を染めた\r\n深く寝静まった\r\n街の中へ\r\n降り注ぐのは\r\n誰の悲しみだろう？\r\n\r\n星はまた\r\n弧を描いて\r\n飛んだ\r\nもやのかかった\r\n思考を晴らして\r\n「いつかまた会える」\r\nなんて言えなかった\r\n星が降ったあとの街、\r\n僕はまだ\r\n\r\n黒く澄んだ\r\nがらんどうの空を\r\n箒星が彩るように\r\n君を刺した\r\n不安も苦痛も、\r\n僕の青色で\r\n塗りつぶして\r\n\r\n君の涙をそっと、\r\n星の海に\r\n流しこむんだ\r\n尾を引いた\r\nその光が、\r\n誰かを\r\nまた救うから\r\n\r\n彗星が\r\n僕を選ぶのなら\r\nこの空を\r\n全部君にあげる\r\n言えなかった\r\n言葉の尾を引いて\r\n降り注ぐのは\r\n誰の悲しみだろう？\r\n\r\n星はまた\r\n弧を描いて\r\n飛んだ\r\n街の視線を\r\n奪い去るように\r\n君と\r\nまた会えるなら\r\n僕は、そうだ\r\n星の名前を\r\nひとつ受け止めよう\r\n\r\n悲しみが\r\nあふれそうになること\r\n天球で\r\n離ればなれでも\r\n僕らは\r\n繋がっているから\r\n\r\n彗星が\r\n僕の頭上を飛んだ\r\n誰もいない\r\n夜の空を染めた\r\n深く寝静まった\r\n街の中へ\r\n降り注ぐのは\r\n誰の悲しみだろう？\r\n\r\n星はまた\r\n弧を描いて\r\n飛んだ\r\nもやのかかった\r\n思考を晴らして\r\n「いつかまた会える」\r\nなんて言えなかった\r\n星が降った後の街、\r\n僕はもうずっと\r\n君の行方を　探してた'),
(5, 'GHOST', 'Hoshimachi Suisei', '2021-09-29', 'J-Pop', 283, 'Hoshimachi Suisei/GHOST.mp3', 'Hoshimachi Suisei/GHOST.jpg', 2, 'パッと弾けた感情に\r\n言い訳を並べて過ごした\r\n葛藤も知らない 街明かり\r\n君だけだって 嘘をついた\r\n信じたくもないままで 踊っている\r\n示すために 連ね続けた 言葉\r\n見えないの 僕が\r\n僕のこの声が聞こえてる？\r\nDancer in the dark\r\nシルエットすらも透明できっと\r\n不格好だけれど でも\r\nせめて声を枯らそう\r\n必死に鎚っても ずっと証明を\r\nねぇゴーストみたいだ\r\n散々恨んだ明るさと\r\n意味有りげに伸びていく影\r\n淡々と過ぎた一粒の\r\n君の言葉で泣きたくなった\r\n大切にしたいものが零れていく\r\n示すままにり綴けたい 言葉\r\n見えてるの 僕が\r\n僕のこの声が届いてる？\r\nDancer in the dark\r\nシルエットすらも透明できっと\r\n不格好だけれど でも\r\nだから叫んで 足拉いて\r\n裸足のまま走って\r\nねぇ気付いて 教えてよ 答えは\r\nこんな僕の心まで 馬鹿にしないで\r\n灰色の街が嗤ってる Wow\r\n足取りも重くなる\r\n声を枯らして 叫んで足掻いて\r\n裸足で走り続けて\r\n変わらないように\r\n諦めないように\r\n連ね綴るだけだ\r\n見つけてよ 僕を\r\n僕のこの声が聞こえてる？\r\nDancer in the dark\r\nシルエットすらも透明で\r\nきっと不格好だけれど\r\nでも せめて声を 枯らそう\r\n必死に縋っても ずっと証明を\r\nねえゴーストみたいだ\r\nあぁ'),
(6, 'バイバイレイニー', 'Hoshimachi Suisei', '2021-09-29', 'J-Pop', 213, 'Hoshimachi Suisei/バイバイレイニー.mp3', 'Hoshimachi Suisei/バイバイレイニー.jpg', 2, '空っぽの　サイレン\r\n乾いた　施錠音\r\nガラガラ　スケーター\r\n賑わえ　\r\n三点リーダ\r\nどんな言葉にも　\r\nちゃんと　\r\n綻びがあった\r\nもう　何も言わずに\r\n遊ぼう\r\n\r\nどうでもいい朝に\r\n慣れ過ぎて\r\n傘は持ってない\r\n借りてた　未来\r\n返しきれず　\r\n躱しきれず　\r\nからがら\r\n街征く\r\n余所者\r\n\r\nねえねえ　独りだ　\r\n肩　触れたのは\r\nメイビー、レイニー\r\n君はとうに　\r\n居ないんだね\r\nかなしくは　ないよ　\r\n嬉しくも　ないよ\r\nメイビー、レイニー\r\n好く晴れた　\r\n鈍色に\r\n\r\n減点式の\r\n舗装路を染める\r\nレイニー、レイニー　\r\nこんな間違えたんだね\r\n塗り潰してゆく\r\nパノラマ\r\nレイニー、レイニー　\r\n君は\r\n何点だったの\r\n\r\nバイバイ　バイバイ\r\n好く晴れた\r\n鈍色の　正午\r\n\r\n無粋なクラクション　\r\nああやって　喚いて\r\n叱り合えたら　\r\nそれで良かった？\r\n泣いて　泣いて　\r\n泣いて　何が残った\r\n使い捨ての今日を　\r\n余したくないな\r\n\r\n喧噪５分の　\r\n砂地公園\r\n宇宙の裏\r\n白い煙に\r\n吹かれながら唄う\r\n救いのない\r\n世迷言\r\n\r\nねえねえ　独りだ　\r\n頬　伝ったのは\r\nメイビー、レイニー　\r\n走馬灯みたいなキス\r\n不確かな　声に　\r\n似ている　青に\r\nバイバイ　バイバイ　\r\nしなくちゃ　\r\nいけないんだ\r\n\r\nほんの　微かに　\r\n雨の　隨に\r\n君も征くなら　\r\n無事を\r\n祈ってる\r\n\r\nねえねえ　独りだ　\r\n肩　触れたのは\r\nメイビー、レイニー　\r\n君はとうに　\r\n居ないんだね\r\nかなしくも　ないよ　\r\n嬉しくも　ないよ\r\nメイビー、レイニー　\r\n好く晴れた\r\n鈍色に\r\n\r\n減点式の\r\n舗装路を埋める\r\nレイニー、レイニー　\r\nこれで　\r\n良かったんだよね\r\n塗り潰してゆく\r\nパノラマ\r\nレイニー、レイニー　\r\n君は満点だったよ\r\n\r\nバイバイ　バイバイ\r\n好く晴れた鈍色で　\r\nバイバイ'),
(7, '自分勝手Dazzling', 'Hoshimachi Suisei', '2021-09-26', 'J-Pop', 219, 'Hoshimachi Suisei/自分勝手Dazzling.mp3', 'Hoshimachi Suisei/自分勝手Dazzling.jpg', 2, '刺すように キミの背中\r\n見つめているだけじゃ Dreaming Girl\r\n釘付けの Eyes 昨日よりもっと\r\nあぁ愛しい 触れない距離感\r\nねえ 聞こえてる？\r\nこの時間は 何度も願い懸けてよ\r\n宙を繋いだ 星の間に\r\nキミしか知らない私がいる\r\n幾億分の1に隠れた\r\nあどけなさ残すエピソード\r\nいつもよりちょっと 大人になって\r\nもっと キミを夢中にさせたい\r\nどんなシーンもずっと 見逃さないで\r\n宙を繋ぐ 今夜 アルタイル ベガ\r\n小さくて 紛れないように\r\n沢山の光放つよ\r\nその全てが君のところへ\r\nああ 溢れ 流れ着くころ\r\nねぇ どんな夜も もう暗くないよ\r\n深く碧く染まるよ\r\n待ち合わせ場所 楽しみそうな\r\n君の顔が浮かび 高鳴る\r\n星の住む街 弾む足音\r\n伝えたい 他愛ないエピソード\r\nいつもよりちょっと 大人になって\r\nもっと キミを夢中にさせたい\r\nどんなシーンもずっと 見逃さないで\r\nデート中に よそ見なんて許さない\r\n身勝手な雲 何度も越え\r\n未完成の川じっと見つめ\r\n(Starry, starry, I wish, starry)\r\n願ったんだよ Milky way\r\n出逢ったんだ 掴んだ場所で\r\n乙女の秘密\r\n(Tuning up, tuning up, tuning up, tuning up)\r\n見せてあげるわ\r\n宙を繋いだ 星の間に\r\nキミしか知らない私がいる\r\n幾億分の1に隠れた\r\nあどけなさも 光放ち 今 宙繋ぐ\r\n今夜 アルタイル ベガ'),
(8, 'Bluerose', 'Hoshimachi Suisei', '2021-09-29', 'J-Pop', 224, 'Hoshimachi Suisei/Bluerose.mp3', 'Hoshimachi Suisei/Bluerose.jpg', 2, 'たまには 木陰で休んで\r\n君の悲しかったことも聞かせて\r\n僕にも 力になれること\r\nあるかもしれないじゃん\r\n代わりに 水をくれるときは\r\n優しい言葉を忘れないで\r\n愛してるでも かわいいでも\r\n好きなように注いで\r\n巡り巡る季節\r\n土砂降りの雨も大歓迎\r\nもう一回 めいっぱい輝けるから\r\nねえ ねえ 伝えて 酸いも甘いも\r\n貴方だけの涙も\r\n背負いこんで咲く 青く煌めく星\r\nダーリン この世界のすべてが嘘でもいいの\r\nねぇ 貴方の全てを守るから\r\nそばにいてね\r\n時には 寄り道もしちゃおう\r\n近道だけが正解じゃないよ\r\nあなたと出会えた奇跡が すぐそばにあったように\r\n近づくたびにチクッとする\r\n素直じゃないこの棘でさえも\r\n貴方が笑う度 私も救われてきたから\r\n巡り巡る季節\r\n晴れの日ばかりじゃつまらないね\r\nもう一回 めいっぱい受け止めるから\r\nねえ ねえ 教えて 悔いも憂いも\r\n私だけの笑顔も\r\n抱きしめて咲く 青く煌めく星\r\nダーリン この時代のすべてに魘されても\r\nねぇ 貴方の全てを守るから\r\nそばにいてね\r\nねえ ねえ 伝えて 酸いも甘いも\r\n貴方だけの涙も\r\n背負いこんで咲く 青く煌めく星\r\nダーリン この世界のすべてが 嘘でもいいの\r\nねぇ 私の全てを捧ぐから\r\nそばにいてね'),
(9, 'comet', 'Hoshimachi Suisei', '2021-09-29', 'J-Pop', 244, 'Hoshimachi Suisei/comet.mp3', 'Hoshimachi Suisei/comet.jpg', 2, 'あの空で輝いた 流れ星を追いかけて\r\nいつか君を照らすから 彗星のスターライト\r\n生まれたばかりの 小さな光は\r\n消えてしまいそうな声で歌を唄ったんだ\r\n誰かに届くように とその声を振り絞って\r\n今はまだ響かないけど いつかその心に\r\n満天の星を降らせるよ 眩いほど煌めくよ\r\n何もかも忘れるくらい とびきりのステージをあげる\r\n今夜は眠れない 程に胸を躍らせて\r\n手を取って さぁ行こう 彗星のスターライト\r\n叶えたい願いを 浮かべた光は\r\nずっと出会いを待ってる 早く見つけてよ\r\n理想描いただけじゃ きっとまだ進めない\r\n踏み出したばかりだけど いつかその心に\r\n満開の花を咲かせるよ 夢中にしてみせるから\r\n次元さえも超えるくらい とびきりのドリームをあげる\r\n今夜は醒めないで 一度きりの瞬間だって\r\n大事なの ほら行くよ 彗星のスターライト\r\n数えきれないほどの星が\r\nそれぞれ違う色で光っているんだ\r\nその中で私は 何が残せるのかな\r\nきっと誰よりも青く強い光を\r\n満天の星を降らせるよ 眩いほど煌めくよ\r\n何もかも忘れるくらい とびきりのステージをあげる\r\n今夜は眠れない 程に胸を躍らせて\r\n私のこと見ていてね 彗星のスターライト'),
(10, 'Andromeda', 'Hoshimachi Suisei', '2021-09-29', 'J-Pop', 294, 'Hoshimachi Suisei/Andromeda.mp3', 'Hoshimachi Suisei/Andromeda.jpg', 2, 'Aisareta kioku mo nai no ni\r\nAisareru nukumori dake wa shitteita\r\nUmarete kita sono shunkan kara\r\nDareka no te motomete ikite kitan da\r\n\r\n\r\nAa nobashita dake kuzureochita\r\nSuna no you na kono omoi ga\r\nMune ni aru uchi wa doko e mo ike ya shinain da\r\n\r\n\r\nOwaranai yoru ni wa hitorikiri no asa ni wa\r\nTonari de warau you ni namida ga koborenai you ni\r\nKodoku ni kagayaita hitoribocchi no hoshi ga\r\nKoko ni iru yo to sakende uta ni natta\r\nDareka ga sore wo mite kirei to itta\r\n\r\n\r\nWake mo naku nakitakunaru you na\r\nMunashisa to sabishisa dake wo mochiyotte\r\nHi wo tsukete sa atatameaun da\r\nMou nido to hagurete shimawanai you ni\r\n\r\n\r\nNee seikai to ka machigai to ka\r\nIma wa nanimo wakaranai kedo\r\nHitotsu dake tashika na no wa watashi ga iru tte koto dake\r\n\r\n\r\nChikazuita bun dake hanarete yuku yume sae\r\nIma nara sono mayoigoto waraeru ki ga suru kara\r\nKodoku ni kagayaita ten to ten wo awasete\r\nHitori janai to sakende uta ni natta\r\nDareka ga sore wo mite seiza to itta\r\n\r\n\r\nAnata no zujou ni ima mo furikakaru\r\nKanashimi wo tokasu hikari ni naritai\r\nUrei mo itami mo issho ni kakaeteku kara\r\nOshiete\r\n\r\n\r\nOwaranai yoru ni wa hitorikiri no asa ni wa\r\nTonari de warau you ni namida ga koborenai you ni\r\nKodoku ni kagayaita hitoribocchi no hoshi ga\r\nKoko ni iru yo to sakende uta ni natta\r\nItsuka dareka no yoru wo terasu you ni\r\n\r\n\r\nTeraseru you ni\r\n\r\nSource: https://www.lyrical-nonsense.com/global/lyrics/hoshimachi-suisei/andromeda/'),
(11, 'Je t\'aime', 'Hoshimachi Suisei', '2021-09-20', 'J-Pop', 201, 'Hoshimachi Suisei/Je t\'aime.mp3', 'Hoshimachi Suisei/Je t\'aime.jpg', 2, 'あなたを想う感情が\r\n歪んで破れていった\r\n過剰な愛　この衝動が\r\nピュアな気持ち ByeBye\r\n\r\nあなたの目に映る可愛い私\r\nこの瞬間オンリー望んで\r\nMidnight 壊れるまで\r\nロマンスは殺した\r\n\r\n\r\nTurn it up. 聴かせて…？\r\n今だけは\r\nアモレ？ かもね 夜に甘えて\r\n無味　口づけに意味なんて無いの？\r\n抑えらんないよ Je t’aime。\r\n私の思う愛情が\r\n滲んで汚れていった\r\n露骨　下がらぬ体温が\r\n\r\n正常な思考と ByeBye\r\n大きくなったって “愛” なんて\r\n知らないわ　この瞬間ロンリー\r\n誤魔化すMidnight\r\n\r\n残ったのは　ロマンスの果て\r\n横向きの世界は妙に煌めいていて\r\nどんな毒飲ませたら\r\nねぇこのまま連れ出してくれる？\r\n\r\nさらって？ 見させて…？ この先も\r\n迷って迷って黒に怯えて\r\nダメ　このままじゃ…\r\n行かないで。\r\n\r\nTurn it up. 聴かせて…？\r\n今だけは\r\n揺らいで Come on ねぇ夜に溺れて\r\n不離　繰り返す意味なんて無いの？\r\n\r\n抑えらんないよ Je t’aime。'),
(12, 'Starry Jet', 'Hoshimachi Suisei', '2021-09-29', 'J-Pop', 250, 'Hoshimachi Suisei/Starry Jet.mp3', 'Hoshimachi Suisei/Starry Jet.jpg', 2, '止んだクラクション\r\nさっきまでのヒステリックな街が\r\n喧騒を脱いで キラメキ取り戻す\r\nHey, join us, we are Starry-starry Jet\r\n夜空を駆けるストリーム\r\nJoin us, we are Party-party Jet\r\n乗り遅れないでね\r\nMidnight tunes\r\nココチイイ 選りすぐりの音楽たちを\r\n散りばめて ジェリー 輝きで満たすよ\r\nTake-off\r\n今夜彗星になろうよ\r\nParty mind 眠れぬ街で\r\nキミと彗星になるんだ\r\n盛り上がろう\r\nTake you higher 手を取って\r\nパーティーは始まったばかり\r\nTake you higher 連れてくよ\r\nさあ 一緒に Flight!\r\nそっと閉じて 瞼の奥 光を追いかける\r\n消えてしまう前に 覚えておきたくて\r\nねぇ 朝に還るなんて\r\n謎ネガティブなんだナンデ？\r\nって 自問自答ループくらい\r\nそりゃ上級者グループ\r\nOw 一旦フリーズ フリーズ\r\nどなた様もアテンション・プリーズ\r\n明日に とっておきの思い出を\r\nMidnight pain 綺麗だね\r\nキミの生き方が綺麗なんだ\r\nそれぞれがジュエリー 輝きで満ちてる\r\n今夜彗星になろうよ\r\nキミと彗星になるんだ\r\nAh キラリ\r\nねぇ 踊る星の一粒さえ\r\nこの街に欠かせないなら\r\nそんな今日が本望と 今言えるかも\r\nどこまでも Starry-starry Jet\r\nこのまま 夜が明けるまで\r\nトクベツな Party-party Jet\r\nまだ終われない\r\n盛り上がれ Starry-starry Jet\r\n朝が来たって忘れない\r\n最高の Party-party Jet\r\nさあ 一緒に Flight!'),
(13, '駆けろ', 'Hoshimachi Suisei', '2021-09-29', 'J-Pop', 232, 'Hoshimachi Suisei/駆けろ.mp3', 'Hoshimachi Suisei/駆けろ.jpg', 2, '本音も\r\n建前も\r\n駆け引き\r\n上手な大人は \r\n駄目だね.\r\nそんな言葉 \r\n信用できない\r\n\r\n便利で快適で\r\n進化し続ける\r\nテクノロジー\r\n伝えて \r\n人肌のぬくもり\r\n\r\nねえ\r\nこのままずっと\r\n降り止まない \r\n雨の世界だ\r\nもう\r\n悲しくない \r\n人は慣れる\r\n生き物だから\r\nそう\r\n白紙になった\r\n青春の何ページ目\r\nだったけ\r\n今、\r\n君に会いたいと\r\n涙こみあげる\r\n\r\n踏んだり蹴ったり\r\n注意散漫 \r\n人生の転機だ\r\n新しい時代を\r\n乗りこなして\r\nいくんだ\r\n透明で 不鮮明で\r\n叫び声あげる\r\nマイノリティ\r\n健気に \r\n失敗しては\r\n学んでく\r\n\r\nもう\r\nこのままずっと\r\n降り止まない\r\n雨の世界だ\r\n愛するしかない\r\nそれしかない \r\n器用じゃないから\r\nそう\r\n白紙になった \r\n青春の何ページ目\r\nだったっけ\r\n忘れ物 \r\n思い出せないまま \r\n忘れそう \r\nこのままじゃ…\r\n\r\n風の形 見えない\r\n見えないよ あなたが\r\nあなただって同じ\r\nじっとなんて\r\nしてられない\r\n動き出すよ\r\nこの身かけて\r\n零さないよ\r\n泣いたって\r\nしょうがないさ\r\n\r\nねえ\r\nこのままずっと\r\n降り止まない\r\n雨の世界だ\r\nもう悲しくない\r\n人は慣れる\r\n生き物だから\r\nそう\r\n白紙になった\r\n青春の何ページ目\r\nだったっけ\r\n今、\r\n君に会いたいと\r\n涙 こらえて\r\n\r\nさよならだ\r\nさよならなんだって\r\n認めたくないけど\r\n雨上がりの\r\nこの世界が\r\n眩しいから\r\nもう帰らない\r\n振り返らない\r\n思い出と共に\r\n新しい風に\r\n煽られ\r\nそしてまた\r\n君に\r\n会いたいと願い\r\n駆けてゆく'),
(14, 'The Grim Reaper is a Live-Streamer', 'Calliope Mori', '2021-09-29', 'J-Rap', 192, 'Calliope Mori/The Grim Reaper is a Live-Streamer.mp3', 'Calliope Mori/The Grim Reaper is a Live-Streamer.jpg', 3, 'わたし正体不明レディ\r\n(Dead Beats, Swinging Now, Outta Control!)\r\nSha La La La La La\r\n誰も気づかない!\r\n(spoken: Nobody notices but, haha… You know.)\r\n煌々\r\n宵には\r\n『Never Missing Moon』\r\n今あなたの隣に死神がいますよ\r\nHaha… Yeah, right.\r\nLet’s hit\r\nThe crosswalk, less talk, can ya keep up?\r\nYou kinda 気になる、lookin’ like I don’t sleep enough!\r\nA 適当な rendezvous? We’re bound to stray far\r\nI’m the kind to ease your mind by taking ya to the graveyard!\r\nStep out to the city, but’cha don’t know me\r\nTake my wits right with me but they don’t own me\r\nMaybe feel like going psycho in the streets\r\nSave it for later.\r\nInstead, I’ll make a stylish retreat, and hit\r\n“Go Live, ” ro-high, so fly, oh my, no drive, this guy, talk about a misfire!\r\nLeave it to “Miss Fire Spitting” for cash\r\nI’ll never be caught up again\r\nWriting this off as a passion. It’s TOUGH.\r\nI never had a life to begin with.\r\nAnd now I’ve got 2, double the power to sin with.\r\nNot like I’ll complain!\r\nJust laughing! No?\r\nJust saying!\r\nはらひら情緒の裏表\r\n輝く演者の晴れ舞台\r\nってかたまさか浮かぶは我が調べ\r\n「表はどっち？」尋ねないで！　\r\nDunno! Dunno! Dunno!\r\nわたし正体不明レディ\r\nDown Town\r\n歌ってる\r\nSha La La La La La\r\n誰も気づかない\r\nヒールで闇を踏破\r\n煌々\r\n宵には\r\n『Never Missing Moon』\r\n誰かを照らす\r\nAs far as tellin’ horror stories goes?\r\nMy kinda warfare!\r\nPull back the curtain for one hell of a show\r\n(Dead Beats Swinging Now, outta control!)\r\nTransmission live before you!\r\nI’ll reap in real-time\r\nJust don’t forget admission\r\nThat soul is still mine.\r\nUh\r\nOut on the town again, death in your midst\r\nRight behind ya, down below ya, listen you get the gist, hah\r\nNobody realizing, they don’t recognize me\r\nFine by me, it’s agonizing; “disguising”\r\nLIVE. NOW!! broadcasting\r\nOnly so long-lasting\r\nRather it’s a matter of a right and wrong casting\r\nFasten your seat-belts, faster breathing, need help!!\r\nNeeding that fresh air. already SEEN hell.\r\n「産まれた日に掛けられてた魔法が\r\n解けていく日々の中で\r\n新しい魔法を上掛けしてく　それが人生」]\r\nWhat do you mean?\r\nどーゆー意味？って答えは自分で探してみ\r\nShe said「月に裏も表もない」\r\nHave a great night!\r\nわたし正体不明レディ\r\nDown Town\r\n歌ってる\r\nSha La La La La La\r\n誰も気づかない\r\nヒールで闇を踏破\r\n煌々\r\n宵には\r\n『Never Missing Moon』\r\n誰かを照らす\r\nAs far as tellin’ horror stories goes?\r\nMy kinda warfare!\r\nPull back the curtain for one hell of a show\r\n(Dead Beats Swinging Now, outta control!)\r\nTransmission live before you!\r\nI’ll reap in real-time\r\nJust don’t forget admission\r\nThat soul is still mine.\r\nSha La La La La La\r\nHey listen.\r\n今あなたの隣に死神がいますよ...\r\nSha La La La La La\r\nHey...Hey! もしもし？\r\n'),
(15, 'Red', 'Calliope Mori', '2021-09-29', 'J-Rap', 218, 'Calliope Mori/Red.mp3', 'Calliope Mori/Red.jpg', 3, 'Tonight, the moon has rose in a crimson red\r\nBut roses gotta wither, so I’ll live forever instead\r\nAnd now I can’t get rid of all of these thorns in my head\r\nBring on the hemorrhaging\r\nI guess I’ll live inside your memory\r\nAnother distorted story that ignored the deceased\r\nI’ll live inside of a castle, pray I’m never released\r\nI’d rather kick it in the dungeon, cuz I’m that kind of beast\r\nI’ll bet my heart on the cards, because I trust me the least\r\n(Let it die)\r\nPressure mounting, but I’m doomed without it\r\nPrecious moments zooming by, don’t doubt it\r\nRest is ephemeral, scream and shout it\r\nThe best don’t sleep, I was all about it but\r\n(Let it die)\r\nReaping keeps you tucked in the shadows\r\nThis creeping feeling of identity battles\r\nClosing in from every side of me.\r\nRed tomorrow, Red today\r\nDread, sorrow,\r\nCan’t turn away\r\nCan’t turn back\r\nTime, I’ll always be\r\nA prisoner to my ambition\r\nAs petals fly, I’ll dance your tune but hold your breath,\r\nguess who\'s running the show?\r\nAnd when this red runs black, I’ll ask you\r\nWas I everything you imagined?\r\nWhen my time’s finally up, the sun’s falling down\r\nI’ll turn to stone again.\r\nEvery day is a fight to stay relevant\r\nAnd it cannot last, so I’ll relish it\r\nAnd our planet’s vast, but this hole’s a ditch\r\nYa toss out the past, and you can strike it rich\r\nNobody asked, but the mask is an alright fit\r\nAnd this fiction’s no disaster, in spite of it\r\nI stay curious. What comes after it.\r\nSo mysterious, and yet, I exist.\r\nHold on, stay beautiful, stay young\r\nThere are blades to be swung yet\r\nRising soon, regard the moon reflected in the crimson sung tonight...\r\nRed tomorrow, Red today\r\nDread, sorrow,\r\nCan’t turn away\r\nCan’t turn back\r\nTime, I’ll always be\r\nA prisoner to my ambition\r\nAs petals fly, I’ll dance your tune but hold your breath,\r\nguess who\'s owning the throne?\r\nSo, come alive now\r\nOnce again, so I can chase you down\r\nWe are five minutes away from\r\nThe end that’s come\r\nContinue slashing forward, I must\r\nOr else just\r\nFade away...\r\nThere’s a drive to strive inside all of us\r\nA never-ending ouroboros\r\nSinking way deep down and it’s all because\r\nI kept thinking that reaping is all there was\r\nAnd is now\r\nI gotta find a way out, escape, how?\r\nFate has a funny way of shaking the weak down\r\nAm I gonna peak now? Future looking bleak, wow\r\nSomehow incomplete, after all.\r\nCan’t. Turn. Back.\r\nTime, I’ll always be\r\nA prisoner to my ambition\r\nAs petals fly, I’ll dance your tune, don’t hold your breath for me\r\nAnd when this red runs black, I’ll ask you\r\nWas I everything you imagined?\r\nWhen my time’s finally up, the sun’s falling down\r\nI’ll turn to stone again.\r\nSo, come alive now\r\nOnce again, so I can chase you down\r\nWe are five seconds away from\r\nThe end that’s come\r\nFrom here on out it’s only just,\r\nMe and this bloodlust\r\nI’d rather just\r\nFade away...'),
(16, 'guh', 'Calliope Mori', '2021-09-29', 'J-Rap', 181, 'Calliope Mori/guh.mp3', 'Calliope Mori/guh.jpg', 3, 'Give it up\r\nGive it up\r\nDead beats, we like it rough\r\nGive it up\r\nGive it up\r\nIt\'s High noon (Dead beats, we like it rough)\r\nSo\r\nA yeet yeet skrt to the yacht yacht steeze\r\nA little more wind, we could shoot the breeze\r\nThe routine\'s got me reminiscing back to the start line\r\nMadness indeed I believe i was part-time\r\nStick to my stomach, click click bit of mischief\r\nMiss, Hit, \"fuck this shit\" then a bitch quits\r\nStop. Forget that. Be an entertainer.\r\nReaper with killer wits, they cannot restrain her\r\nI could be a plain girl. Would you like that?\r\nNah, i think I\'ll take ya to the forest with a spike bat\r\nBeat you and skin you and make me a nice hat!\r\n(Calli, are you okay.?)\r\nJust a little wiped, that\'s all.\r\n... but its every day now.\r\nI\'m sensing a 戦争 and can\'t express how\r\nEat a light snack. And remain loud.\r\nHave a nice laugh. All the way down.\r\nWho\'s the one, the loaded gun who\'s always pointed downward\r\nShooting. My. Self again, the sweetest sound\r\nThey ever heard\r\nNow lets play a game, shall we go a bit deeper?\r\nWho is the best at the roasting the reaper?\r\n(Give it up)\r\n(Give it up)\r\nHaven\'t we learned anything?\r\nBe a force of nature, little agitators\r\nShow ya how it\'s done, for fun, a little later\r\nVomit your comments, my range is greater\r\nG to the UH saying \"Give Up, H4t3rs (Hey, there-)\r\nThere\'s a lot of thoughts I can\'t say outright\r\nI\'ve got my chords, you\'ve got your keyboard, both us got all night\r\nTry again, I\'m wishin\' you well!\r\nBut you will never roast me better than I roast myself\r\nHang \'em high\r\nCuz you won\'t take my life, cuz l ain\'t got none\r\nSo sorry, I\'m hardly, just getting started\r\nBut why?\r\nHave you misplaced your life? I\'ll help you find it\r\nJust follow, my shadow,\r\nGuess what? I\'m on your side.\r\nThe self-deprecation is a bit over done\r\nGive herself a point of credit, she could go for one\r\nUnderstood, have a song where l imply I\'m deserving\r\nNow the \"big-headed\" bad guy Calli got \'em swerving\r\nI really oughta try and be less offensive\r\nNot to brag, though my vocab is quite extensive\r\nThe structure\'s a mess not unlike my flow\r\nGot the message, I best stick to what I know!!!!\r\nI don\'t care what they say, self-hate is an art\r\nIf you want to compete with me, then get smart,\r\n\"My dog plays games better, pee pee poo\"\r\nGee, Look at the size of the brain on you!\r\nComin\' through, these burns are the best in the biz\r\nI\'ll pretend that my antis are all just little kids!\r\nWere you observing what I just did?\r\nReverse self-serving, surprise, here\'s a pop quiz:\r\nWho\'s the one who smacks herself for fun without a lick of hesitance\r\n\"Damn, My Content\'s Only Decent\" Club and I\'m the President\r\nNow, let\'s play a game, shall we go a bit deeper?\r\nWho is the best at the roasting the reaper?\r\n(Dead Beats, we like it rough.)\r\nHaven\'t we learned anything?\r\nThere\'s a lot of thoughts I can\'t say outright\r\nI\'ve got my chords, you\'ve got your keyboard, both us got all night\r\nTry again, I\'m wishin\' you well!\r\nBut you will never roast me better than I roast myself\r\nHang \'em high\r\nCuz you won\'t take my life, cuz I ain\'t got none\r\nSo sorry, I\'m hardly, just getting started\r\nBut why?\r\nHave you misplaced your life? I\'ll help you find it\r\nJust follow, my shadow\r\nGuess what? I\'m on your side.\r\nGive it up\r\nGive it up\r\nDead beats, we like it rough\r\nGive it up\r\nGive it up\r\nDead beats, we like it rough'),
(17, 'いじめっ子Bully', 'Calliope Mori', '2021-09-29', 'J-Rap', 245, 'Calliope Mori/いじめっ子Bully.mp3', 'Calliope Mori/いじめっ子Bully.jpg', 3, 'She’s dressed up in diamond dust\r\nA lover of decay\r\nCoated lashes, soul of ashes\r\nWhat more can I say?\r\n踏みつけたアリの行列なんて\r\n気付いてないと誰もが思う\r\nLoving you, killing you, isn’t it thrilling? You’ve\r\nSaid enough from those guts you’ve been spilling through\r\nCrying and begging, a lovely sound\r\nI tear at your soul, but ya still stick around.\r\nWhat I’ve found is a treasure indeed, a friend who can bend to my every need\r\nI’ll use and abuse you and never feel bad until suddenly, funnily, you take\r\nmy hand\r\nTangle you tight in the yarns that I’ve spun and I’ll\r\nDo it again, to get what I want\r\nPretend that I’m harmless, I’m actually alarmed this is\r\nSomething charming to anyone... (wow)\r\nThe fact can actually make Death wanna Die?\r\nI’m the one that you love, and I’m making you cry\r\nAnd it’s “just me”, after all.\r\nI’ll give you fire.\r\n心に飼う\r\nHello？ 餓狼　餓狼\r\n唸り駆ける\r\nまた意地悪な爪を立てて狩ってあげる\r\nhaze you.\r\nWhen the curtains finally close and the show’s really over\r\nIf you glance into my past, it’s just nothing new\r\nLying, conniving, thriving on hate\r\nI’ll tell you it was “all for you.”\r\nお聞きなさい\r\nホントの薔薇は自分の刺に\r\n傷ついたりしないものよ\r\nYa know,\r\nI want you to care that I want you to stay\r\nSo I swear I won’t blame you if you turn away\r\nAt the end of the day, I will smile and give in\r\nTo this burning and vile original sin\r\nCuz hell is the realization your selfish\r\nAnd drawn to the loving, the soft and the helpless\r\nI can see through that facade that you wear\r\nWhen your honest, and promise you’ll fight the despair\r\nAnd I’ll say it again, that I know I’m the worst\r\nSo then how can you spend so much love on the person that hurts you\r\nLike I do?\r\nCuz inside, I can’t hide that I cannot desert you\r\nAnd if I’m “the world” to you, surely you\r\nNever stood even a chance at all, didn’t you?\r\nIt’s me, after all.\r\nI’ll give you fire.\r\n心に飼う\r\nHello？ 餓狼　餓狼\r\n唸り駆ける\r\nまた意地悪な爪を立てて狩ってあげる\r\n来訪　宵の羽音\r\n熟れ残果啄ばむ鴉かな\r\nDon\'t be afraid.\r\nいい子ね　もうお眠り\r\nI’ll give you fire.\r\nJust keep it to yourself.\r\nHello, the hungry wolf\r\nHas come to give you hell\r\nOnce again I’ll treat you nice,\r\nThink twice before you fall\r\nAnd smile while you do.\r\nLove, the me that’s killing you.\r\n餓狼 餓狼　餓狼\r\n餓狼 餓狼　餓狼\r\nhaze you...'),
(18, 'もぐもぐYUMMY！', '猫又おかゆ', '2022-07-11', 'J-Pop', 197, '猫又おかゆ/もぐもぐYUMMY！.mp3', '猫又おかゆ/もぐもぐYUMMY！.jpg', 4, '森羅万象も 悪戦苦闘も\r\nマヨネーズかけたら大体おいしくなる？\r\n君が泣いても お腹は空くよ\r\n消化できなかった ごめん ごめん\r\n酸いも 甘いも 勝手に食べて\r\nご迷惑おかけしています\r\nパクチーな掟 変な味のジュース\r\n心を無にして飲み込みます\r\nAh 混沌 情報過多のレストランで\r\n嘘っぱちのメニューにお茶こぼして\r\n君と もぐもぐ もぐもぐ もぐもぐ もぐもぐ\r\n銃撃戦の真ん中で もぐもぐ\r\n魑魅魍魎 ハラペコの群れ\r\n満腹になる未来を願っているよ\r\nもぐもぐ もぐもぐ もぐもぐ もぐもぐ\r\n世界が終わる前に もぐもぐ\r\nやみぃ マジ神\r\nやむやむ ありのまんま もぐもぐ\r\nやみぃ Magic coming\r\nこの世を味わうんだ うまうま\r\n理論武装のミルフィーユサンド (さんど)\r\n匿名希望のオーロラソース (そーす)\r\n大雑把な味付け 多めに見てよ\r\nおいしくなったら Ok, ok\r\n良いモン 悪いモン いっぱい食べて\r\n汚れた口元拭います\r\nおにぎり ピザ ケーキ 豪華なフルコース\r\n罠を疑い 気をつけます\r\nAh 妄想流言飛語のバイキングで\r\n毒入りと絶品料理 選り分けて\r\n君と もぐもぐ もぐもぐ もぐもぐ もぐもぐ\r\nデスゲームの教室で もぐもぐ\r\n魑魅魍魎 ハラペコの群れ\r\n仲のいい君と生き残れたらいいな\r\nもぐもぐ もぐもぐ もぐもぐ もぐもぐ\r\n数年後もこの場所で もぐもぐ\r\nやみぃ マジ神\r\n今夜の晩御飯は もぐもぐ\r\nやみぃ Magic coming\r\n次はお前の番だ もぐもぐ\r\nやみぃ マジ神\r\nやむやむ ありのまんま もぐもぐ\r\nやみぃ Magic coming\r\nこの世を味わうんだ うまうま\r\nもぐもぐ もぐもぐ もぐもぐ もぐもぐ\r\nもぐもぐ もぐもぐ もぐもぐ やみぃ\r\nもぐもぐ もぐもぐ もぐもぐ もぐもぐ\r\nもぐもぐ もぐもぐ もぐもぐ やみぃ\r\nもぐもぐ もぐもぐ もぐもぐ もぐもぐ\r\nもぐもぐ もぐもぐ もぐもぐ やみぃ\r\nもぐもぐ もぐもぐ もぐもぐ もぐもぐ\r\nもぐもぐ もぐもぐ もぐもぐ やみぃ やみぃ'),
(19, 'あっかんべ', '猫又おかゆ', '2022-04-11', 'J-Pop', 166, '猫又おかゆ/あっかんべ.mp3', '猫又おかゆ/あっかんべ.jpg', 4, 'いっそ塵になって 転がってたいけど\r\nみっともないから 口から出る「大丈夫」\r\n透明な街をすり抜け 傷痕晒したまま\r\n耳障り メトロのメロディー\r\nこんな僕も肯定して\r\n感情も心臓も 値段がつくらしいね\r\nエンドレスな新規リスナー\r\nいくらですか 幸せとは\r\nかみさま\r\nウザったい恥を捨てたら\r\n並べた嘘にキスしよう\r\nI Love U\r\n最底辺の楽園さ\r\n孤独と指絡ませ アデュー サロー\r\n何者でもない僕を せめて慰めてよ\r\nアデュー サロー\r\n簡単なことも出来ずに 息を止めて歩いた\r\n愛くるしいあの子は\r\nいつの間にか笑えなくなっちゃった\r\nまだ泣いてんだ この人生は\r\n曇り模様 晴れ間探し\r\n強がっているわけじゃない\r\n誰か僕を見てよ\r\n見つけて\r\nウザったい恥を捨てたら\r\n並べた嘘にキスしよう\r\nI Love U\r\n承認に飢えた亡霊さ\r\n負け惜しみで叫んだ アデュー サロー\r\n何者でもない僕を 慰める奴はいない\r\nアデュー サロー\r\n'),
(20, 'パボ', '猫又おかゆ', '2022-04-12', 'J-Pop', 157, '猫又おかゆ/パボ.mp3', '猫又おかゆ/パボ.jpg', 4, 'まだ朝じゃん 動けないよ\r\nそれじゃ今と変わらないの\r\nただ パチリ 目を覚ましてみれば\r\n社会 底のなしのブラック\r\n出勤\r\n出勤！出勤！出勤！出勤！\r\n出勤！出勤！出勤！出勤！\r\nまだ夜じゃん 働けんじゃん\r\nそれじゃ ただのご都合奴隷\r\nカラカラ 喉から軽い言葉\r\nだりぃだらぁだりぃ\r\nだらぁだりぃだらぁらぁ\r\n真面目な奴ほど損する社会の構成\r\nルールと宿命\r\nしょーもないもない\r\n踊れ One, two, three, four パボパボ\r\nくらえ 鉄拳制裁 猫パンチ\r\n歌え One, two, three, four パボパボ\r\nくだらねえ世に飽き飽きさ\r\n社長も会長も口八丁\r\n無駄ね 逃げれないよ\r\nパーボ\r\n出勤！出勤！出勤！出勤！\r\n出勤！出勤！出勤！出勤！\r\nまだ終わんない 泊まり込んで\r\n辛い？ならばやめればいい\r\nガラガラ 喉から軽い言葉\r\nだりぃだらぁだりぃ\r\nだらぁだりぃだらぁらぁ\r\nそんなに簡単だったら\r\n苦労はしねえと ばあばは云った\r\n情もないもない\r\nみんなで One, two, three, four パボパボ\r\n下す鉄槌 高度な猫パンチ\r\n笑え One, two, three, four パボパボ\r\n変わらない世に涙目さ\r\nあいつも あの子も星占い\r\n無駄ってわかんないの？\r\nパーボ\r\n人生誰かの駒だろ\r\n僕は天才ぶってた そりゃパボ！\r\nここに上下関係ないから\r\n知らず 今日も笑えますか？\r\n踊れ One, two, three, four パボパボ\r\nくらえ 鉄拳制裁 猫パンチ\r\n歌え One, two, three, four パボパボ\r\nくだらねえ世に飽き飽きさ\r\n社長も会長も口八丁\r\n無駄ね逃げれないよ\r\nまあいいじゃん踊りましょう\r\nパーボ\r\n'),
(21, 'ORANGE PARADE', '猫又おかゆ', '2021-08-03', 'J-Pop', 188, '猫又おかゆ/ORANGE PARADE.mp3', '猫又おかゆ/ORANGE PARADE.jpg', 4, 'お構いなしに心掴む we are\r\nOkay 最高アニマルタンデム\r\nおかゆ the foodie cat! Here we go!\r\n至福のゲートが開く (hey もぐもぐ)\r\n藤色の星がキララララ\r\n最高潮へ誘います (hey もぐもぐ)\r\n全肯定で気持ち relax!\r\n君のハートをリードで結んで\r\n引っ張りまわすの (wow!) all night long\r\nめくるめく かつ 終わりのない\r\nネバー (ネバー) ランド (ランド yay!)\r\nありのままに boom shakalaka (shakalaka)\r\n心の底からハラハラ (ハラハラ)\r\nEverything gonna be alright ふわふわ (ふわふわ)\r\nさせちゃう とびきり うま! うま! (うま! うま!)\r\n土砂降りの興奮とハッピーを君へ (okay!)\r\nずーっとずっと一緒だよね? (ねっ!)\r\n来る者拒まず 去る者には圧\r\nRaining cats and dogs (no!)\r\nCrazy cat and dog! Wow!\r\nOkay 最強アニマルタンデム\r\nころね the doggo! Here we go!\r\n半狂乱の檻が開く (hey, ybyb)\r\n黄色のネオンがピカカカカ\r\n目に物見せちゃいます (hey, ybyb)\r\n急性半強制的に loud! loud! loud! loud!\r\n君のハート にぎにぎ包んで\r\n甘やかしましょ (wow!) All night long\r\n踏み入れたら 一生逃がさない\r\nワンダー (ワンダー) ランド (ランド yay!)\r\n誰彼構わず okie dokie (okie dokie)\r\n想像以上もうドキドキ (ドキドキ)\r\nEverything gonna be alright, shu be do be (shu be do be)\r\n全員まとめて ゆび! ゆび! (ゆび! ゆび!)\r\n土砂降りの興奮とハッピーを君へ (okay!)\r\nずーっとずっと一緒だよね? (ねっ!)\r\n来る者拒まず 去る者には圧\r\nRaining cats and dogs (no!)\r\nCrazy cat and dog! Wow!\r\n夢心地 kitty cup\r\n神速の doggy go round\r\nすぅーっと混ざり合うオレンジ色のパレード\r\nこっちへおいでよ so sweet\r\n眠気を消し去る spicy\r\n飴と鞭の雨霰\r\n心ゆくまで ご堪能あれ\r\n土砂降りの興奮とハッピーを君へ (okay!)\r\nずーっとずっと一緒だよね? (ねっ!)\r\n来る者拒まず 去る者には圧\r\nRaining cats and dogs (no!)\r\nCrazy cat and dog! Wow!\r\nCrazy cat and dog! Wow!\r\n'),
(22, 'REFLECT', 'Gawr Gura', '2021-06-21', 'Electropop', 247, 'Gawr Gura/REFLECT.mp3', 'Gawr Gura/REFLECT.jpg', 5, 'Εκ λόγου άλλος εκβαίνει λόγος\r\n水面に映る自分が言った\r\n「ああ わたしは悪いサメです」\r\nずっと恐れていた 赤く光るその目\r\n海の底 暗闇に消えていく\r\nどうして (Your tired eyes)\r\n泣くのよ (Begin to fall)\r\n欲しいものなら全部手に入れた\r\n教えて (Your darkest thoughts)\r\nわたしは (Unleash them all)\r\n望んでいたわたしになれたかな\r\n嘘はつかない でも本当じゃない\r\n本音は言わない方が楽じゃない？\r\nいつかは (A time and place)\r\nどこかで (For darker days)\r\n分かり合える時が来るの？\r\nLook at this so-called \"gem of the sea\"\r\nOdd and scrawny, don\'t you see what I mean?\r\nReturn to what you know, it ain\'t much I know\r\nHeh, it shows\r\nわたしはあなたとは違うの\r\nやめてよ\r\n決めつけはもう大っ嫌い（大っ嫌い）\r\n理想の姿じゃなくていいの\r\nわたしらしくあれば\r\nただわかって欲しいだけよ\r\nHeh! 理想通りじゃなきゃ意味なんてない\r\n希望も夢すらなくて\r\n辛い 辛い 辛い 辛い\r\nあなたらしさ\r\nあるのかしら？\r\n諦めて楽になろう\r\nさあ\r\nずっと追い求めた わたしなりの答え\r\n自分には嘘はつきたくないの\r\nごめんね (One story ends)\r\n今まで (Begin again)\r\n気付かなかったことがあるんだけど\r\nこうして (While hand-in-hand)\r\nあなたが (Until the end)\r\nいてくれたから今のわたしがいる\r\n過去はいらない？そんなことはない\r\n未来は見えない方がマシじゃない？\r\nここから (No matter where)\r\n静かに (Watch over me)\r\nわたしを見守っていてね\r\nSo, you think that\'s all huh?\r\nJust gonna leave like it\'s nothing?\r\nGoing without me?\r\nI don\'t know what you\'re thinking!\r\nReturn to the sea\r\nA shark is all you\'ll ever be\r\nさよなら (Our story ends)\r\nありがとう (Begin again)\r\n隠していたわたしはもういない\r\nさよなら (Once hand-in-hand)\r\nありがとう (Until the end)\r\n全て受け入れて生きていくから\r\n海の底はつまらないけど\r\nあなたのことは忘れないから\r\nいつでも (No matter where)\r\nどこでも (Watch over me)\r\nわたしらしく生きていこう\r\nΟυδέν κακόν αμιγές καλού'),
(23, 'Shiny Smily Story', 'hololive IDOL PROJECT', '2019-09-16', 'Idol', 255, 'hololive IDOL PROJECT/Shiny Smily Story.mp3', 'hololive IDOL PROJECT/Shiny Smily Story.jpg', 6, '同じ未来を見ていたい\r\nあの夢手にしたい\r\nそれぞれ 違った\r\nココロで 走れＧＯ\r\n\r\nどこを見ても真っ暗な\r\n場所に芽生えてた\r\nほんの小さな希望に\r\nこの瞳奪われた\r\n不安で揺れる心を\r\n上手くチューニングして\r\nほんの小さな勇気を\r\n振り絞っていたよ\r\n\r\n諦めの文字\r\nデリートして進む\r\n苦しいときも もう私は\r\nひとりじゃないから\r\n\r\nだからもっと夢追いかけたい\r\nワクワク止まらない\r\n想像 越えてく\r\n世界見せてあげる\r\nアクセスしてみたい\r\n後悔なんてそうさせない\r\nそれぞれ 違った\r\nココロで 走れＧＯ\r\n\r\n仮想の空に輝く\r\n眩しい想いは\r\n見たことのない光を\r\nリアルに届けるよ\r\nいつも聞こえるエールは\r\nここにキャプチャーして\r\nまた新しい光を\r\n探したくなるよ\r\n\r\n君の笑顔は\r\n保存して進む\r\n悲しいときに 見返すよ\r\n力が湧くから\r\n\r\n胸を張って夢追いかけたい\r\n奇跡のストーリー\r\n一緒に 作ろう\r\n終わらない夢を\r\n誰一人欠かせない\r\n愛が舞ったこの世界\r\nそれぞれ 違った\r\nココロで 彩れ\r\n\r\n悲しいときも寂しいときも\r\n信じ合えるものがある\r\n忘れずにこの鼓動\r\n鳴らし続けたい\r\n終わらない世界に\r\n溢れ出すよ笑顔達\r\n\r\n憧れの舞台立ちたい\r\nらしく輝きたい\r\n時に涙して\r\nまた笑い合いたい\r\n同じ未来を見たい\r\nあの夢手にしたい\r\n踏み出そう\r\n奇跡の一歩を\r\n\r\n息切らして夢追いかけたい\r\nワクワク止まらない\r\n想像 越えてく\r\n世界見せてあげる\r\nアクセスしてみない？\r\n後悔なんてここにない\r\nそれぞれ 違った\r\nココロで 作るＷＯＲＬＤ');

--
-- Triggers `song`
--
DELIMITER $$
CREATE TRIGGER `calculate_album_total_duration_delete` AFTER DELETE ON `song` FOR EACH ROW BEGIN
UPDATE album
SET total_duration = (COALESCE((
	SELECT SUM(duration) FROM song WHERE song.album_id = OLD.album_id
), 0))
WHERE album.album_id = OLD.album_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calculate_album_total_duration_insert` AFTER INSERT ON `song` FOR EACH ROW BEGIN
UPDATE album
SET total_duration = (
	SELECT SUM(duration) FROM song WHERE album.album_id = NEW.album_id
)
WHERE album.album_id = NEW.album_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calculate_album_total_duration_update` AFTER UPDATE ON `song` FOR EACH ROW BEGIN
UPDATE album
SET total_duration = (COALESCE((
	SELECT SUM(duration) FROM song WHERE song.album_id = NEW.album_id
), 0))
WHERE album.album_id = NEW.album_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `username`, `name`, `isAdmin`) VALUES
(1, 'admin@admin.com', '$2y$10$x7W8Wm6Ugrp30ic.mEFfVO/aa/83q1mJTUtzdf.HtWVzLePT0uYlW', 'admin', 'Administrator', 1),
(4, 'peko@gmail.com', '$2y$10$CdtZN7M1kryLR4Xo5OiqcexrGQaFPRExI431qwShxrBlqqfbjoFbK', 'peko', 'Usada Pekora', 0),
(7, 'mafumafu@gmail.com', '$2y$10$nKxnjY2s7P1t1S7esnnsRetygAA4WULKM0RuDVvCohqk9ptq43k62', 'mikeneko', 'Uruha Rushia', 0),
(8, 'kaizoku@holomail.com', '$2y$10$bDDkD/jKJfbkUA.El3jIse0cWBGg32OH4FCeh1z9vgSgNiJpublbC', 'marine', 'Houshou Marine', 0),
(9, 'noel@holomail.com', '$2y$10$8a4.mp6U40n3MDrqDF3xsukyKSgLZZ8i8HPlJqfiA16tIBlMIYoSK', 'noel', 'Shirogane Noel', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`album_id`);

--
-- Indexes for table `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`song_id`),
  ADD KEY `album_id` (`album_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `album_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `song`
--
ALTER TABLE `song`
  MODIFY `song_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `song_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
