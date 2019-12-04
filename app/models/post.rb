class Post < ApplicationRecord
	belongs_to :admin_user
	has_many :post_images, dependent: :destroy
	accepts_attachments_for :post_images, attachment: :image
	has_many :post_comments, dependent: :destroy
	has_many :likes, dependent: :destroy
  has_many :liking_end_users, through: :likes, source: :end_user

	validates :title, presence: true

	enum prefectures: {
		"":0,北海道:101,青森県:102,岩手県:103,宮城県:1044,秋田県:105,山形県:106,福島県:107,
		茨城県:108,栃木県:109,群馬県:110,埼玉県:111,千葉県:112,東京都:113,神奈川県:114,新潟県:115,
		富山県:116,石川県:117,福井県:118,山梨県:119,長野県:120,岐阜県:121,静岡県:122,愛知県:123,
		三重県:124,滋賀県:125,京都府:126,大阪府:127,兵庫県:128,奈良県:129,和歌山県:130,鳥取県:131,
		島根県:132,岡山県:133,広島県:134,山口県:135,徳島県:136,香川県:137,愛媛県:138,高知県:139,
    	福岡県:140,佐賀県:141,長崎県:142,熊本県:143,大分県:144,宮崎県:145,鹿児島県:146,沖縄県:147
	}, _prefix: true

	enum country: {
		"":1000,"------アジア------":1001,インド:1002,インドネシア:1003,カンボジア:1004,シンガポール:1005,スリランカ:1006,
		タイ:1007,韓国:1008,中国:1009,ネパール:1010,パキスタン:1011,
		バングラデシュ:1012,東ティモール:1013,フィリピン:1014,ブータン:1015,ブルネイ:1016,ベトナム:1017,マレーシア:1018,
		ミャンマー:1019,モルディブ:1020,モンゴル:1021,ラオス:1022,北朝鮮:1023,台湾:1024,香港:1025,マカオ:1026,日本:1027,
		"------大洋州------":1028,オーストラリア:1029,キリバス:1030,クック諸島:1031,サモア:1032,ソロモン諸島:1033,ツバル:1034,
		トンガ:1035,ナウル:1036,ニウエ:1037,ニュージーランド:1038,バヌアツ:1039,パプアニューギニア:1040,パラオ:1041,
		フィジー:1042,マーシャル:1043,ミクロネシア:1044,"------北米------":1045,米国:1046,カナダ:1047,"------中南米------":1048,
		アルゼンチン:1049,アンティグアバーブーダ:1050,ウルグアイ:1051,エクアドル:1052,エルサルバドル:1053,ガイアナ:1054,
		キューバ:1055,グアテマラ:1056,グレナダ:1057,コスタリカ:1058,コロンビア:1059,ジャマイカ:1060,スリナム:1061,
		セントビンセントおよびグレナディーン諸島:1062,セントクリストファーネービス:1063,セントルシア:1064,
		チリ:1065,ドミニカ国:1066,ドミニカ共和国:1067,トリニダードトバゴ:1068,ニカラグア:1069,ハイチ:1070,パナマ:1071,
		バハマ:1072,パラグアイ:1073,バルバドス:1074,ブラジル:1075,ベネズエラ:1076,ベリーズ:1077,ペルー:1078,ボリビア:1079,
		ホンジュラス:1080,メキシコ:1081,"------欧州------":1082,アイスランド:1083,アイルランド:1084,アゼルバイジャン:1085,
		アルバニア:1086,アルメニア:1087,アンドラ:1088,イタリア:1089,ウクライナ:1090,ウズベキスタン:1091,英国:1092,
		エストニア:1093,オーストリア:1094,オランダ:1095,カザフスタン:1096,北マケドニア:1097,キプロス:1098,
		ギリシャ:1099,キルギス:1100,クロアチア:1101,コソボ:1102,サンマリノ:1103,ジョージア:1104,
		スイス:1105,スウェーデン:1106,スペイン:1107,スロバキア:1108,スロベニア:1109,セルビア:1110,
		タジキスタン:1111,チェコ:1112,デンマーク:1113,ドイツ:1114,トルクメニスタン:1115,ノルウェー:1116,
		バチカン:1117,ハンガリー:1118,フィンランド:1119,フランス:1120,ブルガリア:1121,ベラルーシ:1122,
		ベルギー:1123,ポーランド:1124,ボスニアヘルツェゴビナ:1125,ポルトガル:1126,マルタ:1127,モナコ:1128,
		モルドバ:1129,モンテネグロ:1130,ラトビア:1131,リヒテンシュタイン:1132,リトアニア:1133,ルーマニア:1134,
		ルクセンブルク:1135,ロシア:1136,"------中東------":1137,アフガニスタン:1138,アラブ首長国連邦:1139,
		イエメン:1140,イスラエル:1141,イラク:1142,イラン:1143,オマーン:1144,カタール:1145,クウェート:1146,
		サウジアラビア:1147,シリア:1148,トルコ:1149,バーレーン:1150,ヨルダン:1151,レバノン:1152,パレスチナ:1153,
		"------アフリカ------":1154,アルジェリア:1155,アンゴラ:1156,ウガンダ:1157,エジプト:1158,エスワティニ:1159,
		エチオピア:1160,エリトリア:1161,ガーナ:1162,カーボベルデ:1163,ガボン:1164,カメルーン:1165,ガンビア:1166,
		ギニア:1167,ギニアビサウ:1168,ケニア:1169,コートジボワール:1170,コモロ:1171,コンゴ共和国:1172,
		コンゴ民主共和国:1173,サントメプリンシペ:1174,ザンビア:1175,シエラレオネ:1176,ジブチ:1177,ジンバブエ:1178,
		スーダン:1179,セーシェル:1180,赤道ギニア:1181,セネガル:1182,ソマリア:1183,タンザニア:1184,チャド:1185,
		中央アフリカ:1186,チュニジア:1187,トーゴ:1188,ナイジェリア:1189,ナミビア:1190,ニジェール:1191,
		ブルキナファソ:1192,ブルンジ:1193,ベナン:1194,ボツワナ:1195,マダガスカル:1196,マラウイ:1197,マリ:1198,
		南アフリカ:1199,南スーダン:1200,モザンビーク:1201,モーリシャス:1202,モーリタニア:1203,モロッコ:1204,
		リビア:1205,リベリア:1206,ルワンダ:1207,レソト:1208
	}, _prefix: true


ransacker :country, formatter: proc { |v|
  sym = Post.countries[v]
  if sym.blank?
    -1
  else
    sym
  end
} do |parent|
  parent.table[:country]
end

ransacker :prefectures, formatter: proc { |v|
  sym = Post.prefectures[v]
  if sym.blank?
    -100
  else
    sym
  end
} do |parent|
  parent.table[:prefectures]
end

end
