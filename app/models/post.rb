class Post < ApplicationRecord
	belongs_to :admin_user
	has_many :post_images, dependent: :destroy
	accepts_attachments_for :post_images, attachment: :image
	has_many :post_comments, dependent: :destroy
	#has_many :replies, class_name: PostComment, foreign_key: :reply_comment, dependent: :destroy
	has_many :favorites, dependent: :destroy
	#has_many :replies, foreign_key: :reply_post_comment, dependent: :destroy

	enum prefectures: {
		"":0,北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
		茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,新潟県:15,
		富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,岐阜県:21,静岡県:22,愛知県:23,
		三重県:24,滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,鳥取県:31,
		島根県:32,岡山県:33,広島県:34,山口県:35,徳島県:36,香川県:37,愛媛県:38,高知県:39,
    	福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
	}, _prefix: true

	enum country: {
		"---未選択---":0,"------アジア------":1,インド:2,インドネシア:3,カンボジア:4,シンガポール:5,スリランカ:6,
		タイ:7,韓国:8,中国:9,ネパール:10,パキスタン:11,
		バングラデシュ:12,東ティモール:13,フィリピン:14,ブータン:15,ブルネイ:16,ベトナム:17,マレーシア:18,
		ミャンマー:19,モルディブ:20,モンゴル:21,ラオス:22,北朝鮮:23,台湾:24,香港:25,マカオ:26,日本:27,
		"------大洋州------":28,オーストラリア:29,キリバス:30,クック諸島:31,サモア:32,ソロモン諸島:33,ツバル:34,
		トンガ:35,ナウル:36,ニウエ:37,ニュージーランド:38,バヌアツ:39,パプアニューギニア:40,パラオ:41,
		フィジー:42,マーシャル:43,ミクロネシア:44,"------北米------":45,米国:46,カナダ:47,"------中南米------":48,
		アルゼンチン:49,アンティグアバーブーダ:50,ウルグアイ:51,エクアドル:52,エルサルバドル:53,ガイアナ:54,
		キューバ:55,グアテマラ:56,グレナダ:57,コスタリカ:58,コロンビア:59,ジャマイカ:60,スリナム:61,
		セントビンセントおよびグレナディーン諸島:62,セントクリストファーネービス:63,セントルシア:64,
		チリ:65,ドミニカ国:66,ドミニカ共和国:67,トリニダードトバゴ:68,ニカラグア:69,ハイチ:70,パナマ:71,
		バハマ:72,パラグアイ:73,バルバドス:74,ブラジル:75,ベネズエラ:76,ベリーズ:77,ペルー:78,ボリビア:79,
		ホンジュラス:80,メキシコ:81,"------欧州------":82,アイスランド:83,アイルランド:84,アゼルバイジャン:85,
		アルバニア:86,アルメニア:87,アンドラ:88,イタリア:89,ウクライナ:90,ウズベキスタン:91,英国:92,
		エストニア:93,オーストリア:94,オランダ:95,カザフスタン:96,北マケドニア:97,キプロス:98,
		ギリシャ:99,キルギス:100,クロアチア:101,コソボ:102,サンマリノ:103,ジョージア:104,
		スイス:105,スウェーデン:106,スペイン:107,スロバキア:108,スロベニア:109,セルビア:110,
		タジキスタン:111,チェコ:112,デンマーク:113,ドイツ:114,トルクメニスタン:115,ノルウェー:116,
		バチカン:117,ハンガリー:118,フィンランド:119,フランス:120,ブルガリア:121,ベラルーシ:122,
		ベルギー:123,ポーランド:124,ボスニアヘルツェゴビナ:125,ポルトガル:126,マルタ:127,モナコ:128,
		モルドバ:129,モンテネグロ:130,ラトビア:131,リヒテンシュタイン:132,リトアニア:133,ルーマニア:134,
		ルクセンブルク:135,ロシア:136,"------中東------":137,アフガニスタン:138,アラブ首長国連邦:139,
		イエメン:140,イスラエル:141,イラク:142,イラン:143,オマーン:144,カタール:145,クウェート:146,
		サウジアラビア:147,シリア:148,トルコ:149,バーレーン:150,ヨルダン:151,レバノン:152,パレスチナ:153,
		"------アフリカ------":154,アルジェリア:155,アンゴラ:156,ウガンダ:157,エジプト:158,エスワティニ:159,
		エチオピア:160,エリトリア:161,ガーナ:162,カーボベルデ:163,ガボン:164,カメルーン:165,ガンビア:166,
		ギニア:167,ギニアビサウ:168,ケニア:169,コートジボワール:170,コモロ:171,コンゴ共和国:172,
		コンゴ民主共和国:173,サントメプリンシペ:174,ザンビア:175,シエラレオネ:176,ジブチ:177,ジンバブエ:178,
		スーダン:179,セーシェル:180,赤道ギニア:181,セネガル:182,ソマリア:183,タンザニア:184,チャド:185,
		中央アフリカ:186,チュニジア:187,トーゴ:188,ナイジェリア:189,ナミビア:190,ニジェール:191,
		ブルキナファソ:192,ブルンジ:193,ベナン:194,ボツワナ:195,マダガスカル:196,マラウイ:197,マリ:198,
		南アフリカ:199,南スーダン:200,モザンビーク:201,モーリシャス:202,モーリタニア:203,モロッコ:204,
		リビア:205,リベリア:206,ルワンダ:207,レソト:208
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
    -1
  else
    sym
  end
} do |parent|
  parent.table[:prefectures]
end

	  def favorited_by?(end_user)
	  	unless end_user.blank?
	  	  favorites.where(end_user_id: end_user.id).exists?
	    end
	  end
end
