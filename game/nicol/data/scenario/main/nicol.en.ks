
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
Maria, born a commoner,[r]
was appointed as a member of the Magic Academy's student council[r]
due to her excellent grades.[p]

[md name="maria" face="hamehura_Maria_cos1_do"]


#Maria
(Starting today, I'm part of the student council...[r]
I have to do my best...!)[p]

[chara_hide name="maria"]

#
With a mix of nerves and determination,[r]
Maria opened the door to the student council room.[p]

[playbgm volume=30 storage="M03_FinalMix.ogg" ]
[bg storage="HF08_021_026.png" time=1000 ]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true]

[v storage="5" ]

#Nicol
—Hello.[r]
You must be Miss Campbell, the new member?[p]

#
The one who greeted Maria was[r]
the student council vice president and son of the Prime Minister,[r]
Nicol Ascart, son of Count Ascart.[p]

#
An upperclassman, and a year older than Maria.[p]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_def.png" wait=true]


#Maria
Good day.[r]
I'm Maria Campbell. It's a pleasure to meet you.[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]

#
Maria bowed deeply.[p]

;[chara_hide name="nicol" pos_mode=false ]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#
...And then she felt a different gaze from Nicol,[r]
She looked up and saw, hiding behind him,[r]
a pale girl staring at Maria.[p]

[chara_show name="sophia" top="&f.top" left="620" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true zindex=0 ]


#Maria	
(What a beautiful person...!)[p]

[md name="sophia" face="hamehura_Sophia_cos1_odo"]

#？？？	
...![p]

[chara_move name="sophia" top="&f.top" anim=true left="520" wait=true zindex=0 ]


#
The moment their eyes met,[r]
she completely hid behind Nicol.[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

#
Nicol smiled wryly and introduced himself: Nicol Ascart.[p]

[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="14" ]

#Nicol
This is my younger sister, Sophia.[r]
...She's a bit shy. Please don't mind her.[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#Maria
Oh, she's your sister.[r]
Lady Sophia, it's a pleasure to meet you.[p]

[chara_hide name="maria" pos_mode=false ]
[md name="sophia" face="hamehura_Sophia_cos1_ai" ]

#
Maria greeted her as well, but[r]
Sophia stayed hidden behind Nicol,[r]
and didn't come out.[p]


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


#Maria
Lady Sophia, I made muffins for everyone in the student council.[r]
Would you like to try some?[p]

[md name="sophia" face="hamehura_Sophia_cos1_ai"]

#Sophia
...I'm not fond of sweets.[p]

;=======================================

[mask graphic="black.png" time=1500 effect="slideInRight"]

[bg storage="black.png" time=10 ]

[md name="maria" face="hamehura_Maria_cos1_tere"]
[md name="sophia" face="hamehura_Sophia_cos1_mu"]

[bg storage="HF04_034_r.png" time=10] 

[mask_off time=1500 effect="slideOutLeft"]

;=======================================


#Maria
Uh, Lady Sophia,[r]
I also have some baked goods...[r]
I made them with less sugar, so if you'd like...[p]
[md name="sophia" face="hamehura_Sophia_cos1_ai"]

#Sophia	
...I don't want to get cavities.[p]

;=======================================

[mask graphic="black.png" time=1500 effect="slideInRight"]

[bg storage="black.png" time=10 ]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="sophia" face="hamehura_Sophia_cos1_mu"]

[bg storage="HF04_002.png" time=10]

[mask_off time=1500 effect="slideOutLeft"]

;=======================================

	
#Maria
Lady Sophia, there are beautiful roses blooming in the garden.[r]
Would you like to go see them with me?[p]

[md name="sophia" face="hamehura_Sophia_cos1_ai"]

#Sophia
...I'm not very good with sunlight.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#Maria
I can hold a parasol for you.[p]

[md name="sophia" face="hamehura_Sophia_cos1_mu"]

#Sophia
...Well, just for a little while.[p]
	
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
Maria and Sophia[r]
walked through the garden,[r]
and Nicol watched them from the student council room window.[p]

#Nicol
(She's... a strange person...)[p]

[chara_hide_all time=1000]

[bg storage="HF04_002.png" ]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_def.png" wait=false time=1000 ]
[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=1000 ]
	
#
Holding the parasol and smiling at Sophia,[r]
Nicol narrowed his eyes as he looked at Maria.[p]

#
Without being swayed by Nicol's appearance or position,[r]
she didn't try to flatter him.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#
And she treated Sophia, who looked different from everyone else,[r]
with such warmth and kindness.[p]

[chara_hide name="maria" pos_mode=false  wait=false]
[chara_hide name="sophia" pos_mode=false wait=true ]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true]

#
Recently, Nicol had noticed changes in Sophia.[r]
It had started when Maria began approaching her.[p]

[chara_hide name="nicol" pos_mode=false wait=true ]

[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=10 ]


#
At first, Sophia seemed to think that Maria[r]
was only trying to get closer to Nicol through her.[r]
That was her assumption.[p]

#
She didn't want her brother taken away.[r]
She didn't want to let a bad woman near him.[p]

[md name="sophia" face="hamehura_Sophia_cos1_def"]

#
Because of this, she was cold towards Maria at first,[r]
but Maria never gave up.[r]
and little by little, Sophia had begun to open up to Maria's smile.[p]

[chara_hide name="sophia" pos_mode=false wait=true ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_odo.png" wait=true]


#Nicol
(Sophia... is smiling...)[p]

#
Though small,[r]
Sophia had a smile on her face for Maria.[p]

#
Nicol couldn't remember the last time he had seen his sister smile like that.[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

[v storage="40" ]

#Nicol
You really... are a mysterious person.[p]

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
On her way to the student council room, Maria bumped into Nicol.[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#Maria
Hello, Lord Nicol.[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]


#Nicol
Hello, Miss Campbell.[r]
...Since we're headed in the same direction, shall we go together?[p]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#Maria
Ah, yes![p]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

#
The grounds of the Magic Academy were vast.[r]
The two walked down the long hallways.[p]

#Nicol
It seems you also took care of Sophia the other day.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#Maria
Not at all.[r]
I'm happy to have become friends with Lady Sophia![p]

[v storage="h2" ]

#Nicol
...I see.[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#Maria
(Lord Nicol must really[r]
care about Lady Sophia...）[p]

#
Maria felt warmth in her heart.[p]

[chara_hide_all ]

#
It was at that moment.[r]
Whispers could be heard from the shadows.[p]


[chara_show name="reijo1" top="&f.top" left="-160" storage="chara/reijo1/hamehura_DVDmob1_fear.png" wait=false]
[chara_show name="reijo2" top="&f.top" left="100" storage="chara/reijo2/hamehura_DVDmob2_fear.png" wait=false]
[chara_show name="reijo3" top="&f.top" left="340" storage="chara/reijo3/hamehura_DVDmob3_def.png" wait=true ]


#Lady 1
Lord Nicol is such a wonderful person, but to have a sister who looks like that...[r]
He must be so unfortunate[r]
to have her as his sister.[p]

#Lady 2
Perhaps Lady Sophia[r]
is the Prime Minister's illegitimate child...[p]

#Lady 3
Her face, at least, is lovely,[r]
so maybe that's not too far off?[r]
Heheh.[p]

[chara_hide_all ]


#The Ladies
Ahahaha![p]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_ai.png" wait=false time=1000 ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_do.png" wait=true time=1000 ]

[v storage="h4" ]

#Nicol
......[p]

#
Nicol furrowed his brows slightly, but[r]
he said nothing.[p]

#
Maria quietly looked at Nicol's face,[r]
took a deep breath, and—[p]

let the words out in one gulp:

[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="Tell him not to worry about it"  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="Tell him you believe in the real Nicol" target="*select_01_02" ]

[s]

*select_01_01
[cm]

[md name="maria" face="hamehura_Maria_cos1_def"]
	
[fadeinbgm storage="M10_FinalMix.ogg" time=2000]
	
#Maria
Lord Nicol has such a wonderful sister,[r]
so she sure they're just jealous.[r]
They're just envious of you.[p]

[md name="nicol" face="hamehura_Nicol_cos1_odo"]

#Nicol
...![p]

[chara_hide_all]

[eval exp="sf.nicol_cg_1=true" ]
[bg storage="nicol1.png"]
	
#
Nicol stopped in his tracks and stared at Maria.[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]


#
At his intense gaze, Maria wondered if[r]
she might have said something wrong.[p]

#
Maria opened her mouth to apologize, but[r]
Nicol spoke first.[p]

[v storage="64" ]

#Nicol
...No one's ever spoken of my sister[r]
in such a way before.[r]
Thank you, Miss Campbell.[p]

#
Gently,[p]

#
Nicol smiled like a blooming flower.[p]

#
Those words, from someone who rarely shows emotion,[r]
made Maria feel Nicol's sincere heart.[p]

[jump target="common1"]

*select_01_02
[cm]

[fadeinbgm storage="M10_FinalMix.ogg" time=2000]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="nicol" face="hamehura_Nicol_cos1_do"]

[bg storage="HF08_018_r.png" time=10] 

#Maria
I envy you for having such a sister as Lady Sophia, Lord Nicol.[r]
I'm quite envious.[p]

[md name="nicol" face="hamehura_Nicol_cos1_odo"]

#Maria
I can tell you care for her deeply.[r]
It shows in how you treat her.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

[kanim_chara layer=0 name="nicol" keyframe=quake time=300 count=1 easing=linear]

#Maria
That's why, I truly believe in what I feel—[r]
I believe in both you and Lady Sophia.[p]

[celanim anim="green_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="green_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#Nicol
...[p]

[chara_hide_all]

[eval exp="sf.nicol_cg_1=true" ]
[bg storage="nicol1.png"]	

#
Nicol stopped and stared at Maria again.[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
Maria looked him straight in the eye.[p]

#
With her words and her heart,[r]
showed that she was being honest.[p]

#Nicol
You truly believe... don't you?[p]

#
He smiled a little, almost like a bitter laugh, but softer,[r]
Nicol let out a small chuckle.[p]

#Nicol
...Then I'll believe those words too. 'Truly.'[r]
Thank you, Miss Campbell.[p]

#
Those words came from someone who rarely shows emotion,[r]
and Maria could tell that Nicol's heart was filled with[r]
a warm sense of relief and gratitude.[p]

*common1


[free_layermode time=1000 ]

	
[bg storage="HF08_018_r.png" time=10] 

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_tere.png" wait=false time=1000 ]
[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_def.png" wait=true time=1000 ]


#Maria
No need to thank me...[r]
I just said what I was thinking.[p]

#
She was humble,[r]
but Nicol's genuine smile[r]
made her heart race.[p]

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
Maria let out a heavy sigh.[r]
Graduation day at the Magic Academy was fast approaching.[r]
The day Nicol would graduate was drawing near.[p]

#Maria
It wasn't a permanent goodbye, but...[r]
Lord Nicol is a noble, and I'm just a commoner.[p]

#Maria
Once he graduates, I may never see him again.[r]
It was possible.[p]

[md name="maria" face="hamehura_Maria_cos1_akire"]

#
While finishing some student council tasks,[r]
Maria muttered to herself.[p]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos1_mu.png" wait=true]


#Nicol	
Is something wrong?[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
Suddenly, Nicol was by her side.[r]
Maria raised her head as if startled.[p]

#Maria	
Ah, no, it's nothing![p]

[md name="nicol" face="hamehura_Nicol_cos1_do"]

[v storage="76" ]

#Nicol	
Don't hide it from me.[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]

#
It seemed Nicol had the upper hand.[p]

[md name="maria" face="hamehura_Maria_cos1_ai"]

#
Under his intense gaze,[r]
Maria lowered her eyes to her hands.[p]

#Maria
Since the graduation ceremony is approaching...[r]
I feel sad when I think of you graduating, Lord Nicol...[r]
It makes me feel... lonely.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#Maria
...That's wrong, isn't it![r]
It's a joyous occasion, but[r]
I shouldn't be feeling so down...[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#
Even though he had told her not to hide it,[r]
Maria ended up forcing a smile.[r]
She couldn't help it.[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

[v storage="h1" ]

#Nicol	
I'm glad.[p]

#
Nicol chuckled softly.[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

[v storage="84" ]

#Nicol
...Because I feel the same way.[p]

#Maria
Eh—[p]

#
Nicol, still smiling, narrowed his eyes as he said,[r]
and placed his hand gently on top of Maria's.[r]
[p]

[md name="nicol" face="hamehura_Nicol_cos1_ai"]

[v storage="87" ]

#Nicol
Until now, I never cared much about meetings or partings.[r]
But the thought of having less time with you, Miss Campbell,[r]
makes me very lonely. I truly feel that way.[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

#Nicol
I've never felt this way about anyone besides my family before.[r]
It's the first time.[p]

[md name="maria" face="hamehura_Maria_cos1_ai"]

#Maria
Lord Nicol...[p]

[md name="nicol" face="hamehura_Nicol_cos1_ai"]

#Nicol
For so long, deep down inside me—[p]

[v storage="91" ]

#Nicol
I’ve been hurt by others who don’t know me,[r]
and insulted the people I love—my sister, Sophia.[r]
They kept calling her a burden to me. It hurt.[p]

[v storage="92" ]

#Nicol
They judged us by our looks and titles,[r]
without bothering to see who we really were.[r]
I grew tired of them fawning over me.[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="93" ]

#Nicol
But you,[r]
you saw who we really are and smiled at us.[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

[v storage="94" ]

#Nicol
Sophia only started smiling like that[r]
because of you.[p]

[v storage="95" ]

#Nicol
Thank you, Miss Campbell.[r]
My deepest gratitude to you.[p]

#Maria	
(What should I say?)

[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text="Thank you as well."  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="There's nothing to thank me for..." target="*select_02_02" ]

[s]

*select_02_01
[cm]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#Maria
No, really, it's me who should be thanking you, Lord Nicol.[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

#Maria
Both you and Lady Sophia[r]
saw me for who I am, not just as a commoner.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#Maria
The reason I've enjoyed my school life so much[r]
is thanks to you both![p]

[v storage="99" ]

#Nicol
Haha, really?[p]

[md name="maria" face="hamehura_Maria_cos1_kon"]

#Maria
Auu...[r]
Y-Yes, it's true![p]

#Nicol
Yeah, I know.[p]

[md name="maria" face="hamehura_Maria_cos1_def"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="h3" ]

#Nicol
...Ah.[r]
I had forgotten what it felt like to smile from the heart.[p]

[celanim anim="green_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="green_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#Nicol
I always thought I had to be strong, to be firm,[r]
and maybe I've been keeping myself too guarded.[p]


[md name="nicol" face="hamehura_Nicol_cos1_def"]


#Nicol
I never thought I'd feel this way...[p]

#
Nicol's gaze as he looked at Maria[r]
was as warm and radiant as a sunny day.[p]

[jump target="common2"]

*select_02_02
[cm]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#Maria
No, really,[r]
there's no need to thank me...[p]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#
Maria simply acted naturally,[r]
just being herself with Nicol and Sophia.[p]

[md name="maria" face="hamehura_Maria_cos1_tere"]

#
That's why Nicol's[r]
genuine gratitude made her feel embarrassed.[p]

[v storage="h1" ]

#Nicol
...Heh. You're so shy.[p]

#Nicol
But at least accept my thanks.[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

#Maria
I-I'm sorry...[p]

#Nicol
No need to apologize.[p]

[md name="maria" face="hamehura_Maria_cos1_kon"]

#Maria
Auu...[p]

[md name="nicol" face="hamehura_Nicol_cos1_def"]

#Nicol
Haha—You're adorable.[p]

[md name="maria" face="hamehura_Maria_cos1_def"]

[v storage="h3" ]

#Nicol
...Ah.[r]
I never thought I'd feel this way about anyone.[r]
I never thought I'd open my heart to someone like this.[p]

#Nicol
I never imagined it...[p]

#
As he said this, Nicol looked at Maria with a gaze[r]
that was endlessly gentle,[r]
like a warm spring day.[p]

*common2

[md name="maria" face="hamehura_Maria_cos1_odo"]
[md name="nicol" face="hamehura_Nicol_cos1_mu"]

[v storage="106" ]

#Nicol
Miss Campbell.[r]
There is something I want to tell you at tomorrow's graduation party.[r]
Please, be sure to attend.[p]

[chara_hide name="nicol" pos_mode=false ]

#
Nicol whispered this,[r]
bowed and left with a polite gesture.[p]

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
The graduation party is known to be one of the most glamorous events at the academy.[r]
[p]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_ai.png" wait=true]

#
—And that's why Maria was worried.[p]

#
As a commoner, Maria[r]
had only been able to alter a cheap second-hand dress[r]
and that was the best she could do.[p]

#
Would such a dress be suitable[r]
to appear before Nicol in...?[p]

#Maria
(It’s not just about me. Just being with me,[r]
Nicol might also be laughed at...)[p]

[md name="maria" face="hamehura_Maria_cos1_akire"]


#
Standing in front of her mirror in the girls' dormitory that night,[r]
Maria sighed.[p]

[fadeoutbgm time=2000]
[playse storage="se/door_wood_knock1.ogg" ]

#
And at that moment,[r]
there was a knock at her door.[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]


#Maria
Yes?[p]

#
Wondering who could be visiting at such an hour,[r]
Maria opened the door.[p]

[playse storage="se/door-open1.ogg" ]

[fadeinbgm storage="M17_FinalMix.ogg" time=2000 ]

[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_mu.png" wait=true time=1000 ]
[md name="maria" face="hamehura_Maria_cos1_odo"]
	
#Sophia	
Good evening, Maria.[p]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Maria
Lady Sophia!? What brings you here?[p]

#Sophia
I have something I would like to talk to you about, Maria.[r]
Is that alright?[p]

[md name="maria" face="hamehura_Maria_cos1_ase"]


#Maria
Yes... Please, come in.[p]

#
Maria invited Sophia in.[r]
It was Sophia who began the conversation.[r]
She gazed at Maria with a serious expression.[p]

#Sophia
What do you think of my brother?[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#Maria
Eh—[p]

[md name="maria" face="hamehura_Maria_cos1_ai"]

#
Taken aback by the sudden question,[r]
Maria furrowed her brows and revealed her true feelings.[p]

#Maria
...I don’t want to say goodbye.[p]

#Maria
The thought of Lord Nicol going far away[r]
makes my heart ache... and it’s painful.[p]

#Maria
If possible,[r]
I want to stay by his side forever...[p]

#Sophia	
Is that how you really feel?[p]


[md name="maria" face="hamehura_Maria_cos1_do"]

#Maria
[font size=30]本当です！[resetfont]
[p]

[md name="sophia" face="hamehura_Sophia_cos1_def"]

#
Maria answered without thinking.[r]
Sophia smiled gently at Maria.[p]

#Sophia	
I knew you’d say that.[p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#Maria
Eh...?[p]

[md name="maria" face="hamehura_Maria_cos1_kon"]

#Sophia
It was so obvious.[r]
That you and my brother care for each other.[p]

#
Sophia giggled.[r]
Maria felt her face heat up.[p]

#Sophia
...Hehe.[r]
Soon enough, I’ll have to call you[r]
'Sister,' won't I?[p]

#Maria
Lady Sophia, what are you saying...?[p]

#Sophia	
Oh, my.[p]

[md name="maria" face="hamehura_Maria_cos1_mu"]

#Sophia
Now then, with that being said...[r]
I have a gift for you in celebration.[p]

#Sophia	
Please come to my room later.[p]


;=======================================

[mask graphic="black.png" time=2000]

[bg storage="black.png" time=10 ]
[chara_hide_all time=100]

[chara_show name="maria" top="&f.top" left="&f.left" storage="chara/hamehura_Maria_cos1_mu.png" wait=true]

[wait time=2000 ]

[bg storage="HF04_034_r.png" time=10] 

[mask_off time=2000 ]

;========================================
	
#Maria
(...A gift? I wonder what it is?)[p]

#
Feeling nervous,[r]
Maria knocked on Sophia's door.[r]
A reply came immediately from within.[p]

#Sophia	
Please, come in.[p]

[bg storage="HF04_066_071_073_084A.png"]

[chara_show name="sophia" top="&f.top" left="&f.right_s" storage="chara/hamehura_Sophia_cos1_def.png" wait=true time=1000 ]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#Maria
This is...[p]

#
—Before her was[r]
a modest yet elegant dress.[p]

#
It was designed so that Maria, a commoner, wouldn’t stand out negatively.[r]
It was a thoughtfully made piece.[p]

#Sophia	
Please, wear this, Maria.[p]

[md name="maria" face="hamehura_Maria_cos1_ase"]

#Maria
...Is it really okay?[r]
Such a beautiful...![p]

#Sophia	
Yes, of course![p]

[md name="maria" face="hamehura_Maria_cos1_odo"]

#Sophia	
...Please, take good care of my brother.[p]

[md name="maria" face="hamehura_Maria_cos1_def2"]

#Maria
[font size=30]
Th-Thank you so much![r]
Lady Sophia!
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
Maria's dress[r]
was one that even other noble girls admired.[r]
It was graceful and dignified.[p]

#
Even the girls who usually bullied Maria[r]
were left speechless by its beauty.[p]

[md name="maria" face="hamehura_Maria_cos5_akire"]

#
But Maria herself, wearing such a[r]
luxurious dress for the first time in her life,[r]
felt so shy that she had become a wallflower.[p]

#
And then.[p]

[v storage="149"]

#？？？	
That dress suits you well.[p]

[chara_show name="nicol" top="&f.top" left="&f.right" storage="chara/hamehura_Nicol_cos2_mu.png" wait=true]
[md name="maria" face="hamehura_Maria_cos5_odo"]

#
A sweet voice whispered unexpectedly nearby.[r]
Maria looked up and saw[r]
Nicol, dressed in a stunning formal outfit.[p]

[md name="nicol" face="hamehura_Nicol_cos2_def"]

[v storage="151"]

#Nicol
You're very beautiful.[p]

[md name="maria" face="hamehura_Maria_cos5_kon"]

#Maria
L-Lord Nicol, you too...![p]

#Nicol
Oh, well, thank you.[p]

[md name="maria" face="hamehura_Maria_cos5_tere"]
[md name="nicol" face="hamehura_Nicol_cos2_mu"]

#
Nicol smiled softly and[r]
took Maria's hand and said, 'Now then.'[p]

[v storage="155"]

#Nicol
Shall we talk over there?[p]

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
He led her to a[r]
quiet balcony under the starry sky.[p]

[md name="maria" face="hamehura_Maria_cos5_tere2"]

#
The noise of the party was faint in the distance.[p]

[md name="maria" face="hamehura_Maria_cos5_odo"]

[v storage="158"]

#Nicol
—Maria.[p]

#
Not 'Miss Campbell,'[r]
Nicol called her by her name for the first time.[p]

#
Maria was enveloped in surprise.[r]
It was so strong that the distant noise faded away.[p]

#
Nicol gazed at Maria gently[r]
and continued speaking.[p]

[md name="nicol" face="hamehura_Nicol_cos2_tere"]

[v storage="162"]

#Nicol
I love you.[r]
I want to walk through life with you from now on.[p]

[v storage="163"]

#Nicol
With you, I feel like we can share peaceful, warm days[r]
forever.[r]
I don't want to let you go. I've never felt this way before.[p]

[chara_hide_all time=1000]


[eval exp="sf.nicol_cg_2=true" ]
[bg storage="nicol2.png"]

[v storage="164"]

#Nicol
So... Maria.[r]
Please, be my partner for life.[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
With those words, Nicol knelt down[r]
and extended his hand to Maria.[p]

#Maria
...![p]

#
It wasn't formal language like when they first met,[r]
nor did he call her Miss Campbell.[r]
These were Nicol's true feelings,[p]

#
and Maria felt that she had never[r]
been the recipient of such deep and warm feelings before.[r]
It was the first time in her life.[p]

#
The shock of it all[r]
made her feel a bit flustered, but—[p]

#Maria
(I don't want to say goodbye to Lord Nicol.[r]
I want to stay with him forever.)[p]

#
She remembered the feelings she had shared with Sophia—[r]
her feelings of love.[p]

#
Maria gave Nicol a firm, determined look.[p]

#Maria	
(What will you do?)

[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text="Take Nicol's hand"  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="Hesitate to take his hand" target="*select_03_02" ]

[s]

*select_03_01
[cm]

	
#Maria
I...[r]
I've always been in love with you.[p]

#Maria
Please, let me stay by your side.[r]
Always, forever...[p]

#
Maria took Nicol's hand.[r]
Nicol smiled as warmly as a spring flower[r]
and kissed the back of her hand with reverence.[p]

[v storage="175"]

#Nicol
I vow to love you forever.[p]

#
Nicol stood up, still holding Maria's hand.[p]

#Maria
Please take care of me, Lord Nicol—[p]

#
Maria held his hand back[r]
with all her heart.[p]

#
A gentle breeze blew, scattering flower petals around them,[r]
as if celebrating their union—[p]

[celanim anim="green_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="green_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


[jump target="common3"]

*select_03_02
[cm]
	
#
Am I really the one for him?[r]
Is it alright to accept these feelings?[r]
Such thoughts swirled in Maria's mind.[p]

#
But—[p]

#Nicol
It’s alright.[p]

#
Nicol took Maria's hand.[r]
And once again, he kissed the back of her hand.[p]

[v storage="175"]

#Nicol
I vow to love you forever.[p]

#Nicol
And I will protect you always.[p]

#Nicol
Please—trust me.[p]

#
Nicol stood and gently embraced Maria.[r]
[p]

#
At last, Maria found her voice.[r]
They were honest, heartfelt words.[p]

#Maria
I...[r]
I love you too, Lord Nicol...[p]

#
As if blessing the two, the starry sky[r]
twinkled brightly overhead—[p]

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



