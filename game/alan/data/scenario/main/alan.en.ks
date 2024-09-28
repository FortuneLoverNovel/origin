
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

#Maria


I'm exhausted...[p]

[playbgm  volume=15   storage="M33_FinalMix.ogg" ]


#
Maria was slumped over a desk in the library corner.[p]

#Maria
Now that finals are over,[r]
I thought I could finally rest...[p]

[chara_hide name="maria"]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

#
Maria's thoughts turned to...[r]
the Fourth Prince, Alan Stuart.[p]

#
Not just his twin, Geordo,[r]
but also that even Maria, a commoner,[r]
outdid him in the exams, leaving Alan irritated.[p]

[chara_hide name="alan"]
[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=true]

#Maria
Every time we meet, he says something harsh...[r]
It really hurts...[p]

#

But it's out of frustration,[r]
not malice, like Katarina's.[r]
I get that.[p]

[md name="maria" face="無表情"]

#
If I cause Alan stress,[r]
Maria thought she should avoid him.[p]

[stopbgm]

#
Just then,[p]

[playbgm  volume=15   storage="M40_FinalMix.ogg" ]
[playse storage="se/door-open1.ogg" ]
[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]


[md name="maria" face="焦り"]
#
She heard the library door open,[r]
and Maria jumped up in surprise.[p]

#
Peeking from behind the shelf, she saw who entered.[r]
It was him, looking displeased.[p]

[chara_hide name="maria"]

[v storage="h1" ]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]


[wait time=1000]
	
[chara_hide name="alan"]	
[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" wait=true]

#Maria
Ugh... It's Prince Alan...[p]

#Maria

(What should I do?)
	
[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="I should hide."  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="I should quietly leave." target="*select_01_02" ]

[s]

;隠れておこう
*select_01_01
[cm]

[md name="maria" face="焦り"]

[love_up]

#Maria
(If he finds me,[r]
he might say something harsh again...)[p]

;[anim name="maria" left=-1000 ]
;[wa]

[chara_hide name="maria"]

#
Maria hid behind the bookshelf.[p]

[playse storage="se/walk-asphalt1.ogg"]

#
...Alan's footsteps were approaching.[p]

#
To Maria, those footsteps felt like[r]
they carried his irritation.[r]
She held her breath, hoping not to be noticed.[p]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_do" wait=true]

[stopse]

#Alan	
...Tch.[p]


#
As they passed on opposite sides of the bookshelf,[r]
Alan clicked his tongue.[p]

[chara_hide name="alan" pos_mode=false ]

[wait time=1000]

;[anim name="maria" left="&f.left" time=2300 ]
;[wa]


[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" wait=true]

#
Maria flinched, but thankfully,[r]
it seemed Alan hadn't noticed her.[p]

[md name="maria" face="悲しみ"]

#Maria
(Prince Alan seems upset again today.[r]
I'm glad he didn't see me...[p]

[md name="maria" face="無表情"]

#
Maria sighed in relief,[r]
and continued hiding behind the bookshelf,[r]
quietly slipping out of the library.[p]

[jump target="*common1" ]

*select_01_02
[cm]

[md name="maria" face="焦り"]

#Maria
(If I stay hidden behind the bookshelf and take a detour,[r]
I should be able to avoid him...)[p]

#
Maria, hiding behind the bookshelf,[r]
headed for the library door.[p]

[chara_hide name="maria"]

[playse storage="se/walk-asphalt1.ogg"]

#
From afar, Alan's[r]
irritated footsteps could still be heard.[p]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" wait=true]

#Maria
(Please, don't let him notice me...)[p]

#
The door was right in front of her.[r]
Maria opened the door carefully, making no sound.[r]
She opened the door slowly.[p]

[md name="maria" face="驚き" ]

[playse storage="se/door-open1.ogg"]

#
But despite her efforts,[r]
a slight noise escaped...[p]

[stopbgm]
[md name="maria" face="焦り" ]

#Maria
Ah.[p]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_odo" wait=true]

#Alan	
Ah.[p]

[playbgm  volume=15 storage="M46_FinalMix.ogg" ]

#
As Alan turned around,[r]
just as Maria was about to step through the door,[r]
it happened at the same time.[p]

#
Their eyes met, and they spoke at the same time.[p]

[md name="alan" face="怒り"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Maria
E-excuse me![p]

[playse storage="se/dash-asphalt2.ogg" ]

[chara_hide name="maria"]

[md name="alan" face="驚き"]

[v storage="h2"]

#
Before Alan could say anything,[r]
Maria hurried out of the library.[p]

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
Once again, like every day,[r]
trying to avoid running into Alan,[r]
she kept sneaking around.[p]

#
Maria glanced around nervously[r]
as she walked through the courtyard.[p]

[md name="maria" face="微笑み" ]

#Maria
It seems Prince Alan isn't around here...[p]

#
She let out a sigh of relief.[r]
It was at that moment.[p]

[fadeinbgm  volume=15 storage="M02_FinalMix.ogg" time=2000 ]
[wait time=2000]

[md name="maria" face="驚き" ]

#
From beyond the garden hedge, the sound of a violin[r]
weaving a beautiful melody.[p]

[md name="maria" face="笑顔" ]

#Maria
What a beautiful sound...[p]

[md name="maria" face="微笑み" ]

#Maria
(I wonder who's playing?)[p]

[chara_hide name="maria"]

[bg storage="HF04_292.png" ]


[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_def" wait=true]

#
Maria quietly[r]
peeked out from behind the hedge.[r]
And there she saw...[p]

[chara_move name="maria" top="&f.top" left="&f.left" wait=true]
[md name="maria" face="驚き"]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]


#Maria
Prince Alan...?[p]

[stopbgm]
[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

[md name="alan" face="怒り"]

#Alan	

[v storage="22"]

[font size=30]
W-who's there!?
[resetfont]
[p]

[playbgm  volume=15   storage="M09_FinalMix.ogg" ]

#
Sensing someone's presence,[r]
Alan stopped playing and sharply turned around.[p]

[md name="maria" face="焦り"]

#Maria
Ah![r]
Uh, um, I'm sorry...![p]

#Maria
I didn't mean to eavesdrop,[r]
I just heard such a beautiful sound...![p]

[md name="alan" face="驚き"]

#Alan	
...A beautiful sound?[p]

[v storage="h6"]

#
Alan frowned.[r]
As if looking at something unpleasant,[r]
he cast his gaze down at the violin.[p]

[md name="alan" face="悲しみ"]

[v storage="27"]

#Alan	
Beautiful, huh?[r]
Geordo is much better than me.[r]
You must think that too, don't you?[p]

[md name="maria" face="怒り"]

#Maria
That's not true at all![p]

[md name="maria" face="微笑み"]

#Maria
It was truly... a wonderful performance.[p]

[md name="maria" face="焦り"]

[v storage="29_A"]

#Alan	
I'm always second place, at best.[p]

[v storage="29_B"]

#Alan	
Whether it's studies or violin, in everything...[r]
No matter how hard I try...[r]
I'll never catch up...[p]

#
Alan sighed heavily and turned away.[r]
Maria sensed the heavy burden of sadness Alan carried.[p]

[md name="maria" face="悲しみ"]
[md name="alan" face="驚き"]

#
Maria took a step[r]
towards Alan's back.[p]

#Maria
Prince Alan, you have your own strengths and[r]
weaknesses, don't you?[p]

#Maria

It's normal to have things you're good and bad at.[r]
Isn't that perfectly natural?[p]

[md name="maria" face="微笑み"]
[md name="alan" face="無表情"]

#Maria
Surely, there's no such thing as a perfect person.[p]

#Maria
Neither I, nor Prince Geordo, nor you, Prince Alan...[r]
Everyone has something they're not good at,[r]
and also something they're skilled at.[p]

[md name="maria" face="笑顔"]


#Maria
That's why I think,[r]
you should stay just the way you are, Prince Alan.[r]
That's what I believe.[p]

[md name="maria" face="微笑み"]
[md name="alan" face="悲しみ"]


#Alan
You...[p]

#
Alan turned around.[r]
His face looked like that of a scolded child.[p]

[v storage="38"]

#Alan
...Do you really think that?[p]

[md name="maria" face="笑顔"]

#Maria
Yes, I do.[p]

[md name="maria" face="微笑み"]

#Alan	
...[p]

[md name="alan" face="微笑み"]

#Alan	
[font size=18]
...I see. ...Maybe you're right.
[resetfont]

[p]

[md name="maria" face="笑顔"]

#Maria
I'm sure of it.[p]

[md name="maria" face="照れ"]

#Maria
And once again...[p]

[md name="maria" face="笑顔"]
[md name="alan" face="驚き"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Maria
I really do like your playing, Prince Alan![r]
It was truly wonderful.[r]
Please let me hear it again![p]

[md name="alan" face="微笑み"]

#Alan	
Yeah.[p]

[md name="maria" face="微笑み"]
[md name="alan" face="無表情"]

#Alan	
......[p]

[v storage="45"]

[md name="alan" face="照れ"]

#Alan	
[font size="18"]
...Thank you.
[resetfont]
[p]

#
Averting his gaze,[r]
Alan mumbled softly.[p]

[md name="maria" face="驚き"]
[md name="alan" face="悲しみ"]

[v storage="47"]

#Alan	
...I said some harsh things to you, didn't I?[r]
I was taking out my frustrations. ...I'm sorry.[p]

[md name="maria" face="微笑み"]
[md name="alan" face="驚き"]

#Maria
Then... should we make up?[p]

[md name="alan" face="悲しみ"]

#Alan
Make up...? How?[p]

[md name="maria" face="照れ"]

#Maria
Hmm.[r]
How about a handshake?[p]

[md name="alan" face="無表情"]

#Alan
A handshake...?[p]

[md name="maria" face="微笑み"]
[md name="alan" face="照れ"]

#
Alan looked at his hand.[r]
Then, a bit shyly, he said 'Hmph'[r]
and offered his hand.[p]

[md name="maria" face="笑顔"]
[md name="alan" face="微笑み"]

#
Maria took his hand.[p]

[md name="maria" face="照れ"]

#Maria
(Such a big hand...[r]
But he's just like a child...)[p]
[md name="maria" face="微笑み"]
[md name="alan" face="怒り"]

[v storage="h2"]

#
As Maria chuckled, Alan[r]
looked away, embarrassed, saying,[r]
'Don't laugh.'[p]


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
The seasons passed,[r]
and the day of the exams came again,[r]
and finally, today, it was over.[p]


[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_ai" wait=true]

#Maria
I'm so tired...[r]
I've been buried in studies lately...[p]

[md name="maria" face="無表情"]

#
Now all that's left is to wait for the results.[r]
I feel free, but also incredibly tired.[p]

Maria decided to get some fresh air[r]
and headed to the courtyard.[p]

#

...but,[p]

[chara_hide name="maria" ]

[bg storage="HF04_078.png"]


[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_odo" wait=true]
	
#
someone was already in her favorite spot.[r]
It was Alan, lying down.[p]

#Alan
...[p]

#Maria
Is he... sleeping?[p]

#Maria
(What should I do?)

[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text="Watch him sleep."  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="Try talking to him." target="*select_02_02" ]

[s]

*select_02_01
[cm]

[md name="maria" face="照れ"]

#Maria
(Prince Alan's sleeping face...[r]
This is such a rare sight...)[p]

#
Out of curiosity,[r]
Maria quietly approached Alan[r]
and slowly looked at his face.[p]

[md name="maria" face="驚き"]

#
In the dappled sunlight, his sleeping face[r]
looked as if it had been carved from stone,[r]
perfectly composed.[p]

[md name="maria" face="微笑み"]

#
And yet, there was a certain innocence to it.[r]
A feeling of tenderness swelled up inside her.[p]

#Maria
(...So beautiful...)[p]

#
As Maria thought this,[r]
she realized she was the only one seeing him like this right now,[r]
and a slight smile of happiness crossed her face.[p]

[md name="maria" face="笑顔"]

#Maria
Hehe.[p]

#
Just then,[r]
Alan's eyes suddenly opened.[p]

[md name="maria" face="驚き"]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

[v storage="h2"]

#Alan
...Hey.[p]

[md name="maria" face="焦り"]
[chara_move name="maria" left="&f.left" time=500 ]

#Maria
Ah... I'm sorry.[r]
Did I wake you...?[p]

#Alan
...I heard your footsteps.[p]

#Maria
So you were already awake...[p]

#
Looking at his face,[r]
she wondered if she had made an awkward face[r]
while doing it...[p]

#
Feeling embarrassed,[r]
Maria's cheeks grew warm.[p]

#
Alan looked at the blushing Maria,[p]

[jump target="common2"]

*select_02_02
[cm]

[md name="maria" face="悲しみ"]

#Maria
(Is he sleeping...?[r]
It'd be bad to wake him, right?)[p]

[md name="maria" face="微笑み"]

#Maria
(But still, I'd like to talk to him...[r]
even just a little bit...)[p]

[md name="maria" face="照れ"]

#Maria
Prince Alan...?[p]

#
Hesitantly, Maria[r]
called out to him quietly.[p]

#Alan
...[p]

[md name="maria" face="無表情"]

#
There was no response from Alan.[p]

#Maria
(So he really is asleep...[r]
Maybe he's tired from the exams too...)[p]

#
And at that moment,[r]
Alan's eyes suddenly opened.[p]

[md name="maria" face="驚き"]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

[v storage="h2"]

#Alan
...Hey.[p]

[md name="maria" face="焦り"]

[chara_move name="maria" left="&f.left" time=500 ]
;[wa]

#Maria
Ah... I'm sorry.[r]
Did I wake you...?[p]

[md name="alan" face="ドヤ顔"]

#Alan
Is calling my name once enough for you?[p]

[md name="maria" face="驚き"]

#Maria
Huh—[p]

#Maria
(Ah, so he was awake the whole time...)[p]

[md name="maria" face="照れ"]

#
He narrowed his eyes teasingly,[r]
and caught Maria in his gaze.[r]
Maria's cheeks grew hot.[p]

#Maria
P-Prince Alan.[r]
G-good morning...[p]

[md name="maria" face="微笑み"]
[md name="alan" face="微笑み"]

[celanim anim="blue_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="blue_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#Alan
Yeah.[p]

#
Seeing Maria looking down in embarrassment,[r]
Alan let out a small laugh.[p]

*common2

[md name="maria" face="驚き"]
[md name="alan" face="微笑み"]


[v storage="65"]

#Alan
...Come here.[p]

#
Alan motioned for her to come closer.[r]
When Maria approached,[r]
he patted the ground beside him and said, 'Sit.'[p]

[v storage="67"]

#Alan
Come closer.[p]

#Maria
(Could it be that Prince Alan...[r]
wants me to give him a lap pillow?)[p]


;スチル表示
[chara_hide_all ]

[wait time=1000 ]

[eval exp="sf.alan_cg_1=true" ]
[bg storage="alan1.png" time=2000] 


#
Thinking that, she did as she was told,[r]
and as she expected, Alan[r]
rested his head on her lap.[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
He turned his head away, not looking at Maria,[r]
as if torn between wanting comfort[r]
and feeling embarrassed.[p]

#
Seeing this cute side of him,[r]
Maria couldn't help but smile.[p]

[v storage="72"]

#Alan
How were the exams?[p]

#Maria
Ah, um...[r]
I think I did pretty well.[r]
And you, Prince Alan?[p]

[v storage="h5"]

#Alan
Well, I did okay.[p]

#Maria
I see.[r]
Good job.[p]

[v storage="h1"]

#
It was a simple conversation.[r]
When the conversation ended,[r]
a brief silence fell between them.[p]

#
A gentle breeze blew softly,[r]
and the sunlight flickered through the leaves.[p]

[fadeoutbgm time=1000] 

[wait time=1000]
[playbgm volume=15 storage="M21_FinalMix.ogg" ]

[v storage="78"]

#Alan
It's all thanks to you.[p]

#
Alan suddenly spoke.[p]

[v storage="80"]

#Alan
Ever since I met you...[r]
I've been able to let go of the heavy burdens[r]
I was carrying.[p]

[v storage="81"]

#Alan	
I always thought I had to keep looking forward,[r]
but you taught me[r]
that it's okay to relax sometimes.[p]

[v storage="82_A"]

#Alan
To work hard, to take things seriously.[r]
Whether it was studying or playing the violin—[p]

[v storage="82_B"]

#Alan
I had given up on them, thinking I'd never be good,[r]
but now I can face them head-on,[r]
and it's all thanks to you.[p]

#Maria
Prince Alan...[p]

;要チェック
[v storage="84"]

#Alan
Ever since I met you, Maria,[r]
my days have changed.[r]
They're brighter, more meaningful, precious...[p]

[v storage="85_A"]

#Alan
Instead of comparing myself to others,[r]
I learned that I can just be myself.[p]

[v storage="85_B"]

#Alan
That's what you taught me,[r]
and it made me so happy.[p]

[v storage="86"]

#Alan
Maria.[r]
...Thank you.[p]

#Maria
You're welcome, Prince Alan.[p]

#
Maria gently stroked Alan's forehead.[p]

#
Surely, Alan had never had anyone[r]
who would stroke his head and praise him,[r]
no matter how much he yearned for it.[p]

#Maria
(Could it be that Prince Alan...[r]
was waiting here just to talk to me?)[p]

#Maria
(...No, that can't be.)[p]

#
A peaceful, quiet moment passed.[p]

#
But it was Alan who broke the silence.[r]
Of course, it had to be Alan.[p]

[free_layermode time=1000 ]


[bg storage="HF04_078.png"]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_def" wait=false]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

#
He suddenly jumped up[r]
and, as if making a decision, said,[p]

[md name="maria" face="驚き"]
[md name="alan" face="怒り"]

[v storage="94"]

#Alan
There's something I want to tell you.[r]
But before that,[r]
there's something I need to do.[p]

[md name="alan" face="無表情"]

[v storage="95"]

#Alan
...So tomorrow,[r]
come here at the same time as today.[p]

[fadeoutbgm time=1000]
[playse storage="se/dash-asphalt2.ogg" ]

[chara_hide name="alan"]

#
Saying that,[r]
Alan emphasized, 'You better be there,'[r]
and ran off somewhere.[p]

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
Remembering her promise with Alan,[r]
Maria walked to the courtyard.[p]

#
But someone was blocking her path.[r]
And that person was—[p]

[md name="maria" face="焦り"]
[chara_show name="mary" top="&f.top" left="&f.right" face="hamehura_Mary_cos1_mu" wait=true]

#Mary
Hello, Maria.[p]

#
It was Mary, Alan's fiancée.[p]

#Mary
Maria.[r]
I have just one thing[r]
I want to ask you.[p]

#
Mary's gaze was direct,[r]
dignified, and serious.[p]


[md name="maria" face="無表情"]

#
Maria straightened her expression[r]
and encouraged her to speak.[p]

[md name="mary" face="怒り"]

#Mary
—To you,[r]
what kind of person is Prince Alan?[p]

[md name="maria" face="驚き"]
[md name="mary" face="無表情"]

#Maria
To me?[p]

[md name="maria" face="無表情"]

#
Maria thought for a moment,[r]
then looked into Mary's eyes and began to speak firmly.[p]

#Maria
He's stubborn, proud,[r]
but honest, hardworking, and kind.[r]
...More than anyone, he's true to himself.[p]

[md name="maria" face="微笑み"]

#Maria
And I... love that about him.[r]
I want to support him.[p]

#Maria
I want to be close to him...[p]

#Maria
I want to be by his side forever.[p]

[md name="maria" face="悲しみ"]
[md name="mary" face="悲しみ"]

#Maria
Not because he's the Fourth Prince,[r]
or because he's from the Stuart family—[r]
But because he's Prince Alan.[p]

[md name="maria" face="無表情"]

#Maria
I just want to be with him.[r]
I want to be by his side and see him smile.[r]
I want to support him and walk by his side.[p]

#Maria
...That's how I truly feel.[p]

[md name="maria" face="悲しみ"]

#
I'd be lying if I said I didn't feel guilty.[r]
Mary is Alan's fiancée.[p]

#
What I just said...[r]
is like declaring[r]
that I'm stealing him from her.[p]

#
But at this moment,[r]
I had to speak my true feelings,[r]
or it would be disrespectful to Mary.[p]

#Mary	
...[p]

#
Mary listened intently[r]
to what Maria was saying.[p]

[md name="mary" face="微笑み"]

#
But her expression[r]
softened slightly.[p]

[md name="maria" face="驚き"]

#Mary
...I can't compete with you.[p]

[md name="maria" face="悲しみ"]

#Maria
Lady Mary...[p]

[md name="mary" face="悲しみ"]

#Mary
I was never able to bring[r]
such a smile to his face.[p]

#Mary
The only one who can truly brighten his life is—[r]
Maria, it's you and only you.[p]

[md name="mary" face="微笑み"]

#Mary
Your feelings for Prince Alan...[r]
Please cherish them.[p]

#Mary
Well then, goodbye.[p]

[md name="mary" face="悲しみ"]

#Mary	
[font size="18"]
...Please, be happy.
[resetfont]
[p]

#
Mary's smile was soft and gentle.[r]
But the moment she turned away—[p]

[chara_hide name="mary"]

[md name="maria" face="焦り"]

#Maria
Ah...[p]

#
Maria saw tears glistening[r]
in Mary's eyes.[p]

[md name="maria" face="悲しみ"]


#Maria
Lady Mary... thank you.[p]

[chara_hide name="maria"]

#
Maria bowed deeply[r]
until she could no longer see her.[p]


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

The promised place.[r]
Under the dappled sunlight.[p]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=true]

#
As Maria looked up at the sky,[r]
she heard the sound of footsteps approaching.[p]

[playse volume=50 storage="se/dash-in-room1.ogg" ]
[wse]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_do" wait=true]

[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

[v storage="130"]

#Alan
[font size=36]マリア……！
[resetfont]
[p]

[md name="maria" face="笑顔"]
[md name="alan" face="無表情"]

#Maria
Prince Alan![p]

#
He must have been running the whole way.[r]
Alan stopped beside Maria, out of breath.[p]

[chara_hide_all ]

[eval exp="sf.alan_cg_2=true" ]
[bg storage="alan2.png" ]

#
He took a moment to catch his breath...[r]
After a deep breath, Alan stood up straight[r]
and took Maria's hand.[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
Then, what he wanted to tell Maria,[r]
he finally put into words.[p]

[v storage="135"]

#Alan
Maria.[r]
I want you by my side.[r]
Now and forever.[p]

#
Simple words.[r]
So simple,[r]
yet so sincere.[p]

#
Maria gazed at Alan.[p]

#Maria
Did he understand what that meant?[r]
Do you understand what you're asking, Prince Alan?[p]

[v storage="139"]

#Alan
I understand.[p]

[v storage="140"]

#Alan
...Be mine.[p]

[v storage="141"]

#Alan
Marry me.[p]

#
Alan's gaze had never been so serious.[r]
He continued speaking.[p]

[v storage="143"]

#Alan
Yesterday, I talked to Mary and Geordo,[r]
and with both of our parents.[p]

[v storage="144"]

#Alan
We had a serious conversation.[r]
And both of them[r]
gave me their blessing.[p]

#Maria
(So that's why Lady Mary...)[p]

#
Maria recalled their encounter earlier.[r]
At the same time, she realized what had been entrusted to her.[p]

#
Both Alan and Mary[r]
had made up their minds.[p]

#

Alan knelt down and looked up at Maria.[p]

[v storage="149"]

;@quake_camera

#Alan	
[font size="36"]お前の人生、俺にくれ！
[resetfont]
[p]

[free_layermode time=1000 ]


#Maria
(How should I answer?)

[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text="With pleasure."  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="Are you really sure?" target="*select_03_02" ]

[s]

*select_03_01
[cm]

[bg storage="HF04_078.png"]
[playbgm  volume=15   storage="M17_FinalMix.ogg" ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=false]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

#
A loud voice.[r]
Big feelings.[p]

#
Maria was ready to accept them.[r]
Because those were the people who supported her.[p]

#
And they were her respect[r]
and deepest sincerity for her own feelings of love.[p]

[md name="maria" face="微笑み"]

#Maria
—With pleasure.[p]

[md name="maria" face="笑顔"]

#Maria
I'll give you all of myself.[r]
Please... take me.[p]

[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

[celanim anim="blue_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="blue_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]

[md name="alan" face="照れ"]

#Alan
...![p]

[md name="maria" face="微笑み"]
[md name="alan" face="微笑み"]

[v storage="154"]

#Alan
Yes! Of course![p]

[md name="maria" face="笑顔"]

#
Alan smiled like a boy, beaming,[r]
and wrapped Maria in his arms.[p]

#
Maria also wrapped her arms around Alan's big body,[r]
hugging him back.[p]

#
In the gentle sunlight,[r]
the two of them held each other for a long time.[p]

@jump target="common_03"

*select_03_02
[cm]

[bg storage="HF04_078.png"]
[playbgm  volume=15   storage="M17_FinalMix.ogg" ]


[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=true]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

#
A loud voice.[r]
Big feelings.[p]

[md name="maria" face="悲しみ"]

#
But really,[r]
is it okay for me to accept this?[p]

[md name="alan" face="悲しみ"]

#
This involves multiple noble families,[r]
and it's not just a simple romance between a man and a woman.[p]

#
Ahead of this love, for the two of them who are still so young,[r]
there are unimaginable[r]
hardships awaiting them.[p]

#Maria
(Is this really okay?)[p]

#
But still—[r]
Maria remembered[r]
her conversation with Mary.[p]

#
I love Alan.[r]
I want to support him.[p]

[md name="maria" face="無表情"]

#
—I want to be by his side.[p]

#Maria
(If I hesitate here...[r]
it's a betrayal to both Lady Mary and Prince Alan.)[p]

#
That's why Maria[r]
looked straight at Alan—[p]

[md name="maria" face="微笑み"]
[md name="alan" face="照れ"]

#
and, with all her heart, nodded.[p]

[md name="alan" face="微笑み"]

#
This love surely won't be[r]
filled only with happiness.[p]

#
Maybe there will be more hardships[r]
than joy.[p]

[md name="alan" face="微笑み"]

#Maria
(But even so, we will...)[p]

[md name="maria" face="笑顔"]

#
As Alan smiled and held her close,[r]
Maria tightly[r]
hugged him back.[p]

#
In the gentle sunlight,[r]
they vowed to walk their future together.[p]

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




