
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

#Кит	
Ты милая. Из какой ты семьи?[p]
[playbgm  volume=15   storage="M30_FinalMix.ogg" ]

#Мария
Э... это...?[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]


#
Юноша, появившийся перед ней,[r]
внезапно так сказал,[r]
и на мгновение разум Марии помутнел.[p]

#
Мария внимательно посмотрела на юношу[r]
и внезапно осознала, кто он.[p]

#
Это был Кит Клаес,[l][r]
наследник дома Клаес и сводный брат[r]
леди Катарины Клаес, невесты принца Джордо.[p]

#
Кит с уверенной улыбкой наклонился к Марии.[p]

[v storage="h2"]

#Кит
Эй, давай поиграем немного?[p]

#
Кит прикоснулся к подбородку Марии[r]
и попытался поднять её лицо, но—[p]

[free_layermode time=1000 ]

#Мария	
(Что же мне делать?)

[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="Убежать"  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="Остаться и посмотреть" target="*select_01_02" ]

[s]

;逃げる
*select_01_01
[cm]

[bg storage="HF04_034_r.png" ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_do" wait=false]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_def" wait=true]

#Мария
Н-нет, спасибо![p]

[md name="maria" face="焦り"]

#
Мария в спешке отступила от Кита на полшага.[p]

#Мария
(He's the heir of the Claes family.[r]
He must be teasing me...!)[p]

[celanim anim="yellow_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="yellow_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#Кит	
Ого? Ты говоришь *мне* «нет, спасибо»?[p]

#
Кит посмотрел на свою пустую руку[r]
и насмешливо приподнял бровь.[p]

[md name="keeth" face="無表情"]

#Мария
Я не дворянка, я простая девушка.[p]

#Мария
There's no way I could ever[r]
быть достойной такого, как вы, Кит-сама![p]

[md name="maria" face="焦り"]

#
Мария быстро начала лепетать оправдания.[p]

[md name="maria" face="悲しみ"]
[md name="keeth" face="無表情"]

#
In reality, offending the Claes family[r]
could cost a commoner like her her life.[r]
[p]

[md name="maria" face="焦り"]
[md name="keeth" face="微笑み"]

#Мария
Эм, э-эм, я...[r]
Мне нужно на занятия, так что прошу меня извинить...![p]

#
Мария быстро поклонилась Киту[r]
и быстро развернулась, чтобы убежать.[p]

[jump target="*common_01"]

;;;;;;;;;;;様子を見る
*select_01_02
[cm]

[bg storage="HF04_034_r.png" ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=false]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_def" wait=true]


#Мария
(He's the heir to the Claes family...[r]
What if rejecting him causes problems...?)[p]

[md name="maria" face="焦り"]

#
Offending the Claes family[r]
would be more than a commoner could handle.[r]
[p]

#
Я не знаю, что он сделает, но...[r]
От этой неизвестности Мария крепко зажмурилась[r]
и сжалась в комочек.[p]

[chara_hide_all]

[bg storage="black.png" time="100"]
	
#
—Но сколько бы она ни ждала, ничего не происходило.[p]

#Мария
(Huh...?)[p]

[bg storage="HF04_034_r.png" time=2000]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=false]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_ai" wait=true]

[md name="maria" face="悲しみ"]
[md name="keeth" face="悲しみ"]

#
When she cautiously opened her eyes,[r]
перед ней стоял Кит, неловко пожимая плечами.[p]

[md name="maria" face="焦り"]


;[v storage="h2"]

#Кит
Не реагируй так.[r]
Будто я тебя обижаю.[r]
Я бы не сделал ничего плохого леди.[p]

[md name="maria" face="驚き"]
[md name="keeth" face="微笑み"]

#Кит
...Или ты на самом деле чего-то ожидала?[p]

[md name="maria" face="焦り"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Мария
—![p]

#Мария
(He's teasing me!)[p]

[md name="maria" face="怒り"]

#Мария
Э-э! Я...[r]
Мне нужно на занятия, так что прошу меня извинить![p]


#
Мария отскочила от Кита[r]
и быстро развернулась и убежала.[p]

*common_01

[chara_hide name="maria"]

[md name="keeth" face="無表情"]

[v storage="h1"]

#Кит
Хм...[p]

#
Отказаться от моего предложения, да?[r]
Кит приподнял бровь.[p]

#
Кит, удивлённый её реакцией,[r]
смотрел ей вслед, как хищник.[r]
словно кот, следящий за своей добычей.[p]

#
Он сделал несколько шагов вперёд.[r]
Кит поднял платочек,[r]
который Мария уронила.[p]

[md name="keeth" face="微笑み"]

#Кит
Хм. Дёшево, но со вкусом.[p]

#
Посмотрев на имя «Мария», вышитое на платке,[r]
Кит хитро ухмыльнулся[r]
с хитрой улыбкой на лице.[p]

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
У Марии была проблема.[r]
И сейчас она столкнулась с ней лицом к лицу.[p]

[chara_show  name="kata" face="hamehura_Catalina_cos1_aku" top="&f.top" left="&f.right" ]


[v storage="19"]

#Катарина
Для простолюдинки—[p]

#
Леди Катарина и[r]
её свита благородных девушек[r]
окружили Марию враждебными взглядами.[p]

#
Ах, опять это.[r]
Мария опустила голову и прикусила губу.[p]

[md name="kata" face="怒り"]

[v storage="22"]

#Катарина
Думаешь, раз у тебя есть сила света,[r]
можешь задирать нос![p]

#
Они возненавидели Марию[r]
и всякий раз осыпали её жестокими словами,[r]
когда только была возможность.[p]

#
Все они были благородными девицами из знатных семей.[r]
Для простолюдинки, как Мария, даже если их оскорбления были несправедливы,[r]
ей не позволено было ответить.[p]

#Мария
(Всё будет хорошо...)[p]

[chara_hide name="kata" pos_mode=false ]

[chara_show name="reijo1" top="&f.top" left="&f.right" face="hamehura_DVDmob1_do"]

#Девица 1

Наверняка студсовету очень жаль,[r]
что им приходится с тобой общаться![p]

#Мария
(Если я просто буду молчать...)[p]

[chara_hide name="reijo1"  pos_mode=false]
[chara_show name="reijo2" top="&f.top" left="&f.right" face="hamehura_DVDmob2_do" ]

#Девица 2
Верно![r]
И твои оценки на тестах, наверное, хорошие только потому,[r]
что тебя поддерживали из-за твоей магии![p]

#Мария
(Once they've said their fill,[r]
they'll leave...)[p]

#
Но—[r]
Сегодня было особенно неспокойно.[l][r]
Резкие голоса благородных девиц становились всё громче.[p]


[chara_hide_all]

[playbgm volume=15 storage="M43_FinalMix.ogg" ]

#
И, наконец—[p]

[chara_show time=1000 name="maria" face="hamehura_Maria_cos1_ase" top="&f.top" left="&f.left" wait=false]
[chara_show time=1000 name="kata" face="hamehura_Catalina_cos1_aku2" top="&f.top" left="&f.right" wait=true]

;[md name="maria" face="焦り"]
;[md name="kata" face="悪役顔2"]

[v storage="32"]

#Катарина
Меня бесит твоё выражение «жертвы»![r]
Покажи ей её место![r]
Дай ей понять, где её место.[p]

[chara_hide name="kata"  pos_mode=false]

[chara_show name="reijo3" top="&f.top" left="&f.right" face="hamehura_DVDmob3_def" ]

#
Катарина высокомерно приказала своей свите.[r]
[p]

#
Одна из девушек злобно усмехнулась[r]
и подняла руку.[p]

#
Мерцание—[p]

В её руке вспыхнуло пламя.[r]
Она выпустила в Марию агрессивное заклинание огня—![p]

[mask time=100 color="red"]
[wait time=100]
[mask_off time=100]
[wait time=100]

[mask time=100 color="red"]
[wait time=100]
[mask_off time=1000]
[wait time=100]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Мария
—![p]

[chara_hide name="reijo3" wait=false wait=false]
[chara_hide name="maria"  wait=true wait=true]

[bg storage="black.png" time=100]	

#
Мария крепко зажмурилась.[p]

#
Но боль так и не пришла.[p]

[bg storage="HF05_068_r.png"]

[chara_show time=10 name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_odo"]


#
Когда она осторожно открыла глаза,[r]
перед ней возвышалась огромная стена земли.[r]
[p]

[chara_show name="kata" face="hamehura_Catalina_cos1_odo" top="&f.top" left="&f.right" ]


[kanim_chara layer=0 name="kata" keyframe=quake time=300 count=1 easing=linear]
[v storage="42"]

#Катарина
Ч-что...!?[p]

#
Нет, это была не просто стена.[r]
Это была огромная фигура, созданная из земляной магии,[r]
которая стояла перед ней, защищая её.[p]

[chara_show name="kata" face="hamehura_Catalina_cos1_odo" top="&f.top" left="&f.right" ]

[md name="maria" face="焦り"]

@quake_camera

[playse storage="se/rock-crack1.ogg" ]

#
Глиняная фигура подняла массивную руку.[p]

#
Если бы эта рука обрушилась на кого-то—[p]

[md name="kata" face="悲しみ"]

#Катарина
Ах...!![p]

[playse storage="se/dash-asphalt2.ogg" ]
[chara_hide name="kata"]


#
Не представляя даже, что могло бы произойти, Катарина и другие[r]
побледнели и закричали,[r]
разбегаясь, как испуганные пауки...[p]

[md name="maria" face="悲しみ"]


#Мария
Эм, извините...[p]

[md name="maria" face="焦り"]

#
Мария попыталась заговорить с глиняной фигурой, которая, казалось, её спасла.[r]
Но фигура молчала и осторожно подняла Марию.[p]

[md name="maria" face="驚き"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

[chara_move name="maria" top=-180 effect="easeOutQuart" anim=true]

[playse storage="se/nadare.ogg" ]

#Мария
Кья...!?[p]

#
Мария была напугана, но руки фигуры были нежны[r]
и, поняв, что в этом не было враждебности, позволила ему нести её куда-то.[r]
	[p]

[bg storage="HF04_292.png"]

[md name="maria" face="焦り"]

[playse storage="se/nadare.ogg" ]

#
Глиняная фигура остановилась в углу двора.[r]
Когда она вновь растеклась в землю,[r]
она осторожно опустила Марию.[p]


[playbgm volume=15 storage="M21_FinalMix.ogg" ]

[chara_move name="maria" top="&f.top" effect="easeOutQuart" anim=true]


#？？？
...Похоже, ты не ранена, да?[p]

#
Неожиданно раздался голос,[r]
и Мария повернулась на его источник.[p]

[md name="maria" face="驚き"]

[chara_move name="maria" left="&f.left" ]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_ai" ]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Мария
Кит-сама...!?[p]

[md name="keeth" face="無表情"]

[v storage="h3"]

#Кит
...Ха.[r]
Я просто хотел вернуть платок, который подобрал,[r]
но вместо этого я оказался свидетелем *этого*.[p]

#Мария
Кит-сама, вы спасли меня?[p]

[md name="maria" face="焦り"]
[md name="keeth" face="悲しみ"]

#Кит
Ну... думаю, можно сказать и так.[r]
Но не говори никому, хорошо?[p]

#Кит
В конце концов... Катарина всё же моя сестра.[r]
Если станет известно, что я помог тебе,[r]
это может вызвать для меня проблемы.[p]

[md name="maria" face="悲しみ"]


#
Вот почему я не вмешался напрямую.[r]
Я послал глиняную фигуру, объяснил Кит.[p]

[md name="maria" face="無表情"]
[md name="keeth" face="驚き"]

#
...Но внезапно Мария перед ним[r]
начала проливать крупные слёзы.[r]
Кит растерялся,[p]

[md name="maria" face="泣き"]

#Мария
Ах—нет, простите.[r]
Мне надо было поблагодарить вас, но...[p]

[md name="keeth" face="無表情"]

#
Мария пыталась сдержать слёзы,[r]
но они всё текли и текли.[p]

[md name="keeth" face="悲しみ"]

[v storage="h5"]

#Кит
Мария...[p]

#
Смотря на дрожащие плечи Марии, Кит[r]
осознал, сколько же страха она испытала.[r]
[p]

[md name="maria" face="悲しみ"]

#Кит
(Сколько же страха и тревоги...[r]
this girl must have been feeling all alone...)[p]

[md name="maria" face="泣き"]

#Кит
Ты тоже терпела всё это одна, да...?[p]

#
Отождествляя её ситуацию со своей,[r]
Кит не мог просто оставить её одну.[r]
[p]

#
Кит неуверенно протянул руку,[r]
но затем крепко обнял Марию.[p]

[v storage="69"]

#Кит
...Ты молодец. Должно быть, тебе было страшно.[r]
Но теперь всё хорошо.[p]

#
Его рука неловко погладила волосы Марии.[r]
Но Кит изо всех сил старался её утешить.[p]

#Кит
Так что, ну...[r]
хватит плакать, ладно?[p]

[md name="maria" face="悲しみ"]

#
Обычно ветреный Кит[r]
сейчас выглядел неловко.[p]

#
Но Мария была глубоко тронута его искренними усилиями её утешить.[r]
[p]

[md name="keeth" face="微笑み" ]

#
От чувства безопасности её слёзы незаметно прекратились.[r]
Мария вытерла глаза пальцами и посмотрела на Кита.[p]

#Мария
(I have to say something...)

[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text="Спасибо."  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="Почему вы мне помогли?" target="*select_02_02" ]

[s]

;ありがとうございます。
*select_02_01
[cm]

[md name="keeth" face="無表情"]

#Мария
...Спасибо вам, Кит-сама.[r]
Если бы вы меня не спасли, я не знаю, что бы со мной случилось...[p]

#Мария
Я даже не знаю, как вас отблагодарить...[p]

#
Голос Марии, ещё дрожащий от слёз,[r]
всё ещё немного дрожал, но[r]
она изо всех сил старалась выразить благодарность Киту.[p]

#Кит
Ну... ничего.[r]
Видеть, как с девушкой так поступают,[r]
и просто стоять в стороне, было бы неправильно...[p]

[md name="maria" face="驚き"]


#
Кит отвернулся от Марии.[p]


[celanim anim="yellow_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="yellow_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]

#
Но его лицо, слегка покрасневшее,[r]
смущённо порозовело.[p]

[md name="keeth" face="微笑み"]

#Кит
Ну, главное, что ты не пострадала, да?[p]

[md name="maria" face="微笑み"]

#
Несмотря на то, как он это сказал,[r]
в его словах чувствовалось облегчение.[p]

#
Мария не могла не улыбнуться[r]
его неловкой доброте.[p]


[jump target="*common_02"]

;(jump:合流)

;どうして助けてくれたんですか
*select_02_02
[cm]

[md name="maria" face="悲しみ"]
[md name="keeth" face="無表情"]

#Мария
Эм... Кит-сама.[r]
Почему вы[r]
помогли мне?[p]

#
Леди Катарина — сводная сестра Кита.[r]
Действия Кита шли вразрез с[r]
интересами Катарины.[p]

#
Хотя он и её сводный брат,[r]
его действия могли поставить его в сложное положение.[r]
[p]

#Кит
Ну... ничего.[r]
Видеть, как с девушкой так поступают,[r]
и просто стоять в стороне, было бы неправильно...[p]

[md name="maria" face="驚き"]
[md name="keeth" face="怒り"]

#Кит
...Это было моё собственное решение.[r]
Тебе не нужно волноваться[r]
или чувствовать себя виноватой, хорошо?[p]

#
Хотя его слова были неловкими,[r]
в них чувствовалась забота о Марии.[r]
[p]

[md name="maria" face="微笑み"]
[md name="keeth" face="無表情"]


#Мария
...Спасибо, Кит-сама.[p]

[md name="keeth" face="微笑み"]

#Кит
Пожалуйста.[p]

#
Кит снова отвернулся от Марии.[r]
Но его лицо, слегка покрасневшее,[r]
смущённо порозовело.[p]

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
Скоро выпускной.[r]
Академия была полна суеты.[p]

[chara_show time=10 name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu"]

#Мария
Фух...[p]

#
В последнее время Мария была занята работой в студенческом совете.[r]
[p]

#
Сейчас у неё был перерыв.[r]
Она посмотрела на сад из коридора, чтобы немного отвлечься.[p]

[chara_hide name="maria"]

[v storage="83"]

#
...И в этот момент.[p]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_mu" ]

#Кит
...[p]

[chara_hide name="keeth"]

[chara_show  name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_odo"]

#Мария
Кит-сама...?[p]

#
Она увидела, как Кит направляется в сад.[r]
[p]

[md name="maria" face="悲しみ"]

#Мария	
(Come to think of it, I've been so busy lately...[r]
I haven't had a chance to talk to Lord Keith.)[p]

[md name="maria" face="無表情"]

#
Захотев с ним поговорить после столь долгого времени,[r]
Мария последовала за ним в сад.[p]

[bg storage="HF08_044.png"]

[md name="maria" face="照れ"]

#Мария	
(Hehe...[r]
Maybe I'll play a little prank on him.)[p]

#
Она тихо приблизилась к нему сзади[r]
и решила его испугать криком «Буу!».[r]
Мария задумала это.[p]

[md name="maria" face="微笑み"]

#
Казалось, Кит был по другую сторону цветочных кустов.[r]
[p]

#
И тут она услышала, как Кит что-то бормочет[r]
себе под нос.[p]

[chara_hide name="maria"]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_mu" wait=true]

[v storage="93"]

#Кит
Пожалуйста, выйди за меня.[p]

[md name="keeth" face="悲しみ"]

[v storage="94"]

#Кит
...Мм, слишком просто?[p]

[v storage="95"]

[md name="keeth" face="無表情"]

#Кит
Покойся со мной в одном гробу.[p]

[md name="keeth" face="悲しみ"]

[v storage="96"]

#Кит
...Слишком мрачно? Наверное, отпугну её...[p]

[md name="keeth" face="微笑み"]

[v storage="97"]

#Кит
Ты моя прекрасная первая звезда...[p]

[md name="keeth" face="悲しみ"]

[v storage="98"]

#Кит
Фу, слишком слащаво. Точно нет.[p]

#
Это явно были слова предложения.[r]
Похоже, Кит[r]
репетировал признание.[p]

[chara_hide name="keeth"]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" ]

#
Став свидетелем чего-то неожиданного,[r]
Мария попыталась тихо отступить, но...[p]

[md name="maria" face="驚き"]

[playse storage="se/kioru.ogg"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
(Snap!)[p]

#
Она наступила на маленькую ветку.[p]
[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_do" wait=true]

[md name="maria" face="焦り"]
@quake_camera

[v storage="101"]

#Кит
К-кто здесь!?[p]

#
Голос Кита звучал явно обеспокоенно, когда он заглянул через кусты.[l][r]
И когда он увидел Марию,[r]
его голос стал ещё выше.[p]

[md name="keeth" face="驚き"]

[v storage="103"]

[playbgm  volume=15   storage="M09_FinalMix.ogg" ]

[kanim_chara layer=0 name="keeth" keyframe=quake time=300 count=1 easing=linear]

#Кит
W-what!? Maria!?[p]

[md name="keeth" face="照れ"]

#
Лицо Кита залилось румянцем.[r]
Мария никогда прежде не видела его таким.[p]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Мария	
Эм, простите![r]
Я забуду, что только что увидела![p]

#
Мария быстро заговорила.[r]
Но—[p]

[md name="maria" face="悲しみ"]
[md name="keeth" face="無表情"]

#
Её сердце вдруг кольнула боль.[p]

#Мария
(Lord Keith... has someone he loves...)[p]

#
На мгновение повисло неловкое молчание.[l][r]
Мария опустила голову и поспешила[r]
покинуть это место.[p]

#
But.[p]

[md name="keeth" face="怒り"]

[v storage="111"]

#Кит
Подожди.[p]

[md name="maria" face="驚き"]

@quake_camera

#
Кит схватил Марию за руку.[p]

[md name="maria" face="悲しみ"]

[v storage="113"]

#Кит	
С-слушай...[r]
Кажется, ты кое-что неправильно поняла, так что[r]
I'll just say it...[p]

[v storage="114"]

[kanim_chara layer=0 name="keeth" keyframe=quake time=300 count=1 easing=linear]

#Кит	
Ah, to hell with it.[r]
Это всё было из-за тебя![p]

[md name="maria" face="驚き"]

#Мария
Что...?[p]

[md name="keeth" face="無表情"]

#
Мария ошеломлённо посмотрела на Кита.[p]

#
Кит смущённо отвернулся.[l][r]
Но его уши были ярко-красными,[r]
а рука, державшая Марию, была горячей.[p]

[v storage="118"]

#Кит	
...Завтра. Завтра я сделаю всё как надо,[r]
so come here and take responsibility, okay?[r]
And no backing out. You don't get a say in this.[p]

[chara_hide name="keeth"]

[md name="maria" face="焦り"]

#
Сказав это,[r]
Кит отпустил руку Марии[r]
и быстро ушёл.[p]

#Мария	
...[r]
Подожди, из-за меня...?[p]

#
Left behind, Maria[r]
slowly realized the situation.[p]

[md name="maria" face="驚き"]
[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Мария
—Что!![p]

[md name="maria" face="照れ"]

#
Лицо Марии стало ярко-красным.[p]

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
Вспоминая вчерашнее,[r]
Мария почувствовала, как её лицо разгорелось.[p]

[md name="maria" face="無表情"]

#
Как и обещала Киту,[r]
Мария была на том же месте, что и вчера.[p]

#
Что же будет дальше...[r]
Она была достаточно взрослой, чтобы понять.[p]

[md name="maria" face="悲しみ"]

#Мария	
(Maybe I should've worn something nicer...[r]
before coming...)[p]

#
Пока она нервно ждала,[r]
она услышала приближающиеся шаги.[p]

[playse storage="se/dash-asphalt2.ogg"]
[wse]

[chara_move name="maria" left="&f.left" ]

[chara_show name="keeth" top="&f.top" left="&f.right" face="hamehura_Keith_cos1_mu" wait=true]

#
Это был Кит.[l][r]
He too, just like Maria,[r]
seemed a little uneasy.[p]

[md name="keeth" face="悲しみ"]

[v storage="142"]

#Кит	
Uh... Actually, I forgot to tell you yesterday...[r]
I was planning to meet you at the rose garden...[r]
but I got too flustered.[p]

#
After that excuse, he said,[p]

[v storage="140"]

[md name="maria" face="驚き"]
[md name="keeth" face="無表情"]

#Кит
Let's go.[p]

[kanim_chara layer=0 name="keeth" keyframe=quake time=300 count=1 easing=linear]

#
Keith took Maria's hand and led her through the garden.[p]

#
His hand was even warmer than yesterday and slightly sweaty.[p]

[md name="maria" face="照れ"]

#Мария
(Lord Keith is nervous...)[p]

#
His nervousness was contagious for Maria.[p]

[bg storage="HF01_026_rr.png"]

[playbgm  volume=15   storage="M10_FinalMix.ogg" ]

[md name="maria" face="無表情"]
[md name="keeth" face="無表情"]
	
#
They reached the rose garden in silence.[p]

[v storage="134"]

#Кит
...Phew.[p]


[md name="maria" face="焦り"]
[md name="keeth" face="怒り"]

#
Keith took a deep breath and faced Maria.[p]

#
His eyes were serious and tense.[r]
The face Keith had shown since yesterday[r]
was one Maria had never seen before.[p]

#
И именно поэтому
Maria's heart was racing like never before.[p]

#
Maria looked straight into Keith's eyes.[r]
She told him with her eyes that she was ready.[p]

#
Keith understood and began to speak to Maria.[p]

[v storage="129"]

#Кит	
It's not really like me to say something like this,[r]
but...[p]


[chara_hide_all]

[bg storage="keeth2.png"]
[eval exp="sf.keeth_cg_2=true" ]

[v storage="145"]

#Кит	
I love you.[r]
As a woman, I love you.[r]
I want to make you the happiest person in the world.[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]


[v storage="146"]

#Кит	
...I'm the brother of the woman who tormented you.[r]
You don't need to worry about anything.[r]
Just give me your honest answer.[p]

#
His words were simple and straightforward.[l][r]
But they were filled with concern for Maria's heart.[r]
[p]

#
Thump—Maria's heart trembled.[p]

#Мария
...Are you sure you want someone like me?[p]

[v storage="150"]

#Кит
It has to be you, Maria.[p]

[v storage="151"]

#Кит	
When you're with me, my empty heart feels full.[r]
You see me for who I am. You hold the real me close.[r]
...And that makes me incredibly happy.[p]

[v storage="152"]

#Кит
...I've never felt like this before.[p]

#Мария
Lord Keith...[p]

#Мария
(How should I answer?)

[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text="С радостью приму."  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="Ты точно уверен в этом?" target="*select_03_02" ]

[s]

;喜んでお受けします
*select_03_01
[cm]

#
Maria took a small breath[r]
and gave him a heartfelt smile.[p]

#Мария
I'd be happy to.[r]
Lord Keith, I... I love you too.[p]

[v storage="156"]


#Кит
Maria...![p]

@wait time=200

[love_up]

#
Relief, joy, and happiness filled Keith's face as[r]
he smiled and[r]
hugged Maria tightly.[p]

[v storage="158"]

#Кит
Thank you, Maria. I'll cherish you forever.[p]

#
With those words, Keith gently kissed Maria's cheek.[r]
Then, he gave Maria a playful wink.[p]

[v storage="160"]

#Кит
I'll save the kiss on the lips for our wedding day.[p]

#
Keith gently poked Maria's lips with his finger.[p]

#Мария
(That's the Keith I know.)[p]

#
Blushing, Maria felt overwhelmed with happiness.[p]

[jump target="*common_03"]


;本当にいいんですか？
*select_03_02
[cm]

#Мария
I'm touched by your feelings.[r]
But... are you really sure about this?[p]

#
Keith and Maria were of different statuses.[r]
Keith was especially the heir to a duke's house.[p]

#
Love alone wasn't enough to justify this,[r]
especially in such high positions.[p]

#
Maria cared about Keith, and that's why she was worried.[p]


[v storage="h3"]

#Кит
Sigh...[r]
Do I really seem that naive to you?[r]
That hurts...[p]

#Мария
Ah, no, I didn't mean...![p]

#Кит
I know, I know—[r]
I understand how you feel.[p]

#Кит
But...[r]
It's because you think of me like that,[r]
that I want you to be my partner for life.[p]

#Мария
Lord Keith...[p]

#Кит
I've already made up my mind. What about you?[p]

#Мария
I...[p]

#
Keith opened his arms, waiting for Maria.[l][r]
Maria paused for a moment[r]
before stepping into his arms.[p]

#
That was her answer to his feelings.[p]

[v storage="158"]

#Кит
...Thank you, Maria. I'll always cherish you.[p]

#
Held gently by Keith,[r]
Maria nodded with happiness in her heart.[p]

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




