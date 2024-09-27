
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
[r]
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_do"]


#
[r]
[p]

[chara_hide name="maria"]

#
[r]
[p]

[playbgm volume=30 storage="M03_FinalMix.ogg" ]
[bg storage="HF08_021_026.png" time=1000 ]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true]

[v storage="5" ]

#
[r]
[p]

#
[r]
[r]
[p]

#
[p]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_def.png" wait=true]


#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]

#
[p]

;[chara_hide name="nicol" pos_mode=false ]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#
[r]
[r]
[p]

[chara_show name="sophia" top="&f.top" left="620" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true zindex=0 ]


#	
[p]

[md name="sophia" face="hamehura_Sophia_cos1_odo"]

#？？？	
[p]

[chara_move name="sophia" top="&f.top" anim=true left="520" wait=true zindex=0 ]


#
[r]
[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

#
[p]

[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="14" ]

#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#
[r]
[p]

[chara_hide name="maria" pos_mode=false ]
[md name="sophia" face="hamehura_Sophia_cos1_ai" ]

#
[r]
[r]
[p]


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


#
[r]
[p]

[md name="sophia" face="hamehura_Sophia_cos1_ai"]

#
[p]

;=======================================

[mask graphic="black.png" time=1500 effect="slideInRight"]

[bg storage="black.png" time=10 ]

[md name="maria" face="hamehura_Maria_cos1_tere"]
[md name="sophia" face="hamehura_Sophia_cos1_mu"]

[bg storage="HF04_034_r.png" time=10] 

[mask_off time=1500 effect="slideOutLeft"]

;=======================================


#
[r]
[r]
[p]
[md name="sophia" face="hamehura_Sophia_cos1_ai"]

#	
[p]

;=======================================

[mask graphic="black.png" time=1500 effect="slideInRight"]

[bg storage="black.png" time=10 ]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="sophia" face="hamehura_Sophia_cos1_mu"]

[bg storage="HF04_002.png" time=10]

[mask_off time=1500 effect="slideOutLeft"]

;=======================================

	
#
[r]
[p]

[md name="sophia" face="hamehura_Sophia_cos1_ai"]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#
[p]

[md name="sophia" face="hamehura_Sophia_cos1_mu"]

#
[p]
	
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
[r]
[r]
[p]

#
[p]

[chara_hide_all time=1000]

[bg storage="HF04_002.png" ]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_def.png" wait=false time=1000 ]
[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=1000 ]
	
#
[r]
[p]

#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#
[r]
[p]

[chara_hide name="maria" pos_mode=false  wait=false]
[chara_hide name="sophia" pos_mode=false wait=true ]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true]

#
[r]
[p]

[chara_hide name="nicol" pos_mode=false wait=true ]

[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=10 ]


#
[r]
[r]
[p]

#
[r]
[p]

[md name="sophia" face="hamehura_Sophia_cos1_def"]

#
[r]
[r]
[p]

[chara_hide name="sophia" pos_mode=false wait=true ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_odo.png" wait=true]


#
[p]

#
[r]
[p]

#
[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

[v storage="40" ]

#
[p]

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
[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#
[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]


#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

#
[r]
[p]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#
[r]
[p]

[v storage="h2" ]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#
[r]
[p]

#
[p]

[chara_hide_all ]

#
[r]
[p]


[chara_show name="reijo1" top="&f.top" left="-160" storage="chara/reijo1/hamehura_DVDmob1_fear.png" wait=false]
[chara_show name="reijo2" top="&f.top" left="100" storage="chara/reijo2/hamehura_DVDmob2_fear.png" wait=false]
[chara_show name="reijo3" top="&f.top" left="340" storage="chara/reijo3/hamehura_DVDmob3_def.png" wait=true ]


#
[r]
[r]
[p]

#
[r]
[p]

#
[r]
[r]
[p]

[chara_hide_all ]


#
[p]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_ai.png" wait=false time=1000 ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_do.png" wait=true time=1000 ]

[v storage="h4" ]

#
[p]

#
[r]
[p]

#
[r]
[p]



[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text=""  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="" target="*select_01_02" ]

[s]

*select_01_01
[cm]

[md name="maria" face="hamehura_Maria_cos1_def"]
	
[fadeinbgm storage="M10_FinalMix.ogg" time=2000]
	
#
[r]
[r]
[p]

[md name="nicol" face="hamehura_Nicol_cos1_odo"]

#
[p]

[chara_hide_all]

[eval exp="sf.nicol_cg_1=true" ]
[bg storage="nicol1.png"]
	
#
[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]


#
[r]
[p]

#
[r]
[p]

[v storage="64" ]

#
[r]
[r]
[p]

#
[p]

#
[p]

#
[r]
[p]

[jump target="common1"]

*select_01_02
[cm]

[fadeinbgm storage="M10_FinalMix.ogg" time=2000]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="nicol" face="hamehura_Nicol_cos1_do"]

[bg storage="HF08_018_r.png" time=10] 

#
[r]
[p]

[md name="nicol" face="hamehura_Nicol_cos1_odo"]

#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

[kanim_chara layer=0 name="nicol" keyframe=quake time=300 count=1 easing=linear]

#
[r]
[p]

[celanim anim="green_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="green_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#
[p]

[chara_hide_all]

[eval exp="sf.nicol_cg_1=true" ]
[bg storage="nicol1.png"]	

#
[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
[p]

#
[r]
[p]

#
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

*common1


[free_layermode time=1000 ]

	
[bg storage="HF08_018_r.png" time=10] 

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_tere.png" wait=false time=1000 ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_def.png" wait=true time=1000 ]


#
[r]
[p]

#
[r]
[r]
[p]

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
[r]
[r]
[p]

#
[r]
[p]

#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_akire"]

#
[r]
[p]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true]


#	
[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
[r]
[p]

#	
[p]

[md name="nicol" face="hamehura_Nicol_cos1_do"]

[v storage="76" ]

#	
[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_ai"]

#
[r]
[p]

#
[r]
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#
[r]
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#
[r]
[r]
[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

[v storage="h1" ]

#	
[p]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

[v storage="84" ]

#
[p]

#
[p]

#
[r]
[r]
[p]

[md name="nicol" face="hamehura_Nicol_cos1_ai"]

[v storage="87" ]

#
[r]
[r]
[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_ai"]

#
[p]

[md name="nicol" face="hamehura_Nicol_cos1_ai"]

#
[p]

[v storage="91" ]

#
[r]
[r]
[p]

[v storage="92" ]

#
[r]
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="93" ]

#
[r]
[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

[v storage="94" ]

#
[r]
[p]

[v storage="95" ]

#
[r]
[p]

#	


[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text=""  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="" target="*select_02_02" ]

[s]

*select_02_01
[cm]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#
[r]
[p]

[v storage="99" ]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_kon"]

#
[r]
[p]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="h3" ]

#
[r]
[p]

[celanim anim="green_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="green_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#
[r]
[p]


[md name="nicol" face="hamehura_Nicol_cos1_def"]


#
[p]

#
[r]
[p]

[jump target="common2"]

*select_02_02
[cm]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#
[r]
[p]

[v storage="h1" ]

#
[p]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

#
[p]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_kon"]

#
[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

[v storage="h3" ]

#
[r]
[r]
[p]

#
[p]

#
[r]
[r]
[p]

*common2

[md name="maria" face="hamehura_Maria_cos1_odo"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="106" ]

#
[r]
[r]
[p]

[chara_hide name="nicol" pos_mode=false ]

#
[r]
[p]

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
[r]
[p]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_ai.png" wait=true]

#
[p]

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

[md name="maria" face="hamehura_Maria_cos1_akire"]


#
[r]
[p]

[fadeoutbgm time=2000]
[playse storage="se/door_wood_knock1.ogg" ]

#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]


#
[p]

#
[r]
[p]

[playse storage="se/door-open1.ogg" ]

[fadeinbgm storage="M17_FinalMix.ogg" time=2000 ]

[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=1000 ]
[md name="maria" face="hamehura_Maria_cos1_odo"]
	
#	
[p]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
[p]

#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos1_ase"]


#
[p]

#
[r]
[r]
[p]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_ai"]

#
[r]
[p]

#
[p]

#
[r]
[p]

#
[r]
[p]

#	
[p]


[md name="maria" face="hamehura_Maria_cos1_do"]

#
[font size=30]本当です！[resetfont]
[p]

[md name="sophia" face="hamehura_Sophia_cos1_def"]

#
[r]
[p]

#	
[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#
[p]

[md name="maria" face="hamehura_Maria_cos1_kon"]

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
[p]

#	
[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]

#
[r]
[p]

#	
[p]


;=======================================

[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide_all time=100]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_mu.png" wait=true]

[wait time=2000 ]

[bg storage="HF04_034_r.png" time=10] 

[mask_off time=2000 ]

;========================================
	
#
[p]

#
[r]
[r]
[p]

#	
[p]

[bg storage="HF04_066_071_073_084A.png"]

[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_def.png" wait=true time=1000 ]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#
[p]

#
[r]
[p]

#
[r]
[p]

#	
[p]

[md name="maria" face="hamehura_Maria_cos1_ase"]

#
[r]
[p]

#	
[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#	
[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#
[font size=30]
[r]

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
[r]
[r]
[p]

#
[r]
[p]

[md name="maria" face="hamehura_Maria_cos5_akire"]

#
[r]
[r]
[p]

#
[p]

[v storage="149"]

#？？？	
[p]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos2_mu.png" wait=true]
[md name="maria" face="hamehura_Maria_cos5_odo"]

#
[r]
[r]
[p]

[md name="nicol" face="hamehura_Nicol_cos2_def"]

[v storage="151"]

#
[p]

[md name="maria" face="hamehura_Maria_cos5_kon"]

#
[p]

#
[p]

[md name="maria" face="hamehura_Maria_cos5_tere"]
[md name="nicol" face="hamehura_Nicol_cos2_mu"]

#
[r]
[p]

[v storage="155"]

#
[p]

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
[r]
[p]

[md name="maria" face="hamehura_Maria_cos5_tere2"]

#
[p]

[md name="maria" face="hamehura_Maria_cos5_odo"]

[v storage="158"]

#
[p]

#
[r]
[p]

#
[r]
[p]

#
[r]
[p]

[md name="nicol" face="hamehura_Nicol_cos2_tere"]

[v storage="162"]

#
[r]
[p]

[v storage="163"]

#
[r]
[r]
[p]

[chara_hide_all time=1000]


[eval exp="sf.nicol_cg_2=true" ]
[bg storage="nicol2.png"]

[v storage="164"]

#
[r]
[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

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

#	


[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text=""  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="" target="*select_03_02" ]

[s]

*select_03_01
[cm]

	
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

[v storage="175"]

#
[p]

#
[p]

#
[p]

#
[r]
[p]

#
[r]
[p]

[celanim anim="green_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="green_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


[jump target="common3"]

*select_03_02
[cm]
	
#
[r]
[r]
[p]

#
[p]

#
[p]

#
[r]
[p]

[v storage="175"]

#
[p]

#
[p]

#
[p]

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
[r]
[p]

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



