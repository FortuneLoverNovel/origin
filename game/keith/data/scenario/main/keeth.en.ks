
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

#Keith	
You're cute. Which family are you from?[p]
[playbgm  volume=15   storage="M30_FinalMix.ogg" ]

#Maria
Huh... um...?[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]


#
The boy who appeared in front of her[r]
suddenly said that,[r]
and Maria's mind went blank for a moment.[p]

#
Maria stared at the boy intently[r]
and suddenly realized who he was.[p]

#
He was Keith Claes,[l][r]
the heir to the Claes dukedom, and the stepbrother of[r]
Lady Katarina Claes, the fiancée of Prince Geordo.[p]

#
With a confident smile, Keith leaned closer to Maria.[p]

[v storage="h2"]

#Keith
Hey, why don't you play with me for a bit?[p]

#
Keith touched Maria's chin[r]
and tried to lift it, but—[p]

[free_layermode time=1000 ]

#Maria	
(What should I do?)

[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="Run away"  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="See what happens" target="*select_01_02" ]

[s]

;逃げる
*select_01_01
[cm]

[bg storage="HF04_034_r.png" ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_do" wait=false]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_def" wait=true]

#Maria
N-no, thank you![p]

[md name="maria" face="焦り"]

#
Maria hurriedly stepped back from Keith.[p]

#Maria
[r]
[p]

[celanim anim="yellow_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="yellow_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#Keith	
Oh? You're telling *me* 'no, thank you'?[p]

#
Keith glanced at his empty hand[r]
and raised an amused eyebrow.[p]

[md name="keeth" face="無表情"]

#Maria
I'm not a noble or anything, just a common girl.[p]

#Maria
[r]
be worthy of someone like you, Lord Keith![p]

[md name="maria" face="焦り"]

#
Maria quickly rattled off her excuses.[p]

[md name="maria" face="悲しみ"]
[md name="keeth" face="無表情"]

#
[r]
[r]
[p]

[md name="maria" face="焦り"]
[md name="keeth" face="微笑み"]

#Maria
Um, um, I...[r]
I have class, so I must be going...![p]

#
Maria gave Keith a quick bow[r]
and quickly turned to run.[p]

[jump target="*common_01"]

;;;;;;;;;;;様子を見る
*select_01_02
[cm]

[bg storage="HF04_034_r.png" ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=false]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_def" wait=true]


#Maria
[r]
[p]

[md name="maria" face="焦り"]

#
[r]
[r]
[p]

#
I don't know what he'll do to me, but...[r]
Not knowing made Maria tightly shut her eyes[r]
and curl up slightly.[p]

[chara_hide_all]

[bg storage="black.png" time="100"]
	
#
—But no matter how long she waited, nothing happened.[p]

#Maria
[p]

[bg storage="HF04_034_r.png" time=2000]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=false]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_ai" wait=true]

[md name="maria" face="悲しみ"]
[md name="keeth" face="悲しみ"]

#
[r]
Keith was there, shrugging awkwardly.[p]

[md name="maria" face="焦り"]


;[v storage="h2"]

#Keith
Don't react like that.[r]
It's like I'm bullying you or something.[r]
I wouldn't do anything bad to a lady.[p]

[md name="maria" face="驚き"]
[md name="keeth" face="微笑み"]

#Keith
...Or were you actually expecting something?[p]

[md name="maria" face="焦り"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Maria
—![p]

#Maria
[p]

[md name="maria" face="怒り"]

#Maria
Um! I...[r]
I have class, so I must go![p]


#
Maria jumped back from Keith[r]
and quickly turned and ran.[p]

*common_01

[chara_hide name="maria"]

[md name="keeth" face="無表情"]

[v storage="h1"]

#Keith
Hmph...[p]

#
Rejecting my offer, huh?[r]
Keith raised an eyebrow.[p]

#
Keith, surprised by her reaction,[r]
watched Maria's retreating back with the eyes of a predator.[r]
like a cat watching its prey.[p]

#
He took a few steps forward.[r]
Keith picked up the handkerchief[r]
Maria had dropped.[p]

[md name="keeth" face="微笑み"]

#Keith
Hmm. It's cheap, but it's got nice taste.[p]

#
Looking at the name 'Maria' embroidered on it,[r]
Keith grinned slyly,[r]
a mischievous smile on his face.[p]

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
Maria had a problem.[r]
And now, she was facing it.[p]

[chara_show  name="kata" face="hamehura_Catalina_cos1_aku" top="&f.top" left="&f.right" ]


[v storage="19"]

#Katarina
For a commoner—[p]

#
Lady Katarina and[r]
her group of noble ladies[r]
surrounded Maria with hostile glares.[p]

#
Oh, it's happening again today...[r]
Maria looked down and bit her lip.[p]

[md name="kata" face="怒り"]

[v storage="22"]

#Katarina
Just because you have light magic power,[r]
don't get ahead of yourself![p]

#
They treated Maria as their sworn enemy,[r]
always throwing cruel words at her[r]
whenever they could.[p]

#
They were all noble ladies from prestigious families.[r]
For a commoner like Maria, even if their insults were unjust,[r]
she couldn't talk back.[p]

#Maria
(It'll be okay...)[p]

[chara_hide name="kata" pos_mode=false ]

[chara_show name="reijo1" top="&f.top" left="&f.right" face="hamehura_DVDmob1_do"]

#Noble Lady 1

The student council must feel so sorry[r]
for being forced to deal with you![p]

#Maria
(If I just stay quiet today...[p]

[chara_hide name="reijo1"  pos_mode=false]
[chara_show name="reijo2" top="&f.top" left="&f.right" face="hamehura_DVDmob2_do" ]

#Noble Lady 2
That's right![r]
Your grades were probably only good[r]
because they favored you for your magic![p]

#Maria
[r]
[p]

#
But—[r]
Today was more tense than usual.[l][r]
The noble girls' shrill voices escalated.[p]


[chara_hide_all]

[playbgm volume=15 storage="M43_FinalMix.ogg" ]

#
Finally—[p]

[chara_show time=1000 name="maria" face="hamehura_Maria_cos1_ase" top="&f.top" left="&f.left" wait=false]
[chara_show time=1000 name="kata" face="hamehura_Catalina_cos1_aku2" top="&f.top" left="&f.right" wait=true]

;[md name="maria" face="焦り"]
;[md name="kata" face="悪役顔2"]

[v storage="32"]

#Katarina
I can't stand that victim face of yours![r]
Show her where she belongs![r]
Make her understand her place.[p]

[chara_hide name="kata"  pos_mode=false]

[chara_show name="reijo3" top="&f.top" left="&f.right" face="hamehura_DVDmob3_def" ]

#
Katarina arrogantly commanded her followers,[r]
[p]

#
One of the girls gave a malicious smile[r]
and raised her hand.[p]

#
A faint flicker—[p]

A flame ignited in her hand.[r]
She launched an aggressive fire spell at Maria—![p]

[mask time=100 color="red"]
[wait time=100]
[mask_off time=100]
[wait time=100]

[mask time=100 color="red"]
[wait time=100]
[mask_off time=1000]
[wait time=100]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Maria
—![p]

[chara_hide name="reijo3" wait=false wait=false]
[chara_hide name="maria"  wait=true wait=true]

[bg storage="black.png" time=100]	

#
Maria squeezed her eyes shut tightly.[p]

#
But the pain never came.[p]

[bg storage="HF05_068_r.png"]

[chara_show time=10 name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_odo"]


#
When she cautiously opened her eyes,[r]
there was a massive wall of earth in front of her.[r]
[p]

[chara_show name="kata" face="hamehura_Catalina_cos1_odo" top="&f.top" left="&f.right" ]


[kanim_chara layer=0 name="kata" keyframe=quake time=300 count=1 easing=linear]
[v storage="42"]

#Katarina
Wh-what...!?[p]

#
No, it wasn't just a wall.[r]
It was a giant figure made of earth magic[r]
that stood as a shield to protect Maria.[p]

[chara_show name="kata" face="hamehura_Catalina_cos1_odo" top="&f.top" left="&f.right" ]

[md name="maria" face="焦り"]

@quake_camera

[playse storage="se/rock-crack1.ogg" ]

#
The earthen figure raised its massive arm.[p]

#
If that arm hit someone—[p]

[md name="kata" face="悲しみ"]

#Katarina
Eek...!![p]

[playse storage="se/dash-asphalt2.ogg" ]
[chara_hide name="kata"]


#
Without needing to imagine what would happen, Katarina and the others[r]
turned pale and screamed,[r]
running away like scattered spiders...[p]

[md name="maria" face="悲しみ"]


#Maria
Um...[p]

[md name="maria" face="焦り"]

#
Maria tried to speak to the earthen figure that had saved her.[r]
But the figure remained silent and gently lifted Maria.[p]

[md name="maria" face="驚き"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

[chara_move name="maria" top=-180 effect="easeOutQuart" anim=true]

[playse storage="se/nadare.ogg" ]

#Maria
Kyaa...!?[p]

#
Maria was startled, but the figure's arms were gentle[r]
and she realized it meant no harm, allowing it to carry her.[r]
	[p]

[bg storage="HF04_292.png"]

[md name="maria" face="焦り"]

[playse storage="se/nadare.ogg" ]

#
The earthen figure stopped at the corner of the courtyard.[r]
As it melted back into the ground,[r]
it carefully set Maria down.[p]


[playbgm volume=15 storage="M21_FinalMix.ogg" ]

[chara_move name="maria" top="&f.top" effect="easeOutQuart" anim=true]


#？？？
...It doesn't seem like you're hurt, right?[p]

#
Suddenly, a voice spoke up,[r]
and Maria turned toward it.[p]

[md name="maria" face="驚き"]

[chara_move name="maria" left="&f.left" ]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_ai" ]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Maria
Lord Keith...!?[p]

[md name="keeth" face="無表情"]

[v storage="h3"]

#Keith
...Sigh.[r]
I was just coming to return the handkerchief I picked up,[r]
but I stumbled onto *that* scene instead.[p]

#Maria
Lord Keith, did you save me?[p]

[md name="maria" face="焦り"]
[md name="keeth" face="悲しみ"]

#Keith
Well... I guess you could say that.[r]
But keep it a secret, okay?[p]

#Keith
I mean, after all... Katarina's technically my sister, right?[r]
If it gets out that I helped you,[r]
it could cause some problems for me.[p]

[md name="maria" face="悲しみ"]


#
That's why I didn't get involved directly.[r]
I sent the earthen figure instead, Keith explained.[p]

[md name="maria" face="無表情"]
[md name="keeth" face="驚き"]

#
...But then, the Maria in front of him suddenly[r]
started to shed large tears.[r]
Keith panicked,[p]

[md name="maria" face="泣き"]

#Maria
Ah—no, I'm sorry.[r]
I should be thanking you, but...[p]

[md name="keeth" face="無表情"]

#
Maria tried to stop her tears,[r]
but they kept flowing one after the other.[p]

[md name="keeth" face="悲しみ"]

[v storage="h5"]

#Keith
Maria...[p]

#
Seeing Maria's trembling shoulders, Keith[r]
realized just how much fear she must have felt earlier.[r]
[p]

[md name="maria" face="悲しみ"]

#Keith
(Just how much anxiety and fear...[r]
[p]

[md name="maria" face="泣き"]

#Keith
You've been enduring it all alone too, haven't you...?[p]

#
As he saw himself in Maria's circumstances,[r]
Keith couldn't bring himself to leave her be.[r]
[p]

#
Keith hesitantly reached out his hand,[r]
but then firmly hugged Maria.[p]

[v storage="69"]

#Keith
...You held up well. You must've been scared.[r]
But it's okay now.[p]

#
His hand awkwardly stroked Maria's hair.[r]
But Keith was trying his hardest to comfort her.[p]

#Keith
So, you know...[r]
stop crying, okay?[p]

[md name="maria" face="悲しみ"]

#
The usually flirtatious Keith[r]
now had an unfamiliar air of awkwardness.[p]

#
But Maria was deeply moved by his sincere effort to comfort her.[r]
[p]

[md name="keeth" face="微笑み" ]

#
That sense of security stopped her tears before she even realized it.[r]
Maria wiped her eyes with her fingertips and looked up at Keith.[p]

#Maria


[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text="Thank you."  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="Why did you help me?" target="*select_02_02" ]

[s]

;ありがとうございます。
*select_02_01
[cm]

[md name="keeth" face="無表情"]

#Maria
...Thank you, Lord Keith.[r]
If you hadn't saved me, I don't know what would've happened to me...[p]

#Maria
I don't even know how to thank you enough...[p]

#
Maria's voice, still shaky from crying,[r]
was still a little moist, but[r]
she earnestly expressed her gratitude to Keith.[p]

#Keith
Well... it's nothing.[r]
Seeing a girl go through something like that[r]
and just standing by would feel wrong...[p]

[md name="maria" face="驚き"]


#
Keith turned away from Maria.[p]


[celanim anim="yellow_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="yellow_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]

#
But his profile, slightly flushed,[r]
was tinged with embarrassment.[p]

[md name="keeth" face="微笑み"]

#Keith
Well, at least you didn't get hurt, right?[p]

[md name="maria" face="微笑み"]

#
Even though he said it like that,[r]
there was a sense of relief in his words.[p]

#
Maria couldn't help but smile[r]
at his awkward kindness.[p]


[jump target="*common_02"]

;(jump:合流)

;どうして助けてくれたんですか
*select_02_02
[cm]

[md name="maria" face="悲しみ"]
[md name="keeth" face="無表情"]

#Maria
Um... Lord Keith.[r]
Why did you[r]
help me?[p]

#
Lady Katarina is Keith's stepsister.[r]
Keith's actions earlier clearly went against[r]
Katarina.[p]

#
Even though he's her stepbrother,[r]
those actions could be problematic for him.[r]
[p]

#Keith
Well... it's nothing.[r]
Seeing a girl go through something like that[r]
and just standing by would feel wrong...[p]

[md name="maria" face="驚き"]
[md name="keeth" face="怒り"]

#Keith
...That was my own choice.[r]
You don't need to worry[r]
or feel guilty about it, okay?[p]

#
Even though his words were clumsy,[r]
there was a sense of care for Maria in them.[r]
[p]

[md name="maria" face="微笑み"]
[md name="keeth" face="無表情"]


#Maria
...Thank you, Lord Keith.[p]

[md name="keeth" face="微笑み"]

#Keith
You're welcome.[p]

#
Keith turned away from Maria again.[r]
But his profile, slightly flushed,[r]
was tinged with embarrassment.[p]

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
Graduation day is approaching.[r]
The academy was buzzing with activity.[p]

[chara_show time=10 name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu"]

#Maria
Phew...[p]

#
Recently, Maria had been busy with student council work.[r]
[p]

#
Now she was on a break.[r]
She gazed out at the garden from the hallway to clear her mind.[p]

[chara_hide name="maria"]

[v storage="83"]

#
...And then, at that moment.[p]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_mu" ]

#Keith
...[p]

[chara_hide name="keeth"]

[chara_show  name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_odo"]

#Maria
Lord Keith...?[p]

#
She saw Keith walking toward the garden.[r]
[p]

[md name="maria" face="悲しみ"]

#Maria	
[r]
[p]

[md name="maria" face="無表情"]

#
Wanting to talk to him after so long,[r]
Maria followed him to the garden.[p]

[bg storage="HF08_044.png"]

[md name="maria" face="照れ"]

#Maria	
[r]
[p]

#
She quietly approached him from behind,[r]
thinking she'd surprise him with a 'Boo!'[r]
Maria thought of this plan.[p]

[md name="maria" face="微笑み"]

#
It seemed Keith was on the other side of the flower bushes.[r]
[p]

#
Then, she heard Keith muttering[r]
something quietly.[p]

[chara_hide name="maria"]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_mu" wait=true]

[v storage="93"]

#Keith
Please marry me.[p]

[md name="keeth" face="悲しみ"]

[v storage="94"]

#Keith
...Hmm, too simple?[p]

[v storage="95"]

[md name="keeth" face="無表情"]

#Keith
Join me in the same grave.[p]

[md name="keeth" face="悲しみ"]

[v storage="96"]

#Keith
...Too heavy? She'll probably run away...[p]

[md name="keeth" face="微笑み"]

[v storage="97"]

#Keith
You're my beautiful first star...[p]

[md name="keeth" face="悲しみ"]

[v storage="98"]

#Keith
Ugh, too cheesy. No way.[p]

#
Those were unmistakably proposal words.[r]
It seemed Keith was[r]
practicing a confession.[p]

[chara_hide name="keeth"]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" ]

#
Having witnessed something unexpected,[r]
Maria tried to quietly back away, but...[p]

[md name="maria" face="驚き"]

[playse storage="se/kioru.ogg"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
[p]

#
She stepped on a small branch.[p]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_do" wait=true]

[md name="maria" face="焦り"]
@quake_camera

[v storage="101"]

#Keith
I-is someone there!?[p]

#
Keith's voice was clearly flustered as he peeked through the bushes.[l][r]
And when he saw Maria there,[r]
his voice grew even higher.[p]

[md name="keeth" face="驚き"]

[v storage="103"]

[playbgm  volume=15   storage="M09_FinalMix.ogg" ]

[kanim_chara layer=0 name="keeth" keyframe=quake time=300 count=1 easing=linear]

#Keith
[p]

[md name="keeth" face="照れ"]

#
Keith's face turned bright red.[r]
Maria had never seen him look like this before.[p]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Maria	
Um, sorry![r]
I'll forget what I just saw![p]

#
Maria hurriedly spoke.[r]
But—[p]

[md name="maria" face="悲しみ"]
[md name="keeth" face="無表情"]

#
A prick of pain stabbed her heart.[p]

#Maria
[p]

#
An awkward silence hung in the air for a moment.[l][r]
Maria looked down and quickly[r]
tried to leave.[p]

#
[p]

[md name="keeth" face="怒り"]

[v storage="111"]

#Keith
Wait.[p]

[md name="maria" face="驚き"]

@quake_camera

#
Keith grabbed Maria's hand.[p]

[md name="maria" face="悲しみ"]

[v storage="113"]

#Keith	
L-listen...[r]
It seems like you've misunderstood something, so[r]
[p]

[v storage="114"]

[kanim_chara layer=0 name="keeth" keyframe=quake time=300 count=1 easing=linear]

#Keith	
[r]
All of that was because of you![p]

[md name="maria" face="驚き"]

#Maria
Huh...?[p]

[md name="keeth" face="無表情"]

#
Maria stared blankly at Keith.[p]

#
Keith turned his face away, embarrassed.[l][r]
But his ears were bright red,[r]
and the hand that held Maria's was burning hot.[p]

[v storage="118"]

#Keith	
...Tomorrow. Tomorrow, I'll do it properly,[r]
[r]
[p]

[chara_hide name="keeth"]

[md name="maria" face="焦り"]

#
With that,[r]
Keith let go of Maria's hand[r]
and quickly walked away.[p]

#Maria	
...[r]
Wait, what do you mean, my fault...?[p]

#
[r]
[p]

[md name="maria" face="驚き"]
[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Maria
—Wha!![p]

[md name="maria" face="照れ"]

#
Maria's face turned bright red.[p]

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
As she remembered what had happened yesterday,[r]
Maria felt her face heat up.[p]

[md name="maria" face="無表情"]

#
Just as she had promised Keith,[r]
Maria was at the same place as yesterday.[p]

#
What was about to happen...[r]
She wasn't too naive to know.[p]

[md name="maria" face="悲しみ"]

#Maria	
[r]
[p]

#
As she nervously waited,[r]
she heard footsteps approaching.[p]

[playse storage="se/dash-asphalt2.ogg"]
[wse]

[chara_move name="maria" left="&f.left" ]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_mu" wait=true]

#
It was Keith.[l][r]
[r]
[p]

[md name="keeth" face="悲しみ"]

[v storage="142"]

#Keith	
[r]
[r]
[p]

#
[p]

[v storage="140"]

[md name="maria" face="驚き"]
[md name="keeth" face="無表情"]

#Keith
[p]

[kanim_chara layer=0 name="keeth" keyframe=quake time=300 count=1 easing=linear]

#
[p]

#
[p]

[md name="maria" face="照れ"]

#Maria
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

#Keith
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
That's why
[p]

#
[r]
[p]

#
[p]

[v storage="129"]

#Keith	
[r]
[p]


[chara_hide_all]

[bg storage="keeth2.png"]
[eval exp="sf.keeth_cg_2=true" ]

[v storage="145"]

#Keith	
[r]
[r]
[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]


[v storage="146"]

#Keith	
[r]
[r]
[p]

#
[l][r]
[r]
[p]

#
[p]

#Maria
[p]

[v storage="150"]

#Keith
[p]

[v storage="151"]

#Keith	
[r]
[r]
[p]

[v storage="152"]

#Keith
[p]

#Maria
[p]

#Maria


[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text="I'd be happy to accept."  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="Are you really sure about this?" target="*select_03_02" ]

[s]

;喜んでお受けします
*select_03_01
[cm]

#
[r]
[p]

#Maria
[r]
[p]

[v storage="156"]


#Keith
[p]

@wait time=200

[love_up]

#
[r]
[r]
[p]

[v storage="158"]

#Keith
[p]

#
[r]
[p]

[v storage="160"]

#Keith
[p]

#
[p]

#Maria
[p]

#
[p]

[jump target="*common_03"]


;本当にいいんですか？
*select_03_02
[cm]

#Maria
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

#Keith
[r]
[r]
[p]

#Maria
[p]

#Keith
[r]
[p]

#Keith
[r]
[r]
[p]

#Maria
[p]

#Keith
[p]

#Maria
[p]

#
[l][r]
[r]
[p]

#
[p]

[v storage="158"]

#Keith
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




