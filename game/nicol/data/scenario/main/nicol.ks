
*start

;タイトルマスク

[cm]
[clearfix]
[start_keyconfig]

[mask graphic="now_loading.png" time=10]

[bg storage="HF04_034_r.png" time=10]


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
[chara_config ptext="chara_name_area" pos_mode=false]
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



[macro name="md"]

    [iscript]
        
        tf.face = "chara/" + mp.face +".png";
        
    [endscript]

    [chara_mod name="&mp.name" storage="&tf.face"]

[endmacro]

[macro name="v" ]
    
    [if exp="sf.btn_volume==true"]
    
    [eval exp="mp.storage='vo/'+mp.storage+'.ogg'" ]
    
    [playse * buf=2 ]
    
    [endif]
    
[endmacro]

[macro name="kanim_chara" ]


[kanim layer=0 name="%name" keyframe=quake time=300 count=1 easing=linear]

[wait time=500]

[iscript]
$(".tyrano_chara").css({
    "animation-play-state":"",
    "animation-iteration-count":"",
    "animation-fill-mode":"",
    "animation-timing-function":"",
    "animation-name":"",
    "animation-duration":"",
    "transform":""
});
[endscript]

    
[endmacro]

[macro name="quake_camera" ]

[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=2 easing=linear mode="none"]

[iscript]
TYRANO.kag.tmp.num_anim = 0;
[endscript]

[wait time=500]

[iscript]
$(".layer_camera").css({
    "animation-play-state":"",
    "animation-iteration-count":"",
    "animation-fill-mode":"",
    "animation-timing-function":"",
    "animation-name":"",
    "animation-duration":"",
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
    f.right_s = 370; 
    
    f.right = 300;
    
    
    f.center = 110;
    f.love = 0;
    
    if(sf.nicol_cg_1==undefined){
       sf.nicol_cg_1=false;
       sf.nicol_cg_2=false;
    }

        
[endscript]



[iscript]

f.charas = [

"hamehura_Maria_cos1_ai_b.png",
"hamehura_Maria_cos1_ai.png",
"hamehura_Maria_cos1_ase_b.png",
"hamehura_Maria_cos1_ase.png",
"hamehura_Maria_cos1_def_b.png",
"hamehura_Maria_cos1_def.png",
"hamehura_Maria_cos1_def2_b.png",
"hamehura_Maria_cos1_def2.png",
"hamehura_Maria_cos1_do_b.png",
"hamehura_Maria_cos1_do.png",
"hamehura_Maria_cos1_kon_b.png",
"hamehura_Maria_cos1_kon.png",
"hamehura_Maria_cos1_mu_b.png",
"hamehura_Maria_cos1_mu.png",
"hamehura_Maria_cos1_naki_b.png",
"hamehura_Maria_cos1_naki.png",
"hamehura_Maria_cos1_odo_b.png",
"hamehura_Maria_cos1_odo.png",
"hamehura_Maria_cos1_tere_b.png",
"hamehura_Maria_cos1_tere.png",
"hamehura_Maria_cos1_akire_b.png",
"hamehura_Maria_cos1_akire.png",


"hamehura_Maria_cos5_ai_b.png",
"hamehura_Maria_cos5_ai.png",
"hamehura_Maria_cos5_akire_b.png",
"hamehura_Maria_cos5_akire.png",
"hamehura_Maria_cos5_ase_b.png",
"hamehura_Maria_cos5_ase.png",
"hamehura_Maria_cos5_def_b.png",
"hamehura_Maria_cos5_def.png",
"hamehura_Maria_cos5_def2_b.png",
"hamehura_Maria_cos5_def2.png",
"hamehura_Maria_cos5_do_b.png",
"hamehura_Maria_cos5_do.png",
"hamehura_Maria_cos5_kon_b.png",
"hamehura_Maria_cos5_kon.png",
"hamehura_Maria_cos5_mu_b.png",
"hamehura_Maria_cos5_mu.png",
"hamehura_Maria_cos5_naki_b.png",
"hamehura_Maria_cos5_naki.png",
"hamehura_Maria_cos5_odo_b.png",
"hamehura_Maria_cos5_odo.png",
"hamehura_Maria_cos5_tere_b.png",
"hamehura_Maria_cos5_tere.png",
"hamehura_Maria_cos5_tere2_b.png",
"hamehura_Maria_cos5_tere2.png",
"hamehura_Sophia_cos1_do_b.png",
"hamehura_Sophia_cos1_ai_b.png",
"hamehura_Sophia_cos1_ai.png",
"hamehura_Sophia_cos1_def_b.png",
"hamehura_Sophia_cos1_def.png",
"hamehura_Sophia_cos1_do.png",
"hamehura_Sophia_cos1_mu_b.png",
"hamehura_Sophia_cos1_mu.png",
"hamehura_Sophia_cos1_odo_b.png",
"hamehura_Sophia_cos1_odo.png",

"hamehura_Nicol_cos1_do_b.png",
"hamehura_Nicol_cos1_ai_b.png",
"hamehura_Nicol_cos1_ai.png",
"hamehura_Nicol_cos1_def_b.png",
"hamehura_Nicol_cos1_def.png",
"hamehura_Nicol_cos1_do.png",
"hamehura_Nicol_cos1_kon_b.png",
"hamehura_Nicol_cos1_kon.png",
"hamehura_Nicol_cos1_mu_b.png",
"hamehura_Nicol_cos1_mu.png",
"hamehura_Nicol_cos1_odo_b.png",
"hamehura_Nicol_cos1_odo.png",
"hamehura_Nicol_cos2_ai_b.png",
"hamehura_Nicol_cos2_ai.png",
"hamehura_Nicol_cos2_def_b.png",
"hamehura_Nicol_cos2_def.png",
"hamehura_Nicol_cos2_do_b.png",
"hamehura_Nicol_cos2_do.png",
"hamehura_Nicol_cos2_kon_b.png",
"hamehura_Nicol_cos2_kon.png",
"hamehura_Nicol_cos2_mu_b.png",
"hamehura_Nicol_cos2_mu.png",
"hamehura_Nicol_cos2_odo_b.png",
"hamehura_Nicol_cos2_odo.png",

"reijo1/hamehura_DVDmob1_fear.png",
"reijo2/hamehura_DVDmob2_fear.png",
"reijo3/hamehura_DVDmob3_def.png"
 
 ];


f.charas2 = [];

for(var key in f.charas){
	f.charas2.push("data/fgimage/chara/" +f.charas[key]) ;
}

[endscript]

[preload storage="&f.charas2"]


;キャラクター情報読み込み
[chara_new  name="nicol" color="0x6b7c9d" storage="chara/hamehura_Nicol_cos2_mu.png" jname="ニコル" ]
[chara_new  name="sophia" color="0xff0981" storage="chara/hamehura_Sophia_cos1_mu.png" jname="ソフィア" ]
[chara_new  name="maria" color="0xff0981" storage="chara/hamehura_Maria_cos1_mu.png" jname="マリア" ]

;令嬢
[chara_new  name="reijo1" color="0x8b8f98" storage="chara/reijo1/hamehura_DVDmob1_fear.png" jname="令嬢1" ]
[chara_new  name="reijo2" color="0x8b8f98" storage="chara/reijo2/hamehura_DVDmob2_fear.png" jname="令嬢2" ]
[chara_new  name="reijo3" color="0x8b8f98" storage="chara/reijo3/hamehura_DVDmob3_def.png" jname="令嬢3" ]

;キャラクターの表情登録


; 背景先読み
[preload storage="data/bgimage/nicol1.png" ]
[preload storage="data/bgimage/nicol2.png" ]

[preload storage="data/bgimage/HF04_002.png" ]
[preload storage="data/bgimage/HF04_016.png" ]
[preload storage="data/bgimage/HF04_034_r.png" ]
[preload storage="data/bgimage/HF04_066_071_073_084A.png" ]
[preload storage="data/bgimage/HF04_232.png" ]
[preload storage="data/bgimage/HF08_018_r.png" ]
[preload storage="data/bgimage/HF08_021_026.png" ]


[layopt layer=message0 visible=true]

;Loveメーター
[image layer=0 name="love" storage="love_0.png" left=980 top=10 ] 

[fadeoutbgm time=1000]


[mask_off time=2000 ]


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


;[jump target="dev2"]

[chara_show name="maria" top="&f.top" left="&f.center" storage="chara/hamehura_Maria_cos1_mu.png" wait=true]

#
平民の出のマリアが[r]
魔法学園の生徒会メンバーに任命されたのは、[r]
彼女の成績が優秀であるがゆえである。[p]

[md name="maria" face="hamehura_Maria_cos1_do"]


#マリア
（今日から私も生徒会の一員……[r]
しっかり頑張らないとっ……！）[p]

[chara_hide name="maria"]

#
緊張と使命感を胸に[r]
マリアは生徒会室への扉を開けた。[p]

[playbgm volume=30 storage="M03_FinalMix.ogg" ]
[bg storage="HF08_021_026.png" time=1000 ]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true]

[v storage="5" ]

#ニコル
――こんにちは。[r]
君が新メンバーのキャンベル嬢ですね？[p]

#
マリアを出迎えたのは[r]
生徒会副会長にして宰相である[r]
アスカルト伯爵の子息ニコル・アスカルトだった。[p]

#
上級生で、マリアにとって一歳年上の先輩である。[p]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_def.png" wait=true]


#マリア
ごきげんよう。[r]
マリア・キャンベルです。どうぞよろしくお願いします。[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]

#
マリアは深々とお辞儀をする。[p]

;[chara_hide name="nicol" pos_mode=false ]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#
……と、ニコルとは異なる視線を感じて[r]
顔を上げれば、彼の背に隠れて[r]
白い少女がマリアを見つめていた。[p]

[chara_show name="sophia" top="&f.top" left="620" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true zindex=0 ]


#マリア	
（綺麗な人……！）[p]

[md name="sophia" face="hamehura_Sophia_cos1_odo"]

#？？？	
っ！[p]

[chara_move name="sophia" top="&f.top" anim=true left="520" wait=true zindex=0 ]


#
少女と目が合った瞬間、[r]
彼女はニコルの後ろに完全に隠れてしまった。[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

#
ニコル・アスカルトだ。と名乗り、ニコルが苦笑する。[p]

[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="14" ]

#ニコル
こちらは妹のソフィアです。[r]
……少し人見知りで。どうかお気になさらず。[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#マリア
妹さんなのですね。[r]
ソフィア様、どうぞよろしくお願いいたします。[p]

[chara_hide name="maria" pos_mode=false ]
[md name="sophia" face="hamehura_Sophia_cos1_ai" ]

#
マリアは彼女へも挨拶をするが[r]
ソフィアはニコルの後ろから[r]
出てきてはくれなかった……。[p]


;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide_all time=100]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_def.png" wait=false time=10 ]
[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=10 ]

[wait time=2000 ]

[bg storage="HF04_034_r.png" time=10] 

[mask_off time=2000 ]

[playbgm   storage="M26_FinalMix.ogg" ]

;========================================


#マリア
ソフィア様、生徒会の皆さんに[r]
マフィンを作ってきたんです。いかがですか？[p]

[md name="sophia" face="hamehura_Sophia_cos1_ai"]

#ソフィア
……甘いもの、好きではないので。[p]

;=======================================

[mask graphic="black.png" time=1500 effect="slideInRight"]

[bg storage="black.png" time=10 ]

[md name="maria" face="hamehura_Maria_cos1_tere"]
[md name="sophia" face="hamehura_Sophia_cos1_mu"]

[bg storage="HF04_034_r.png" time=10] 

[mask_off time=1500 effect="slideOutLeft"]

;=======================================


#マリア
あ、あの……ソフィア様[r]
焼き菓子があるのですが……[r]
お砂糖は控えめに作ったので、よろしければどうぞ。[p]
[md name="sophia" face="hamehura_Sophia_cos1_ai"]

#ソフィア	
……虫歯になったら、嫌なので。[p]

;=======================================

[mask graphic="black.png" time=1500 effect="slideInRight"]

[bg storage="black.png" time=10 ]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="sophia" face="hamehura_Sophia_cos1_mu"]

[bg storage="HF04_002.png" time=10]

[mask_off time=1500 effect="slideOutLeft"]

;=======================================

	
#マリア
ソフィア様、庭園で綺麗な薔薇が咲いておりました。[r]
一緒に見にいきませんか？[p]

[md name="sophia" face="hamehura_Sophia_cos1_ai"]

#ソフィア
……日差しが、得意ではないので。[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#マリア
日傘なら、私が持ちます。[p]

[md name="sophia" face="hamehura_Sophia_cos1_mu"]

#ソフィア
…………じゃあ、ちょっとだけ。[p]
	
;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=1500 effect="slideInRight"]

[bg storage="black.png" time=10 ]

[chara_hide_all time=100]

[chara_show name="nicol" top="&f.top" left="&f.center" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true time=100]

[playbgm storage="M22B_FinalMix_Re.ogg"]

[bg storage="HF04_232.png" time=10]

[mask_off time=2000 ]

;=======================================


#
マリアとソフィアが[r]
庭園を歩いている姿を[r]
ニコルは生徒会室の窓から眺めていた。[p]

#ニコル
（不思議な人、だ……）[p]

[chara_hide_all time=1000]

[bg storage="HF04_002.png" ]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_def.png" wait=false time=1000 ]
[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=1000 ]
	
#
日傘を持って、ソフィアへ[r]
微笑みかけているマリアにニコルは目を細めた。[p]

#
ニコルの見た目や立場に惑わされて[r]
すり寄ってくることもなく。[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#
周囲とは異なった容姿のソフィアにも[r]
あんなにも明るく接して。[p]

[chara_hide name="maria" pos_mode=false  wait=false]
[chara_hide name="sophia" pos_mode=false wait=true ]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true]

#
ニコルは最近、ソフィアの変化を感じ取っていた。[r]
マリアがソフィアに、アプローチを始めてからだ。[p]

[chara_hide name="nicol" pos_mode=false wait=true ]

[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=10 ]


#
どうも、ソフィアはマリアに対し最初は[r]
「兄に近寄るため、自分に近づいた」[r]
と思っていたようだ。[p]

#
兄を取られたくない。[r]
兄に嫌な女を近づけさせたくない。[p]

[md name="sophia" face="hamehura_Sophia_cos1_def"]

#
ゆえにマリアへ素っ気ない態度をとっていた[r]
ソフィアであるが、それでもめげずに[r]
笑顔を向けるマリアへ少しずつ心を開き始めている。[p]

[chara_hide name="sophia" pos_mode=false wait=true ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_odo.png" wait=true]


#ニコル
（ソフィアが、笑みを……）[p]

#
マリアに対し、小さくではあるが[r]
ソフィアは笑顔を浮かべていた。[p]

#
妹のあんな顔を見たのはいつ以来か……。[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

[v storage="40" ]

#ニコル
本当に……不思議な人だ、あなたは。[p]

*dev1
;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide_all time=100]


[wait time=2000 ]

[bg storage="HF08_018_r.png" time=10] 

[mask_off time=2000 ]

[playbgm   storage="M26_FinalMix.ogg" ]

;========================================

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_odo.png" wait=false time=1000 ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true time=1000 ]

#
生徒会室へ向かう途中、マリアはニコルと鉢合わせた。[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#マリア
こんにちは、ニコル様[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]


#ニコル
こんにちは、キャンベル嬢。[r]
……行先は同じですから一緒に行きましょうか。[p]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#マリア
あ、はいっ！[p]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

#
魔法学園の敷地は広い。[r]
長い廊下を二人は歩く。[p]

#ニコル
先日もソフィアの相手をしていただいたようで。[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#マリア
いえいえ。[r]
ソフィア様とお友達になれて私も嬉しいです！[p]

[v storage="h2" ]

#ニコル
……そうですか。[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#マリア
（ニコル様、よっぽど[r]
ソフィア様のことが大切なんだろうなぁ……）[p]

#
マリアは微笑ましい気持ちになった。[p]

[chara_hide_all ]

#
……そんな時だった。[r]
ひそひそ、と物陰から噂話が聞こえてくる。[p]


[chara_show name="reijo1" top="&f.top" left="-160" storage="chara/reijo1/hamehura_DVDmob1_fear.png" wait=false]
[chara_show name="reijo2" top="&f.top" left="100" storage="chara/reijo2/hamehura_DVDmob2_fear.png" wait=false]
[chara_show name="reijo3" top="&f.top" left="340" storage="chara/reijo3/hamehura_DVDmob3_def.png" wait=true ]


#令嬢1
ニコル様は素晴らしい方なのに、あのような見た目の[r]
妹さんがいらっしゃって、お可哀そうだわ。[r]
きっと疎んでいらっしゃるはずよ。[p]

#令嬢2
もしかして、ソフィア嬢は[r]
宰相閣下の愛人の子だったりして……。[p]

#令嬢3
ソフィア嬢の顔『は』[r]
良くていらっしゃるから案外そうかもしれなくてよ？[r]
ふふふっ。[p]

[chara_hide_all ]


#令嬢たち
あははははははっ――[p]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_ai.png" wait=false time=1000 ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_do.png" wait=true time=1000 ]

[v storage="h4" ]

#ニコル
……。[p]

#
ニコルは少し眉根を寄せるが[r]
何かを言うことはなかった。[p]

#
マリアはそっとニコルの顔を[r]
窺い見ると、一度大きく息を吸って――[p]

一息に言葉を吐き出した。

[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="気にする必要などないと伝える"  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="ありのままのニコルを信じると伝える" target="*select_01_02" ]

[s]

*select_01_01
[cm]

[md name="maria" face="hamehura_Maria_cos1_def"]
	
[fadeinbgm storage="M10_FinalMix.ogg" time=2000]
	
#マリア
ニコル様には、あんなに素敵な妹さんが[r]
いらっしゃるから、きっと[r]
ヤキモチを焼かれているのですね。[p]

[md name="nicol" face="hamehura_Nicol_cos1_odo"]

#ニコル
……！[p]

[chara_hide_all]

[eval exp="sf.nicol_cg_1=true" ]
[bg storage="nicol1.png"]
	
#
ニコルは思わず立ち止まってマリアを見つめた。[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]


#
その真剣な眼差しに、まずいことを[r]
言ってしまっただろうかと不安になる。[p]

#
マリアは謝罪を口にしようとしたが[r]
それよりも先にニコルが口を開いた。[p]

[v storage="64" ]

#ニコル
……妹のことを、そのように[r]
言われたのは初めてですよ。[r]
ありがとうございます、キャンベル嬢。[p]

#
ふわり。[p]

#
花のような笑みを浮かべるニコル。[p]

#
その言葉は、普段は感情を見せないニコルが[r]
見せてくれた真っ直ぐな想いなのだとマリアは感じた。[p]

[jump target="common1"]

*select_01_02
[cm]

[fadeinbgm storage="M10_FinalMix.ogg" time=2000]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="nicol" face="hamehura_Nicol_cos1_do"]

[bg storage="HF08_018_r.png" time=10] 

#マリア
私は、ソフィア様のような妹さんがいるニコル様を[r]
とてもうらやましく思います。[p]

[md name="nicol" face="hamehura_Nicol_cos1_odo"]

#マリア
ニコル様が、ソフィア様をとても大切に[r]
していらっしゃるということも伝わってきます。[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

[kanim_chara layer=0 name="nicol" keyframe=quake time=300 count=1 easing=linear]

#マリア
だから私は、私自身が感じた[r]
ニコル様とソフィア様を心から信じています。[p]

[celanim anim="green_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="green_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#ニコル
……。[p]

[chara_hide_all]

[eval exp="sf.nicol_cg_1=true" ]
[bg storage="nicol1.png"]	

#
ニコルは思わず立ち止まってマリアを見つめた。[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
マリアは真っ直ぐに、ニコルの瞳を見つめ返す。[p]

#
自分の言葉、そして心に[r]
一切の偽りがないことを示すかのように。[p]

#ニコル
心から信じる、ですか。[p]

#
苦笑のように、でも綻ぶように[r]
ニコルは小さく笑ってみせた。[p]

#ニコル
……その言葉をこちらも信じましょう、『心から』[r]
ありがとうございます、キャンベル嬢。[p]

#
その言葉は、普段は感情を[r]
見せないニコルが見せてくれた[r]
安堵と感謝の優しい想いだった。[p]

*common1


[free_layermode time=1000 ]

	
[bg storage="HF08_018_r.png" time=10] 

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_tere.png" wait=false time=1000 ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_def.png" wait=true time=1000 ]


#マリア
お礼なんて……。[r]
私は、思ったことをそのまま口にしただけですから。[p]

#
謙遜しながらも[r]
ニコルが見せてくれた心からの笑みに[r]
マリアの心臓はドキドキと高鳴っていた。[p]

;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide_all time=100]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_ai.png" wait=false time=10 ]

[wait time=2000 ]

[bg storage="HF08_021_026.png" time=10] 

[mask_off time=2000 ]

[playbgm  volume=60 storage="M09_FinalMix.ogg" ]

;========================================


#
マリアは重い溜息を吐いた。[r]
もうすぐ魔法学園の卒業式。[r]
ニコルが卒業する日が、迫っていた。[p]

#マリア
永遠のお別れじゃないけれど……。[r]
ニコル様は貴族で、私は平民。[p]

#マリア
卒業したら、もうお会いすることも[r]
なくなるかもしれない。[p]

[md name="maria" face="hamehura_Maria_cos1_akire"]

#
生徒会室で雑務をこなしながら[r]
小さく独り言をこぼすと。[p]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true]


#ニコル	
どうかしましたか？[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
いつのまにか、傍にニコルがいた。[r]
マリアは弾かれたように顔を上げる。[p]

#マリア	
あっ、いえ、なんでもないです！[p]

[md name="nicol" face="hamehura_Nicol_cos1_do"]

[v storage="76" ]

#ニコル	
誤魔化さないで。[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]

#
どうやらニコルの方が一枚上手なようだ。[p]

[md name="maria" face="hamehura_Maria_cos1_ai"]

#
じっと彼に見つめられて[r]
マリアは自分の手元に視線を落とした。[p]

#マリア
もうすぐ卒業式なので……。[r]
ニコル様が卒業されてしまうと思うと[r]
寂しいな、と感じてしまって……。[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#マリア
……いけませんよね！[r]
おめでたいことなのに[r]
こんな、しんみりしちゃうなんて……。[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#
誤魔化さないでと言われたのに[r]
結局、マリアは強がるように[r]
笑みを浮かべてしまった。[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

[v storage="h1" ]

#ニコル	
よかった。[p]

#
ニコルがくすりと笑う。[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

[v storage="84" ]

#ニコル
……俺も同じ気持ちだったから。[p]

#マリア
え――。[p]

#
ニコルは目を細めて微笑んだまま[r]
テーブルの上のマリアの手に[r]
そっと自分の手を重ねた。[p]

[md name="nicol" face="hamehura_Nicol_cos1_ai"]

[v storage="87" ]

#ニコル
今までは、出会いも別れも興味なんてなかったのに。[r]
……キャンベル嬢と過ごす時間が減ってしまうのは、[r]
すごく寂しい。心からそう思う。[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

#ニコル
……ここまで家族以外の他人に[r]
興味を持ったのは、初めてだ。[p]

[md name="maria" face="hamehura_Maria_cos1_ai"]

#マリア
ニコル様……。[p]

[md name="nicol" face="hamehura_Nicol_cos1_ai"]

#ニコル
……ずっと、俺の中で――[p]

[v storage="91" ]

#ニコル
何も知らない他人から[r]
愛する家族をー妹のソフィアを[r]
俺の重荷だと、そう言われ続けることが、苦しかった。[p]

[v storage="92" ]

#ニコル
見た目と肩書だけで判断して[r]
中身を見ようともしない者たちが[r]
媚びてすり寄ってくるのがほとほと嫌だった。[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="93" ]

#ニコル
……あなたは、俺とソフィアの[r]
中身を見て、笑みを向けてくれる。[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

[v storage="94" ]

#ニコル
ソフィアがあんな風に笑顔を[r]
浮かべるようになったのは全てあなたのおかげだ。[p]

[v storage="95" ]

#ニコル
ありがとう、キャンベル嬢。[r]
あなたに心からの感謝を。[p]

#マリア	
（なんて答えよう？）

[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text="こちらこそ、ありがとうございます"  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="お礼を言われるようなことなんて……" target="*select_02_02" ]

[s]

*select_02_01
[cm]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#マリア
そんな――こちらこそです、ニコル様。[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#マリア
ニコル様もソフィア様も[r]
平民の私じゃなくて私自身を見てくださった。[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#マリア
こんなに楽しく学園生活を送れたのは[r]
ニコル様たちのおかげです！[p]

[v storage="99" ]

#ニコル
ふふ、本当に？[p]

[md name="maria" face="hamehura_Maria_cos1_kon"]

#マリア
あうう……。[r]
ほ、本当ですよ！[p]

#ニコル
うん、わかっている。[p]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="h3" ]

#ニコル
……ああ。[r]
久しく、心から笑うなんてことも忘れてたな。[p]

[celanim anim="green_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="green_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#ニコル
強くあらねば、しっかりせねば、と[r]
俺は気を張り続けていたのかもしれない。[p]


[md name="nicol" face="hamehura_Nicol_cos1_def"]


#ニコル
こんな風に思える日がくるなんて……。[p]

#
そう言ってマリアを見つめるニコルの眼差しは、[r]
温かくて眩しい日だまりを見るかのようであった。[p]

[jump target="common2"]

*select_02_02
[cm]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#マリア
いいえ、そんな[r]
お礼を言われるようなことなんて……。[p]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#
マリアとしては、ありのままに[r]
ニコルとソフィアへ接していただけ。[p]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#
だからこそ、ニコルからの[r]
素直な感謝が気恥ずかしいのだ。[p]

[v storage="h1" ]

#ニコル
……ふふ。君は照れ屋だね。[p]

#ニコル
でも、感謝ぐらいは素直に受け取ってほしいな。[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

#マリア
ご、ごめんなさい……。[p]

#ニコル
謝らなくていい。[p]

[md name="maria" face="hamehura_Maria_cos1_kon"]

#マリア
あうう……。[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

#ニコル
あはは――君はかわいいね。[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

[v storage="h3" ]

#ニコル
……ああ。[r]
誰かにこんな想いを向けるなんて。[r]
誰かに、こんなに心を許すなんて。[p]

#ニコル
……思っても、みなかったな……。[p]

#
そう言ってマリアを見つめるニコルの眼差しは[r]
どこまでも優しくて、[r]
まるで春の日だまりのようであった。[p]

*common2

[md name="maria" face="hamehura_Maria_cos1_odo"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="106" ]

#ニコル
キャンベル嬢。[r]
明日の卒業パーティーで伝えたいことがある。[r]
どうか、パーティーに出席してほしい。[p]

[chara_hide name="nicol" pos_mode=false ]

#
ニコルはそう耳打ちして[r]
「では」と一礼しきびすを返すのであった。[p]

*dev2

;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide_all time=100]

[wait time=2000 ]

[bg storage="HF04_016.png" time=10] 

[mask_off time=2000 ]

[playbgm   storage="M12_FinalMix.ogg" ]

;========================================

#
卒業パーティーは学園内でも[r]
その華やかさで知られている。[p]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_ai.png" wait=true]

#
――だからこそ、マリアは悩んでいた。[p]

#
平民の出であるマリアには[r]
中古の安いドレスを手直しして[r]
準備するのが精一杯。[p]

#
はたしてそんなドレスで[r]
ニコルの前に現れてもよいものか……。[p]

#マリア
（私だけじゃなくて、一緒にいるだけで[r]
ニコル様まで笑われてしまうかも……）[p]

[md name="maria" face="hamehura_Maria_cos1_akire"]


#
夜の女子寮で自室の鏡の前に立ち、[r]
マリアは溜息を吐いた。[p]

[fadeoutbgm time=2000]
[playse storage="se/door_wood_knock1.ogg" ]

#
と、その時。[r]
部屋のドアがノックされる。[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]


#マリア
はい？[p]

#
こんな時間に誰だろう、と[r]
マリアはドアを開けた。[p]

[playse storage="se/door-open1.ogg" ]

[fadeinbgm storage="M17_FinalMix.ogg" time=2000 ]

[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=1000 ]
[md name="maria" face="hamehura_Maria_cos1_odo"]
	
#ソフィア	
こんばんは、マリアさん。[p]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#マリア
ソフィア様!?　どうしてこちらへ？[p]

#ソフィア
マリアさんにお話ししたいことがあるのです。[r]
よろしいですか？[p]

[md name="maria" face="hamehura_Maria_cos1_ase"]


#マリア
ええ……どうぞ。[p]

#
マリアはソフィアを招き入れた。[r]
話を切り出したのはソフィアだ。[r]
真剣な目で、マリアを見つめる。[p]

#ソフィア
お兄様のことを、どうお思いですか？[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#マリア
え――。[p]

[md name="maria" face="hamehura_Maria_cos1_ai"]

#
いきなりの言葉に面食らうが[r]
マリアは眉尻を下げ、本心を吐露した。[p]

#マリア
……お別れしたくない、です。[p]

#マリア
ニコル様が遠くに行ってしまうと[r]
考えると、心がギュッとして……切ないです。[p]

#マリア
……できることなら[r]
ずっと、ニコル様のお傍にいたい……。[p]

#ソフィア	
その気持ちは本当ですか？[p]


[md name="maria" face="hamehura_Maria_cos1_do"]

#マリア
[font size=30]本当です！[resetfont]
[p]

[md name="sophia" face="hamehura_Sophia_cos1_def"]

#
思わず食い気味に答えてしまった。[r]
そんなマリアにソフィアはニコリと微笑む。[p]

#ソフィア	
そうおっしゃってくださると信じておりました。[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#マリア
え……？[p]

[md name="maria" face="hamehura_Maria_cos1_kon"]

#ソフィア
だって、バレバレでしたもの。[r]
お兄様とマリアさんが慕い合っていることなんて。[p]

#
ソフィアはくすくすと笑った。[r]
マリアは顔が熱くなるのを感じた。[p]

#ソフィア
……ふふ。[r]
もう少ししたら、マリアさんのことを[r]
『おねえさま』と呼ぶことになるのでしょうか。[p]

#マリア
ソフィア様、何をおっしゃって……。[p]

#ソフィア	
あらあら。[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]

#ソフィア
さて――そういうわけで。[r]
前祝となりますがマリアさんに贈り物がございます。[p]

#ソフィア	
後で、私の部屋にいらしてください。[p]


;=======================================

[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide_all time=100]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_mu.png" wait=true]

[wait time=2000 ]

[bg storage="HF04_034_r.png" time=10] 

[mask_off time=2000 ]

;========================================
	
#マリア
（……贈り物ってなんだろう？）[p]

#
緊張した面持ちで、[r]
マリアはソフィアの部屋の扉をノックした。[r]
すぐに中から返事がある。[p]

#ソフィア	
どうぞ、入ってください。[p]

[bg storage="HF04_066_071_073_084A.png"]

[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_def.png" wait=true time=1000 ]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#マリア
これって……。[p]

#
――そこにあったのは[r]
控えめでありながらも麗しいドレス。[p]

#
平民のマリアが悪目立ちしないよう[r]
気遣いの行き届いた逸品であった。[p]

#ソフィア	
どうぞこちらを、マリアさん。[p]

[md name="maria" face="hamehura_Maria_cos1_ase"]

#マリア
……いいんですか？[r]
こんな、素敵な……！[p]

#ソフィア	
ええ、もちろんです！[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#ソフィア	
……どうか、お兄様をよろしくお願いします。[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#マリア
[font size=30]
あ、ありがとうございます！[r]
ソフィア様！
[resetfont]
[p]



*dev3

;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide_all time=100]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos5_mu.png" wait=true]

[wait time=2000 ]

[bg storage="HF03_202.png" time=10] 

[mask_off time=2000 ]

[playbgm volume=60 storage="M02_FinalMix.ogg" ]

;========================================


#
マリアのドレスは[r]
他の令嬢も惚れ惚れするような[r]
優雅で気品のあるものだった。[p]

#
いつもマリアをいじめる令嬢ですら[r]
その美しさには押し黙る他ない。[p]

[md name="maria" face="hamehura_Maria_cos5_akire"]

#
しかし当のマリアはというと、このような[r]
華やかなドレスを着るなど生まれて初めてで、[r]
気恥ずかしさから壁の花となっていた。[p]

#
すると。[p]

[v storage="149"]

#？？？	
そのドレス、よく似合っている。[p]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos2_mu.png" wait=true]
[md name="maria" face="hamehura_Maria_cos5_odo"]

#
不意に傍で囁かれる甘い声。[r]
マリアが顔を上げると[r]
そこには華麗な礼装をまとったニコルが立っていた。[p]

[md name="nicol" face="hamehura_Nicol_cos2_def"]

[v storage="151"]

#ニコル
とても綺麗だ。[p]

[md name="maria" face="hamehura_Maria_cos5_kon"]

#マリア
ニ、ニコル様こそ……っ。[p]

#ニコル
おや、それはどうも。[p]

[md name="maria" face="hamehura_Maria_cos5_tere"]
[md name="nicol" face="hamehura_Nicol_cos2_mu"]

#
ニコルは笑みを一つ浮かべると[r]
「さて」とマリアの手を取った。[p]

[v storage="155"]

#ニコル
あちらで話をしようか。[p]

;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]

[md name="maria" face="hamehura_Maria_cos5_tere"]
[md name="nicol" face="hamehura_Nicol_cos2_mu"]

[wait time=2000 ]

[bg storage="HF01_145.png" time=10] 

[mask_off time=2000 ]

[playbgm   storage="M22B_FinalMix_Re.ogg" ]

;========================================


#
彼が手を引いて歩きだした先は[r]
満天の星空が広がる静かなバルコニーだった。[p]

[md name="maria" face="hamehura_Maria_cos5_tere2"]

#
パーティーの喧噪が遠くに聞こえる。[p]

[md name="maria" face="hamehura_Maria_cos5_odo"]

[v storage="158"]

#ニコル
――マリア。[p]

#
キャンベル嬢、ではなく[r]
ニコルが初めて、その名を口にした。[p]

#
マリアは驚きに包まれた。[r]
遠くの喧噪が聞こえなくなるほどに。[p]

#
そんなマリアを優しく見つめ[r]
ニコルは言葉を続けるのだ。[p]

[md name="nicol" face="hamehura_Nicol_cos2_tere"]

[v storage="162"]

#ニコル
君のことが好きだ。[r]
これからも、ずっとマリアと共に歩んでいきたい。[p]

[v storage="163"]

#ニコル
君となら、優しく温かな日々を[r]
ずっと紡いでいける気がするんだ。[r]
君を手放したくない。こんな気持ち……初めてなんだ。[p]

[chara_hide_all time=1000]


[eval exp="sf.nicol_cg_2=true" ]
[bg storage="nicol2.png"]

[v storage="164"]

#ニコル
だから……マリア。[r]
どうか俺の生涯のパートナーになってくれないか。[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
そう言って、ニコルはかしずくと[r]
マリアへと手を差し出した。[p]

#マリア
……！[p]

#
出会った頃のような敬語ではなく[r]
キャンベル嬢呼びでもない。[r]
それはニコルの本当の想いを込めた言葉。[p]

#
マリアは、こんなに大きくて[r]
そして温かな想いを向けられたのは[r]
生まれて初めてだった。[p]

#
衝撃に、さすがに[r]
狼狽の気持ちが込み上げるが――[p]

#マリア
（私は、ニコル様とお別れしたくない。[r]
これからもずっと一緒にいたい）[p]

#
ソフィアへ語った自分の気持ちを[r]
――恋心を思い出す。[p]

#
マリアは凛とした眼差しをニコルに向ける。[p]

#マリア	
（どうする？）

[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text="ニコルの手を取る"  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="手を取るのをためらう" target="*select_03_02" ]

[s]

*select_03_01
[cm]

	
#マリア
私は――[r]
ずっと、あなたに恋をしていました。[p]

#マリア
……どうか私をあなたのお傍に置いてください。[r]
ずっと、ずっと……。[p]

#
マリアはニコルの手を取った。[r]
するとニコルは春花のように微笑んで[r]
彼女の手の甲に恭しくキスをした。[p]

[v storage="175"]

#ニコル
あなたに永遠の愛を誓おう。[p]

#
マリアの手を握ってニコルが立ち上がる。[p]

#マリア
よろしくお願いします、ニコル様――。[p]

#
マリアはその手を[r]
心からの想いを込めて握り返した。[p]

#
優しい風が吹いて、花弁が二人を[r]
祝福するかのように舞い踊る――[p]

[celanim anim="green_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="green_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


[jump target="common3"]

*select_03_02
[cm]
	
#
本当に自分でいいのだろうか。[r]
この気持ちに、素直になってもいいのだろうか。[r]
そんな想いが、マリアの心に渦巻いた。[p]

#
だけど――[p]

#ニコル
大丈夫。[p]

#
ニコルが、マリアの手を取った。[r]
そのまま彼女の手の甲に恭しくキスをする。[p]

[v storage="175"]

#ニコル
あなたに永遠の愛を誓おう。[p]

#ニコル
あなたを護り抜いてみせる。[p]

#ニコル
どうか――僕を信じて。[p]

#
立ち上がるニコルが、マリアの体を[r]
優しく抱きしめた。[p]

#
ようやっと、マリアは言葉を絞り出す。[r]
心からの、素直な言葉を。[p]

#マリア
私も……[r]
愛しております、ニコル様……。[p]

#
満天の星空が二人を祝福するかのように[r]
きらきらと瞬いていた――。[p]

*common3

[free_layermode time=1000 ]

[chara_hide_all]

[layopt layer=message0 visible=false]
[freeimage layer=0]
[freeimage layer=1]
@clearfix

[if exp="f.love==3"]
[bg time=2000 storage="happy_end.png"]
[else]
[bg time=2000 storage="normal_end.png"]
[endif]

[wait time=8000]

;タイトルに戻る。

[layopt layer=message0 visible=false]
[fadeoutbgm time=3000]
[wait time=3000]
[fadeinbgm time=1000 storage="M19_FinalMix.ogg" ]
[jump storage="title.ks"]

[s]


;===============================================



