
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
[p]
[playbgm  volume=30   storage="M08_FinalMix.ogg" ]

[p]
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
[r]
[r]
[p]

#
[r]
[r]
[p]

#マリア
[r]
[p]

[bg storage="HF04_078.png"]

#
[r]
[p]

#マリア:hamehura_Maria_cos1_def
[r]
[p]

#
[r]
[p]
#
[r]
[r]
[p]

[v storage="h1"]
#？？？
[r]
[p]

#マリア:hamehura_Maria_cos1_odo
[p]

#マリア	
[p]

#
[r]
[r]
[p]

[chara_move name="maria" left="&f.left" face="hamehura_Maria_cos1_ase"]

#ジオルド
[chara_show name="gio" top="&f.top" left="&f.right" face="hamehura_Giord_cos1_doya"]


#マリア	
[p]

[v storage="h2"]
#
[r]
[p]

#
[r]
[p]

#マリア
[r]
[r]
[p]

#ジオルド	
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]

[v storage="17"]
[r]
[r]
[p]

*dev4

#マリア	
[p]
なんて答えよう？

[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="正直に話す"  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="ごまかす" target="*select_01_02" ]

[s]

;正直に話す
*select_01_01
[cm]

#マリア
[r]
[p]

#ジオルド	
[chara_mod  name="gio" face="hamehura_Giord_cos1_doya"]

#ジオルド	

[r]
[p]

#
[r]
[r]
[p]

[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]
[v storage="h2"]

#ジオルド
[celanim anim="red_rose_1" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="red_rose_2" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]

[love_up]

#
[r]
[p]

#
[r]
[r]
[p]

[chara_mod  name="maria" face="hamehura_Maria_cos1_ai"]

#
[p]

#
[r]
[p]

#

[r]
[r]
[p]

[jump target="*common_01"]

;ごまかす

*select_01_02
[cm]

[chara_mod  name="maria" face="hamehura_Maria_cos1_ase" ]

#マリア
[r]
[p]

#マリア
[r]
[p]

#ジオルド
[r]
[p]

[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

#
[p]

[chara_mod  name="maria" face="hamehura_Maria_cos1_ai"]

#
[r]
[r]
[p]

[chara_mod  name="gio" face="hamehura_Giord_cos1_ai"]

#ジオルド
[r]
[p]

#
[r]
[p]

#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

#ジオルド
[p]

#マリア	
[p]


*common_01


#ジオルド
[v storage="25"]
[p]

#ジオルド
[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]

#
[v storage="h2"]
[r]
[r]
[p]

#マリア
[p]

#
[r]
[r]
[p]

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
[p]

#
[r]
[p]

#
[r]
[r]
[p]

#マリア
[r]
[r]
[p]

#
[r]
[p]
[r]
[p]

[fadeoutbgm time=1000]

#
[p]

[playbgm  volume=30   storage="M43_FinalMix.ogg"]

[chara_move name="maria" left="&f.left" ]
[chara_show name="kata" face="hamehura_Catalina_cos1_do" top="&f.top" left="&f.right" ]

#カタリナ
[v storage="36"]
[p]

#マリア
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase"]
[p]

#
[r]
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

[if exp="sf.btn_volume==true"]
[playse storage="se/punch-middle2.ogg" ]
[endif]

;[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=2 easing=linear]
@quake_camera

#
[p]

#
[r]
[r]
[p]

#カタリナ
[chara_mod  name="kata" face="hamehura_Catalina_cos1_aku"]
[v storage="43"]

[kanim layer=0 name="kata" keyframe=quake time=300 count=1 easing=linear]

[r]
[r]
[p]

#
[r]
[r]
[p]

#カタリナ
[v storage="45"]

[r]
[r]
[p]

#
[r]
[p]

#マリア
[kanim layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]
[font size="40"]
[p]
[resetfont]

#
[r]
[p]

[chara_hide name="maria" wait=false ]
[chara_hide name="kata" wait=true ]	

[wait time=1000]

;[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=1 easing=linear]
@quake_camera


#？？？
[font size="40"]
[p]
[resetfont]

#ジオルド
[chara_show name="gio" top="&f.top" left="&f.left" face="hamehura_Giord_cos1_do" ]
[chara_show name="kata" face="hamehura_Catalina_cos1_do" top="&f.top" left="&f.right" ]
 
#カタリナ

[chara_mod  name="kata" face="hamehura_Catalina_cos1_odo" ]
[kanim layer=0 name="kata" keyframe=quake time=300 count=1 easing=linear]

[v storage="50"]
[p]

#ジオルド
[v storage="51"]

[r]
[r]
[p]

#カタリナ	
[chara_mod  name="kata" face="hamehura_Catalina_cos1_ai" ]
[v storage="52"]

[r]
[p]

#ジオルド	
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]

[r]
[p]

[r]
[r]
[p]

#カタリナ	
[chara_mod  name="kata" face="hamehura_Catalina_cos1_ai"]
[v storage="54"]
[p]

#
[r]
[p]

#
[r]
[r]
[p]

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
[p]

#
[r]
[r]
[p]


#

[r]
[r]
[p]

[chara_hide_all ]

[bg storage="hamehura_jiorudo1.png" ]
[eval exp="sf.gio_cg_1=true" ]
#マリア
[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#ジオルド	
[v storage="61"]

[r]
[p]

#
[v storage="h2"]
[r]
[r]
[p]

#
[r]
[p]

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
[p]

[bg storage="HF04_283.png" time=1000 ]

[chara_show name="maria" top="&f.top" left="&f.left" time=1000 face="hamehura_Maria_cos1_mu" ]

#
[r]
[p]

#マリア
[r]
[p]

[chara_mod  name="maria" face="hamehura_Maria_cos1_def"]

#マリア
[r]
[p]


#
[r]
[p]

[r]
[p]

[chara_hide name="maria"]

#？？？
[v storage="h3"]
[p]

#
[r]
[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" face="hamehura_Giord_cos1_def"]


#ジオルド

[r]
[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#マリア
[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]
[p]


#
[v storage="h2"]
[r]
[r]
[p]

#
[r]
[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]
[v storage="75"]

[p]

#

[r]
[r]
[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]


#マリア
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase" ]
[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#ジオルド	

[r]
[chara_mod  name="gio" face="hamehura_Giord_cos1_ai"]

[p]
[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#マリア
[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

[p]

#

[r]
[p]

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
[r]
[p]

#マリア
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase"]
[p]

#
[r]
[r]
[p]

#マリア
[r]
[p]

#
[r]
[p]

;白転
[chara_hide name="maria" time=100]
[chara_hide name="gio" time=100]
[bg storage="white.png" time=100] 

[wait time=1000 ]

#
[p]

[bg storage="HF04_292.png" time=1000] 

#
[p]

[chara_show name="maria" top="&f.top" left="&f.left" wait=false]
[chara_show name="gio" top="&f.top" left="&f.right" wait=true]

#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_man" ]	
[v storage="85"]
[p]

#ジオルド
[celanim anim="red_rose_1" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="red_rose_2" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]

[love_up]


[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]

#

[r]
[r]
[p]

#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

[r]
[p]

#
[r]
[p]

@jump target="common_02"

;;;;;;;;;;ためらう
*select_02_02

[cm]
#マリア
[chara_mod  name="maria" face="hamehura_Maria_cos1_ai"]

[r]
[p]

#
[r]
[r]
[p]

#
[r]
[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]
[v storage="h1"]

[r]
[r]
[p]

#

[r]
[r]
[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#マリア
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase"]
[p]

#
[r]
[p]


;白転
[chara_hide name="maria" time=100]
[chara_hide name="gio" time=100]
[bg storage="white.png" time=100] 

[wait time=1000 ]

#
[p]

[bg storage="HF04_292.png" time=1000] 
;[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=2 easing=linear]
@quake_camera

#
[p]

[chara_show name="maria" top="&f.top" left="&f.left" wait=false]
[chara_show name="gio" top="&f.top" left="&f.right" wait=true]

[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]

#ジオルド	
[v storage="85"]

[p]

#
[r]
[r]
[p]

;;;;;;;;;

*common_02


#ジオルド
[chara_mod  name="gio" face="hamehura_Giord_cos1_doya"]

[v storage="88"]

[r]
[p]

#
[r]
[p]

#ジオルド
[v storage="90"]
[p]

#
[r]
[r]
[p]

*dev3
[chara_hide_all ]

[bg storage="black.png" time=1000] 
[wait time=1000 ]

[bg storage="HF04_251.png"]
[playbgm  volume=30   storage="M28_FinalMix.ogg" ]
	
#
[r]
[r]
[p]

#
[p]

#
[r]
[p]

[chara_show name="reijo1" top="&f.top" face="hamehura_DVDmob1_do"]
[chara_show name="reijo2" top="&f.top" face="hamehura_DVDmob2_do" ]
[chara_show name="reijo3" top="&f.top" face="hamehura_DVDmob3_do"]


#令嬢1
[r]
[p]

#令嬢2:hamehura_DVDmob2_fear
[r]
[p]

#令嬢1
[p]

#令嬢3
[r]
[p]

#令嬢2
[r]
[p]

#令嬢3:hamehura_DVDmob3_fear
[r]
[p]

#令嬢1
[r]
[r]
[p]

#令嬢3:hamehura_DVDmob3_do
[r]
[p]

#令嬢2:hamehura_DVDmob2_do
[r]
[p]

[r]
[p]

#令嬢3:hamehura_DVDmob3_fear
[r]
[r]
[p]

[chara_hide_all]

#
[r]

[r]
[p]

[chara_show name="maria" top=&f.top face="hamehura_Maria_cos1_ai"]

#マリア
[p]

#
[p]

#
[p]

#
[r]
[r]
[p]

#
[r]
[p]

[r]
[p]

#
[r]
[r]
[p]

[chara_hide name="maria" ]

[bg storage="black.png" ]


[bg storage="kyokai.png" ]
	
#
[r]
[p]

[playbgm  volume=30   storage="M21_FinalMix.ogg"]

[chara_show name="gio" top="&f.top" left="&f.right" face="hamehura_Giord_cos1_doya"]


#
[r]
[r]
[p]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_def"]

#マリア
[p]

#
[r]
[p]

[chara_mod name="gio" face="hamehura_Giord_cos1_doya"]

#ジオルド
[v storage="119"]
[p]

[chara_mod name="maria" face="hamehura_Maria_cos1_mu"]

#
[r]
[p]

#マリア
[p]

#ジオルド:hamehura_Giord_cos1_def
[v storage="122"]
[p]

#マリア:hamehura_Maria_cos1_odo
[p]

#ジオルド
[v storage="124"]
[r]
[r]
[p]

#ジオルド:hamehura_Giord_cos1_doya
[v storage="125"]
[r]
[p]

#ジオルド:hamehura_Giord_cos1_def
[v storage="126"]
[r]
[r]
[p]

#ジオルド
[v storage="127"]
[r]
[p]

#ジオルド:hamehura_Giord_cos1_doya
[v storage="128"]
[r]
[p]

#
[r]
[p]

#ジオルド:hamehura_Giord_cos1_man
[v storage="130"]

[r]
[p]

#マリア
[p]

#
[r]
[p]

#
[r]
[p]

#
[p]

[chara_mod name="maria" face="hamehura_Maria_cos1_ase"]

#
[p]

#
[r]
[p]

#マリア:hamehura_Maria_cos1_ai
[r]
[p]

[chara_mod name="gio" face="hamehura_Giord_cos1_ai"]

#マリア
[r]
[r]
[p]

#マリア
[r]
[r]
[p]

#ジオルド
[v storage="139"]

[p]

#
[r]
[p]

#ジオルド
[v storage="141"]

[r]
[p]

[chara_mod name="gio" face="hamehura_Giord_cos1_ai"]

#
[r]
[p]

[kanim layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
[r]
[r]
[p]

#ジオルド:hamehura_Giord_cos1_doya
[v storage="144"]
[r]
[r]
[p]

#ジオルド
[v storage="145"]
[p]
[r]
[r]
[p]

#ジオルド:hamehura_Giord_cos1_def
[v storage="146"]

[p]

#

[r]
[r]
[p]

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
[r]
[p]

#
[r]
[p]

[p]

#マリア
[r]
[p]

#ジオルド:hamehura_Giord_cos1_man
[v storage="151"]
[p]



[chara_hide_all]
[bg storage="white.png" time=1000] 

[wait time=1000 ]

[bg storage="hamehura_jiorudo2.png" time=3000 ]
[eval exp="sf.gio_cg_2=true" ]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1000 mode=screen wait=false loop=false ]
[endif]

#
[p]

[r]
[p]

#
[v storage="h2"]
[p]

[r]
[p]

#
[r]
[p]

#
[v storage="h4"]

[p]

@jump target="common_03"

*select_03_02

[eval exp="f.end=2"]

[cm]

#マリア:hamehura_Maria_cos1_def2
[r]
[p]

#
[p]

[r]
[p]

#ジオルド
[celanim anim="red_rose_1" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="red_rose_2" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]

[love_up]

#
[r]
[p]

#ジオルド:hamehura_Giord_cos1_man
[p]

#
[r]
[p]

[chara_hide_all]
[bg storage="white.png" time=1000] 

[bg storage="hamehura_jiorudo2.png" time=3000 ]
[eval exp="sf.gio_cg_2=true" ]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1000 mode=screen wait=false loop=false ]
[endif]

#
[r]
[p]

#マリア
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
[p]

#
[v storage="h4"]
[p]
*common_03

#
[r]
[p]

#ジオルド
[v storage="157"]

[r]
[r]
[p]

#
[v storage="h2"]

[r]
[p]

#
[p]

[free_layermode time=1000 ]

#
[r]
[p]
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

