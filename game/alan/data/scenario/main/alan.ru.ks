
*start

;タイトルマスク

[cm]
[clearfix]
[start_keyconfig]

[mask graphic="now_loading.png" time=10]

[bg storage="HF08_021_026.png" time=10]


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
        "笑顔":"hamehura_Maria_cos1_def2",
        
    },
    
    "alan":{
        
        "悲しみ":"hamehura_Alan_cos1_ai",
        "微笑み":"hamehura_Alan_cos1_def",
        "怒り":"hamehura_Alan_cos1_do",
        "ドヤ顔":"hamehura_Alan_cos1_doya",
        "混乱":"hamehura_Alan_cos1_kon",
        "無表情":"hamehura_Alan_cos1_mu",
        "驚き":"hamehura_Alan_cos1_odo",
        "照れ":"hamehura_Alan_cos1_tere",
        
        
    },
    
    "mary":{
        
        "悲しみ":"hamehura_Mary_cos1_ai",
        "微笑み":"hamehura_Mary_cos1_def",
        "怒り":"hamehura_Mary_cos1_do",
        "無表情":"hamehura_Mary_cos1_mu",
        
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
    f.right = 300;
    f.love = 0;
    
    if(sf.alan_cg_1==undefined){
       sf.alan_cg_1=false;
       sf.alan_cg_2=false;
    }

        
[endscript]



[iscript]

f.charas = [

"data/fgimage/chara/alan/hamehura_Alan_cos1_ai.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_def.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_do.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_doya.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_kon.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_mu.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_odo.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_tere.png",

"data/fgimage/chara/alan/hamehura_Alan_cos1_ai_b.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_def_b.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_do_b.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_doya_b.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_kon_b.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_mu_b.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_odo_b.png",
"data/fgimage/chara/alan/hamehura_Alan_cos1_tere_b.png",


"data/fgimage/chara/mary/hamehura_Mary_cos1_ai.png",
"data/fgimage/chara/mary/hamehura_Mary_cos1_def.png",
"data/fgimage/chara/mary/hamehura_Mary_cos1_do.png",
"data/fgimage/chara/mary/hamehura_Mary_cos1_mu.png",

"data/fgimage/chara/mary/hamehura_Mary_cos1_ai_b.png",
"data/fgimage/chara/mary/hamehura_Mary_cos1_def_b.png",
"data/fgimage/chara/mary/hamehura_Mary_cos1_do_b.png",
"data/fgimage/chara/mary/hamehura_Mary_cos1_mu_b.png",


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
 
 ];


[endscript]

[preload storage="&f.charas"]


;キャラクター情報読み込み
[chara_new  name="alan" color="0x6b7c9d" storage="chara/alan/hamehura_Alan_cos1_ai.png" jname="アラン" ]
[chara_new  name="mary"  color="0xff0981" storage="chara/mary/hamehura_Mary_cos1_ai.png" jname="メアリ" ]
[chara_new  name="maria" color="0xff0981" storage="chara/maria/hamehura_Maria_cos1_ai.png" jname="マリア" ]

;キャラクターの表情登録

;アラン
[chara_face name="alan" face="hamehura_Alan_cos1_ai" storage="chara/alan/hamehura_Alan_cos1_ai.png"]
[chara_face name="alan" face="hamehura_Alan_cos1_def" storage="chara/alan/hamehura_Alan_cos1_def.png"]
[chara_face name="alan" face="hamehura_Alan_cos1_do" storage="chara/alan/hamehura_Alan_cos1_do.png"]
[chara_face name="alan" face="hamehura_Alan_cos1_doya" storage="chara/alan/hamehura_Alan_cos1_doya.png"]
[chara_face name="alan" face="hamehura_Alan_cos1_kon" storage="chara/alan/hamehura_Alan_cos1_kon.png"]
[chara_face name="alan" face="hamehura_Alan_cos1_mu" storage="chara/alan/hamehura_Alan_cos1_mu.png"]
[chara_face name="alan" face="hamehura_Alan_cos1_odo" storage="chara/alan/hamehura_Alan_cos1_odo.png"]
[chara_face name="alan" face="hamehura_Alan_cos1_tere" storage="chara/alan/hamehura_Alan_cos1_tere.png"]


;メアリ
[chara_face name="mary" face="hamehura_Mary_cos1_ai" storage="chara/mary/hamehura_Mary_cos1_ai.png"]
[chara_face name="mary" face="hamehura_Mary_cos1_def" storage="chara/mary/hamehura_Mary_cos1_def.png"]
[chara_face name="mary" face="hamehura_Mary_cos1_do" storage="chara/mary/hamehura_Mary_cos1_do.png"]
[chara_face name="mary" face="hamehura_Mary_cos1_mu" storage="chara/mary/hamehura_Mary_cos1_mu.png"]


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



; 背景先読み
[preload storage="data/bgimage/alan1.png" ]
[preload storage="data/bgimage/alan2.png" ]

[preload storage="data/bgimage/HF04_002.png" ]
[preload storage="data/bgimage/HF04_078.png" ]
[preload storage="data/bgimage/HF04_292.png" ]
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


;[jump target="dev1"]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=true]

#


[p]

[playbgm  volume=15   storage="M33_FinalMix.ogg" ]


#
[p]

#
[r]
[p]

[chara_hide name="maria"]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

#
[r]
[p]

#
[r]
[r]
[p]

[chara_hide name="alan"]
[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=true]

#
[r]
[p]

#

[r]
[r]
[p]

[md name="maria" face="無表情"]

#
[r]
[p]

[stopbgm]

#
[p]

[playbgm  volume=15   storage="M40_FinalMix.ogg" ]
[playse storage="se/door-open1.ogg" ]
[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]


[md name="maria" face="焦り"]
#
[r]
[p]

#
[r]
[p]

[chara_hide name="maria"]

[v storage="h1" ]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]


[wait time=1000]
	
[chara_hide name="alan"]	
[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" wait=true]

#
[p]

#


	
[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text=""  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="" target="*select_01_02" ]

[s]

;隠れておこう
*select_01_01
[cm]

[md name="maria" face="焦り"]

[love_up]

#
[r]
[p]

;[anim name="maria" left=-1000 ]
;[wa]

[chara_hide name="maria"]

#
[p]

[playse storage="se/walk-asphalt1.ogg"]

#
[p]

#
[r]
[r]
[p]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_do" wait=true]

[stopse]

#	
[p]


#
[r]
[p]

[chara_hide name="alan" pos_mode=false ]

[wait time=1000]

;[anim name="maria" left="&f.left" time=2300 ]
;[wa]


[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" wait=true]

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
[r]
[p]

[jump target="*common1" ]

*select_01_02
[cm]

[md name="maria" face="焦り"]

#
[r]
[p]

#
[r]
[p]

[chara_hide name="maria"]

[playse storage="se/walk-asphalt1.ogg"]

#
[r]
[p]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" wait=true]

#
[p]

#
[r]
[r]
[p]

[md name="maria" face="驚き" ]

[playse storage="se/door-open1.ogg"]

#
[r]
[p]

[stopbgm]
[md name="maria" face="焦り" ]

#
[p]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_odo" wait=true]

#	
[p]

[playbgm  volume=15 storage="M46_FinalMix.ogg" ]

#
[r]
[r]
[p]

#
[p]

[md name="alan" face="怒り"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
[p]

[playse storage="se/dash-asphalt2.ogg" ]

[chara_hide name="maria"]

[md name="alan" face="驚き"]

[v storage="h2"]

#
[r]
[p]

*common1	

*dev1 

;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide name="alan" time=10]
[chara_hide name="maria" time=10 ]

[wait time=2000 ]

[bg storage="HF08_018_r.png" time=10] 

[mask_off time=2000 ]

[playbgm  volume=15   storage="M08_FinalMix.ogg" ]

[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_ai" wait=false]
	
#
[r]
[r]
[p]

#
[r]
[p]

[md name="maria" face="微笑み" ]

#
[p]

#
[r]
[p]

[fadeinbgm  volume=15 storage="M02_FinalMix.ogg" time=2000 ]
[wait time=2000]

[md name="maria" face="驚き" ]

#
[r]
[p]

[md name="maria" face="笑顔" ]

#
[p]

[md name="maria" face="微笑み" ]

#
[p]

[chara_hide name="maria"]

[bg storage="HF04_292.png" ]


[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_def" wait=true]

#
[r]
[r]
[p]

[chara_move name="maria" top="&f.top" left="&f.left" wait=true]
[md name="maria" face="驚き"]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]


#
[p]

[stopbgm]
[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

[md name="alan" face="怒り"]

#	

[v storage="22"]

[font size=30]

[resetfont]
[p]

[playbgm  volume=15   storage="M09_FinalMix.ogg" ]

#
[r]
[p]

[md name="maria" face="焦り"]

#
[r]
[p]

#
[r]
[p]

[md name="alan" face="驚き"]

#	
[p]

[v storage="h6"]

#
[r]
[r]
[p]

[md name="alan" face="悲しみ"]

[v storage="27"]

#	
[r]
[r]
[p]

[md name="maria" face="怒り"]

#
[p]

[md name="maria" face="微笑み"]

#
[p]

[md name="maria" face="焦り"]

[v storage="29_A"]

#	
[p]

[v storage="29_B"]

#	
[r]
[r]
[p]

#
[r]
[p]

[md name="maria" face="悲しみ"]
[md name="alan" face="驚き"]

#
[r]
[p]

#
[r]
[p]

#

[r]
[p]

[md name="maria" face="微笑み"]
[md name="alan" face="無表情"]

#
[p]

#
[r]
[r]
[p]

[md name="maria" face="笑顔"]


#
[r]
[r]
[p]

[md name="maria" face="微笑み"]
[md name="alan" face="悲しみ"]


#
[p]

#
[r]
[p]

[v storage="38"]

#
[p]

[md name="maria" face="笑顔"]

#
[p]

[md name="maria" face="微笑み"]

#	
[p]

[md name="alan" face="微笑み"]

#	
[font size=18]

[resetfont]

[p]

[md name="maria" face="笑顔"]

#
[p]

[md name="maria" face="照れ"]

#
[p]

[md name="maria" face="笑顔"]
[md name="alan" face="驚き"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
[r]
[r]
[p]

[md name="alan" face="微笑み"]

#	
[p]

[md name="maria" face="微笑み"]
[md name="alan" face="無表情"]

#	
[p]

[v storage="45"]

[md name="alan" face="照れ"]

#	
[font size="18"]

[resetfont]
[p]

#
[r]
[p]

[md name="maria" face="驚き"]
[md name="alan" face="悲しみ"]

[v storage="47"]

#	
[r]
[p]

[md name="maria" face="微笑み"]
[md name="alan" face="驚き"]

#
[p]

[md name="alan" face="悲しみ"]

#
[p]

[md name="maria" face="照れ"]

#
[r]
[p]

[md name="alan" face="無表情"]

#
[p]

[md name="maria" face="微笑み"]
[md name="alan" face="照れ"]

#
[r]
[r]
[p]

[md name="maria" face="笑顔"]
[md name="alan" face="微笑み"]

#
[p]

[md name="maria" face="照れ"]

#
[r]
[p]
[md name="maria" face="微笑み"]
[md name="alan" face="怒り"]

[v storage="h2"]

#
[r]
[r]
[p]


;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide name="alan" time=10]
[chara_hide name="maria" time=10 ]

[wait time=2000 ]

[bg storage="HF08_018_r.png" time=10] 

[mask_off time=2000 ]

[playbgm  volume=15 storage="M23_FinalMix.ogg" ]


#
[r]
[r]
[p]


[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_ai" wait=true]

#
[r]
[p]

[md name="maria" face="無表情"]

#
[r]
[p]

[r]
[p]

#

[p]

[chara_hide name="maria" ]

[bg storage="HF04_078.png"]


[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_odo" wait=true]
	
#
[r]
[p]

#
[p]

#
[p]

#


[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text=""  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="" target="*select_02_02" ]

[s]

*select_02_01
[cm]

[md name="maria" face="照れ"]

#
[r]
[p]

#
[r]
[r]
[p]

[md name="maria" face="驚き"]

#
[r]
[r]
[p]

[md name="maria" face="微笑み"]

#
[r]
[p]

#
[p]

#
[r]
[r]
[p]

[md name="maria" face="笑顔"]

#
[p]

#
[r]
[p]

[md name="maria" face="驚き"]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

[v storage="h2"]

#
[p]

[md name="maria" face="焦り"]
[chara_move name="maria" left="&f.left" time=500 ]

#
[r]
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

#
[p]

[jump target="common2"]

*select_02_02
[cm]

[md name="maria" face="悲しみ"]

#
[r]
[p]

[md name="maria" face="微笑み"]

#
[r]
[p]

[md name="maria" face="照れ"]

#
[p]

#
[r]
[p]

#
[p]

[md name="maria" face="無表情"]

#
[p]

#
[r]
[p]

#
[r]
[p]

[md name="maria" face="驚き"]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

[v storage="h2"]

#
[p]

[md name="maria" face="焦り"]

[chara_move name="maria" left="&f.left" time=500 ]
;[wa]

#
[r]
[p]

[md name="alan" face="ドヤ顔"]

#
[p]

[md name="maria" face="驚き"]

#
[p]

#
[p]

[md name="maria" face="照れ"]

#
[r]
[r]
[p]

#
[r]
[p]

[md name="maria" face="微笑み"]
[md name="alan" face="微笑み"]

[celanim anim="blue_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="blue_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#
[p]

#
[r]
[p]

*common2

[md name="maria" face="驚き"]
[md name="alan" face="微笑み"]


[v storage="65"]

#
[p]

#
[r]
[r]
[p]

[v storage="67"]

#
[p]

#
[r]
[p]


;スチル表示
[chara_hide_all ]

[wait time=1000 ]

[eval exp="sf.alan_cg_1=true" ]
[bg storage="alan1.png" time=2000] 


#
[r]
[r]
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

[v storage="72"]

#
[p]

#
[r]
[r]
[p]

[v storage="h5"]

#
[p]

#
[r]
[p]

[v storage="h1"]

#
[r]
[r]
[p]

#
[r]
[p]

[fadeoutbgm time=1000] 

[wait time=1000]
[playbgm volume=15 storage="M21_FinalMix.ogg" ]

[v storage="78"]

#
[p]

#
[p]

[v storage="80"]

#
[r]
[r]
[p]

[v storage="81"]

#	
[r]
[r]
[p]

[v storage="82_A"]

#
[r]
[p]

[v storage="82_B"]

#
[r]
[r]
[p]

#
[p]

;要チェック
[v storage="84"]

#
[r]
[r]
[p]

[v storage="85_A"]

#
[r]
[p]

[v storage="85_B"]

#
[r]
[p]

[v storage="86"]

#
[r]
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

#
[p]

#
[p]

#
[r]
[p]

[free_layermode time=1000 ]


[bg storage="HF04_078.png"]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_def" wait=false]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

#
[r]
[p]

[md name="maria" face="驚き"]
[md name="alan" face="怒り"]

[v storage="94"]

#
[r]
[r]
[p]

[md name="alan" face="無表情"]

[v storage="95"]

#
[r]
[p]

[fadeoutbgm time=1000]
[playse storage="se/dash-asphalt2.ogg" ]

[chara_hide name="alan"]

#
[r]
[r]
[p]

;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide name="alan" time=10]
[chara_hide name="maria" time=10 ]

[wait time=2000 ]

[playbgm  volume=15  storage="M42_FinalMix_Re.ogg" ]

[bg storage="HF04_002.png" time=10] 

[mask_off time=2000 ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=true]


#
[r]
[p]

#
[r]
[p]

[md name="maria" face="焦り"]
[chara_show name="mary" top="&f.top" left="&f.right" face="hamehura_Mary_cos1_mu" wait=true]

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


[md name="maria" face="無表情"]

#
[r]
[p]

[md name="mary" face="怒り"]

#
[r]
[p]

[md name="maria" face="驚き"]
[md name="mary" face="無表情"]

#
[p]

[md name="maria" face="無表情"]

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
[p]

#
[p]

[md name="maria" face="悲しみ"]
[md name="mary" face="悲しみ"]

#
[r]
[r]
[p]

[md name="maria" face="無表情"]

#
[r]
[r]
[p]

#
[p]

[md name="maria" face="悲しみ"]

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

#
[r]
[p]

[md name="mary" face="微笑み"]

#
[r]
[p]

[md name="maria" face="驚き"]

#
[p]

[md name="maria" face="悲しみ"]

#
[p]

[md name="mary" face="悲しみ"]

#
[r]
[p]

#
[r]
[p]

[md name="mary" face="微笑み"]

#
[r]
[p]

#
[p]

[md name="mary" face="悲しみ"]

#	
[font size="18"]

[resetfont]
[p]

#
[r]
[p]

[chara_hide name="mary"]

[md name="maria" face="焦り"]

#
[p]

#
[r]
[p]

[md name="maria" face="悲しみ"]


#
[p]

[chara_hide name="maria"]

#
[r]
[p]


;=======================================
[fadeoutbgm ]
[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide name="alan" time=10]
[chara_hide name="maria" time=10 ]

[wait time=2000 ]

[playbgm  volume=15   storage="M21_FinalMix.ogg" ]

[bg storage="HF04_078.png" time=10] 

[mask_off time=2000 ]


#

[r]
[p]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=true]

#
[r]
[p]

[playse volume=50 storage="se/dash-in-room1.ogg" ]
[wse]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_do" wait=true]

[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

[v storage="130"]

#
[font size=36]マリア……！
[resetfont]
[p]

[md name="maria" face="笑顔"]
[md name="alan" face="無表情"]

#
[p]

#
[r]
[p]

[chara_hide_all ]

[eval exp="sf.alan_cg_2=true" ]
[bg storage="alan2.png" ]

#
[r]
[r]
[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
[r]
[p]

[v storage="135"]

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

#
[r]
[p]

[v storage="139"]

#
[p]

[v storage="140"]

#
[p]

[v storage="141"]

#
[p]

#
[r]
[p]

[v storage="143"]

#
[r]
[p]

[v storage="144"]

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
[p]

#

[p]

[v storage="149"]

;@quake_camera

#	
[font size="36"]お前の人生、俺にくれ！
[resetfont]
[p]

[free_layermode time=1000 ]


#


[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text=""  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="" target="*select_03_02" ]

[s]

*select_03_01
[cm]

[bg storage="HF04_078.png"]
[playbgm  volume=15   storage="M17_FinalMix.ogg" ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=false]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

#
[r]
[p]

#
[r]
[p]

#
[r]
[p]

[md name="maria" face="微笑み"]

#
[p]

[md name="maria" face="笑顔"]

#
[r]
[p]

[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

[celanim anim="blue_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="blue_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]

[md name="alan" face="照れ"]

#
[p]

[md name="maria" face="微笑み"]
[md name="alan" face="微笑み"]

[v storage="154"]

#
[p]

[md name="maria" face="笑顔"]

#
[r]
[p]

#
[r]
[p]

#
[r]
[p]

@jump target="common_03"

*select_03_02
[cm]

[bg storage="HF04_078.png"]
[playbgm  volume=15   storage="M17_FinalMix.ogg" ]


[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=true]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

#
[r]
[p]

[md name="maria" face="悲しみ"]

#
[r]
[p]

[md name="alan" face="悲しみ"]

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
[r]
[r]
[p]

#
[r]
[p]

[md name="maria" face="無表情"]

#
[p]

#
[r]
[p]

#
[r]
[p]

[md name="maria" face="微笑み"]
[md name="alan" face="照れ"]

#
[p]

[md name="alan" face="微笑み"]

#
[r]
[p]

#
[r]
[p]

[md name="alan" face="微笑み"]

#
[p]

[md name="maria" face="笑顔"]

#
[r]
[r]
[p]

#
[r]
[p]

*common_03

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




