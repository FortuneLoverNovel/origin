
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

#	
[p]
[playbgm  volume=15   storage="M30_FinalMix.ogg" ]

#
[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]


#
[r]
[r]
[p]

#
[r]
[p]

#
[l][r]
[r]
[p]

#
[p]

[v storage="h2"]

#
[p]

#
[r]
[p]

[free_layermode time=1000 ]

#	


[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text=""  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="" target="*select_01_02" ]

[s]

;逃げる
*select_01_01
[cm]

[bg storage="HF04_034_r.png" ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_do" wait=false]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_def" wait=true]

#
[p]

[md name="maria" face="焦り"]

#
[p]

#
[r]
[p]

[celanim anim="yellow_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="yellow_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#	
[p]

#
[r]
[p]

[md name="keeth" face="無表情"]

#
[p]

#
[r]
[p]

[md name="maria" face="焦り"]

#
[p]

[md name="maria" face="悲しみ"]
[md name="keeth" face="無表情"]

#
[r]
[r]
[p]

[md name="maria" face="焦り"]
[md name="keeth" face="微笑み"]

#
[r]
[p]

#
[r]
[p]

[jump target="*common_01"]

;;;;;;;;;;;様子を見る
*select_01_02
[cm]

[bg storage="HF04_034_r.png" ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=false]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_def" wait=true]


#
[r]
[p]

[md name="maria" face="焦り"]

#
[r]
[r]
[p]

#
[r]
[r]
[p]

[chara_hide_all]

[bg storage="black.png" time="100"]
	
#
[p]

#
[p]

[bg storage="HF04_034_r.png" time=2000]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=false]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_ai" wait=true]

[md name="maria" face="悲しみ"]
[md name="keeth" face="悲しみ"]

#
[r]
[p]

[md name="maria" face="焦り"]


;[v storage="h2"]

#
[r]
[r]
[p]

[md name="maria" face="驚き"]
[md name="keeth" face="微笑み"]

#
[p]

[md name="maria" face="焦り"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
[p]

#
[p]

[md name="maria" face="怒り"]

#
[r]
[p]


#
[r]
[p]

*common_01

[chara_hide name="maria"]

[md name="keeth" face="無表情"]

[v storage="h1"]

#
[p]

#
[r]
[p]

#
[r]
[r]
[p]

#
[r]
[r]
[p]

[md name="keeth" face="微笑み"]

#
[p]

#
[r]
[r]
[p]

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
[r]
[p]

[chara_show  name="kata" face="hamehura_Catalina_cos1_aku" top="&f.top" left="&f.right" ]


[v storage="19"]

#
[p]

#
[r]
[r]
[p]

#
[r]
[p]

[md name="kata" face="怒り"]

[v storage="22"]

#
[r]
[p]

#
[r]
[r]
[p]

#
[r]
[r]
[p]

#
[p]

[chara_hide name="kata" pos_mode=false ]

[chara_show name="reijo1" top="&f.top" left="&f.right" face="hamehura_DVDmob1_do"]

#

[r]
[p]

#
[p]

[chara_hide name="reijo1"  pos_mode=false]
[chara_show name="reijo2" top="&f.top" left="&f.right" face="hamehura_DVDmob2_do" ]

#
[r]
[r]
[p]

#
[r]
[p]

#
[r]
[l][r]
[p]


[chara_hide_all]

[playbgm volume=15 storage="M43_FinalMix.ogg" ]

#
[p]

[chara_show time=1000 name="maria" face="hamehura_Maria_cos1_ase" top="&f.top" left="&f.left" wait=false]
[chara_show time=1000 name="kata" face="hamehura_Catalina_cos1_aku2" top="&f.top" left="&f.right" wait=true]

;[md name="maria" face="焦り"]
;[md name="kata" face="悪役顔2"]

[v storage="32"]

#
[r]
[r]
[p]

[chara_hide name="kata"  pos_mode=false]

[chara_show name="reijo3" top="&f.top" left="&f.right" face="hamehura_DVDmob3_def" ]

#
[r]
[p]

#
[r]
[p]

#
[p]

[r]
[p]

[mask time=100 color="red"]
[wait time=100]
[mask_off time=100]
[wait time=100]

[mask time=100 color="red"]
[wait time=100]
[mask_off time=1000]
[wait time=100]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
[p]

[chara_hide name="reijo3" wait=false wait=false]
[chara_hide name="maria"  wait=true wait=true]

[bg storage="black.png" time=100]	

#
[p]

#
[p]

[bg storage="HF05_068_r.png"]

[chara_show time=10 name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_odo"]


#
[r]
[r]
[p]

[chara_show name="kata" face="hamehura_Catalina_cos1_odo" top="&f.top" left="&f.right" ]


[kanim_chara layer=0 name="kata" keyframe=quake time=300 count=1 easing=linear]
[v storage="42"]

#
[p]

#
[r]
[r]
[p]

[chara_show name="kata" face="hamehura_Catalina_cos1_odo" top="&f.top" left="&f.right" ]

[md name="maria" face="焦り"]

@quake_camera

[playse storage="se/rock-crack1.ogg" ]

#
[p]

#
[p]

[md name="kata" face="悲しみ"]

#
[p]

[playse storage="se/dash-asphalt2.ogg" ]
[chara_hide name="kata"]


#
[r]
[r]
[p]

[md name="maria" face="悲しみ"]


#
[p]

[md name="maria" face="焦り"]

#
[r]
[p]

[md name="maria" face="驚き"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

[chara_move name="maria" top=-180 effect="easeOutQuart" anim=true]

[playse storage="se/nadare.ogg" ]

#
[p]

#
[r]
[r]
	[p]

[bg storage="HF04_292.png"]

[md name="maria" face="焦り"]

[playse storage="se/nadare.ogg" ]

#
[r]
[r]
[p]


[playbgm volume=15 storage="M21_FinalMix.ogg" ]

[chara_move name="maria" top="&f.top" effect="easeOutQuart" anim=true]


#？？？
[p]

#
[r]
[p]

[md name="maria" face="驚き"]

[chara_move name="maria" left="&f.left" ]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_ai" ]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
[p]

[md name="keeth" face="無表情"]

[v storage="h3"]

#
[r]
[r]
[p]

#
[p]

[md name="maria" face="焦り"]
[md name="keeth" face="悲しみ"]

#
[r]
[p]

#
[r]
[r]
[p]

[md name="maria" face="悲しみ"]


#
[r]
[p]

[md name="maria" face="無表情"]
[md name="keeth" face="驚き"]

#
[r]
[r]
[p]

[md name="maria" face="泣き"]

#
[r]
[p]

[md name="keeth" face="無表情"]

#
[r]
[p]

[md name="keeth" face="悲しみ"]

[v storage="h5"]

#
[p]

#
[r]
[r]
[p]

[md name="maria" face="悲しみ"]

#
[r]
[p]

[md name="maria" face="泣き"]

#
[p]

#
[r]
[r]
[p]

#
[r]
[p]

[v storage="69"]

#
[r]
[p]

#
[r]
[p]

#
[r]
[p]

[md name="maria" face="悲しみ"]

#
[r]
[p]

#
[r]
[p]

[md name="keeth" face="微笑み" ]

#
[r]
[p]

#


[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text=""  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="" target="*select_02_02" ]

[s]

;ありがとうございます。
*select_02_01
[cm]

[md name="keeth" face="無表情"]

#
[r]
[p]

#
[p]

#
[r]
[r]
[p]

#
[r]
[r]
[p]

[md name="maria" face="驚き"]


#
[p]


[celanim anim="yellow_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="yellow_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]

#
[r]
[p]

[md name="keeth" face="微笑み"]

#
[p]

[md name="maria" face="微笑み"]

#
[r]
[p]

#
[r]
[p]


[jump target="*common_02"]

;(jump:合流)

;どうして助けてくれたんですか
*select_02_02
[cm]

[md name="maria" face="悲しみ"]
[md name="keeth" face="無表情"]

#
[r]
[r]
[p]

#
[r]
[r]
[p]

#
[r]
[r]
[p]

#
[r]
[r]
[p]

[md name="maria" face="驚き"]
[md name="keeth" face="怒り"]

#
[r]
[r]
[p]

#
[r]
[r]
[p]

[md name="maria" face="微笑み"]
[md name="keeth" face="無表情"]


#
[p]

[md name="keeth" face="微笑み"]

#
[p]

#
[r]
[r]
[p]

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
[r]
[p]

[chara_show time=10 name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu"]

#
[p]

#
[r]
[p]

#
[r]
[p]

[chara_hide name="maria"]

[v storage="83"]

#
[p]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_mu" ]

#
[p]

[chara_hide name="keeth"]

[chara_show  name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_odo"]

#
[p]

#
[r]
[p]

[md name="maria" face="悲しみ"]

#	
[r]
[p]

[md name="maria" face="無表情"]

#
[r]
[p]

[bg storage="HF08_044.png"]

[md name="maria" face="照れ"]

#	
[r]
[p]

#
[r]
[r]
[p]

[md name="maria" face="微笑み"]

#
[r]
[p]

#
[r]
[p]

[chara_hide name="maria"]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_mu" wait=true]

[v storage="93"]

#
[p]

[md name="keeth" face="悲しみ"]

[v storage="94"]

#
[p]

[v storage="95"]

[md name="keeth" face="無表情"]

#
[p]

[md name="keeth" face="悲しみ"]

[v storage="96"]

#
[p]

[md name="keeth" face="微笑み"]

[v storage="97"]

#
[p]

[md name="keeth" face="悲しみ"]

[v storage="98"]

#
[p]

#
[r]
[r]
[p]

[chara_hide name="keeth"]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" ]

#
[r]
[p]

[md name="maria" face="驚き"]

[playse storage="se/kioru.ogg"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
[p]

#
[p]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_do" wait=true]

[md name="maria" face="焦り"]
@quake_camera

[v storage="101"]

#
[p]

#
[l][r]
[r]
[p]

[md name="keeth" face="驚き"]

[v storage="103"]

[playbgm  volume=15   storage="M09_FinalMix.ogg" ]

[kanim_chara layer=0 name="keeth" keyframe=quake time=300 count=1 easing=linear]

#
[p]

[md name="keeth" face="照れ"]

#
[r]
[p]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#	
[r]
[p]

#
[r]
[p]

[md name="maria" face="悲しみ"]
[md name="keeth" face="無表情"]

#
[p]

#
[p]

#
[l][r]
[r]
[p]

#
[p]

[md name="keeth" face="怒り"]

[v storage="111"]

#
[p]

[md name="maria" face="驚き"]

@quake_camera

#
[p]

[md name="maria" face="悲しみ"]

[v storage="113"]

#	
[r]
[r]
[p]

[v storage="114"]

[kanim_chara layer=0 name="keeth" keyframe=quake time=300 count=1 easing=linear]

#	
[r]
[p]

[md name="maria" face="驚き"]

#
[p]

[md name="keeth" face="無表情"]

#
[p]

#
[l][r]
[r]
[p]

[v storage="118"]

#	
[r]
[r]
[p]

[chara_hide name="keeth"]

[md name="maria" face="焦り"]

#
[r]
[r]
[p]

#	
[r]
[p]

#
[r]
[p]

[md name="maria" face="驚き"]
[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
[p]

[md name="maria" face="照れ"]

#
[p]

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
[r]
[p]

[md name="maria" face="無表情"]

#
[r]
[p]

#
[r]
[p]

[md name="maria" face="悲しみ"]

#	
[r]
[p]

#
[r]
[p]

[playse storage="se/dash-asphalt2.ogg"]
[wse]

[chara_move name="maria" left="&f.left" ]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_mu" wait=true]

#
[l][r]
[r]
[p]

[md name="keeth" face="悲しみ"]

[v storage="142"]

#	
[r]
[r]
[p]

#
[p]

[v storage="140"]

[md name="maria" face="驚き"]
[md name="keeth" face="無表情"]

#
[p]

[kanim_chara layer=0 name="keeth" keyframe=quake time=300 count=1 easing=linear]

#
[p]

#
[p]

[md name="maria" face="照れ"]

#
[p]

#
[p]

[bg storage="HF01_026_rr.png"]

[playbgm  volume=15   storage="M10_FinalMix.ogg" ]

[md name="maria" face="無表情"]
[md name="keeth" face="無表情"]
	
#
[p]

[v storage="134"]

#
[p]


[md name="maria" face="焦り"]
[md name="keeth" face="怒り"]

#
[p]

#
[r]
[r]
[p]

#

[p]

#
[r]
[p]

#
[p]

[v storage="129"]

#	
[r]
[p]


[chara_hide_all]

[bg storage="keeth2.png"]
[eval exp="sf.keeth_cg_2=true" ]

[v storage="145"]

#	
[r]
[r]
[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]


[v storage="146"]

#	
[r]
[r]
[p]

#
[l][r]
[r]
[p]

#
[p]

#
[p]

[v storage="150"]

#
[p]

[v storage="151"]

#	
[r]
[r]
[p]

[v storage="152"]

#
[p]

#
[p]

#


[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text=""  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="" target="*select_03_02" ]

[s]

;喜んでお受けします
*select_03_01
[cm]

#
[r]
[p]

#
[r]
[p]

[v storage="156"]


#
[p]

@wait time=200

[love_up]

#
[r]
[r]
[p]

[v storage="158"]

#
[p]

#
[r]
[p]

[v storage="160"]

#
[p]

#
[p]

#
[p]

#
[p]

[jump target="*common_03"]


;本当にいいんですか？
*select_03_02
[cm]

#
[r]
[p]

#
[r]
[p]

#
[r]
[p]

#
[p]


[v storage="h3"]

#
[r]
[r]
[p]

#
[p]

#
[r]
[p]

#
[r]
[r]
[p]

#
[p]

#
[p]

#
[p]

#
[l][r]
[r]
[p]

#
[p]

[v storage="158"]

#
[p]

#
[r]
[p]

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




