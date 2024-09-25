
*start

;タイトルマスク

[cm]
[clearfix]
[start_keyconfig]

[mask graphic="now_loading.png" time=10]

[bg storage="keeth1.png" time=10]


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

f.chara = {
    
    "maria":
    {
        
        "怒り":"hamehura_Maria_cos1_do",
        "焦り":"hamehura_Maria_cos1_ase",
        "悲しみ":"hamehura_Maria_cos1_ai",
        "驚き":"hamehura_Maria_cos1_odo",
        "無表情":"hamehura_Maria_cos1_mu",
        "泣き":"hamehura_Maria_cos1_naki",
        "微笑み":"hamehura_Maria_cos1_def",
        "照れ":"hamehura_Maria_cos1_tere",
        
    },
    
    "keeth":{
        
        "無表情":"hamehura_Keith_cos1_mu",
        "悲しみ":"hamehura_Keith_cos1_ai",
        "微笑み":"hamehura_Keith_cos1_def",
        "怒り":"hamehura_Keith_cos1_do",
        "驚き":"hamehura_Keith_cos1_odo",
        "照れ":"hamehura_Keith_cos1_tere"
        
    },
    
    "kata":{
        
        "悪役顔":"hamehura_Catalina_cos1_aku",
        "怒り":"hamehura_Catalina_cos1_do",
        "悪役顔2":"hamehura_Catalina_cos1_aku2",
        "微笑み":"hamehura_DVDmob3_def",
        "驚き":"hamehura_Catalina_cos1_odo",
        "悲しみ":"hamehura_Catalina_cos1_ai",
        
    },
        

}

[endscript]

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
        
        tf.face = f.chara[mp.name][mp.face]
        
    [endscript]

    [chara_mod name="&mp.name" face="&tf.face"]

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
    f.right = 300;
    f.love = 0;
    
    if(sf.keeth_cg_1==undefined){
       sf.keeth_cg_1=false;
       sf.keeth_cg_2=false;
    }

        
[endscript]



[iscript]

f.charas = [

"data/fgimage/chara/keeth/hamehura_Keith_cos1_ai.png",
"data/fgimage/chara/keeth/hamehura_Keith_cos1_def.png",
"data/fgimage/chara/keeth/hamehura_Keith_cos1_do.png",
"data/fgimage/chara/keeth/hamehura_Keith_cos1_mu.png",
"data/fgimage/chara/keeth/hamehura_Keith_cos1_odo.png",
"data/fgimage/chara/keeth/hamehura_Keith_cos1_tere.png",

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
"data/fgimage/chara/maria/hamehura_Maria_cos1_naki.png",

"data/fgimage/chara/reijo1/hamehura_DVDmob1_fear.png",
"data/fgimage/chara/reijo2/hamehura_DVDmob2_fear.png",
"data/fgimage/chara/reijo3/hamehura_DVDmob3_do.png",


"data/fgimage/chara/keeth/hamehura_Keith_cos1_ai_b.png",
"data/fgimage/chara/keeth/hamehura_Keith_cos1_def_b.png",
"data/fgimage/chara/keeth/hamehura_Keith_cos1_do_b.png",
"data/fgimage/chara/keeth/hamehura_Keith_cos1_mu_b.png",
"data/fgimage/chara/keeth/hamehura_Keith_cos1_odo_b.png",


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
"data/fgimage/chara/maria/hamehura_Maria_cos1_naki_b.png",

"data/fgimage/chara/reijo1/hamehura_DVDmob1_fear_b.png",
"data/fgimage/chara/reijo2/hamehura_DVDmob2_fear_b.png",
"data/fgimage/chara/reijo3/hamehura_DVDmob3_do_b.png"
 
 ];


[endscript]

[preload storage="&f.charas"]


;キャラクター情報読み込み
[chara_new  name="keeth" color="0x6b7c9d" storage="chara/keeth/hamehura_Keith_cos1_ai.png" jname="キース" ]
[chara_new  name="kata"  color="0xff0981" storage="chara/kata/hamehura_Catalina_cos1_ai.png" jname="カタリナ" ]
[chara_new  name="maria" color="0xff0981" storage="chara/maria/hamehura_Maria_cos1_ai.png" jname="マリア" ]

[chara_new  name="reijo1" color="0x8b8f98" storage="chara/reijo1/hamehura_DVDmob1_def.png" jname="令嬢1" ]
[chara_new  name="reijo2" color="0x8b8f98" storage="chara/reijo2/hamehura_DVDmob2_def.png" jname="令嬢2" ]
[chara_new  name="reijo3" color="0x8b8f98" storage="chara/reijo3/hamehura_DVDmob3_def.png" jname="令嬢3" ]

;キャラクターの表情登録
;ジオルド
[chara_face name="keeth" face="hamehura_Keith_cos1_ai" storage="chara/keeth/hamehura_Keith_cos1_ai.png"]
[chara_face name="keeth" face="hamehura_Keith_cos1_def" storage="chara/keeth/hamehura_Keith_cos1_def.png"]
[chara_face name="keeth" face="hamehura_Keith_cos1_do" storage="chara/keeth/hamehura_Keith_cos1_do.png"]
[chara_face name="keeth" face="hamehura_Keith_cos1_mu" storage="chara/keeth/hamehura_Keith_cos1_mu.png"]
[chara_face name="keeth" face="hamehura_Keith_cos1_odo" storage="chara/keeth/hamehura_Keith_cos1_odo.png"]
[chara_face name="keeth" face="hamehura_Keith_cos1_tere" storage="chara/keeth/hamehura_Keith_cos1_tere.png"]


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
[chara_face name="maria" face="hamehura_Maria_cos1_naki" storage="chara/maria/hamehura_Maria_cos1_naki.png"]



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
[preload storage="data/bgimage/keeth1.png" ]
[preload storage="data/bgimage/keeth2.png" ]

[preload storage="data/bgimage/HF04_002.png" ]
[preload storage="data/bgimage/HF04_078.png" ]
[preload storage="data/bgimage/HF04_251.png" ]
[preload storage="data/bgimage/HF04_283.png" ]
[preload storage="data/bgimage/HF04_292.png" ]


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


[eval exp="sf.keeth_cg_1=true" ]

;[jump target="dev1"]

[v storage="1"]

#キース	
君、かわいいね。どこの家のコ？[p]
[playbgm  volume=15   storage="M30_FinalMix.ogg" ]

#マリア
え……あの……？[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]


#
目の前に現れた少年が[r]
突然そう言ったものだから[r]
マリアは一瞬、頭が真っ白になった。[p]

#
マリアは少年をまじまじと見て[r]
ハッと少年の正体に気づく。[p]

#
彼はキース・クラエス。[l][r]
公爵家の跡取で、第三王子ジオルドの婚約者である[r]
カタリナ・クラエス公爵令嬢の義弟だ。[p]

#
キースは余裕ぶった笑みで、マリアに顔を寄せる。[p]

[v storage="h2"]

#キース
ねえ、ちょっと僕と遊んでよ。[p]

#
キースはマリアのあごに触れて[r]
持ち上げようとするが――[p]

[free_layermode time=1000 ]

#マリア	
（どうしよう？）

[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="逃げる"  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="様子を見る" target="*select_01_02" ]

[s]

;逃げる
*select_01_01
[cm]

[bg storage="HF04_034_r.png" ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_do" wait=false]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_def" wait=true]

#マリア
け、結構です！[p]

[md name="maria" face="焦り"]

#
マリアは慌ててキースから半歩退がった。[p]

#マリア
（相手はクラエス公爵家御曹司。[r]
きっとからかってるんだわ……！）[p]

[celanim anim="yellow_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="yellow_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#キース	
へぇ、この僕に「結構です」？[p]

#
空ぶった掌を見ながら[r]
キースは愉快そうに片眉を上げた。[p]

[md name="keeth" face="無表情"]

#マリア
私、貴族でもなんでもない、ただの平民の女です。[p]

#マリア
とてもじゃありませんが[r]
キース様のお相手などつとまりませんので！[p]

[md name="maria" face="焦り"]

#
マリアは早口で言い訳を並べた。[p]

[md name="maria" face="悲しみ"]
[md name="keeth" face="無表情"]

#
実際、公爵家の不評を買うなど[r]
平民としては命がいくつあっても[r]
足りないほどの事態である。[p]

[md name="maria" face="焦り"]
[md name="keeth" face="微笑み"]

#マリア
あの、あの、私っ……[r]
授業がありますのでこれで失礼いたします……！[p]

#
マリアはキースへ一礼をすると[r]
きびすを返して走り出した。[p]

[jump target="*common_01"]

;;;;;;;;;;;様子を見る
*select_01_02
[cm]

[bg storage="HF04_034_r.png" ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=false]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_def" wait=true]


#マリア
（相手はクラエス公爵家御曹司……[r]
下手に拒絶したらどうなるか……）[p]

[md name="maria" face="焦り"]

#
公爵家の不評を買うなど[r]
平民としては命がいくつあっても[r]
足りないほどの事態である。[p]

#
何をされるのかわからないが……[r]
わからないからこそ、マリアはギュッと[r]
目を閉じて身を小さくした。[p]

[chara_hide_all]

[bg storage="black.png" time="100"]
	
#
――が、いつまで経っても何も起きず。[p]

#マリア
（あ、あれ……？）[p]

[bg storage="HF04_034_r.png" time=2000]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=false]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_ai" wait=true]

[md name="maria" face="悲しみ"]
[md name="keeth" face="悲しみ"]

#
おそるおそる目を開くと[r]
困ったように肩を竦めるキースがいた。[p]

[md name="maria" face="焦り"]


;[v storage="h2"]

#キース
そんなリアクションしないでよ。[r]
まるで僕が君をいじめてるみたいだ。[r]
レディには酷いことなんかしないよ。[p]

[md name="maria" face="驚き"]
[md name="keeth" face="微笑み"]

#キース
……それとも、実は期待してた？[p]

[md name="maria" face="焦り"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#マリア
～っ！[p]

#マリア
（この人、私をからかってるんだ！）[p]

[md name="maria" face="怒り"]

#マリア
あの！　私っ……[r]
授業がありますので、これで失礼いたします！[p]


#
マリアはキースから飛び退くと[r]
そのままきびすを返して走り出した。[p]

*common_01

[chara_hide name="maria"]

[md name="keeth" face="無表情"]

[v storage="h1"]

#キース
ふーん……。[p]

#
自分の誘いを断るなんて、[r]
とキースは片眉を上げた。[p]

#
キースは予想外の反応をした[r]
マリアの背を、獲物を見つけた[r]
猫のような眼差しで見ていた。[p]

#
それから数歩。[r]
キースはマリアが落としてしまった[r]
ハンカチを拾い上げる。[p]

[md name="keeth" face="微笑み"]

#キース
へえ。安っぽいけどいい趣味してるね。[p]

#
ハンカチに刺繍された「マリア」という[r]
名前を眺め、キースはニヤリと[r]
意地の悪い笑みを浮かべるのであった。[p]

*dev1

;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide name="keeth" time=10]
[chara_hide name="maria" time=10 ]

[wait time=2000 ]

[chara_show time=10 name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai"]

[bg storage="HF05_068_r.png" time=10] 

[mask_off time=2000 ]

[playbgm  volume=15   storage="M39_FinalMix.ogg" ]

#
マリアには悩みがあった。[r]
そして今、その悩みに直面している。[p]

[chara_show  name="kata" face="hamehura_Catalina_cos1_aku" top="&f.top" left="&f.right" ]


[v storage="19"]

#カタリナ
平民のくせに――。[p]

#
公爵令嬢カタリナと[r]
その取り巻きの令嬢が[r]
敵意の眼差しでマリアを囲んでいる。[p]

#
ああ、今日もか。[r]
マリアはうつむき、唇を噛んだ。[p]

[md name="kata" face="怒り"]

[v storage="22"]

#カタリナ
光の魔力を持ってるからって[r]
調子に乗ってるんじゃないわよ！[p]

#
彼女たちはマリアを目の敵にして[r]
ことあるごとに心ない言葉を[r]
マリアに浴びせていたのだ。[p]

#
相手はいずれも名高い家の令嬢たち。[r]
よもや平民のマリアがそれが不当な罵倒で[r]
あっても言い返すことなど許されなかった。[p]

#マリア
（大丈夫……）[p]

[chara_hide name="kata" pos_mode=false ]

[chara_show name="reijo1" top="&f.top" left="&f.right" face="hamehura_DVDmob1_do"]

#令嬢1

仕方なく相手をさせられてる[r]
生徒会の方々も、本当にお気の毒だわ！[p]

#マリア
（今日も、じっとしていれば……）[p]

[chara_hide name="reijo1"  pos_mode=false]
[chara_show name="reijo2" top="&f.top" left="&f.right" face="hamehura_DVDmob2_do" ]

#令嬢2
そうよ！[r]
どうせ学力テストだって[r]
魔力が特別だからひいきされたに決まってるわ！[p]

#マリア
（彼女たちも気が済んだら[r]
立ち去ってくれるはずだから……）[p]

#
だが――[r]
今日はいつにも増して不穏だった。[l][r]
令嬢たちの金切り声はエスカレートしていく。[p]


[chara_hide_all]

[playbgm volume=15 storage="M43_FinalMix.ogg" ]

#
ついには――[p]

[chara_show time=1000 name="maria" face="hamehura_Maria_cos1_ase" top="&f.top" left="&f.left" wait=false]
[chara_show time=1000 name="kata" face="hamehura_Catalina_cos1_aku2" top="&f.top" left="&f.right" wait=true]

;[md name="maria" face="焦り"]
;[md name="kata" face="悪役顔2"]

[v storage="32"]

#カタリナ
その被害者面が気に食わないのよ！[r]
あなた、この女に自分の立場を[r]
理解させておやりなさい。[p]

[chara_hide name="kata"  pos_mode=false]

[chara_show name="reijo3" top="&f.top" left="&f.right" face="hamehura_DVDmob3_def" ]

#
カタリナが取り巻きの令嬢に[r]
傲慢な態度で命令を下す。[p]

#
すると一人の令嬢が意地悪な笑みを[r]
浮かべながら掌を中空にかざした。[p]

#
ゆらり――[p]

彼女の手に灯るのは炎だ。[r]
攻撃的な火の魔法がマリアへと放たれる――！[p]

[mask time=100 color="red"]
[wait time=100]
[mask_off time=100]
[wait time=100]

[mask time=100 color="red"]
[wait time=100]
[mask_off time=1000]
[wait time=100]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#マリア
――っ！[p]

[chara_hide name="reijo3" wait=false wait=false]
[chara_hide name="maria"  wait=true wait=true]

[bg storage="black.png" time=100]	

#
マリアはぎゅっと目を閉じた。[p]

#
だが、痛みはやってこない。[p]

[bg storage="HF05_068_r.png"]

[chara_show time=10 name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_odo"]


#
おそるおそる目を開くと、[r]
マリアの目の前に[r]
大きな土の壁ができていた。[p]

[chara_show name="kata" face="hamehura_Catalina_cos1_odo" top="&f.top" left="&f.right" ]


[kanim_chara layer=0 name="kata" keyframe=quake time=300 count=1 easing=linear]
[v storage="42"]

#カタリナ
なっ……!?[p]

#
いや、壁ではない。[r]
土魔法による巨大な人形が[r]
盾となってマリアを護ったのだ。[p]

[chara_show name="kata" face="hamehura_Catalina_cos1_odo" top="&f.top" left="&f.right" ]

[md name="maria" face="焦り"]

@quake_camera

[playse storage="se/rock-crack1.ogg" ]

#
土人形が巨大な腕を振り上げる。[p]

#
あの腕をぶつけられたらどうなるか――[p]

[md name="kata" face="悲しみ"]

#カタリナ
ひっ……!![p]

[playse storage="se/dash-asphalt2.ogg" ]
[chara_hide name="kata"]


#
想像しなくてもわかることにカタリナたちは[r]
顔色を真っ青にして悲鳴を上げ、[r]
クモの子を散らすように我先と逃げていった……。[p]

[md name="maria" face="悲しみ"]


#マリア
あ、あの……。[p]

[md name="maria" face="焦り"]

#
マリアは助けてくれたらしい、土人形に話しかける。[r]
だが土人形は無言のまま、マリアを抱え上げた。[p]

[md name="maria" face="驚き"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

[chara_move name="maria" top=-180 effect="easeOutQuart" anim=true]

[playse storage="se/nadare.ogg" ]

#マリア
きゃあっ……!?[p]

#
驚くマリアだが土人形の腕は優しく[r]
敵意がないことを理解して、どこかへ[r]
歩き出す土人形に、ひとまず身を委ねるのであった。	[p]

[bg storage="HF04_292.png"]

[md name="maria" face="焦り"]

[playse storage="se/nadare.ogg" ]

#
土人形は中庭の片隅で立ち止まった。[r]
どろどろと元の土くれに戻りながら[r]
マリアを丁寧に下ろしてくれる。[p]


[playbgm volume=15 storage="M21_FinalMix.ogg" ]

[chara_move name="maria" top="&f.top" effect="easeOutQuart" anim=true]


#？？？
……ケガは――してないみたい、かな？[p]

#
そんな中、突然声をかけられ[r]
マリアはそちらへ振り返る。[p]

[md name="maria" face="驚き"]

[chara_move name="maria" left="&f.left" ]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_ai" ]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#マリア
キース様……!?[p]

[md name="keeth" face="無表情"]

[v storage="h3"]

#キース
……はぁ。[r]
拾ったハンカチを返そうと思ったら[r]
あんな場面に出くわすなんてね。[p]

#マリア
キース様が、助けてくださったのですか？[p]

[md name="maria" face="焦り"]
[md name="keeth" face="悲しみ"]

#キース
まあ……そうなるのかな？[r]
でも内緒にしてくれよ。[p]

#キース
ホラ、あれは僕の……一応は義姉だろ。[r]
僕が君を助けたっておおっぴらになると[r]
立場上、面倒なことになるからさ。[p]

[md name="maria" face="悲しみ"]


#
だから自分が出るのではなく[r]
土人形をけしかけたのだとキースは説明する。[p]

[md name="maria" face="無表情"]
[md name="keeth" face="驚き"]

#
……が、目の前のマリアが突然[r]
ぽろぽろと大粒の涙をこぼしはじめ[r]
キースは思わずうろたえた。[p]

[md name="maria" face="泣き"]

#マリア
あ――違うんです、ごめんなさい。[r]
お礼を言わなきゃ、いけない、のに……[p]

[md name="keeth" face="無表情"]

#
マリアは涙を止めようとするが[r]
次から次へとそれは込み上げる。[p]

[md name="keeth" face="悲しみ"]

[v storage="h5"]

#キース
マリア……。[p]

#
キースはマリアの震える肩を見て[r]
彼女が先ほど、どれほどの恐怖を[r]
感じていたのかを理解した。[p]

[md name="maria" face="悲しみ"]

#キース
（どれほどの不安と恐怖を……[r]
この子は、たった一人で……）[p]

[md name="maria" face="泣き"]

#キース
君も、たった一人で、我慢していたんだね……。[p]

#
自らの生い立ちにマリアを重ねると[r]
キースは彼女を放っておくことが[r]
どうしてもできなかった。[p]

#
キースはおずおずと手を伸ばし[r]
だけどしっかりとマリアの体を抱きしめた。[p]

[v storage="69"]

#キース
……よく耐えたね。怖かったろう。[r]
もう大丈夫だから。[p]

#
マリアの髪を撫でる手は、どこかぎこちない。[r]
けれど懸命に、キースはマリアを慰めようとしていた。[p]

#キース
だから、ほら……。[r]
もう泣きやみなよ。[p]

[md name="maria" face="悲しみ"]

#
遊び人で知られるキースが見せる[r]
どこか不慣れな雰囲気。[p]

#
けれどマリアは、心から自分を慰めようと[r]
してくれているキースの心優しさに胸を打たれる。[p]

[md name="keeth" face="微笑み" ]

#
その安心感からか気づけば涙も止まっている。[r]
マリアは指先で目元を拭いキースを見上げた。[p]

#マリア
（何か言わないと……）

[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text="ありがとうございます"  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="どうして助けてくれたんですか？" target="*select_02_02" ]

[s]

;ありがとうございます。
*select_02_01
[cm]

[md name="keeth" face="無表情"]

#マリア
……ありがとうございます、キース様。[r]
キース様が助けてくださらなかったら、今頃、私……。[p]

#マリア
本当に、何とお礼を申し上げたらいいのか……。[p]

#
マリアの声は、泣き止んだばかりで[r]
まだ少しだけ潤んでいるが、[r]
それでも一生懸命にキースへ感謝の気持ちを伝えた。[p]

#キース
ん……別に。[r]
女の子が酷い目に遭うのを[r]
黙って見てるのも気分悪いし……。[p]

[md name="maria" face="驚き"]


#
キースはふいっとマリアから離れそっぽを向いた。[p]


[celanim anim="yellow_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="yellow_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]

#
けれどその横顔は、照れ臭いのか[r]
少しだけ赤く染まっていた。[p]

[md name="keeth" face="微笑み"]

#キース
ま、ケガがなくてよかったんじゃない？[p]

[md name="maria" face="微笑み"]

#
そんな物言いだけれど、[r]
キースの言葉には安堵が含まれていて。[p]

#
不器用な優しさにマリアはほんのりと[r]
笑みを浮かべてしまうのだった。[p]


[jump target="*common_02"]

;(jump:合流)

;どうして助けてくれたんですか
*select_02_02
[cm]

[md name="maria" face="悲しみ"]
[md name="keeth" face="無表情"]

#マリア
あの……キース様。[r]
どうして私を[r]
助けてくださったのでしょうか？[p]

#
カタリナ公爵令嬢はキースの義理の姉。[r]
先のキースの行動は、明らかに[r]
カタリナに歯向かうものであった。[p]

#
いくら義弟といえど[r]
あの行動はキースの立場を考えれば[r]
良くはない選択だったろうに……。[p]

#キース
ん……別に。[r]
女の子が酷い目に遭うのを[r]
黙って見てるのも気分悪いし……。[p]

[md name="maria" face="驚き"]
[md name="keeth" face="怒り"]

#キース
……あれは僕の勝手だから。[r]
君がいちいち心配したり、[r]
変に気に病む必要なんて、ないよ。わかった？[p]

#
不器用な物言いだが、[r]
キースの言葉には、マリアに対する[r]
気遣いが含まれていた。[p]

[md name="maria" face="微笑み"]
[md name="keeth" face="無表情"]


#マリア
……ありがとうございます、キース様。[p]

[md name="keeth" face="微笑み"]

#キース
どーいたしまして。[p]

#
キースはふいっとマリアから離れそっぽを向いた。[r]
けれどその横顔は、照れ臭いのか[r]
少しだけ赤く染まっていた。[p]

*common_02

*dev2

;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide name="keeth" time=10]
[chara_hide name="maria" time=10 ]

[wait time=2000 ]

[bg storage="HF08_018_r.png" time=10] 

[mask_off time=2000 ]

[playbgm  volume=15   storage="M08_FinalMix.ogg" ]


#
もうすぐ卒業式だ。[r]
学園内は慌ただしい雰囲気が漂っていた。[p]

[chara_show time=10 name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu"]

#マリア
ふぅ……。[p]

#
マリアは最近、生徒会の仕事で[r]
忙しい日々を送っていた。[p]

#
今は休憩中だ。[r]
気分転換に廊下から庭園を眺める。[p]

[chara_hide name="maria"]

[v storage="83"]

#
……と、その時だ。[p]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_mu" ]

#キース
……。[p]

[chara_hide name="keeth"]

[chara_show  name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_odo"]

#マリア
キース様……？[p]

#
見えたのは、庭園の方へ[r]
ふらっと歩いていくキースの姿。[p]

[md name="maria" face="悲しみ"]

#マリア	
（そういえば最近は忙しくて……[r]
キース様とお話しできてなかったな）[p]

[md name="maria" face="無表情"]

#
久々に彼と会話をしたくて[r]
マリアは彼を追って庭園へ向かった。[p]

[bg storage="HF08_044.png"]

[md name="maria" face="照れ"]

#マリア	
（えへへ……[r]
ちょっとイタズラしちゃおうかな）[p]

#
こっそり彼の後ろに近づいて[r]
ワッ！　と驚かせてみようか。[r]
マリアはそんなことを考える。[p]

[md name="maria" face="微笑み"]

#
どうやらキースは花垣の[r]
向こう側にいるようだ。[p]

#
と、何やらボソボソと[r]
キースが喋っている声が聞こえてきた。[p]

[chara_hide name="maria"]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_mu" wait=true]

[v storage="93"]

#キース
僕と結婚してくれ。[p]

[md name="keeth" face="悲しみ"]

[v storage="94"]

#キース
……うーん、安直すぎるかなぁ。[p]

[v storage="95"]

[md name="keeth" face="無表情"]

#キース
僕と同じ墓に入ってくれ。[p]

[md name="keeth" face="悲しみ"]

[v storage="96"]

#キース
……重すぎ？　引かれそう……。[p]

[md name="keeth" face="微笑み"]

[v storage="97"]

#キース
君は僕の麗しき一番星……。[p]

[md name="keeth" face="悲しみ"]

[v storage="98"]

#キース
うわーキザすぎ。ないない。[p]

#
それは紛れもなくプロポーズの言葉。[r]
どうやらキースは[r]
告白の練習をしているようであった。[p]

[chara_hide name="keeth"]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" ]

#
思わぬ場面に遭遇してしまい[r]
マリアは後ずさろうとして……[p]

[md name="maria" face="驚き"]

[playse storage="se/kioru.ogg"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
（パキッ！）[p]

#
小さな枝を踏んでしまう。[p]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_do" wait=true]

[md name="maria" face="焦り"]
@quake_camera

[v storage="101"]

#キース
だ、誰かいるの!?[p]

#
キースが明らかに慌てた声を出して花垣をのぞきこむ。[l][r]
そして、そこにいるマリアの姿に[r]
さらに上ずった声を出した。[p]

[md name="keeth" face="驚き"]

[v storage="103"]

[playbgm  volume=15   storage="M09_FinalMix.ogg" ]

[kanim_chara layer=0 name="keeth" keyframe=quake time=300 count=1 easing=linear]

#キース
な、なっ!?　マリア!?[p]

[md name="keeth" face="照れ"]

#
キースの顔が真っ赤になる。[r]
彼のそんな顔を見るのは初めてだった。[p]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#マリア	
あ、あのっ、ごめんなさい！[r]
今見たことは忘れますからっ！[p]

#
マリアは早口でまくしたてた。[r]
だが――[p]

[md name="maria" face="悲しみ"]
[md name="keeth" face="無表情"]

#
チクリ。心に痛みを感じていた。[p]

#マリア
（キース様、想い人がいるんだ……）[p]

#
一瞬だけ、気まずい沈黙が流れる。[l][r]
マリアはうつむき、そそくさと[r]
その場から立ち去ろうとした。[p]

#
けれど。[p]

[md name="keeth" face="怒り"]

[v storage="111"]

#キース
待って。[p]

[md name="maria" face="驚き"]

@quake_camera

#
マリアの手をキースが掴む。[p]

[md name="maria" face="悲しみ"]

[v storage="113"]

#キース	
あ、あのさぁ……[r]
何かカンチガイしているみたいだから[r]
言っておくけど……。[p]

[v storage="114"]

[kanim_chara layer=0 name="keeth" keyframe=quake time=300 count=1 easing=linear]

#キース	
ああもう、やぶれかぶれだ。[r]
今のは全部、君のせいなんだからね！[p]

[md name="maria" face="驚き"]

#マリア
え……？[p]

[md name="keeth" face="無表情"]

#
マリアはポカンとしてキースの目を見る。[p]

#
キースは恥ずかしそうに顔を背けた。[l][r]
だがその耳は真っ赤で[r]
マリアの手を掴んだ手も熱い。[p]

[v storage="118"]

#キース	
……明日。明日ちゃんとやるから[r]
ここに来て責任とってよね。[r]
絶対だよ。拒否権なんて、あげないから。[p]

[chara_hide name="keeth"]

[md name="maria" face="焦り"]

#
それだけ言って[r]
キースはマリアの手を離すと[r]
足早に去っていった。[p]

#マリア	
……。[r]
え、私のせい、って……？[p]

#
残されたマリアは[r]
ワンテンポ遅れて状況を理解する。[p]

[md name="maria" face="驚き"]
[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#マリア
――～～っ!![p]

[md name="maria" face="照れ"]

#
ぼっ、とマリアの顔が真っ赤になった。[p]

*dev3

;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide name="keeth" time=10]
[chara_hide name="maria" time=10 ]

[wait time=2000 ]

[bg storage="HF08_044.png" time=10] 

[mask_off time=2000 ]

[playbgm  volume=15   storage="M11_FinalMix.ogg" ]

[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_tere" wait=false]
	
#
昨日のことを思い出すと[r]
マリアは顔に熱が灯るのを感じる。[p]

[md name="maria" face="無表情"]

#
キースとの約束どおり[r]
マリアは昨日と同じ場所にいた。[p]

#
これから何が起きるのか……[r]
さすがにわからないほど子供ではない。[p]

[md name="maria" face="悲しみ"]

#マリア	
（も、もっといいお洋服で[r]
来るべきだったかなぁ……）[p]

#
そわそわしながら待っていると[r]
一つの足音が近づいてくる。[p]

[playse storage="se/dash-asphalt2.ogg"]
[wse]

[chara_move name="maria" left="&f.left" ]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_mu" wait=true]

#
キースだった。[l][r]
彼もまた、マリアと同じく[r]
どこか気もそぞろな様子だ。[p]

[md name="keeth" face="悲しみ"]

[v storage="142"]

#キース	
あー……。実は昨日、言い忘れてたんだけど……。[r]
本当は薔薇園で待ち合わせね、って[r]
言うつもりだったんだけど、焦っちゃって。[p]

#
ちょっと言い訳のように、そう言ってから。[p]

[v storage="140"]

[md name="maria" face="驚き"]
[md name="keeth" face="無表情"]

#キース
行くよ。[p]

[kanim_chara layer=0 name="keeth" keyframe=quake time=300 count=1 easing=linear]

#
キースはマリアの手を引いて庭園の中を歩きだす。[p]

#
彼の手は昨日に増して熱く、しっとりと汗ばんでいた。[p]

[md name="maria" face="照れ"]

#マリア
（キース様、緊張してるんだ……）[p]

#
彼の緊張はマリアにも伝わってくる。[p]

[bg storage="HF01_026_rr.png"]

[playbgm  volume=15   storage="M10_FinalMix.ogg" ]

[md name="maria" face="無表情"]
[md name="keeth" face="無表情"]
	
#
二人は終始無言のまま、薔薇園にたどりついた。[p]

[v storage="134"]

#キース
……ふー。[p]


[md name="maria" face="焦り"]
[md name="keeth" face="怒り"]

#
キースは深呼吸をすると、マリアへと向き合った。[p]

#
緊張した、真剣な眼差し。[r]
昨日からキースが見せる顔は[r]
マリアにとっては初めて続きだ。[p]

#
だからこそ、
マリアもかつてないほどドキドキしてしまう。[p]

#
マリアは真っ直ぐにキースを見つめた。[r]
心の準備はできている、と視線で伝える。[p]

#
キースはそれを汲み取って、マリアへと語り始めた。[p]

[v storage="129"]

#キース	
僕がこんなことを言うのは[r]
ガラじゃないかもしれないけど……。[p]


[chara_hide_all]

[bg storage="keeth2.png"]
[eval exp="sf.keeth_cg_2=true" ]

[v storage="145"]

#キース	
僕は君が好きだ。[r]
一人の女性として、愛してるってこと。[r]
君を世界で一番幸せにしたいんだ。[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]


[v storage="146"]

#キース	
……僕は、君を貶めていた女の弟だ。[r]
君が何かを配慮する必要なんてない。[r]
率直な答えを聞かせてくれ。[p]

#
シンプルで、真っ直ぐな言葉だった。[l][r]
そしてマリアの心にも気を配った[r]
優しい思いが込められていた。[p]

#
ドキリ――マリアの心は揺れる。[p]

#マリア
……私なんかで、いいんですか？[p]

[v storage="150"]

#キース
君でないとダメなんだ、マリア。[p]

[v storage="151"]

#キース	
君がいると僕のカラッポの心が満たされる。[r]
君は僕自身を見てくれる。本当の僕と手を繋いでくれる。[r]
……それが、すごく幸せなんだ。[p]

[v storage="152"]

#キース
……こんな気持ちは初めてなんだ。[p]

#マリア
キース様……。[p]

#マリア
（どう答える？）

[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text="喜んでお受けします"  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="本当にいいんですか？" target="*select_03_02" ]

[s]

;喜んでお受けします
*select_03_01
[cm]

#
マリアは小さく息を整え[r]
そして、心からの笑みを浮かべてみせた。[p]

#マリア
喜んで。[r]
キース様、私も……あなたのことが、大好きです。[p]

[v storage="156"]


#キース
マリア……！[p]

@wait time=200

[love_up]

#
キースは安堵と感動と幸せが[r]
ないまぜになった笑みを浮かべると[r]
マリアをぎゅっと抱きしめた。[p]

[v storage="158"]

#キース
ありがとう、マリア。君を大切にする。[p]

#
言葉終わりに、キースはマリアの頬にそっと口付ける。[r]
それから、マリアへとウインクをしてみせた。[p]

[v storage="160"]

#キース
唇へのキスは、結婚式の時にとっておくよ。[p]

#
キースはマリアの唇に指先でツンと触れた。[p]

#マリア
（いつものキース様だ）[p]

#
照れつつも、マリアは大きな幸せに包まれていた。[p]

[jump target="*common_03"]


;本当にいいんですか？
*select_03_02
[cm]

#マリア
お気持ちは嬉しいです。[r]
でも……本当に、いいんですか？[p]

#
キースとマリアは身分が違う。[r]
特にキースは公爵家の御曹司。[p]

#
好きだから、という甘い理由だけで[r]
許されるような、幼い立場ではない。[p]

#
マリアはキースを想うからこそ、彼が心配だった。[p]


[v storage="h3"]

#キース
はぁ……。[r]
僕がそんなに、青二才に見える？[r]
ヘコむな～……。[p]

#マリア
あっ、いえ、そんなつもりは……！[p]

#キース
わかってるよ、うん――[r]
わかってる。君の気持ちは。[p]

#キース
でもさ……[r]
そうやって僕のことまで考えてくれる。[r]
だからこそ、僕は君を生涯のパートナーにしたいんだ。[p]

#マリア
キース様……。[p]

#キース
僕は覚悟を決めてるよ。……君は？[p]

#マリア
私は……。[p]

#
キースは両腕を広げてマリアを待つ。[l][r]
マリアは一呼吸分の間を置くと[r]
自ら彼の腕の中へ、その身を預けた。[p]

#
それを、彼の気持ちへの答えとする。[p]

[v storage="158"]

#キース
……ありがとう、マリア。君を大切にする。[p]

#
キースに優しく抱きしめられ、[r]
マリアは幸せな気持ちと共に頷いた。[p]

*common_03

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




