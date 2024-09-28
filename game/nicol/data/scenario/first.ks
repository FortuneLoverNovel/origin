;一番最初に呼び出されるファイル
[layopt layer="message0" visible=false]

[title name="フォーチュンラバー"]
[stop_keyconfig]

;ティラノスクリプトが標準で用意している便利なライブラリ群
;コンフィグ、CG、回想モードを使う場合は必須
@call storage="tyrano.ks"

;ゲームで必ず必要な初期化処理はこのファイルに記述するのがオススメ


;テンプレを取得。
[plugin name="theme_kopanda_10"]

[plugin name="celanim" ]

;エフェクト先読み
[preload storage="data/image/celanim/green_rose_1.png"]
[preload storage="data/image/celanim/green_rose_2.png"]

[define_celanim anim="green_rose_1" storage="celanim/green_rose_1.png" cel_width="250" cel_height="250"]
[define_celanim anim="green_rose_2" storage="celanim/green_rose_2.png" cel_width="250" cel_height="250"]



;最初は右下のメニューボタンを非表示にする
[hidemenubutton]

;タイトル画面へ移動

;開発用
;@jump storage="title.ks"
;@jump storage="main/nicol.ks"


@jump storage="title.ks"


[s]


