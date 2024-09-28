
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

#Мария


Я совсем вымоталась...[p]

[playbgm  volume=15   storage="M33_FinalMix.ogg" ]


#
Мария лежала лицом на столе в углу библиотеки.[p]

#Мария
Теперь, когда экзамены закончились,[r]
я думала, что смогу наконец-то отдохнуть...[p]

[chara_hide name="maria"]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

#
мысли Марии унеслись к...[r]
четвёртому принцу — Алану Стюарту.[p]

#
Не только его близнеца Джордо,[r]
но и то, что даже Мария, простолюдинка,[r]
превзошла его на экзаменах, что его разозлило.[p]

[chara_hide name="alan"]
[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=true]

#Мария
Каждый раз при встрече он говорит что-то резкое...[r]
Это так больно...[p]

#

Но это от разочарования,[r]
а не от злобы, как у Катарины.[r]
Я это понимаю.[p]

[md name="maria" face="無表情"]

#
Если моё присутствие вызывает у Алана стресс,[r]
Мария решила, что ей лучше избегать его.[p]

[stopbgm]

#
И в этот момент,[p]

[playbgm  volume=15   storage="M40_FinalMix.ogg" ]
[playse storage="se/door-open1.ogg" ]
[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]


[md name="maria" face="焦り"]
#
Она услышала, как открылась дверь библиотеки,[r]
и Мария резко вздрогнула.[p]

#
Заглянув из-за книжного шкафа, она увидела вошедшего.[r]
Это был он, с недовольным лицом.[p]

[chara_hide name="maria"]

[v storage="h1" ]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]


[wait time=1000]
	
[chara_hide name="alan"]	
[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" wait=true]

#Мария
Ох... Это Алан-сама...[p]

#Мария

(Что же мне делать?)
	
[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="Нужно спрятаться."  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="Лучше выйти незаметно." target="*select_01_02" ]

[s]

;隠れておこう
*select_01_01
[cm]

[md name="maria" face="焦り"]

[love_up]

#Мария
(Если он меня увидит,[r]
он снова скажет что-то неприятное...)[p]

;[anim name="maria" left=-1000 ]
;[wa]

[chara_hide name="maria"]

#
Мария спряталась за книжным шкафом.[p]

[playse storage="se/walk-asphalt1.ogg"]

#
...Шаги Алана приближались.[p]

#
Марии казалось, что в этих шагах[r]
сквозила его раздражённость.[r]
Она сжалась, надеясь, что её не заметят.[p]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_do" wait=true]

[stopse]

#Алан	
...Черт.[p]


#
Когда они разошлись по разные стороны книжного шкафа,[r]
Алан недовольно цокнул языком.[p]

[chara_hide name="alan" pos_mode=false ]

[wait time=1000]

;[anim name="maria" left="&f.left" time=2300 ]
;[wa]


[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" wait=true]

#
Мария вздрогнула, но, к счастью,[r]
похоже, Алан её не заметил.[p]

[md name="maria" face="悲しみ"]

#Мария
(Алан-сама снова выглядит недовольным.[r]
Фух, как хорошо, что он меня не заметил...)[p]

[md name="maria" face="無表情"]

#
Мария с облегчением вздохнула,[r]
и продолжила прятаться за книжным шкафом,[r]
тихо выскользнув из библиотеки.[p]

[jump target="*common1" ]

*select_01_02
[cm]

[md name="maria" face="焦り"]

#Мария
(Если я продолжу прятаться за шкафом и пойду в обход,[r]
он меня точно не заметит...)[p]

#
Мария, прячась за книжным шкафом,[r]
направилась к двери библиотеки.[p]

[chara_hide name="maria"]

[playse storage="se/walk-asphalt1.ogg"]

#
Издалека шаги Алана[r]
всё ещё звучали раздражённо.[p]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" wait=true]

#Мария
(Пусть он меня не заметит...)[p]

#
Дверь была прямо перед ней.[r]
Мария старалась открыть дверь как можно тише.[r]
Она медленно открыла дверь.[p]

[md name="maria" face="驚き" ]

[playse storage="se/door-open1.ogg"]

#
Но несмотря на все её старания,[r]
дверь всё же скрипнула...[p]

[stopbgm]
[md name="maria" face="焦り" ]

#Мария
Ах.[p]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_odo" wait=true]

#Алан	
Ах.[p]

[playbgm  volume=15 storage="M46_FinalMix.ogg" ]

#
В тот момент, когда Алан повернулся,[r]
как раз когда Мария собиралась выйти за дверь,[r]
это произошло одновременно.[p]

#
Их взгляды встретились, и они заговорили одновременно.[p]

[md name="alan" face="怒り"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Мария
Пр-простите![p]

[playse storage="se/dash-asphalt2.ogg" ]

[chara_hide name="maria"]

[md name="alan" face="驚き"]

[v storage="h2"]

#
Прежде чем Алан успел что-то сказать,[r]
Мария в спешке выбежала из библиотеки.[p]

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
Как и каждый день,[r]
Мария старалась избегать встреч с Аланом,[r]
и пряталась от него.[p]

#
Оглядевшись по сторонам,[r]
Мария направилась к двору.[p]

[md name="maria" face="微笑み" ]

#Мария
Алан-сама, кажется, здесь нет...[p]

#
Она облегчённо вздохнула.[r]
В этот момент.[p]

[fadeinbgm  volume=15 storage="M02_FinalMix.ogg" time=2000 ]
[wait time=2000]

[md name="maria" face="驚き" ]

#
Из-за садовой изгороди донеслись звуки скрипки,[r]
что сплела прекрасную мелодию.[p]

[md name="maria" face="笑顔" ]

#Мария
Какой красивый звук...[p]

[md name="maria" face="微笑み" ]

#Мария
(Интересно, кто играет?)[p]

[chara_hide name="maria"]

[bg storage="HF04_292.png" ]


[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_def" wait=true]

#
Мария осторожно[r]
выглянула из-за изгороди.[r]
И кого она увидела...[p]

[chara_move name="maria" top="&f.top" left="&f.left" wait=true]
[md name="maria" face="驚き"]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]


#Мария
Алан-сама...!?[p]

[stopbgm]
[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

[md name="alan" face="怒り"]

#Алан	

[v storage="22"]

[font size=30]
К-кто здесь!?
[resetfont]
[p]

[playbgm  volume=15   storage="M09_FinalMix.ogg" ]

#
Чувствуя чьё-то присутствие,[r]
Алан резко прекратил игру и обернулся.[p]

[md name="maria" face="焦り"]

#Мария
Ах![r]
Э-это... простите...![p]

#Мария
Я не хотела подслушивать,[r]
Просто услышала такую красивую мелодию...![p]

[md name="alan" face="驚き"]

#Алан	
...Красивая мелодия?[p]

[v storage="h6"]

#
Алан нахмурился.[r]
Словно разглядывая что-то раздражающее,[r]
он опустил взгляд на скрипку.[p]

[md name="alan" face="悲しみ"]

[v storage="27"]

#Алан	
Красивая, да?[r]
Жиордо намного лучше играет.[r]
Ты ведь тоже так думаешь, да?[p]

[md name="maria" face="怒り"]

#Мария
Это совсем не так![p]

[md name="maria" face="微笑み"]

#Мария
Это было действительно... прекрасное исполнение.[p]

[md name="maria" face="焦り"]

[v storage="29_A"]

#Алан	
Я всегда второй или даже ниже.[p]

[v storage="29_B"]

#Алан	
Учёба, скрипка... что угодно...[r]
Как бы я ни старался...[r]
Я никогда его не догоню...[p]

#
Алан тяжело вздохнул и отвернулся.[r]
Мария почувствовала тяжесть печали, что нёс Алан.[p]

[md name="maria" face="悲しみ"]
[md name="alan" face="驚き"]

#
Мария сделала шаг[r]
к спине Алана.[p]

#Мария
Алан-сама, у вас есть свои сильные стороны,[r]
и свои слабости, не так ли?[p]

#Мария

Нормально, что у всех есть свои сильные и слабые стороны.[r]
Разве это не естественно?[p]

[md name="maria" face="微笑み"]
[md name="alan" face="無表情"]

#Мария
Ведь идеальных людей не бывает.[p]

#Мария
Ни я, ни Жиордо-сама, ни вы, Алан-сама...[r]
У всех есть что-то, что даётся тяжело,[r]
и что-то, в чём они хороши.[p]

[md name="maria" face="笑顔"]


#Мария
Поэтому я уверена,[r]
что Алан-сама должен оставаться собой.[r]
Так я думаю.[p]

[md name="maria" face="微笑み"]
[md name="alan" face="悲しみ"]


#Алан
Ты...[p]

#
Алан обернулся.[r]
Его лицо было похоже на лицо провинившегося ребёнка.[p]

[v storage="38"]

#Алан
...Ты правда так думаешь?[p]

[md name="maria" face="笑顔"]

#Мария
Да, думаю.[p]

[md name="maria" face="微笑み"]

#Алан	
...[p]

[md name="alan" face="微笑み"]

#Алан	
[font size=18]
...Понятно. ...Может, ты права.
[resetfont]

[p]

[md name="maria" face="笑顔"]

#Мария
Я в этом уверена.[p]

[md name="maria" face="照れ"]

#Мария
И ещё раз...[p]

[md name="maria" face="笑顔"]
[md name="alan" face="驚き"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Мария
Ваше исполнение мне действительно понравилось, Алан-сама![r]
Это было действительно прекрасно.[r]
Пожалуйста, сыграйте ещё раз![p]

[md name="alan" face="微笑み"]

#Алан	
Да.[p]

[md name="maria" face="微笑み"]
[md name="alan" face="無表情"]

#Алан	
......[p]

[v storage="45"]

[md name="alan" face="照れ"]

#Алан	
[font size="18"]
...Спасибо.
[resetfont]
[p]

#
Отводя взгляд,[r]
Алан пробормотал.[p]

[md name="maria" face="驚き"]
[md name="alan" face="悲しみ"]

[v storage="47"]

#Алан	
...Я говорил тебе ужасные вещи, не так ли?[r]
Я срывался на тебе... Прости.[p]

[md name="maria" face="微笑み"]
[md name="alan" face="驚き"]

#Мария
Тогда... давайте помиримся?[p]

[md name="alan" face="悲しみ"]

#Алан
Помиримся...? Как?[p]

[md name="maria" face="照れ"]

#Мария
Хмм.[r]
Может, пожмём друг другу руки?[p]

[md name="alan" face="無表情"]

#Алан
Рукопожатие...?[p]

[md name="maria" face="微笑み"]
[md name="alan" face="照れ"]

#
Алан посмотрел на свою ладонь.[r]
Затем, немного смутившись, он сказал «Хм»[r]
и протянул руку.[p]

[md name="maria" face="笑顔"]
[md name="alan" face="微笑み"]

#
Мария взяла его за руку.[p]

[md name="maria" face="照れ"]

#Мария
(Такая большая рука...[r]
Но он как ребёнок...)[p]
[md name="maria" face="微笑み"]
[md name="alan" face="怒り"]

[v storage="h2"]

#
Мария тихонько засмеялась, и Алан[r]
смущённо отвернулся, сказав:[r]
«Не смейся».[p]


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
Прошли сезоны,[r]
и снова настал день экзаменов,[r]
и наконец, сегодня они закончились.[p]


[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_ai" wait=true]

#Мария
Я так устала...[r]
Я все это время только училась...[p]

[md name="maria" face="無表情"]

#
Теперь осталось только дождаться результатов.[r]
Есть чувство облегчения, но усталость большая.[p]

Чтобы развеяться, Мария решила[r]
выйти в сад.[p]

#

...но,[p]

[chara_hide name="maria" ]

[bg storage="HF04_078.png"]


[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_odo" wait=true]
	
#
в её любимом месте уже кто-то был.[r]
Это был Алан, лежащий под деревом.[p]

#Алан
...[p]

#Мария
Он спит...?[p]

#Мария
(Что же мне делать?)

[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text="Наблюдать за его спящим лицом."  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="Попробовать заговорить с ним." target="*select_02_02" ]

[s]

*select_02_01
[cm]

[md name="maria" face="照れ"]

#Мария
(Спящее лицо Алана-сама...[r]
Такое редкое зрелище...)[p]

#
Из любопытства[r]
Мария осторожно подошла к Алану[r]
и медленно заглянула ему в лицо.[p]

[md name="maria" face="驚き"]

#
В пятнах солнечного света его лицо[r]
было похоже на статую,[r]
очень красивое и спокойное.[p]

[md name="maria" face="微笑み"]

#
Но в нём было что-то детское.[r]
Её переполнило чувство нежности.[p]

#Мария
(...Какой красивый...)[p]

#
Подумав это,[r]
она поняла, что сейчас только она может видеть его таким,[r]
и её лицо осветилось лёгкой улыбкой от этого счастья.[p]

[md name="maria" face="笑顔"]

#Мария
Хех.[p]

#
И в этот момент,[r]
Глаза Алана неожиданно открылись.[p]

[md name="maria" face="驚き"]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

[v storage="h2"]

#Алан
...Эй.[p]

[md name="maria" face="焦り"]
[chara_move name="maria" left="&f.left" time=500 ]

#Мария
Ах... Простите.[r]
Я разбудила вас...?[p]

#Алан
...Я услышал твои шаги.[p]

#Мария
Значит, вы уже не спали...[p]

#
Заглядывая ему в лицо,[r]
она подумала, не выглядела ли она глупо,[r]
глядя на него...[p]

#
От этих смущающих мыслей[r]
щеки Марии вспыхнули.[p]

#
Алан посмотрел на краснеющую Марию[p]

[jump target="common2"]

*select_02_02
[cm]

[md name="maria" face="悲しみ"]

#Мария
(Он спит...?[r]
Нехорошо будет его разбудить?)[p]

[md name="maria" face="微笑み"]

#Мария
(Но всё-таки, я хотела бы поговорить с ним...[r]
хоть немного...)[p]

[md name="maria" face="照れ"]

#Мария
Алан-сама...?[p]

#
Немного колеблясь, Мария[r]
осторожно позвала его.[p]

#Алан
...[p]

[md name="maria" face="無表情"]

#
Ответа от Алана не последовало.[p]

#Мария
(Он всё-таки спит...[r]
Наверное, он тоже устал от экзаменов...)[p]

#
И в этот момент[r]
глаза Алана неожиданно открылись.[p]

[md name="maria" face="驚き"]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

[v storage="h2"]

#Алан
...Эй.[p]

[md name="maria" face="焦り"]

[chara_move name="maria" left="&f.left" time=500 ]
;[wa]

#Мария
Ах... Простите.[r]
Я разбудила вас...?[p]

[md name="alan" face="ドヤ顔"]

#Алан
Ты думаешь, один раз позвать меня достаточно?[p]

[md name="maria" face="驚き"]

#Мария
Что—[p]

#Мария
(Ах, так он всё время был не спящим...)[p]

[md name="maria" face="照れ"]

#
Он прищурился, будто поддразнивая её,[r]
и поймал Марию взглядом.[r]
Щёки Марии вспыхнули.[p]

#Мария
А... Алан-сама.[r]
Д-доброе утро...[p]

[md name="maria" face="微笑み"]
[md name="alan" face="微笑み"]

[celanim anim="blue_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="blue_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#Алан
Да.[p]

#
Увидев, как Мария смущённо опустила взгляд,[r]
Алан слегка усмехнулся.[p]

*common2

[md name="maria" face="驚き"]
[md name="alan" face="微笑み"]


[v storage="65"]

#Алан
...Иди сюда.[p]

#
Алан поманил её рукой.[r]
Когда Мария подошла,[r]
он указал на место рядом с собой и сказал: «Садись».[p]

[v storage="67"]

#Алан
Подойди ближе.[p]

#Мария
(Может быть, Алан-сама...[r]
хочет, чтобы я сделала ему колени подушкой?)[p]


;スチル表示
[chara_hide_all ]

[wait time=1000 ]

[eval exp="sf.alan_cg_1=true" ]
[bg storage="alan1.png" time=2000] 


#
Подумав так, она сделала, как было сказано,[r]
и, как она ожидала, Алан[r]
уложил голову ей на колени.[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
Он отвернулся, не глядя на Марию,[r]
словно разрываясь между желанием заботы[r]
и чувством смущения.[p]

#
Наблюдая за этим его милым поведением,[r]
Мария невольно улыбнулась.[p]

[v storage="72"]

#Алан
Как прошли экзамены?[p]

#Мария
Э-э...[r]
Кажется, я справилась неплохо.[r]
А вы, Алан-сама?[p]

[v storage="h5"]

#Алан
Ну, нормально.[p]

#Мария
Понятно.[r]
Вы хорошо потрудились.[p]

[v storage="h1"]

#
Это был обычный разговор.[r]
Когда разговор иссяк,[r]
между ними воцарилось молчание.[p]

#
Нежный ветерок тихо дул,[r]
и солнечный свет мягко пробивался сквозь листья.[p]

[fadeoutbgm time=1000] 

[wait time=1000]
[playbgm volume=15 storage="M21_FinalMix.ogg" ]

[v storage="78"]

#Алан
Это всё благодаря тебе.[p]

#
Неожиданно заговорил Алан.[p]

[v storage="80"]

#Алан
С тех пор, как я встретил тебя...[r]
я смог сбросить тяжёлую ношу,[r]
которую нёс.[p]

[v storage="81"]

#Алан	
Я всегда думал, что должен только двигаться вперёд,[r]
но ты научила меня,[r]
что иногда можно расслабиться.[p]

[v storage="82_A"]

#Алан
Стараться, серьёзно относиться к делу.[r]
Учёба, игра на скрипке—[p]

[v storage="82_B"]

#Алан
Я уже смирился с тем, что мне не удастся добиться успеха,[r]
но теперь я могу смотреть на это иначе,[r]
и всё это благодаря тебе.[p]

#Мария
Алан-сама...[p]

;要チェック
[v storage="84"]

#Алан
С тех пор, как я встретил тебя, Мария,[r]
моя жизнь изменилась.[r]
Они стали светлее, важнее, более ценными...[p]

[v storage="85_A"]

#Алан
Вместо того, чтобы сравнивать себя с другими,[r]
я понял, что могу оставаться самим собой.[p]

[v storage="85_B"]

#Алан
Ты научила меня этому,[r]
и это сделало меня очень счастливым.[p]

[v storage="86"]

#Алан
Мария.[r]
...Спасибо.[p]

#Мария
Пожалуйста, Алан-сама.[p]

#
Мария нежно погладила Алана по лбу.[p]

#
Наверное, до сих пор у Алана никогда не было того,[r]
кто бы погладил его по голове и похвалил его,[r]
как бы сильно он этого ни хотел.[p]

#Мария
(Может быть, Алан-сама...[r]
ждал здесь только для того, чтобы поговорить со мной?)[p]

#Мария
(...Нет, не может быть.)[p]

#
Прошёл спокойный, тихий момент.[p]

#
Но тишину нарушил Алан.[r]
Конечно, это был Алан.[p]

[free_layermode time=1000 ]


[bg storage="HF04_078.png"]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_def" wait=false]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

#
Он резко вскочил[r]
и, будто приняв решение, сказал:[p]

[md name="maria" face="驚き"]
[md name="alan" face="怒り"]

[v storage="94"]

#Алан
Я хочу тебе кое-что сказать.[r]
Но перед этим[r]
я должен кое-что сделать.[p]

[md name="alan" face="無表情"]

[v storage="95"]

#Алан
...Так что завтра[r]
приходи сюда в это же время.[p]

[fadeoutbgm time=1000]
[playse storage="se/dash-asphalt2.ogg" ]

[chara_hide name="alan"]

#
Сказав это,[r]
Алан добавил: «Ты обязательно должна прийти»,[r]
и побежал куда-то.[p]

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
Вспоминая обещание, данное Алану,[r]
Мария направилась к саду.[p]

#
Но кто-то преградил ей путь.[r]
Этим человеком была—[p]

[md name="maria" face="焦り"]
[chara_show name="mary" top="&f.top" left="&f.right" face="hamehura_Mary_cos1_mu" wait=true]

#Мэри
Здравствуйте, Мария.[p]

#
Это была Мэри, невеста Алана.[p]

#Мэри
Мария.[r]
У меня к вам только один[r]
вопрос.[p]

#
Взгляд Мэри был прямым,[r]
величественным и серьёзным.[p]


[md name="maria" face="無表情"]

#
Мария подобрала лицо[r]
и подала знак продолжить.[p]

[md name="mary" face="怒り"]

#Мэри
—Для вас,[r]
кем является Алан-сама?[p]

[md name="maria" face="驚き"]
[md name="mary" face="無表情"]

#Мария
Для меня?[p]

[md name="maria" face="無表情"]

#
Мария задумалась на мгновение,[r]
затем посмотрела в глаза Мэри и начала уверенно говорить.[p]

#Мария
Он упрямый, гордый,[r]
но честный, трудолюбивый и добрый.[r]
...Больше всех он настоящ.[p]

[md name="maria" face="微笑み"]

#Мария
И это вызывает у меня... любовь к нему.[r]
Я хочу поддерживать его.[p]

#Мария
Я хочу быть рядом с ним...[p]

#Мария
Я хочу быть рядом с ним всегда.[p]

[md name="maria" face="悲しみ"]
[md name="mary" face="悲しみ"]

#Мария
Не потому, что он четвёртый принц,[r]
или потому, что он из семьи Стюарт—[r]
А потому, что он Алан-сама.[p]

[md name="maria" face="無表情"]

#Мария
Я просто хочу быть с ним.[r]
Я хочу быть рядом с ним и видеть его улыбку.[r]
Я хочу поддерживать его и идти с ним бок о бок.[p]

#Мария
...Так я чувствую всем сердцем.[p]

[md name="maria" face="悲しみ"]

#
Было бы ложью сказать, что я не чувствую вины.[r]
Мэри — невеста Алана.[p]

#
То, что я только что сказала...[r]
будто бы заявляет,[r]
что я у неё его отнимаю.[p]

#
Но сейчас,[r]
я должна была рассказать о своих настоящих чувствах,[r]
иначе это было бы неуважением к Мэри.[p]

#Мэри	
...[p]

#
Мэри внимательно слушала,[r]
что говорила Мария.[p]

[md name="mary" face="微笑み"]

#
Но её выражение лица[r]
немного смягчилось.[p]

[md name="maria" face="驚き"]

#Мэри
...Я не могу с вами соперничать.[p]

[md name="maria" face="悲しみ"]

#Мария
Леди Мэри...[p]

[md name="mary" face="悲しみ"]

#Мэри
Я никогда не могла вызвать[r]
такую улыбку на его лице.[p]

#Мэри
Только одна может действительно осветить его жизнь —[r]
Мария, это только вы.[p]

[md name="mary" face="微笑み"]

#Мэри
Ваши чувства к Алану-сама...[r]
Пожалуйста, дорожите ими.[p]

#Мэри
Ну что ж, до свидания.[p]

[md name="mary" face="悲しみ"]

#Мэри	
[font size="18"]
...Будьте счастливы.
[resetfont]
[p]

#
Улыбка Мэри была мягкой и доброй.[r]
Но в тот момент, когда она повернулась—[p]

[chara_hide name="mary"]

[md name="maria" face="焦り"]

#Мария
Ах...[p]

#
Мария увидела слёзы, блестящие[r]
в глазах Мэри.[p]

[md name="maria" face="悲しみ"]


#Мария
Леди Мэри... спасибо.[p]

[chara_hide name="maria"]

#
Мария кланялась,[r]
пока её фигура не исчезла из виду.[p]


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

Место встречи.[r]
Под пятнами солнечного света.[p]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=true]

#
Когда Мария смотрела на небо,[r]
она услышала приближающиеся шаги.[p]

[playse volume=50 storage="se/dash-in-room1.ogg" ]
[wse]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_do" wait=true]

[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

[v storage="130"]

#Алан
[font size=36]マリア……！
[resetfont]
[p]

[md name="maria" face="笑顔"]
[md name="alan" face="無表情"]

#Мария
Алан-сама![p]

#
Он, должно быть, всё это время бежал.[r]
Алан остановился рядом с Марией, тяжело дыша.[p]

[chara_hide_all ]

[eval exp="sf.alan_cg_2=true" ]
[bg storage="alan2.png" ]

#
Он отдышался...[r]
После глубокого вдоха Алан выпрямился[r]
и взял Марию за руку.[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
Затем то, что он хотел сказать Марии,[r]
наконец было облечено в слова.[p]

[v storage="135"]

#Алан
Мария.[r]
Я хочу, чтобы ты была рядом со мной.[r]
Теперь и всегда.[p]

#
Простые слова.[r]
Такие простые,[r]
но такие искренние.[p]

#
Мария смотрела на Алана.[p]

#Мария
Понимает ли он, что это значит?[r]
Понимаете ли вы, что вы просите, Алан-сама?[p]

[v storage="139"]

#Алан
Да, понимаю.[p]

[v storage="140"]

#Алан
...Стань моей.[p]

[v storage="141"]

#Алан
Выходи за меня.[p]

#
Никогда прежде взгляд Алана не был таким серьёзным.[r]
Он продолжил говорить.[p]

[v storage="143"]

#Алан
Вчера я поговорил с Мэри и Джордо,[r]
а также с нашими родителями.[p]

[v storage="144"]

#Алан
Мы серьёзно обсудили всё.[r]
И они оба[r]
дали мне своё благословение.[p]

#Мария
(Вот почему леди Мэри...)[p]

#
Мария вспомнила их недавнюю встречу.[r]
И в то же время она осознала, что было доверено ей.[p]

#
И Алан, и Мэри[r]
приняли своё решение.[p]

#

Алан встал на колено и посмотрел на Марию.[p]

[v storage="149"]

;@quake_camera

#Алан	
[font size="36"]お前の人生、俺にくれ！
[resetfont]
[p]

[free_layermode time=1000 ]


#Мария
(Как мне ответить?)

[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text="С радостью."  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="Вы уверены?" target="*select_03_02" ]

[s]

*select_03_01
[cm]

[bg storage="HF04_078.png"]
[playbgm  volume=15   storage="M17_FinalMix.ogg" ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=false]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

#
Громкий голос.[r]
Сильные чувства.[p]

#
Мария была готова принять их.[r]
Ведь эти чувства исходили от людей, которые её поддерживали.[p]

#
И это был её способ уважить[r]
и отдать должное своим собственным чувствам любви.[p]

[md name="maria" face="微笑み"]

#Мария
—С радостью.[p]

[md name="maria" face="笑顔"]

#Мария
Я отдаю вам всю себя.[r]
Пожалуйста... возьмите меня.[p]

[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

[celanim anim="blue_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="blue_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]

[md name="alan" face="照れ"]

#Алан
...![p]

[md name="maria" face="微笑み"]
[md name="alan" face="微笑み"]

[v storage="154"]

#Алан
Да! Конечно![p]

[md name="maria" face="笑顔"]

#
Алан широко улыбнулся, как мальчишка,[r]
и обнял Марию изо всех сил.[p]

#
Мария тоже обняла его крепкое тело[r]
и прижалась к нему.[p]

#
Под нежными солнечными лучами[r]
они долго-долго обнимались.[p]

@jump target="common_03"

*select_03_02
[cm]

[bg storage="HF04_078.png"]
[playbgm  volume=15   storage="M17_FinalMix.ogg" ]


[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=true]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

#
Громкий голос.[r]
Сильные чувства.[p]

[md name="maria" face="悲しみ"]

#
Но правда,[r]
должна ли я принимать это?[p]

[md name="alan" face="悲しみ"]

#
Ведь это затрагивает несколько дворянских семей,[r]
и это не просто роман между мужчиной и женщиной.[p]

#
В этой любви для них двоих, таких юных,[r]
будет множество трудностей,[r]
о которых они не могут и подумать.[p]

#Мария
(Правда, всё в порядке?)[p]

#
Но всё-таки—[r]
Мария вспомнила.[r]
свой разговор с Мэри[p]

#
Я люблю Алана.[r]
Я хочу поддерживать его.[p]

[md name="maria" face="無表情"]

#
—Я хочу быть рядом с ним.[p]

#Мария
(Если я сейчас поколеблюсь...[r]
это будет предательством и для леди Мэри, и для Алана-сама.)[p]

#
Поэтому Мария[r]
прямо посмотрела на Алана—[p]

[md name="maria" face="微笑み"]
[md name="alan" face="照れ"]

#
и всем сердцем кивнула.[p]

[md name="alan" face="微笑み"]

#
Эта любовь, конечно, не будет[r]
состоять только из счастья.[p]

#
Может, будет даже больше трудностей,[r]
чем радости.[p]

[md name="alan" face="微笑み"]

#Мария
(Но, несмотря на это, мы...)[p]

[md name="maria" face="笑顔"]

#
Алан улыбался и обнимал её,[r]
Мария крепко[r]
обняла его в ответ.[p]

#
Под нежными солнечными лучами[r]
они поклялись вместе идти в будущее.[p]

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




