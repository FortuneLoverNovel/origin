
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

#Мария	
Где это я...?[p]
[playbgm  volume=30   storage="M08_FinalMix.ogg" ]

;再生[p]
;[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=true loop=false ]
;[free_layermode]



/*
#Мария
[celanim anim="red_rose_1" layer="1" x=260 y=-150 count=1 speed=0.5 wait=false ]
[anim name="celanim" top=100 time=2000]
[wa]
@wait time=100
[celanim anim="red_rose_2" layer="1" x=260 y=100 count=1 speed=0.5 wait=true]
*/

#
Прекрасный сад, запах роз.[l][r]
Несмотря на пейзаж,[r]
девушка выглядела растерянной.[p]

#
Девушка, поступившая в магическую академию —[l][r]
Мария из любопытства[r]
бродила по академии...[p]

#Мария
Но потеряться вот так...[l][r]
Что же делать...?[p]

[bg storage="HF04_078.png"]

#
Мария осмотрелась.[l][r]
Тогда она заметила большое дерево.[p]

#Мария:hamehura_Maria_cos1_def
Точно, если я заберусь на это дерево,[r]
я смогу понять, где нахожусь...[p]

#
Мария, несмотря на юбку,[r]
поставила ногу на ствол.[p]
#
Однако...[l][r]
Как только ей показалось, что она сможет,[r]
и она собралась сделать усилие...[p]

[v storage="h1"]
#？？？
—Ох.[r]
Что ты там делаешь?[p]

#Мария:hamehura_Maria_cos1_odo
А?[p]

#Мария	
...Ах![p]

#
Всё ещё стоя в позе для подъёма,[r]
Мария широко раскрыла глаза.[l][r]
Потому что там стоял—[p]

[chara_move name="maria" left="&f.left" face="hamehura_Maria_cos1_ase"]

#Джордо
[chara_show name="gio" top="&f.top" left="&f.right" face="hamehura_Giord_cos1_doya"]


#Мария	
Д-Джордо-сама...!?[p]

[v storage="h2"]
#
Джордо Стюарт.[l][r]
Сам третий принц королевства.[p]

#
Мария быстро выпрямилась[r]
и глубоко поклонилась.[p]

#Мария
Прошу прощения.[r]
За этот неподобающий поступок,[r]
...перед вашим высочеством![p]

#Джордо	
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]

[v storage="17"]
Лезть на дерево[r]
в таком наряде?[r]
Какая вы сорванка.[p]

*dev4

#Мария	
Э-э...[p]
Что мне сказать?

[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="Сказать правду"  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="Отговориться" target="*select_01_02" ]

[s]

;正直に話す
*select_01_01
[cm]

#Мария
Я думала, сверху будет лучше видно...[r]
Я просто хотела понять, где нахожусь...[p]

#Джордо	
[chara_mod  name="gio" face="hamehura_Giord_cos1_doya"]

#Джордо	

Понятно.[l][r]
То есть ты заблудилась?[p]

#
Сказав это с улыбкой, он попал в точку,[r]
и Мария только пробормотала: «Уу...»[r]
ей нечего было сказать.[p]

[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]
[v storage="h2"]

#Джордо
[celanim anim="red_rose_1" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="red_rose_2" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]

[love_up]

#
Видя её смущение,[r]
Джордо тихо усмехнулся.[p]

#
Даже то, как он смеялся,[r]
было невероятно элегантно.[l][r]
Но для Марии в этот момент...[p]

[chara_mod  name="maria" face="hamehura_Maria_cos1_ai"]

#
то, что над ней смеялся принц...[p]

#
Смущённая до предела,[r]
она опустила лицо, пылающее от стыда.[p]

#

Однако.[r]
Следующие слова Джордо[r]
были мягкими и вежливыми.[p]

[jump target="*common_01"]

;ごまかす

*select_01_02
[cm]

[chara_mod  name="maria" face="hamehura_Maria_cos1_ase" ]

#Мария
(Если я признаюсь, что заблудилась,[r]
он снова засмеётся...)[p]

#Мария
Э-это... ничего особенного.[l][r]
Пожалуйста, не беспокойтесь...![p]

#Джордо
Когда говоришь «ничего»,[r]
это только вызывает больше вопросов.[p]

[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

#
Джордо слегка склонил голову.[p]

[chara_mod  name="maria" face="hamehura_Maria_cos1_ai"]

#
Даже этот жест был элегантным, но[l][r]
Марии казалось, что принц счёл её нелепой.[r]
и ей оставалось только опустить покрасневшее лицо.[p]

[chara_mod  name="gio" face="hamehura_Giord_cos1_ai"]

#Джордо
Ах, не делай такое лицо.[l][r]
Я не хотел быть жестоким.[p]

#
Голос Джордо был очень мягким,[r]
и полон учтивости.[p]

#Джордо
[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

#Джордо
Так, ты заблудилась, да?[p]

#Мария	
...Да...[p]


*common_01


#Джордо
[v storage="25"]
Тогда позволь мне проводить тебя.[p]

#Джордо
[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]

#
[v storage="h2"]
«Сюда», — сказал Джордо и начал идти.[l][r]
Мария удивилась, но не могла отказаться от[r]
предложенной доброты третьего принца.[p]

#Мария
С-с-пасибо вам большое![p]

#
Может, он и правда добрый.[l][r]
Подумав так, Мария[r]
пошла за Джордо.[p]

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

#Мария
—Вот что произошло тогда.[p]

#
Вспоминая свою встречу с Джордо,[r]
Мария тихо улыбнулась.[p]

#
С тех пор она запомнила план академии,[r]
и больше не терялась, как тогда.[r]
[p]

#Мария
До студенческого совета[r]
здесь короткий путь, верно?[l][r]
...Интересно, всем понравится?[p]

#
В руках Марии была корзинка,[r]
полная домашних маффинов.[p]
Представив их радостные лица,[r]
Мария пошла легче.[p]

[fadeoutbgm time=1000]

#
—Но.[p]

[playbgm  volume=30   storage="M43_FinalMix.ogg"]

[chara_move name="maria" left="&f.left" ]
[chara_show name="kata" face="hamehura_Catalina_cos1_do" top="&f.top" left="&f.right" ]

#Катарина
[v storage="36"]
Мария, куда ты идёшь?[p]

#Мария
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase"]
Ах...[p]

#
Голос, полный враждебности и злобы,[r]
остановил Марию.[p]

#
Не успев опомниться, Мария оказалась окружена[r]
несколькими аристократками.[p]

#
Во главе их стояла[r]
леди Катарина Клаес, дочь герцога.[l][r]
Она была невестой Джордо.[p]

#
Прежде чем Мария успела что-то сказать,[r]
Катарина решительно подошла к Марии[r]
и подняла руку—[p]

[if exp="sf.btn_volume==true"]
[playse storage="se/punch-middle2.ogg" ]
[endif]

;[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=2 easing=linear]
@quake_camera

#
—Шлёп![p]

#
Она сбила корзинку на землю.[l][r]
Пирожные с приятным запахом[r]
выкатились на землю.[p]

#Катарина
[chara_mod  name="kata" face="hamehura_Catalina_cos1_aku"]
[v storage="43"]

[kanim layer=0 name="kata" keyframe=quake time=300 count=1 easing=linear]

Только потому, что у тебя есть магия света,[r]
ты думаешь, что тебе будут льстить,[r]
и что все будут тебя превозносить![p]

#
Катарина нахмурила брови[r]
и, выкрикивая злые слова,[r]
злобно посмотрела на упавшие маффины.[p]

#Катарина
[v storage="45"]

Ты думаешь, что это жалкое угощение, сделанное простолюдинкой,[r]
подходит для студенческого совета?[r]
Как это нелепо![p]

#
Катарина подняла ногу.[r]
Она собиралась раздавить маффины.[p]

#Мария
[kanim layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]
[font size="40"]
Прекрати—[p]
[resetfont]

#
Мария попыталась протянуть руку,[l][r]
но в этот момент...[p]

[chara_hide name="maria" wait=false ]
[chara_hide name="kata" wait=true ]	

[wait time=1000]

;[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=1 easing=linear]
@quake_camera


#？？？
[font size="40"]
Прекрати![p]
[resetfont]

#Джордо
[chara_show name="gio" top="&f.top" left="&f.left" face="hamehura_Giord_cos1_do" ]
[chara_show name="kata" face="hamehura_Catalina_cos1_do" top="&f.top" left="&f.right" ]
 
#Катарина

[chara_mod  name="kata" face="hamehura_Catalina_cos1_odo" ]
[kanim layer=0 name="kata" keyframe=quake time=300 count=1 easing=linear]

[v storage="50"]
Д-Джордо-сама!?[p]

#Джордо
[v storage="51"]

На моих глазах[r]
ты посмела нарушить порядок?[r]
Я не допущу этого.[p]

#Катарина	
[chara_mod  name="kata" face="hamehura_Catalina_cos1_ai" ]
[v storage="52"]

Чёрт...![r]
Но, Джордо-сама—[p]

#Джордо	
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]

Катарина, я думал, что ты умнее...[r]
[p]

Ты ведь не ждёшь,[r]
что мне придётся объяснять это дважды?[l][r]
Если да, то это просто шутка.[p]

#Катарина	
[chara_mod  name="kata" face="hamehura_Catalina_cos1_ai"]
[v storage="54"]
Угхх...![p]

#
Перед холодным тоном Джордо[r]
даже Катарина не могла ничего возразить.[p]

#
Её лицо было красным от злости,[r]
и, злобно глянув на Марию,[r]
быстро покинула место вместе со свитой.[p]

[fadeoutbgm]

[if exp="sf.btn_volume==true"]
[playse storage="se/dash-asphalt1.ogg" ]
[endif]

[chara_hide name="kata" time=2000 wait=true]
[stopse ]

[playbgm  volume=30   storage="M17_FinalMix.ogg" ]

#Мария
[chara_move name="gio" left="&f.right"]
[chara_show name="maria" top=&f.top left="&f.left" face="hamehura_Maria_cos1_ai"]
Э-это... Джордо-сама...[p]

#
Стоит ли извиниться за неудобства[l][r]
или поблагодарить его за помощь?[l][r]
Мария не знала, что сказать.[p]


#

Тем временем Джордо[r]
спокойно поднял один из упавших маффинов[l][r]
и, не колеблясь, откусил.[p]

[chara_hide_all ]

[bg storage="hamehura_jiorudo1.png" ]
[eval exp="sf.gio_cg_1=true" ]
#Мария
Ч-что—!?[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#Джордо	
[v storage="61"]

Мм.[r]
Очень вкусно.[p]

#
[v storage="h2"]
Словно цветы распустились одновременно.[l][r]
С такой нежной улыбкой[r]
Джордо улыбался Марии.[p]

#
—Тук-тук.[l][r]
В этот момент в сердце Марии вспыхнул огонь...[p]

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
Приближался конец года.[p]

[bg storage="HF04_283.png" time=1000 ]

[chara_show name="maria" top="&f.top" left="&f.left" time=1000 face="hamehura_Maria_cos1_mu" ]

#
Мария сидела на дереве[r]
и смотрела на академию.[p]

#Мария
Этот год...[r]
Так много всего произошло...[p]

[chara_mod  name="maria" face="hamehura_Maria_cos1_def"]

#Мария
Я встретила Джордо-сама здесь, да?[l][r]
Он так много для меня сделал...[p]


#
Кстати,[r]
Джордо всегда в моих воспоминаниях.[p]

Вспоминая его добрую улыбку,[r]
Мария почувствовала, как её лицо начинает гореть.[p]

[chara_hide name="maria"]

#？？？
[v storage="h3"]
...Мария.[p]

#
В этот момент она услышала, как её позвали.[l][r]
Под деревом стоял Джордо.[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" face="hamehura_Giord_cos1_def"]


#Джордо

Ты всегда так свободна, словно бабочка,[r]
не так ли?[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#Мария
[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]
Ах.[p]


#
[v storage="h2"]
Джордо тихо хихикнул.[l][r]
Чувствуя себя дразнимой,[r]
Мария поспешила что-то сказать.[p]

#
Но прежде чем Мария успела что-то сказать,[r]
Джордо заговорил, всё ещё улыбаясь.[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#Джордо
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]
[v storage="75"]

Мария, спускайся.[p]

#

Джордо широко раскинул руки.[l][r]
Я тебя поймаю.[l][r]
Услышав это, Мария растерялась.[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]


#Мария
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase" ]
Н-но—[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#Джордо	

Всё в порядке.[l][r]
[chara_mod  name="gio" face="hamehura_Giord_cos1_ai"]

...Или ты мне не доверяешь?[p]
[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#Мария
Нет, вовсе нет...![p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#Джордо
[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

Тогда давай.[p]

#

Джордо продолжал улыбаться,[r]
глядя на Марию.[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#Мария
Что мне делать?

;[glink  color="white"  size="20"  x="360"  width="400"  y="100"  text="Прыгнуть"  target="*select_02_01"  ]
;[glink  color="white"  size="20"  x="360"  width="400"  y="170"  text="Заколебаться"  target="*select_02_02"  ]

[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text="Прыгнуть"  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="Заколебаться" target="*select_02_02" ]


[s]

;;;;;;跳ぶ　
*select_02_01
[cm]

#
Мария знала, что не сможет отказаться от такой улыбки.[r]
[p]

#Мария
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase"]
...[p]

#
Чувствуя взгляд Джордо,[r]
Мария отвела пылающее лицо.[r]
[p]

#Мария
(Джордо-сама...[l][r]
ждёт меня...)[p]

#
Собрав свою смелость, несмотря на смущение,[r]
Мария прыгнула к Джордо.[p]

;白転
[chara_hide name="maria" time=100]
[chara_hide name="gio" time=100]
[bg storage="white.png" time=100] 

[wait time=1000 ]

#
—Шуух.[p]

[bg storage="HF04_292.png" time=1000] 

#
Его руки нежно поймали её.[p]

[chara_show name="maria" top="&f.top" left="&f.left" wait=false]
[chara_show name="gio" top="&f.top" left="&f.right" wait=true]

#Джордо
[chara_mod  name="gio" face="hamehura_Giord_cos1_man" ]	
[v storage="85"]
Поймал.[p]

#Джордо
[celanim anim="red_rose_1" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="red_rose_2" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]

[love_up]


[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]

#

Шёпот Джордо ласкал ухо Марии[r]
и его тёплые, сильные руки[r]
надёжно держали её.[p]

#Джордо
[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

...Хех.[l][r]
Ты такая честная... и хорошая девушка.[p]

#
Палец Джордо нежно погладил щёку Марии[r]
будто хваля её...[p]

@jump target="common_02"

;;;;;;;;;;ためらう
*select_02_02

[cm]
#Мария
[chara_mod  name="maria" face="hamehura_Maria_cos1_ai"]

Э-это опасно, знаете ли?[r]
А если бы с вами что-то случилось?[p]

#
Мария попыталась оправдаться, но на самом деле[r]
правда была в том,[r]
что она просто смутилась.[p]

#
Конечно, Джордо прекрасно это знал.[r]
[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#Джордо
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]
[v storage="h1"]

Ох?[r]
Я кажусь тебе таким ненадёжным?[l][r]
Как неожиданно... Мне даже обидно.[p]

#

Джордо нарочито вздохнул[r]
[l][r]
Конечно, он всё ещё улыбался.[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#Мария
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase"]
(Ухх... Это нечестно...)[p]

#
Теперь у Марии не оставалось выбора, кроме как подчиниться.[l][r]
Мария прыгнула к Джордо.[p]


;白転
[chara_hide name="maria" time=100]
[chara_hide name="gio" time=100]
[bg storage="white.png" time=100] 

[wait time=1000 ]

#
—Шуух.[p]

[bg storage="HF04_292.png" time=1000] 
;[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=2 easing=linear]
@quake_camera

#
Его руки нежно поймали её.[p]

[chara_show name="maria" top="&f.top" left="&f.left" wait=false]
[chara_show name="gio" top="&f.top" left="&f.right" wait=true]

[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]

#Джордо	
[v storage="85"]

Поймал.[p]

#
Шёпот Джордо нежно задел ухо Марии[r]
и его тёплые, сильные руки[r]
надёжно держали её.[p]

;;;;;;;;;

*common_02


#Джордо
[chara_mod  name="gio" face="hamehura_Giord_cos1_doya"]

[v storage="88"]

Я хочу сказать тебе кое-что.[r]
Завтра вечером, встретимся в часовне.[p]

#
С этими словами Джордо закончил[r]
и отпустил Марию.[p]

#Джордо
[v storage="90"]
Я буду ждать тебя.[p]

#
Сказал он с улыбкой,[r]
когда он повернулся на каблуках и элегантно[r]
ушёл, его плащ колыхался за ним.[p]

*dev3
[chara_hide_all ]

[bg storage="black.png" time=1000] 
[wait time=1000 ]

[bg storage="HF04_251.png"]
[playbgm  volume=30   storage="M28_FinalMix.ogg" ]
	
#
Как сказал Джордо,[r]
Мария шла сквозь вечерние сумерки,[r]
направляясь к часовне.[p]

#
Шёпот, шёпот...[p]

#
До ушей Марии[r]
долетел шёпот благородных девиц.[p]

[chara_show name="reijo1" top="&f.top" face="hamehura_DVDmob1_do"]
[chara_show name="reijo2" top="&f.top" face="hamehura_DVDmob2_do" ]
[chara_show name="reijo3" top="&f.top" face="hamehura_DVDmob3_do"]


#Девица 1
Ты слышала?[l][r]
Леди Катарину сослали за пределы королевства.[p]

#Девица 2:hamehura_DVDmob2_fear
О боже...[l][r]
А что будет с Джордо-сама?[p]

#Девица 1
Говорят, он интересуется простолюдинкой...[p]

#Девица 3
Ссылка Катарины[r]
дело рук этой простолюдинки...[p]

#Девица 2
Неужели Джордо-сама[r]
соблазнён этой простолюдинкой?[p]

#Девица 3:hamehura_DVDmob3_fear
У неё невинное лицо, но[r]
она настоящая злодейка.[p]

#Девица 1
Меня беспокоит Джордо-сама...[l][r]
Если эта женщина испортит репутацию Джордо-сама,[r]
он больше не оправится.[p]

#Девица 3:hamehura_DVDmob3_do
Хм, выбрать такую женщину?[r]
Я так разочарована в Джордо-сама![p]

#Девица 2:hamehura_DVDmob2_do
Он не понимает,[r]
что это значит для будущего короля?[p]

Он будто выбирает свою погибель.[r]
[p]

#Девица 3:hamehura_DVDmob3_fear
Тсс, это та самая простолюдинка...[l][r]
Если подойдём ближе,[r]
нас тоже могут втянуть...[p]

[chara_hide_all]

#
Неправдивые злые слухи.[l][r]

Шипы злобы пронзили сердце Марии.[r]
[p]

[chara_show name="maria" top=&f.top face="hamehura_Maria_cos1_ai"]

#Мария
...Ах.[p]

#
Мария сжала губы и молча терпела.[p]

#
—Это было больно.[p]

#
Не столько оскорбления в её адрес,[r]
сколько то, что из-за неё[r]
злословят о дорогом ей человеке.[p]

#
Это было больнее всего для Марии,[r]
и она не могла это вынести.[p]

В то же время[r]
она почувствовала вину перед Джордо.[p]

#
Мария, пытаясь избавиться от слухов и чувств,[r]
поспешила прочь.[r]
[p]

[chara_hide name="maria" ]

[bg storage="black.png" ]


[bg storage="kyokai.png" ]
	
#
Когда Мария открыла двери часовни,[r]
Джордо уже был там.[p]

[playbgm  volume=30   storage="M21_FinalMix.ogg"]

[chara_show name="gio" top="&f.top" left="&f.right" face="hamehura_Giord_cos1_doya"]


#
Свет вечерних сумерек[r]
падал через алые витражи,[r]
освещая Джордо мистическим светом.[p]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_def"]

#Мария
Как красиво—[p]

#
Это было похоже на что-то не из этого мира.[r]
Мария тихо вздохнула.[p]

[chara_mod name="gio" face="hamehura_Giord_cos1_doya"]

#Джордо
[v storage="119"]
Мария, подойди.[p]

[chara_mod name="maria" face="hamehura_Maria_cos1_mu"]

#
Джордо поманил её рукой.[r]
Придя в себя, Мария встала рядом с ним.[p]

#Мария
Джордо-сама, вы хотели что-то сказать—[p]

#Джордо:hamehura_Giord_cos1_def
[v storage="122"]
...Я никогда не встречал никого, как ты.[p]

#Мария:hamehura_Maria_cos1_odo
А?[p]

#Джордо
[v storage="124"]
Ты яркая во всём, что делаешь...[r]
Я думал, что мои дни всегда будут одинаковыми,[r]
но с тех пор, как я встретил тебя, они наполнились красками.[p]

#Джордо:hamehura_Giord_cos1_doya
[v storage="125"]
Не успел я заметить, как всегда следил за тобой—[r]
Я хотел тебя.[p]

#Джордо:hamehura_Giord_cos1_def
[v storage="126"]
Но стоило мне протянуть руку, как ты ускользала, словно бабочка.[r]
А затем, как котёнок,[r]
ты смотрела на меня так мило...[p]

#Джордо
[v storage="127"]
Все другие сами стремятся стать моими,[r]
понимаешь? Хе-хе.[p]

#Джордо:hamehura_Giord_cos1_doya
[v storage="128"]
...Но сегодня,[r]
я хочу сказать тебе.[p]

#
Джордо взял Марию за руку[r]
и встал на колено, как принц.[p]

#Джордо:hamehura_Giord_cos1_man
[v storage="130"]

Мария.[r]
Стань моей принцессой, только моей.[p]

#Мария
Джордо-сама...[p]

#
Мария ошеломлённо[r]
смотрела в глаза Джордо.[p]

#
Она не была настолько глупа, чтобы не понять,[r]
что это было предложение.[p]

#
Я так рада.[p]

[chara_mod name="maria" face="hamehura_Maria_cos1_ase"]

#
...Но.[p]

#
Мария вспомнила[r]
злобные слухи.[p]

#Мария:hamehura_Maria_cos1_ai
...Со мной, Джордо-сама,[r]
я только доставлю вам хлопоты.[p]

[chara_mod name="gio" face="hamehura_Giord_cos1_ai"]

#Мария
Джордо-сама,[r]
вы будущий кандидат на трон.[l][r]
Женщина, как я, лишь испортит вашу репутацию.[p]

#Мария
Все так говорят.[l][r]
Что я стану причиной[r]
гибели Джордо-сама.[p]

#Джордо
[v storage="139"]

—Ах, ну надо же.[p]

#
Прерывая Марию, которая повесила голову,[r]
Джордо слегка улыбнулся.[p]

#Джордо
[v storage="141"]

Неужели мне снова[r]
придётся ловить тебя?[p]

[chara_mod name="gio" face="hamehura_Giord_cos1_ai"]

#
Его улыбающиеся губы цвета розы[r]
нежно коснулись руки Марии.[p]

[kanim layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
Мария дёрнулась,[r]
когда Джордо встал и[r]
заглянул ей в глаза.[p]

#Джордо:hamehura_Giord_cos1_doya
[v storage="144"]
Я однажды стану королём этой страны.[r]
Короля не могут волновать слухи[r]
мелких людей.[p]

#Джордо
[v storage="145"]
Просто сохраняй достоинство.[p]
И ты, и я.[l][r]
Потому что это правда,[r]
и нам не за что стыдиться, не так ли?[p]

#Джордо:hamehura_Giord_cos1_def
[v storage="146"]

...Так что, пожалуйста, не сдавайся.[p]

#

Какой бы ты ни была, я приму тебя—[l][r]
Это намерение читалось[r]
в его мягком, но твёрдом взгляде.[p]

#Мария
Что мне ответить?

;[glink  color="white"  size="20"  x="360"  width="400"  y="100"  text="Вы правда уверены, что я подхожу?"  target="*select_03_01"  ]
;[glink  color="white"  size="20"  x="360"  width="400"  y="170"  text="Я с радостью приму."  target="*select_03_02"  ]

[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text="Вы правда уверены, что я подхожу?"  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="Я с радостью приму." target="*select_03_02" ]

[s]

*select_03_01
[eval exp="f.end=1"]

[cm]
#Мария:hamehura_Maria_cos1_ai
Джордо-сама...[l][r]
Вы правда уверены... что всё в порядке?[p]

#
Голос Марии дрожал.[l][r]
Какой же он добрый человек.[p]

Глаза её наполнились слезами от радости.[p]

#Мария
Если я отдам вам всю себя...[r]
Это будет нормально?[p]

#Джордо:hamehura_Giord_cos1_man
[v storage="151"]
Конечно, Мария.[p]



[chara_hide_all]
[bg storage="white.png" time=1000] 

[wait time=1000 ]

[bg storage="hamehura_jiorudo2.png" time=3000 ]
[eval exp="sf.gio_cg_2=true" ]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1000 mode=screen wait=false loop=false ]
[endif]

#
Джордо улыбнулся и раскинул руки.[p]

Мария, по своей воле,[r]
отдалась в его объятия.[p]

#
[v storage="h2"]
Это было самое нежное объятие, что у них было.[p]

В сверкании витражного света[r]
они смотрели друг другу в глаза.[p]

#
Джордо медленно наклонился к ней.[l][r]
Мария закрыла глаза, готовая принять это.[p]

#
[v storage="h4"]

—Тёплый поцелуй.[p]

@jump target="common_03"

*select_03_02

[eval exp="f.end=2"]

[cm]

#Мария:hamehura_Maria_cos1_def2
Джордо-сама—[l][r]
Я с радостью приму.[p]

#
Голос Марии дрожал.[p]

Теперь ей было позволено идти с ним рядом.[l][r]
Эта радость растопила её сердце.[p]

#Джордо
[celanim anim="red_rose_1" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="red_rose_2" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]

[love_up]

#
Джордо, полный счастья,[r]
довольно прищурил глаза.[p]

#Джордо:hamehura_Giord_cos1_man
...Ты такая хорошая девушка.[p]

#
Это был маленький, сладкий шёпот,[r]
услышанный только Марией.[p]

[chara_hide_all]
[bg storage="white.png" time=1000] 

[bg storage="hamehura_jiorudo2.png" time=3000 ]
[eval exp="sf.gio_cg_2=true" ]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1000 mode=screen wait=false loop=false ]
[endif]

#
В следующий момент Джордо[r]
сильно притянул Марию в свои объятия.[p]

#Мария
Джордо-сама...![p]

#
Мария, по своей воле[r]
изо всех сил обняла его в ответ.[p]

#

Это было самое страстное объятие за всё время.[l][r]
В сверкании витражного света[r]
они смотрели друг другу в глаза.[p]

#
Джордо медленно наклонился к ней.[l][r]
Мария закрыла глаза, готовая принять это.[p]

#
[v storage="h4"]
—Такой горячий поцелуй, что она могла растаять.[p]
*common_03

#
Когда их лица разошлись,[r]
Джордо улыбался.[p]

#Джордо
[v storage="157"]

Ну, а теперь ты можешь сказать мне,[r]
кто распускает эти нелепые слухи?[r]
[p]

#
[v storage="h2"]

Всё ещё нежно улыбаясь, Джордо[r]
показал свою тёмную сторону.[p]

#
—Ах, всё тот же Джордо-сама.[p]

[free_layermode time=1000 ]

#
Мария не могла не[r]
тихо засмеяться.[p]
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

