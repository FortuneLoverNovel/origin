
;ティラノスクリプトサンプルゲーム

*start

;タイトルマスク

[cm]
[clearfix]
[start_keyconfig]

[mask graphic="now_loading.png" time=10]

;[preload storage="data/bgimage/001.png"]


;メニューボタンの表示
;@showmenubutton

;メッセージウィンドウの設定
[position layer=message0 width=960 height=280 top=510 left=180]
[position layer=message0 page=fore frame="frame.png" margint="30" marginl="100" marginr="70" marginb="60" ]
[image layer="message0" name="nameplate" storage="name_blue.png" folder="image" left=210 top=490 zindex="111" ]

[iscript]
$(".nameplate").hide();
[endscript]

;メッセージウィンドウの表示
[layopt layer=message0 visible=false]
[layopt layer="0" visible=true]
[layopt layer="1" visible=true]

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="0x8b8f98" size=26 bold="bold" x=240 y=500 width=200 align=center]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]
[chara_config talk_focus="brightness" ]
[chara_config time="10" ]

;このゲームで登場するキャラクターを宣言
;[preload storage="tyrano/images/system/nextpage.gif" ]


;ロールボタン配置
;セーブ
[button name="role_button" role="menu" graphic="btn_save.png"  x=0 y=0]

;バックログ
[button name="role_button" role="backlog" graphic="btn_log.png" x=1125 y=530]

;ボリュームボタン
[button name="btn_volume" role="none" fix=true graphic="btn_volume.png" x=1135 y=595]

[iscript]
    
    sf.btn_volume = true;
    
    $(".btn_volume").on("click",function(){
        
        if(sf.btn_volume==true){
            sf.btn_volume = false;
            $(".btn_volume").attr("src","./data/image/btn_volume_off.png");
            TG.ftag.startTag("stopse", {buf:"2",stop:"true"});
            TG.tmp.map_bgm["0"].muted = true;
        
        }else{
            sf.btn_volume = true;
            $(".btn_volume").attr("src","./data/image/btn_volume.png");
            TG.tmp.map_bgm["0"].muted = false;
        
        }
        
    });
    
    f.mixmode = false;
    
    if ('CSS' in window && 'supports' in window.CSS) {
        if (window.CSS.supports('mix-blend-mode', 'soft-light')) {
          f.mixmode = true;
        }
    }
    
    

[endscript]

[macro name="v" ]
    
    [if exp="sf.btn_volume==true"]
    
    [eval exp="mp.storage='vo/'+mp.storage+'.ogg'" ]
    
    [playse * buf=2 ]
    
    [endif]
    
[endmacro]

[macro name="quake_camera" ]

[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=2 easing=linear mode="none"]

[iscript]
$(".layer_camera").css({
    "animation-play-state":"",
    "animation-iteration-count":"",
    "animation-fill-mode":"",
    "animation-timing-function":"",
    "transform":""
});

[endscript]

[endmacro]

[macro name="love_up"]

[iscript]

$(".celanim").remove();

f.love++;
tf.love_file='love_'+f.love+'.png';
[endscript]

[free layer=0 name="love" time=100 ]
[image layer=0 name="love" storage="&tf.love_file" left=980 top=10 time=500] 

[endmacro]


[iscript]

    f.top = -120;
    f.left = -120;
    f.right = 300;
    f.love = 0;
    
    if(sf.gio_cg_1==undefined){
       sf.gio_cg_1=false;
       sf.gio_cg_2=false;
    }

        
[endscript]



[iscript]

f.charas = [

"data/fgimage/chara/gio/hamehura_Giord_cos1_ai.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_aku.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_def.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_do.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_doya.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_man.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_odo.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_tobo.png",

"data/fgimage/chara/kata/hamehura_Catalina_cos1_ai.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_aku.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_aku2.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_base.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_def.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_do.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_man.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_odo.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_tobo.png",

"data/fgimage/chara/maria/hamehura_Maria_cos1_ai.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_ase.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_cry.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_def.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_def2.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_do.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_mu.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_odo.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_tere.png",


"data/fgimage/chara/reijo1/hamehura_DVDmob1_fear.png",
"data/fgimage/chara/reijo2/hamehura_DVDmob2_fear.png",
"data/fgimage/chara/reijo3/hamehura_DVDmob3_do.png",


"data/fgimage/chara/gio/hamehura_Giord_cos1_ai_b.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_aku_b.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_def_b.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_do_b.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_doya_b.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_man_b.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_odo_b.png",
"data/fgimage/chara/gio/hamehura_Giord_cos1_tobo_b.png",

"data/fgimage/chara/kata/hamehura_Catalina_cos1_ai_b.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_aku_b.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_aku2_b.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_base_b.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_def_b.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_do_b.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_man_b.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_odo_b.png",
"data/fgimage/chara/kata/hamehura_Catalina_cos1_tobo_b.png",

"data/fgimage/chara/maria/hamehura_Maria_cos1_ai_b.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_ase_b.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_cry_b.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_def_b.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_def2_b.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_do_b.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_mu_b.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_odo_b.png",
"data/fgimage/chara/maria/hamehura_Maria_cos1_tere_b.png",


"data/fgimage/chara/reijo1/hamehura_DVDmob1_fear_b.png",
"data/fgimage/chara/reijo2/hamehura_DVDmob2_fear_b.png",
"data/fgimage/chara/reijo3/hamehura_DVDmob3_do_b.png"
 
 ];


[endscript]

[preload storage="&f.charas"]


;キャラクター情報読み込み
[chara_new  name="gio"   color="0x6b7c9d" storage="chara/gio/hamehura_Giord_cos1_ai.png" jname="ジオルド" ]
[chara_new  name="kata"  color="0xff0981" storage="chara/kata/hamehura_Catalina_cos1_ai.png" jname="カタリナ" ]
[chara_new  name="maria" color="0xff0981" storage="chara/maria/hamehura_Maria_cos1_ai.png" jname="マリア" ]

[chara_new  name="reijo1" color="0x8b8f98" storage="chara/reijo1/hamehura_DVDmob1_def.png" jname="令嬢1" ]
[chara_new  name="reijo2" color="0x8b8f98" storage="chara/reijo2/hamehura_DVDmob2_def.png" jname="令嬢2" ]
[chara_new  name="reijo3" color="0x8b8f98" storage="chara/reijo3/hamehura_DVDmob3_def.png" jname="令嬢3" ]

;キャラクターの表情登録
;ジオルド
[chara_face name="gio" face="hamehura_Giord_cos1_ai" storage="chara/gio/hamehura_Giord_cos1_ai.png"]
[chara_face name="gio" face="hamehura_Giord_cos1_aku" storage="chara/gio/hamehura_Giord_cos1_aku.png"]
[chara_face name="gio" face="hamehura_Giord_cos1_def" storage="chara/gio/hamehura_Giord_cos1_def.png"]
[chara_face name="gio" face="hamehura_Giord_cos1_do" storage="chara/gio/hamehura_Giord_cos1_do.png"]
[chara_face name="gio" face="hamehura_Giord_cos1_doya" storage="chara/gio/hamehura_Giord_cos1_doya.png"]
[chara_face name="gio" face="hamehura_Giord_cos1_man" storage="chara/gio/hamehura_Giord_cos1_man.png"]
[chara_face name="gio" face="hamehura_Giord_cos1_odo" storage="chara/gio/hamehura_Giord_cos1_odo.png"]
[chara_face name="gio" face="hamehura_Giord_cos1_tobo" storage="chara/gio/hamehura_Giord_cos1_tobo.png"]

;カタリナ
[chara_face name="kata" face="hamehura_Catalina_cos1_ai" storage="chara/kata/hamehura_Catalina_cos1_ai.png"]
[chara_face name="kata" face="hamehura_Catalina_cos1_aku" storage="chara/kata/hamehura_Catalina_cos1_aku.png"]
[chara_face name="kata" face="hamehura_Catalina_cos1_aku2" storage="chara/kata/hamehura_Catalina_cos1_aku2.png"]
[chara_face name="kata" face="hamehura_Catalina_cos1_base" storage="chara/kata/hamehura_Catalina_cos1_base.png"]
[chara_face name="kata" face="hamehura_Catalina_cos1_def" storage="chara/kata/hamehura_Catalina_cos1_def.png"]
[chara_face name="kata" face="hamehura_Catalina_cos1_def2" storage="chara/kata/hamehura_Catalina_cos1_def2.png"]
[chara_face name="kata" face="hamehura_Catalina_cos1_do" storage="chara/kata/hamehura_Catalina_cos1_do.png"]
[chara_face name="kata" face="hamehura_Catalina_cos1_man " storage="chara/kata/hamehura_Catalina_cos1_man.png"]
[chara_face name="kata" face="hamehura_Catalina_cos1_odo" storage="chara/kata/hamehura_Catalina_cos1_odo.png"]
[chara_face name="kata" face="hamehura_Catalina_cos1_tobo" storage="chara/kata/hamehura_Catalina_cos1_tobo.png"]

;マリア
[chara_face name="maria" face="hamehura_Maria_cos1_ai" storage="chara/maria/hamehura_Maria_cos1_ai.png"]
[chara_face name="maria" face="hamehura_Maria_cos1_ase" storage="chara/maria/hamehura_Maria_cos1_ase.png"]
[chara_face name="maria" face="hamehura_Maria_cos1_cry" storage="chara/maria/hamehura_Maria_cos1_cry.png"]
[chara_face name="maria" face="hamehura_Maria_cos1_def" storage="chara/maria/hamehura_Maria_cos1_def.png"]
[chara_face name="maria" face="hamehura_Maria_cos1_def2" storage="chara/maria/hamehura_Maria_cos1_def2.png"]
[chara_face name="maria" face="hamehura_Maria_cos1_do" storage="chara/maria/hamehura_Maria_cos1_do.png"]
[chara_face name="maria" face="hamehura_Maria_cos1_mu" storage="chara/maria/hamehura_Maria_cos1_mu.png"]
[chara_face name="maria" face="hamehura_Maria_cos1_odo" storage="chara/maria/hamehura_Maria_cos1_odo.png"]
[chara_face name="maria" face="hamehura_Maria_cos1_tere" storage="chara/maria/hamehura_Maria_cos1_tere.png"]


;令嬢たち
[chara_face name="reijo1" face="hamehura_DVDmob1_def" storage="chara/reijo1/hamehura_DVDmob1_def.png"]
[chara_face name="reijo1" face="hamehura_DVDmob1_do" storage="chara/reijo1/hamehura_DVDmob1_do.png"]
[chara_face name="reijo1" face="hamehura_DVDmob1_fear" storage="chara/reijo1/hamehura_DVDmob1_fear.png"]
[chara_face name="reijo1" face="hamehura_DVDmob1_mu" storage="chara/reijo1/hamehura_DVDmob1_mu.png"]


[chara_face name="reijo2" face="hamehura_DVDmob2_def" storage="chara/reijo2/hamehura_DVDmob2_def.png"]
[chara_face name="reijo2" face="hamehura_DVDmob2_do" storage="chara/reijo2/hamehura_DVDmob2_do.png"]
[chara_face name="reijo2" face="hamehura_DVDmob2_fear" storage="chara/reijo2/hamehura_DVDmob2_fear.png"]
[chara_face name="reijo2" face="hamehura_DVDmob2_mu" storage="chara/reijo2/hamehura_DVDmob2_mu.png"]


[chara_face name="reijo3" face="hamehura_DVDmob3_def" storage="chara/reijo3/hamehura_DVDmob3_def.png"]
[chara_face name="reijo3" face="hamehura_DVDmob3_do" storage="chara/reijo3/hamehura_DVDmob3_do.png"]
[chara_face name="reijo3" face="hamehura_DVDmob3_fear" storage="chara/reijo3/hamehura_DVDmob3_fear.png"]
[chara_face name="reijo3" face="hamehura_DVDmob3_mu" storage="chara/reijo3/hamehura_DVDmob3_mu.png"]


; 背景先読み
[preload storage="data/bgimage/hamehura_jiorudo1.png" ]
[preload storage="data/bgimage/hamehura_jiorudo2.png" ]

[preload storage="data/bgimage/HF04_002.png" ]
[preload storage="data/bgimage/HF04_078.png" ]
[preload storage="data/bgimage/HF04_251.png" ]
[preload storage="data/bgimage/HF04_283.png" ]
[preload storage="data/bgimage/HF04_292.png" ]


[bg storage="HF04_002.png"]

[layopt layer=message0 visible=true]

;Loveメーター
[image layer=0 name="love" storage="love_0.png" left=980 top=10 ] 



[mask_off time=500 ]


[keyframe name=rotate]
[frame p=0%  rotate=0deg]
[frame p=100% rotate=360deg]
[endkeyframe]

[keyframe name=quake]
[frame p=8%   x=0   y=-6]
[frame p=16%  x=-8  y=0]
[frame p=24%  x=2   y=8]
[frame p=32%  x=9   y=2]
[frame p=40%  x=1   y=-11]
[frame p=48%  x=-12 y=-2]
[frame p=56%  x=5   y=11]
[frame p=64%  x=13  y=-4]
[frame p=72%  x=2   y=-15]
[frame p=80%  x=-5  y=-12]
[frame p=88%  x=-8  y=-8]
[frame p=96%  x=17  y=9]
[frame p=100% x=0   y=-6]
[endkeyframe]



*common
;============== ゲームスタート ====================

[chara_show name="maria" top=&f.top face="hamehura_Maria_cos1_ase"]

;[jump target="dev5"]

#マリア	
ここ、どこかしら……。[p]
[playbgm  volume=30   storage="M08_FinalMix.ogg" ]

;再生[p]
;[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=true loop=false ]
;[free_layermode]



/*
#マリア
[celanim anim="red_rose_1" layer="1" x=260 y=-150 count=1 speed=0.5 wait=false ]
[anim name="celanim" top=100 time=2000]
[wa]
@wait time=100
[celanim anim="red_rose_2" layer="1" x=260 y=100 count=1 speed=0.5 wait=true]
*/

#
可憐な庭、薔薇の香り。[l][r]
美しい風景に反して[r]
少女は困惑の表情を浮かべていた。[p]

#
魔法学園に入学したばかりの少女――[l][r]
マリアはその好奇心から[r]
学園内を散策していたのだが……。[p]

#マリア
迷子になってしまうなんて……。[l][r]
どうしよう……。[p]

[bg storage="HF04_078.png"]

#
マリアは周囲を見渡した。[l][r]
すると、大きな木が目に留まる。[p]

#マリア:hamehura_Maria_cos1_def
そうだ、あの高い木に登れば[r]
今どこにいるのかわかるかも……。[p]

#
マリアはスカートのまま[r]
木に足をかけた。[p]
#
しかし。[l][r]
どうにか登れそうだ、と[r]
力を込めようとしたその時である。[p]

[v storage="h1"]
#？？？
――おや。[r]
そこで何を？[p]

#マリア:hamehura_Maria_cos1_odo
え？[p]

#マリア	
……あっ！[p]

#
マリアは木に登ろうとした姿勢のまま[r]
目を真ん丸にした。[l][r]
何故なら、そこにいたのは――。[p]

[chara_move name="maria" left="&f.left" face="hamehura_Maria_cos1_ase"]

#ジオルド
[chara_show name="gio" top="&f.top" left="&f.right" face="hamehura_Giord_cos1_doya"]


#マリア	
ジ……ジオルド様……!?[p]

[v storage="h2"]
#
ジオルド・スティアート。[l][r]
この国の第三王子その人である。[p]

#
マリアは慌てて姿勢を正し、[r]
深々とかしずいた。[p]

#マリア
申し訳ございません。[r]
はしたない姿を[r]
お見せしてしまって……！[p]

#ジオルド	
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]

[v storage="17"]
そんな服で木に登ろうと[r]
していたのですか？[r]
お転婆な方ですね。[p]

*dev4

#マリア	
そ、その……。[p]
なんて答えよう？

[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="正直に話す"  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="ごまかす" target="*select_01_02" ]

[s]

;正直に話す
*select_01_01
[cm]

#マリア
高い所から周りを見ようと……。[r]
道を確かめたくて……。[p]

#ジオルド	
[chara_mod  name="gio" face="hamehura_Giord_cos1_doya"]

#ジオルド	

なるほど。[l][r]
つまり迷子になっていた、と。[p]

#
笑顔のまま図星をつかれて[r]
マリアは「うう……」と[r]
言いよどむしかない。[p]

[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]
[v storage="h2"]

#ジオルド
[celanim anim="red_rose_1" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="red_rose_2" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]

[love_up]

#
そんなマリアの様子に[r]
ジオルドはくつくつと笑った。[p]

#
おかしそうに笑うその姿すら[r]
あまりにも優雅だ。[l][r]
だが、今のマリアにとっては……。[p]

[chara_mod  name="maria" face="hamehura_Maria_cos1_ai"]

#
王子に笑われてしまった――。[p]

#
恥ずかしさに、マリアは[r]
熱くなった顔を下に向ける。[p]

#

しかし。[r]
次に発せられたジオルドの声音は[r]
とても優しく紳士的なものだった。[p]

[jump target="*common_01"]

;ごまかす

*select_01_02
[cm]

[chara_mod  name="maria" face="hamehura_Maria_cos1_ase" ]

#マリア
（迷子になっていた、なんて[r]
正直に話しても笑われてしまう……）[p]

#マリア
そ、その、なんでもないんです。[l][r]
お気になさらないでください……！[p]

#ジオルド
なんでもない、なんて言われたら[r]
余計に気になってしまいますね。[p]

[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

#
ジオルドが小首を傾げる。[p]

[chara_mod  name="maria" face="hamehura_Maria_cos1_ai"]

#
そんな仕草すら優美だけれど[l][r]
マリアにとっては、王子に「滑稽な女」と思われた気がして[r]
真っ赤な顔を下に向けるしかない。[p]

[chara_mod  name="gio" face="hamehura_Giord_cos1_ai"]

#ジオルド
ああ、そんな顔をなさらないで。[l][r]
意地悪をするつもりはありません。[p]

#
ジオルドの声音はとても優しく[r]
紳士的なものだった。[p]

#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

#ジオルド
道に迷っておられたのですね？[p]

#マリア	
……はい……。[p]


*common_01


#ジオルド
[v storage="25"]
では、寮までお送りしましょう。[p]

#ジオルド
[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]

#
[v storage="h2"]
こちらへ、とジオルドは歩き出す。[l][r]
マリアは驚くが、第三王子の厚意を[r]
無下にすることなどできるはずもない。[p]

#マリア
あ、ありがとうございます……！[p]

#
優しい人なのかもしれない。[l][r]
マリアはそう思いながら[r]
ジオルドについていくのであった。[p]

*dev5

[fadeoutbgm time=2000]

;暗転
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide name="gio" time=10]
[chara_hide name="maria" time=10 ]

[wait time=2000 ]

[chara_show time=10 name="maria" top="&f.top" face="hamehura_Maria_cos1_def"]

[bg storage="HF04_251.png" time=10] 


[mask_off time=2000 ]


[playbgm  volume=30   storage="M24A_FinalMix.ogg" ]

#マリア
――なんてこともあったなぁ。[p]

#
ジオルドとの出会いを思い出し[r]
マリアは小さく笑った。[p]

#
あれからちゃんと学園の構内のことも覚え、[r]
あの時のように迷子になることは[r]
なくなった。[p]

#マリア
生徒会室へは[r]
こっちが近道なんだよね。[l][r]
……みんな、喜んでくれるかなぁ？[p]

#
マリアの手には、手作りマフィンが[r]
つめられたバスケット。[p]
みんなの喜ぶ顔を想像すると、[r]
マリアの足取りも軽かった。[p]

[fadeoutbgm time=1000]

#
――だが。[p]

[playbgm  volume=30   storage="M43_FinalMix.ogg"]

[chara_move name="maria" left="&f.left" ]
[chara_show name="kata" face="hamehura_Catalina_cos1_do" top="&f.top" left="&f.right" ]

#カタリナ
[v storage="36"]
マリアさん、どちらへ？[p]

#マリア
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase"]
あっ……。[p]

#
敵意と悪意のこもった声が[r]
マリアを呼び止める。[p]

#
気づけば、マリアは数人の令嬢に[r]
囲まれていた。[p]

#
彼女たちを率いているのは[r]
カタリナ・クラエス公爵令嬢。[l][r]
ジオルドの婚約者である。[p]

#
マリアが何か言おうとする前に[r]
カタリナはマリアへつかつかと[r]
近づくと、片手を振り上げて――[p]

[if exp="sf.btn_volume==true"]
[playse storage="se/punch-middle2.ogg" ]
[endif]

;[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=2 easing=linear]
@quake_camera

#
――バシン！[p]

#
バスケットを地面へと叩き落とした。[l][r]
甘い香りの菓子が[r]
地面に転がり出てしまう。[p]

#カタリナ
[chara_mod  name="kata" face="hamehura_Catalina_cos1_aku"]
[v storage="43"]

[kanim layer=0 name="kata" keyframe=quake time=300 count=1 easing=linear]

光の魔力を持っているというだけで[r]
チヤホヤされて[r]
いい気になってるんじゃないわよ！[p]

#
カタリナは眉を吊り上げて[r]
大声でまくしたてると、忌々しげに[r]
落ちたマフィンを睨みつけた。[p]

#カタリナ
[v storage="45"]

こんな平民が作った貧相なものを[r]
生徒会の方々に食べさせようなんて[r]
不相応にも程があるわ！[p]

#
カタリナが足を上げる。[r]
マフィンを踏み潰すつもりなのだ。[p]

#マリア
[kanim layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]
[font size="40"]
やめて―[p]
[resetfont]

#
マリアが手を伸ばそうとした[l][r]
その時だ。[p]

[chara_hide name="maria" wait=false ]
[chara_hide name="kata" wait=true ]	

[wait time=1000]

;[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=1 easing=linear]
@quake_camera


#？？？
[font size="40"]
やめなさい！[p]
[resetfont]

#ジオルド
[chara_show name="gio" top="&f.top" left="&f.left" face="hamehura_Giord_cos1_do" ]
[chara_show name="kata" face="hamehura_Catalina_cos1_do" top="&f.top" left="&f.right" ]
 
#カタリナ

[chara_mod  name="kata" face="hamehura_Catalina_cos1_odo" ]
[kanim layer=0 name="kata" keyframe=quake time=300 count=1 easing=linear]

[v storage="50"]
ジ……ジオルド様!?[p]

#ジオルド
[v storage="51"]

この僕の目の前で[r]
秩序を乱すような行為を[r]
見過ごすわけにはいきません。[p]

#カタリナ	
[chara_mod  name="kata" face="hamehura_Catalina_cos1_ai" ]
[v storage="52"]

くっ……！[r]
しかし、ジオルド様――[p]

#ジオルド	
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]

カタリナ。あなたはもっと[r]
賢い人間だと思っていたのですが……。[p]

よもやこの僕に[r]
二度も説明を要求するつもりですか？[l][r]
そうであれば、おもしろい冗談ですね。[p]

#カタリナ	
[chara_mod  name="kata" face="hamehura_Catalina_cos1_ai"]
[v storage="54"]
うぐぐぅっ……！[p]

#
ジオルドの冷徹な態度に[r]
さすがのカタリナも反論ができない。[p]

#
カタリナは真っ赤な顔で[r]
マリアを睨むと、取り巻きの令嬢と共に[r]
そそくさとその場を後にした。[p]

[fadeoutbgm]

[if exp="sf.btn_volume==true"]
[playse storage="se/dash-asphalt1.ogg" ]
[endif]

[chara_hide name="kata" time=2000 wait=true]
[stopse ]

[playbgm  volume=30   storage="M17_FinalMix.ogg" ]

#マリア
[chara_move name="gio" left="&f.right"]
[chara_show name="maria" top=&f.top left="&f.left" face="hamehura_Maria_cos1_ai"]
あ、あの、ジオルド様……。[p]

#
迷惑をかけてしまったことへの謝罪[l][r]
助けてくれたことへの感謝[l][r]
どちらを口にすべきか迷うマリア。[p]


#

一方でジオルドは、おもむろに[r]
落ちていたマフィンを拾い上げると[l][r]
なんのためらいもなく、それを一口ほおばった。[p]

[chara_hide_all ]

[bg storage="hamehura_jiorudo1.png" ]
[eval exp="sf.gio_cg_1=true" ]
#マリア
え――!?[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#ジオルド	
[v storage="61"]

うん。[r]
とってもおいしいですね。[p]

#
[v storage="h2"]
まるで一斉に花が咲くような。[l][r]
そんな優しい笑みを[r]
ジオルドはマリアへと向けていた。[p]

#
――ドキン、と。[l][r]
その時、マリアの心に熱が灯った……。[p]

[free_layermode time=1000 ]


;;;;;;;;;;;;;;
/*
[mask graphic="kokomade.png" folder="bgimage" effect="zoomInRight"]

[wait time="3000" ]
[bg storage="black.png" ]

[freeimage layer=0]
[freeimage layer=1]
@clearfix
[layopt layer=message0 visible=false]

[mask_off]
[fadeoutbgm time=3000]
[fadeinbgm time=1000 storage="M19_FinalMix.ogg" ]
[jump storage="title.ks"]
[s]
*/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




*dev2

[bg storage="black.png" time=3000]

#
一年の終わりが近づく。[p]

[bg storage="HF04_283.png" time=1000 ]

[chara_show name="maria" top="&f.top" left="&f.left" time=1000 face="hamehura_Maria_cos1_mu" ]

#
マリアは登った木の上から[r]
学園の風景を眺めていた。[p]

#マリア
この一年[r]
いろんなことがあったなぁ……。[p]

[chara_mod  name="maria" face="hamehura_Maria_cos1_def"]

#マリア
ジオルド様と出会ったのはここだっけ。[l][r]
彼にはいっぱいお世話になったなぁ…。[p]


#
そういえば[r]
いつも思い出にジオルドがいる。[p]

あの優しい笑顔を思い出すと[r]
マリアはつい顔が火照るのを感じた。[p]

[chara_hide name="maria"]

#？？？
[v storage="h3"]
……マリア。[p]

#
彼の声で名前を呼ばれたのはその時だ。[l][r]
木の下にジオルドがいる。[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" face="hamehura_Giord_cos1_def"]


#ジオルド

あなたはいつになっても[r]
蝶のように奔放ですね。[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#マリア
[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]
あ。[p]


#
[v storage="h2"]
くすくすとジオルドが笑う。[l][r]
からかわれたような心地に[r]
マリアは慌てて言い繕おうとした。[p]

#
だがマリアより先に[r]
ジオルドが笑顔のまま口を開く。[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]
[v storage="75"]

マリア、降りておいで。[p]

#

両手を広げるジオルド。[l][r]
受け止めてあげるから。[l][r]
そう言われ、マリアはうろたえた。[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]


#マリア
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase" ]
で、でも――[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#ジオルド	

大丈夫。[l][r]
[chara_mod  name="gio" face="hamehura_Giord_cos1_ai"]

……それとも、僕では不安ですか？[p]
[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#マリア
いえ、そんな……！[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

じゃあ、ほら。[p]

#

ジオルドはニコニコしたまま[r]
マリアを見上げている。[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#マリア
どうしよう？

;[glink  color="white"  size="20"  x="360"  width="400"  y="100"  text="跳ぶ"  target="*select_02_01"  ]
;[glink  color="white"  size="20"  x="360"  width="400"  y="170"  text="ためらう"  target="*select_02_02"  ]

[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text="跳ぶ"  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="ためらう" target="*select_02_02" ]


[s]

;;;;;;跳ぶ　
*select_02_01
[cm]

#
あの笑顔は拒否を許さぬものだと[r]
マリアは既に知っていた。[p]

#マリア
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase"]
っ……。[p]

#
ジオルドの眼差しを感じて[r]
マリアは火照る顔を[r]
ついそらしてしまう。[p]

#マリア
（ジオルド様が……[l][r]
私を、待ってる……）[p]

#
照れ臭さを堪えて意を決し、[r]
マリアはジオルドの方へと跳んだ。[p]

;白転
[chara_hide name="maria" time=100]
[chara_hide name="gio" time=100]
[bg storage="white.png" time=100] 

[wait time=1000 ]

#
――ふわり。[p]

[bg storage="HF04_292.png" time=1000] 

#
彼の両腕が優しくマリアを抱き留める。[p]

[chara_show name="maria" top="&f.top" left="&f.left" wait=false]
[chara_show name="gio" top="&f.top" left="&f.right" wait=true]

#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_man" ]	
[v storage="85"]
つかまえた。[p]

#ジオルド
[celanim anim="red_rose_1" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="red_rose_2" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]

[love_up]


[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]

#

ジオルドの囁きがマリアの耳を[r]
甘くくすぐり、温かく力強い男の腕が[r]
しっかりとマリアをとらえた。[p]

#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

……ふ。[l][r]
素直で……いい子ですね。[p]

#
ジオルドの指が、マリアの頬を[r]
褒めるように撫でる……。[p]

@jump target="common_02"

;;;;;;;;;;ためらう
*select_02_02

[cm]
#マリア
[chara_mod  name="maria" face="hamehura_Maria_cos1_ai"]

あ、危ないですよ？[r]
ジオルド様に何かあったら……。[p]

#
そんな風に言い訳をするものの、[r]
実際のところマリアは[r]
恥ずかしいだけなのだ。[p]

#
――ジオルドには、そんなことなど[r]
お見通しのようである。[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]
[v storage="h1"]

おや。[r]
僕がそんなに頼りなく見えますか？[l][r]
これはこれは……心外だ。[p]

#

わざとらしい仕草で[r]
ジオルドは溜息を吐いてみせる。[l][r]
もちろんその表情は、笑顔だった。[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#マリア
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase"]
（うう……ずるい……）[p]

#
こうなったら従う他にない。[l][r]
マリアはジオルドの方へと跳んだ。[p]


;白転
[chara_hide name="maria" time=100]
[chara_hide name="gio" time=100]
[bg storage="white.png" time=100] 

[wait time=1000 ]

#
――ふわり。[p]

[bg storage="HF04_292.png" time=1000] 
;[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=2 easing=linear]
@quake_camera

#
彼の両腕が優しくマリアを抱き留める。[p]

[chara_show name="maria" top="&f.top" left="&f.left" wait=false]
[chara_show name="gio" top="&f.top" left="&f.right" wait=true]

[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]

#ジオルド	
[v storage="85"]

つかまえた。[p]

#
ジオルドの囁きがマリアの耳を[r]
甘くくすぐり、温かく力強い男の腕が[r]
しっかりとマリアをとらえた。[p]

;;;;;;;;;

*common_02


#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_doya"]

[v storage="88"]

あなたに伝えたいことがあります。[r]
明日の夕方、聖堂へ。[p]

#
そう言い終わると[r]
ジオルドはマリアを解放した。[p]

#ジオルド
[v storage="90"]
待っていますよ。[p]

#
笑顔でそう言って[r]
ジオルドは外套をひるがえし、[r]
きびすを返した。[p]

*dev3
[chara_hide_all ]

[bg storage="black.png" time=1000] 
[wait time=1000 ]

[bg storage="HF04_251.png"]
[playbgm  volume=30   storage="M28_FinalMix.ogg" ]
	
#
ジオルドの言いつけどおり[r]
マリアは夕暮れの中を[r]
聖堂を目指して歩いていた。[p]

#
ひそ、ひそ……。[p]

#
マリアの耳に、[r]
令嬢たちの噂話が届く。[p]

[chara_show name="reijo1" top="&f.top" face="hamehura_DVDmob1_do"]
[chara_show name="reijo2" top="&f.top" face="hamehura_DVDmob2_do" ]
[chara_show name="reijo3" top="&f.top" face="hamehura_DVDmob3_do"]


#令嬢1
聞きまして？[l][r]
カタリナ様、国外追放になられたとか。[p]

#令嬢2:hamehura_DVDmob2_fear
まあ……。[l][r]
では、ジオルド様はどうなるの？[p]

#令嬢1
それが、平民に気があるとか……。[p]

#令嬢3
カタリナ様の追放も[r]
その平民女が仕組んだことでは……。[p]

#令嬢2
まさか、ジオルド様はその平民女に[r]
たぶらかされているのではなくて？[p]

#令嬢3:hamehura_DVDmob3_fear
おとなしそうな顔をして[r]
とんだ毒婦ですこと。[p]

#令嬢1
ジオルド様が心配ですわ……。[l][r]
あの女のせいでジオルド様の[r]
評価が落ちるようなことがあったら。[p]

#令嬢3:hamehura_DVDmob3_do
ふん、あんな女を選ぶなんて、私、[r]
ジオルド様には失望しましたわ！[p]

#令嬢2:hamehura_DVDmob2_do
次期国王の候補としての[r]
ご自覚が足らないのではなくて？[p]

まるで自ら破滅を[r]
お選びになっているみたいですもの。[p]

#令嬢3:hamehura_DVDmob3_fear
シッ、例の平民女よ……。[l][r]
変に近寄ると[r]
私たちにも何かあるかも……。[p]

[chara_hide_all]

#
ありもしない黒い噂。[l][r]

悪意のトゲがマリアの心を[r]
チクチクと刺す。[p]

[chara_show name="maria" top=&f.top face="hamehura_Maria_cos1_ai"]

#マリア
……っ。[p]

#
マリアはグッと唇を噛んで耐える。[p]

#
――悔しい。[p]

#
自分が貶されていることよりも[r]
大切な人が、自分のせいで[r]
悪く言われていること。[p]

#
それがマリアには悔しくて[r]
たまらなかった。[p]

同時に、ジオルドへ申し訳ない[r]
気持ちが湧いてくる。[p]

#
マリアは嫌な噂と嫌な気持ちを[r]
振り払うように[r]
足早にその場を通り過ぎた。[p]

[chara_hide name="maria" ]

[bg storage="black.png" ]


[bg storage="kyokai.png" ]
	
#
マリアが聖堂のドアを開けると[r]
すでにジオルドがそこにいた。[p]

[playbgm  volume=30   storage="M21_FinalMix.ogg"]

[chara_show name="gio" top="&f.top" left="&f.right" face="hamehura_Giord_cos1_doya"]


#
夕暮れの光が[r]
ステンドグラスから紅色に射し込み[r]
ジオルドを神秘的に照らしている。[p]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_def"]

#マリア
綺麗――。[p]

#
まるでこの世ならざる風景に[r]
マリアは、ほうっと溜息をついた。[p]

[chara_mod name="gio" face="hamehura_Giord_cos1_doya"]

#ジオルド
[v storage="119"]
マリア、こちらへ。[p]

[chara_mod name="maria" face="hamehura_Maria_cos1_mu"]

#
ジオルドが手招きをする。[r]
我に返ったマリアは、彼の隣に並んだ。[p]

#マリア
ジオルド様、話って――[p]

#ジオルド:hamehura_Giord_cos1_def
[v storage="122"]
……あなたのような人は初めてです。[p]

#マリア:hamehura_Maria_cos1_odo
え？[p]

#ジオルド
[v storage="124"]
あなたは何もかもが鮮烈で……。[r]
ずっと代わり映えのないものだと[r]
思っていた日々があなたと出会ってから色がついた。[p]

#ジオルド:hamehura_Giord_cos1_doya
[v storage="125"]
気づけば僕は、ずっとあなたを[r]
目で追っていた――欲しいと思った。[p]

#ジオルド:hamehura_Giord_cos1_def
[v storage="126"]
なのに手を伸ばせば蝶のようにするりと逃れていってしまう。[r]
かと思えば、子猫のように[r]
愛らしくこちらを見つめている……。[p]

#ジオルド
[v storage="127"]
みんな、自分から僕のものに[r]
なろうとするのにね？　ふふ。[p]

#ジオルド:hamehura_Giord_cos1_doya
[v storage="128"]
……だから今日こそ[r]
君にこう言いたいんです。[p]

#
ジオルドはマリアの手を取ると[r]
王子らしく、片膝をついてみせた。[p]

#ジオルド:hamehura_Giord_cos1_man
[v storage="130"]

マリア。[r]
僕だけのお姫様になってください。[p]

#マリア
ジオルド、様……。[p]

#
マリアは呆然と[r]
ジオルドの目を見つめる。[p]

#
それがプロポーズと理解できないほど[r]
マリアも鈍くはない。[p]

#
嬉しい。[p]

[chara_mod name="maria" face="hamehura_Maria_cos1_ase"]

#
……だけど。[p]

#
マリアが思い出すのは[r]
先程の黒い噂だ。[p]

#マリア:hamehura_Maria_cos1_ai
……私では、ジオルド様に[r]
ご迷惑をかけてしまいます。[p]

[chara_mod name="gio" face="hamehura_Giord_cos1_ai"]

#マリア
ジオルド様は[r]
次期国王候補なのですよね。[l][r]
その立場に泥を塗るような女なんて。[p]

#マリア
……みんなが言っています。[l][r]
私がジオルド様を[r]
破滅させてしまう、と。[p]

#ジオルド
[v storage="139"]

――ああ、やれやれ。[p]

#
うつむくマリアの言葉をさえぎるように[r]
ジオルドは困った笑みを浮かべた。[p]

#ジオルド
[v storage="141"]

また僕が[r]
つかまえに行かなきゃダメなのかな？[p]

[chara_mod name="gio" face="hamehura_Giord_cos1_ai"]

#
微笑む薔薇色の唇が、マリアの手の甲に[r]
柔らかくキスを落とす。[p]

[kanim layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
ビクリと、とマリアは肩をすくませた。[r]
立ち上がったジオルドが[r]
そんなマリアの瞳をのぞきこむ。[p]

#ジオルド:hamehura_Giord_cos1_doya
[v storage="144"]
僕はいずれ、この国の王になります。[r]
下々のくだらない噂に振り回されて、[r]
一国の主が務まるものですか。[p]

#ジオルド
[v storage="145"]
ただ凛とあればよいのです。[p]
あなたも、僕も。[l][r]
それが真実なのですから[r]
恥じるところなど一つもないでしょう？[p]

#ジオルド:hamehura_Giord_cos1_def
[v storage="146"]

……だからあなたも、諦めて？[p]

#

どんなあなたでも受け止める――[l][r]
そんな意志が宿った[r]
灯火のように優しい眼差しだった。[p]

#マリア
なんて答えよう？

;[glink  color="white"  size="20"  x="360"  width="400"  y="100"  text="本当に私でいいんですか？"  target="*select_03_01"  ]
;[glink  color="white"  size="20"  x="360"  width="400"  y="170"  text="喜んでお受けします"  target="*select_03_02"  ]

[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text="本当に私でいいんですか"  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="喜んでお受けします" target="*select_03_02" ]

[s]

*select_03_01
[eval exp="f.end=1"]

[cm]
#マリア:hamehura_Maria_cos1_ai
ジオルド様……。[l][r]
本当に、いいんですか？[p]

#
マリアは声を震わせた。[l][r]
なんて優しい人なんだろう。[p]

その喜びに涙が滲みそうになるのだ。[p]

#マリア
あなたに、私の全てを委ねても……[r]
いいんですか？[p]

#ジオルド:hamehura_Giord_cos1_man
[v storage="151"]
もちろんです、マリア。[p]



[chara_hide_all]
[bg storage="white.png" time=1000] 

[wait time=1000 ]

[bg storage="hamehura_jiorudo2.png" time=3000 ]
[eval exp="sf.gio_cg_2=true" ]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1000 mode=screen wait=false loop=false ]
[endif]

#
ジオルドが笑顔で両腕を広げる。[p]

マリアは自らの意志で[r]
彼の腕の中に身を預けた。[p]

#
[v storage="h2"]
これまでの中で、一番優しい抱擁。[p]

二人はステンドグラスの煌きの中[r]
互いの目を見つめ合った。[p]

#
ジオルドがゆっくりと顔を寄せる。[l][r]
マリアは受け入れるように目を閉じた。[p]

#
[v storage="h4"]

――温かな口付け。[p]

@jump target="common_03"

*select_03_02

[eval exp="f.end=2"]

[cm]

#マリア:hamehura_Maria_cos1_def2
ジオルド様――[l][r]
喜んで、お受けいたします。[p]

#
マリアは声を震わせた。[p]

彼の隣を歩むことを許されている。[l][r]
その喜びが、マリアの心をとろかせる。[p]

#ジオルド
[celanim anim="red_rose_1" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="red_rose_2" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]

[love_up]

#
ジオルドは幸福そうに[r]
そして満足気に、瞳を細めた。[p]

#ジオルド:hamehura_Giord_cos1_man
……いい子ですね。[p]

#
それはマリアにだけ聞こえるような[r]
小さな、そしてとびきり甘い囁き。[p]

[chara_hide_all]
[bg storage="white.png" time=1000] 

[bg storage="hamehura_jiorudo2.png" time=3000 ]
[eval exp="sf.gio_cg_2=true" ]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1000 mode=screen wait=false loop=false ]
[endif]

#
次の瞬間には、ジオルドは[r]
力強くマリアの体を抱き寄せた。[p]

#マリア
ジオルド様……！[p]

#
マリアは自らの意志で[r]
彼を精一杯、抱きしめ返す。[p]

#

これまでの中で、一番情熱的な抱擁。[l][r]
二人はステンドグラスの煌きの中[r]
互いの目を見つめ合った。[p]

#
ジオルドがゆっくりと顔を寄せる。[l][r]
マリアは受け入れるように目を閉じた。[p]

#
[v storage="h4"]
――溶けそうなほどの、熱い口付け。[p]
*common_03

#
顔を離せば[r]
ジオルドの笑みがそこにあった。[p]

#ジオルド
[v storage="157"]

……とりあえず、妙な噂を[r]
面白おかしく吹聴している輩が誰か[r]
教えてくれるかな？[p]

#
[v storage="h2"]

優しい笑みのまま、ジオルドは[r]
腹黒王子の一面をのぞかせる。[p]

#
――ああ、いつもどおりのジオルド様。[p]

[free_layermode time=1000 ]

#
マリアはつい[r]
くすりと笑んでしまうのであった。[p]
[layopt layer=message0 visible=false]
[freeimage layer=0]
[freeimage layer=1]
@clearfix

[if exp="f.love==3"]
[bg time=1000 storage="happy_end.png"]
[else]
[bg time=1000 storage="normal_end.png"]
[endif]

[wait time=8000]

;タイトルに戻る。

[layopt layer=message0 visible=false]
[fadeoutbgm time=3000]
[wait time=3000]
[fadeinbgm time=1000 storage="M19_FinalMix.ogg" ]
[jump storage="title.ks"]

[s]

