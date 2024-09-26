
[cm]

[preload storage="data/bgimage/title.png" ]
[preload storage="data/image/now_loading.png" ]

@clearstack
@bg storage ="title.png" time=100
@wait time = 200

*start 

[button x=500 y=450 width=400 graphic="title/btn_newgame.png" enterimg="title/btn_newgame_on.png" target="gamestart"]
[button x=500 y=520 width=400 graphic="title/btn_load.png" enterimg="title/btn_load_on.png" role="load" ]
[button x=500 y=590 width=400 graphic="title/btn_sp.png" enterimg="title/btn_sp_on.png" storage="main/special.ks" ]

[s]

*gamestart
;一番最初のシナリオファイルへジャンプする
[fadeoutbgm time=1000 ]
@jump storage="main/nicol.lang.ks"



