
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
Мария, родом из простолюдинов,[r]
была назначена членом студенческого совета Магической Академии[r]
благодаря её отличным оценкам.[p]

[md name="maria" face="hamehura_Maria_cos1_do"]


#Мария
(Сегодня я тоже стала членом студсовета...[r]
Нужно хорошенько постараться...!)[p]

[chara_hide name="maria"]

#
С чувством волнения и ответственности[r]
Мария открыла дверь в кабинет студенческого совета.[p]

[playbgm volume=30 storage="M03_FinalMix.ogg" ]
[bg storage="HF08_021_026.png" time=1000 ]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true]

[v storage="5" ]

#Николь
—Привет.[r]
Вы, должно быть, мисс Кэмпбелл, новая участница?[p]

#
Марии встретил[r]
вице-президент студенческого совета и сын премьер-министра,[r]
Николь Аскарт, сын графа Аскарта.[p]

#
Старший ученик, на год старше Марии.[p]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_def.png" wait=true]


#Мария
Добрый день.[r]
Я Мария Кэмпбелл. Прошу любить и жаловать.[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]

#
Мария глубоко поклонилась.[p]

;[chara_hide name="nicol" pos_mode=false ]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#
...И тут она почувствовала другой взгляд, не от Николя,[r]
Она подняла глаза и увидела, что за его спиной прячется[r]
бледная девушка, смотревшая на Марию.[p]

[chara_show name="sophia" top="&f.top" left="620" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true zindex=0 ]


#Мария	
(Какая красивая девушка...!)[p]

[md name="sophia" face="hamehura_Sophia_cos1_odo"]

#？？？	
![p]

[chara_move name="sophia" top="&f.top" anim=true left="520" wait=true zindex=0 ]


#
Как только их взгляды встретились,[r]
она тут же спряталась за Николя.[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

#
Николь с улыбкой представился: Николь Аскарт.[p]

[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="14" ]

#Николь
Это моя младшая сестра, София.[r]
...Она немного стеснительная. Не обращайте внимания.[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#Мария
О, это ваша сестра.[r]
Леди София, рада познакомиться.[p]

[chara_hide name="maria" pos_mode=false ]
[md name="sophia" face="hamehura_Sophia_cos1_ai" ]

#
Мария тоже поприветствовала её, но[r]
София так и не вышла из-за спины Николя,[r]
и не показалась.[p]


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


#Мария
Леди София, я испекла маффины для всех членов студенческого совета.[r]
Хотите попробовать?[p]

[md name="sophia" face="hamehura_Sophia_cos1_ai"]

#София
...Я не люблю сладкое.[p]

;=======================================

[mask graphic="black.png" time=1500 effect="slideInRight"]

[bg storage="black.png" time=10 ]

[md name="maria" face="hamehura_Maria_cos1_tere"]
[md name="sophia" face="hamehura_Sophia_cos1_mu"]

[bg storage="HF04_034_r.png" time=10] 

[mask_off time=1500 effect="slideOutLeft"]

;=======================================


#Мария
Эм, леди София...[r]
У меня есть и выпечка...[r]
Я сделала их с минимальным количеством сахара, так что, если хотите...[p]
[md name="sophia" face="hamehura_Sophia_cos1_ai"]

#София	
...Я не хочу, чтобы у меня был кариес.[p]

;=======================================

[mask graphic="black.png" time=1500 effect="slideInRight"]

[bg storage="black.png" time=10 ]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="sophia" face="hamehura_Sophia_cos1_mu"]

[bg storage="HF04_002.png" time=10]

[mask_off time=1500 effect="slideOutLeft"]

;=======================================

	
#Мария
Леди София, в саду распустились прекрасные розы.[r]
Не хотите пойти посмотреть их со мной?[p]

[md name="sophia" face="hamehura_Sophia_cos1_ai"]

#София
...Я не очень хорошо переношу солнечный свет.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#Мария
Я могу нести зонтик.[p]

[md name="sophia" face="hamehura_Sophia_cos1_mu"]

#София
...Ну, ненадолго.[p]
	
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
Мария и София[r]
гуляли по саду,[r]
и Николь наблюдал за ними из окна кабинета студсовета.[p]

#Николь
(Она... странный человек...)[p]

[chara_hide_all time=1000]

[bg storage="HF04_002.png" ]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_def.png" wait=false time=1000 ]
[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=1000 ]
	
#
Держа зонтик и улыбаясь Софии,[r]
Николь прищурился, глядя на Марию.[p]

#
Её не смущали ни внешность Николя, ни его положение,[r]
она не пыталась угодить ему.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#
И она с теплотой относилась к Софии, которая выглядела иначе, чем все остальные,[r]
с такой теплотой и добротой.[p]

[chara_hide name="maria" pos_mode=false  wait=false]
[chara_hide name="sophia" pos_mode=false wait=true ]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true]

#
В последнее время Николь замечал изменения в Софии.[r]
Это началось с того, как Мария начала к ней подходить.[p]

[chara_hide name="nicol" pos_mode=false wait=true ]

[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=10 ]


#
Поначалу София думала, что Мария[r]
подходит к ней, чтобы подобраться к её брату.[r]
Так ей казалось.[p]

#
Она не хотела, чтобы её брат у неё исчез.[r]
Она не хотела, чтобы какая-то неприятная девушка приближалась к нему.[p]

[md name="sophia" face="hamehura_Sophia_cos1_def"]

#
Поэтому сначала она была холодна с Марией,[r]
но Мария не сдавалась.[r]
Постепенно София начала открываться на улыбки Марии.[p]

[chara_hide name="sophia" pos_mode=false wait=true ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_odo.png" wait=true]


#Николь
(София... улыбается...)[p]

#
Хотя улыбка была едва заметной,[r]
София всё-таки улыбнулась Марии.[p]

#
Николь не мог вспомнить, когда в последний раз видел, чтобы его сестра так улыбалась.[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

[v storage="40" ]

#Николь
Ты действительно... загадочный человек.[p]

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
По пути в кабинет студсовета Мария столкнулась с Николем.[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#Мария
Приветствую, господин Николь.[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]


#Николь
Приветствую, мисс Кэмпбелл.[r]
...Раз уж мы идём в одном направлении, может, пойдём вместе?[p]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#Мария
А, да![p]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

#
Территория Магической Академии была обширной.[r]
Они шли по длинным коридорам.[p]

#Николь
Похоже, вы недавно тоже занимались Софией.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#Мария
Нет-нет.[r]
Я рада, что подружилась с леди Софией![p]

[v storage="h2" ]

#Николь
...Понятно.[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#Мария
(Господин Николь, должно быть, очень[r]
дорожит леди Софией...)[p]

#
Мария почувствовала умиление.[p]

[chara_hide_all ]

#
И вдруг.[r]
Из-за угла раздались шепотки.[p]


[chara_show name="reijo1" top="&f.top" left="-160" storage="chara/reijo1/hamehura_DVDmob1_fear.png" wait=false]
[chara_show name="reijo2" top="&f.top" left="100" storage="chara/reijo2/hamehura_DVDmob2_fear.png" wait=false]
[chara_show name="reijo3" top="&f.top" left="340" storage="chara/reijo3/hamehura_DVDmob3_def.png" wait=true ]


#Девушка 1
Господин Николь такой замечательный, а у него сестра с такой внешностью...[r]
Ему так не повезло[r]
с такой сестрой.[p]

#Девушка 2
Может быть, леди София[r]
незаконнорожденная дочь премьер-министра...[p]

#Девушка 3
Её лицо, по крайней мере, прекрасно,[r]
так что, может, это правда?[r]
Хехех.[p]

[chara_hide_all ]


#Девушки
Ахахахахаха...[p]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_ai.png" wait=false time=1000 ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_do.png" wait=true time=1000 ]

[v storage="h4" ]

#Николь
......[p]

#
Николь слегка нахмурился, но[r]
ничего не сказал.[p]

#
Мария тихо взглянула на лицо Николя,[r]
сделала глубокий вдох и—[p]

сказала на одном дыхании:

[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="Сказала, что не стоит обращать внимания"  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="Сказала, что верит в настоящего Николя" target="*select_01_02" ]

[s]

*select_01_01
[cm]

[md name="maria" face="hamehura_Maria_cos1_def"]
	
[fadeinbgm storage="M10_FinalMix.ogg" time=2000]
	
#Мария
Что у господина Николя такая чудесная сестра,[r]
и что, несомненно, они просто завидуют.[r]
Они просто ревнуют.[p]

[md name="nicol" face="hamehura_Nicol_cos1_odo"]

#Николь
...![p]

[chara_hide_all]

[eval exp="sf.nicol_cg_1=true" ]
[bg storage="nicol1.png"]
	
#
Николь невольно остановился и посмотрел на Марию.[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]


#
От его серьёзного взгляда Мария подумала,[r]
что, возможно, сказала что-то не то.[p]

#
Мария уже собиралась извиниться, но[r]
Николь заговорил первым.[p]

[v storage="64" ]

#Николь
...Никто прежде не говорил о моей сестре[r]
в таком тоне.[r]
Спасибо вам, мисс Кэмпбелл.[p]

#
Мягко.[p]

#
Николь улыбнулся, как цветок, расцветающий на ветру.[p]

#
Эти слова, исходящие от того, кто редко показывает свои чувства,[r]
заставили Марию почувствовать искренность Николя.[p]

[jump target="common1"]

*select_01_02
[cm]

[fadeinbgm storage="M10_FinalMix.ogg" time=2000]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="nicol" face="hamehura_Nicol_cos1_do"]

[bg storage="HF08_018_r.png" time=10] 

#Мария
Я завидую вам, господин Николь, что у вас есть такая сестра, как леди София.[r]
Очень завидую.[p]

[md name="nicol" face="hamehura_Nicol_cos1_odo"]

#Мария
Я вижу, как вы дорожите ею.[r]
Это видно по тому, как вы к ней относитесь.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

[kanim_chara layer=0 name="nicol" keyframe=quake time=300 count=1 easing=linear]

#Мария
Вот почему я искренне верю в свои чувства—[r]
Я верю и в вас, и в леди Софию.[p]

[celanim anim="green_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="green_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#Николь
...[p]

[chara_hide_all]

[eval exp="sf.nicol_cg_1=true" ]
[bg storage="nicol1.png"]	

#
Николь снова остановился и посмотрел на Марию.[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
Мария уверенно посмотрела ему в глаза.[p]

#
Её слова и её сердце[r]
показывали, что она абсолютно честна.[p]

#Николь
Ты действительно веришь... не так ли?[p]

#
Он немного улыбнулся, как будто с горечью, но мягче,[r]
Николь тихо засмеялся.[p]

#Николь
...Тогда я тоже поверю в эти слова. 'От всего сердца.'[r]
Спасибо, мисс Кэмпбелл.[p]

#
Эти слова исходили от того, кто редко показывает свои чувства,[r]
и Мария поняла, что сердце Николя было переполнено[r]
тёплой благодарностью и облегчением.[p]

*common1


[free_layermode time=1000 ]

	
[bg storage="HF08_018_r.png" time=10] 

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_tere.png" wait=false time=1000 ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_def.png" wait=true time=1000 ]


#Мария
Благодарить не за что...[r]
Я просто сказала то, что думала.[p]

#
Она скромничала,[r]
но искренняя улыбка Николя[r]
заставила её сердце биться быстрее.[p]

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
Мария тяжело вздохнула.[r]
День выпускного в Магической Академии стремительно приближался.[r]
День выпуска Николя приближался.[p]

#Мария
Это не было прощанием навсегда, но...[r]
Господин Николь — дворянин, а я простолюдинка.[p]

#Мария
Когда он закончит учёбу, возможно, мы больше не увидимся.[r]
Это было вполне возможно.[p]

[md name="maria" face="hamehura_Maria_cos1_akire"]

#
Занимаясь мелкими делами в кабинете студсовета,[r]
Мария пробормотала про себя.[p]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true]


#Николь	
Что-то случилось?[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
Незаметно Николь оказался рядом с ней.[r]
Мария резко подняла голову.[p]

#Мария	
А, нет, ничего![p]

[md name="nicol" face="hamehura_Nicol_cos1_do"]

[v storage="76" ]

#Николь	
Не скрывай от меня.[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]

#
Похоже, Николь оказался хитрее.[p]

[md name="maria" face="hamehura_Maria_cos1_ai"]

#
Под его пристальным взглядом[r]
Мария опустила взгляд на свои руки.[p]

#Мария
Скоро выпускной, поэтому...[r]
Когда я думаю о том, что вы скоро закончите учёбу, господин Николь...[r]
Мне становится... одиноко.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#Мария
...Это нехорошо, правда![r]
Это же радостное событие, но[r]
а я почему-то грущу...[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#
Хотя он сказал не скрывать это,[r]
Мария всё равно попыталась улыбнуться.[r]
Она не удержалась.[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

[v storage="h1" ]

#Николь	
Я рад.[p]

#
Николь тихо усмехнулся.[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

[v storage="84" ]

#Николь
...Потому что я чувствую то же самое.[p]

#Мария
Что—[p]

#
Николь всё ещё улыбался и прищурился, сказав,[r]
и мягко положил свою руку на руку Марии, лежащую на столе.[r]
[p]

[md name="nicol" face="hamehura_Nicol_cos1_ai"]

[v storage="87" ]

#Николь
До этого мне не было дела до встреч и прощаний.[r]
Но мысль о том, что мы с вами больше не будем проводить время вместе, мисс Кэмпбелл,[r]
заставляет меня чувствовать себя одиноко. Я действительно так чувствую.[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

#Николь
Я никогда прежде не испытывал таких чувств ни к кому, кроме своей семьи.[r]
Это впервые.[p]

[md name="maria" face="hamehura_Maria_cos1_ai"]

#Мария
Господин Николь...[p]

[md name="nicol" face="hamehura_Nicol_cos1_ai"]

#Николь
Всё это время, глубоко внутри меня—[p]

[v storage="91" ]

#Николь
Меня ранили люди, которые меня не знали,[r]
и оскорбляли тех, кого я люблю — мою сестру Софию.[r]
Они продолжали говорить, что она для меня бремя. Это было больно.[p]

[v storage="92" ]

#Николь
Они судили нас только по внешности и титулу,[r]
не пытаясь узнать нас по-настоящему.[r]
Я устал от тех, кто льстил мне.[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="93" ]

#Николь
Но ты,[r]
ты увидела, какими мы есть на самом деле, и улыбнулась нам.[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

[v storage="94" ]

#Николь
София начала так улыбаться[r]
только благодаря тебе.[p]

[v storage="95" ]

#Николь
Спасибо, мисс Кэмпбелл.[r]
Моя искренняя благодарность тебе.[p]

#Мария	
(Как мне ответить?)

[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text="Спасибо вам тоже."  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="Мне не за что благодарить..." target="*select_02_02" ]

[s]

*select_02_01
[cm]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#Мария
Нет, господин Николь, это я должна вас благодарить.[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#Мария
Вы с леди Софией[r]
увидели во мне не просто простолюдинку, а меня как личность.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#Мария
Причина, по которой моя школьная жизнь была такой радостной —[r]
это благодаря вам![p]

[v storage="99" ]

#Николь
Ха-ха, правда?[p]

[md name="maria" face="hamehura_Maria_cos1_kon"]

#Мария
Ау...[r]
Да, правда![p]

#Николь
Да, я знаю.[p]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="h3" ]

#Николь
...А.[r]
Я уже и забыл, каково это — искренне улыбаться.[p]

[celanim anim="green_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="green_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#Николь
Я всегда думал, что должен быть сильным, собранным,[r]
и, возможно, я слишком долго держал себя в напряжении.[p]


[md name="nicol" face="hamehura_Nicol_cos1_def"]


#Николь
Я не думал, что когда-нибудь буду так себя чувствовать...[p]

#
Взгляд Николя, когда он смотрел на Марию,[r]
был таким же тёплым и ярким, как солнечный день.[p]

[jump target="common2"]

*select_02_02
[cm]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#Мария
Нет, правда,[r]
не за что меня благодарить...[p]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#
Мария вела себя естественно,[r]
просто оставаясь собой в общении с Николаем и Софией.[p]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#
И именно поэтому её смущала[r]
искренняя благодарность Николя.[p]

[v storage="h1" ]

#Николь
...Хех. Ты такая застенчивая.[p]

#Николь
Но хотя бы прими мою благодарность.[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

#Мария
П-простите...[p]

#Николь
Не нужно извиняться.[p]

[md name="maria" face="hamehura_Maria_cos1_kon"]

#Мария
Ау...[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

#Николь
Ха-ха, ты такая милая.[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

[v storage="h3" ]

#Николь
...А.[r]
Никогда не думал, что буду так относиться к кому-то.[r]
Никогда не думал, что смогу так открыться кому-то.[p]

#Николь
Никогда не представлял себе этого...[p]

#
Сказав это, Николь посмотрел на Марию взглядом,[r]
который был бесконечно добрым,[r]
словно тёплый весенний день.[p]

*common2

[md name="maria" face="hamehura_Maria_cos1_odo"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="106" ]

#Николь
Мисс Кэмпбелл.[r]
Завтра на выпускном балу я хочу вам кое-что сказать.[r]
Прошу вас, обязательно приходите.[p]

[chara_hide name="nicol" pos_mode=false ]

#
Николь шепнул это,[r]
поклонился и ушёл.[p]

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
Выпускной бал считается одним из самых ярких событий в академии.[r]
[p]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_ai.png" wait=true]

#
—И именно поэтому Мария переживала.[p]

#
Мария, будучи простолюдинкой,[r]
смогла лишь подправить старое подержанное платье,[r]
и это было пределом её возможностей.[p]

#
Будет ли такое платье уместным,[r]
чтобы появиться перед Николем...?[p]

#Мария
(Дело не только во мне. Моё присутствие рядом[r]
может стать причиной насмешек над Николя...)[p]

[md name="maria" face="hamehura_Maria_cos1_akire"]


#
Стоя перед зеркалом в своей комнате в женском общежитии той ночью,[r]
Мария тяжело вздохнула.[p]

[fadeoutbgm time=2000]
[playse storage="se/door_wood_knock1.ogg" ]

#
И в этот момент.[r]
в дверь постучали.[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]


#Мария
Да?[p]

#
Интересно, кто это может быть так поздно,[r]
Мария открыла дверь.[p]

[playse storage="se/door-open1.ogg" ]

[fadeinbgm storage="M17_FinalMix.ogg" time=2000 ]

[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=1000 ]
[md name="maria" face="hamehura_Maria_cos1_odo"]
	
#София	
Добрый вечер, Мария.[p]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Мария
Леди София!? Что вас сюда привело?[p]

#София
Я хотела бы кое-что с вами обсудить, Мария.[r]
Не возражаете?[p]

[md name="maria" face="hamehura_Maria_cos1_ase"]


#Мария
Да... Пожалуйста, входите.[p]

#
Мария пригласила Софию войти.[r]
Заговорила первой София.[r]
Она серьёзно посмотрела на Марию.[p]

#София
Что вы думаете о моём брате?[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Мария
Что—[p]

[md name="maria" face="hamehura_Maria_cos1_ai"]

#
Ошеломлённая внезапным вопросом,[r]
Мария нахмурилась и открыла свои истинные чувства.[p]

#Мария
...Я не хочу прощаться.[p]

#Мария
Мысль о том, что господин Николь уедет далеко,[r]
сжимает моё сердце... и это больно.[p]

#Мария
Если бы я могла,[r]
я бы всегда оставалась рядом с ним...[p]

#София	
Вы действительно так чувствуете?[p]


[md name="maria" face="hamehura_Maria_cos1_do"]

#Мария
[font size=30]本当です！[resetfont]
[p]

[md name="sophia" face="hamehura_Sophia_cos1_def"]

#
Мария ответила не задумываясь.[r]
София мягко улыбнулась Марии.[p]

#София	
Я знала, что вы так скажете.[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#Мария
Что...?[p]

[md name="maria" face="hamehura_Maria_cos1_kon"]

#София
Это было так очевидно.[r]
Что вы с моим братом испытываете чувства друг к другу.[p]

#
София тихо хихикнула.[r]
Мария почувствовала, как её лицо начинает краснеть.[p]

#София
...Хехе.[r]
Очень скоро мне придётся называть вас[r]
'Сестрицей', не так ли?[p]

#Мария
Леди София, что вы такое говорите...?[p]

#София	
Ну-ну.[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]

#София
Ну что ж, как бы то ни было...[r]
У меня есть для вас подарок в честь праздника.[p]

#София	
Пожалуйста, зайдите ко мне в комнату позже.[p]


;=======================================

[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide_all time=100]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_mu.png" wait=true]

[wait time=2000 ]

[bg storage="HF04_034_r.png" time=10] 

[mask_off time=2000 ]

;========================================
	
#Мария
(...Интересно, что за подарок?)[p]

#
Немного волнуясь,[r]
Мария постучала в дверь Софии.[r]
Изнутри сразу раздался ответ.[p]

#София	
Пожалуйста, входите.[p]

[bg storage="HF04_066_071_073_084A.png"]

[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_def.png" wait=true time=1000 ]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#Мария
Это...[p]

#
—Перед ней было[r]
скромное, но элегантное платье.[p]

#
Оно было сделано так, чтобы Мария, будучи простолюдинкой, не выделялась негативно,[r]
Это был тщательно продуманный наряд.[p]

#София	
Пожалуйста, наденьте это, Мария.[p]

[md name="maria" face="hamehura_Maria_cos1_ase"]

#Мария
...Это правда для меня?[r]
Такое прекрасное...![p]

#София	
Да, конечно![p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#София	
...Пожалуйста, позаботьтесь о моём брате.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#Мария
[font size=30]
Огромное спасибо![r]
Леди София!
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
Платье Марии[r]
вызвало восхищение даже у других дворянок.[r]
Оно было элегантным и изысканным.[p]

#
Даже девушки, которые обычно дразнили Марию,[r]
были поражены его красотой.[p]

[md name="maria" face="hamehura_Maria_cos5_akire"]

#
Но сама Мария, надев такое[r]
роскошное платье впервые в жизни,[r]
почувствовала себя настолько неловко, что старалась держаться в тени.[p]

#
Вдруг.[p]

[v storage="149"]

#？？？	
Это платье тебе очень идёт.[p]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos2_mu.png" wait=true]
[md name="maria" face="hamehura_Maria_cos5_odo"]

#
Нежный голос неожиданно прошептал рядом.[r]
Мария подняла глаза и увидела,[r]
Николя, одетого в роскошный наряд.[p]

[md name="nicol" face="hamehura_Nicol_cos2_def"]

[v storage="151"]

#Николь
Ты очень красивая.[p]

[md name="maria" face="hamehura_Maria_cos5_kon"]

#Мария
Г-господин Николь, вы тоже...[p]

#Николь
О, ну, спасибо.[p]

[md name="maria" face="hamehura_Maria_cos5_tere"]
[md name="nicol" face="hamehura_Nicol_cos2_mu"]

#
Николь мягко улыбнулся и[r]
взял Марию за руку и сказал: 'Ну что ж.'[p]

[v storage="155"]

#Николь
Пойдём поговорим вон там?[p]

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
Он повёл её[r]
на тихий балкон под звёздным небом.[p]

[md name="maria" face="hamehura_Maria_cos5_tere2"]

#
Гул вечеринки доносился издалека.[p]

[md name="maria" face="hamehura_Maria_cos5_odo"]

[v storage="158"]

#Николь
—Мария.[p]

#
Не 'мисс Кэмпбелл,'[r]
Николь впервые назвал её по имени.[p]

#
Мария охватило удивление.[r]
Настолько, что гул вечеринки словно исчез.[p]

#
Николь нежно посмотрел на Марию[r]
и продолжил говорить.[p]

[md name="nicol" face="hamehura_Nicol_cos2_tere"]

[v storage="162"]

#Николь
Я люблю тебя.[r]
Я хочу идти с тобой по жизни.[p]

[v storage="163"]

#Николь
С тобой, мне кажется, мы можем вместе прожить спокойные и тёплые дни[r]
навсегда.[r]
Я не хочу тебя отпускать. Никогда раньше я не испытывал таких чувств.[p]

[chara_hide_all time=1000]


[eval exp="sf.nicol_cg_2=true" ]
[bg storage="nicol2.png"]

[v storage="164"]

#Николь
Так что... Мария.[r]
Пожалуйста, стань моей спутницей по жизни.[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
С этими словами Николь встал на колено[r]
и протянул руку Марии.[p]

#Мария
...![p]

#
Это уже были не формальные фразы, как в их первую встречу,[r]
и он не называл её мисс Кэмпбелл.[r]
Эти слова выражали настоящие чувства Николя,[p]

#
и Мария почувствовала, что никогда прежде[r]
никогда прежде не ощущала таких глубоких и тёплых чувств.[r]
Это было впервые в её жизни.[p]

#
От шока[r]
она даже немного смутилась, но—[p]

#Мария
(Я не хочу прощаться с господином Николем.[r]
Я хочу быть с ним всегда.)[p]

#
Она вспомнила, что сказала Софии—[r]
вспомнила своё признание в любви.[p]

#
Мария посмотрела на Николя уверенным взглядом.[p]

#Мария	
(Что делать?)

[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text="Взять Николя за руку"  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="Колебаться, стоит ли брать его за руку" target="*select_03_02" ]

[s]

*select_03_01
[cm]

	
#Мария
Я...[r]
Я всегда была влюблена в тебя.[p]

#Мария
Пожалуйста, позволь мне быть с тобой.[r]
Всегда, всегда...[p]

#
Мария взяла Николя за руку.[r]
Николь улыбнулся, как тёплый весенний цветок,[r]
и почтительно поцеловал её руку.[p]

[v storage="175"]

#Николь
Я клянусь любить тебя вечно.[p]

#
Николь поднялся, не отпуская руки Марии.[p]

#Мария
Прошу вас заботиться обо мне, господин Николь—[p]

#
Мария в ответ сжала его руку[r]
от всего сердца.[p]

#
Мягкий ветерок подул, унося лепестки цветов вокруг них,[r]
словно празднуя их союз—[p]

[celanim anim="green_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="green_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


[jump target="common3"]

*select_03_02
[cm]
	
#
А действительно ли я ему подхожу?[r]
Стоит ли мне довериться этим чувствам?[r]
Такие мысли кружились в голове Марии.[p]

#
Но—[p]

#Николь
Всё будет хорошо.[p]

#
Николь взял Марию за руку.[r]
И снова он почтительно поцеловал её руку.[p]

[v storage="175"]

#Николь
Я клянусь любить тебя вечно.[p]

#Николь
И я всегда буду тебя защищать.[p]

#Николь
Прошу — доверься мне.[p]

#
Николь встал и нежно обнял Марию.[r]
[p]

#
Наконец, Мария смогла произнести слова.[r]
И это были искренние, сердечные слова.[p]

#Мария
Я тоже...[r]
Я тоже люблю вас, господин Николь...[p]

#
Словно благословляя их двоих, звёздное небо[r]
ярко мерцало над ними—[p]

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



