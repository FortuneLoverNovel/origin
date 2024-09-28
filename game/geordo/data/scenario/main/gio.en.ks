
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

#Maria	
Where am I...?[p]
[playbgm  volume=30   storage="M08_FinalMix.ogg" ]

;再生[p]
;[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=true loop=false ]
;[free_layermode]



/*
#Maria
[celanim anim="red_rose_1" layer="1" x=260 y=-150 count=1 speed=0.5 wait=false ]
[anim name="celanim" top=100 time=2000]
[wa]
@wait time=100
[celanim anim="red_rose_2" layer="1" x=260 y=100 count=1 speed=0.5 wait=true]
*/

#
A lovely garden, with the scent of roses.[l][r]
Despite the beautiful scenery,[r]
the girl looked confused.[p]

#
The girl who had just enrolled in the magic academy—[l][r]
Maria, out of curiosity,[r]
had been exploring the academy...[p]

#Maria
But to get lost like this...[l][r]
What should I do...?[p]

[bg storage="HF04_078.png"]

#
Maria looked around.[l][r]
Then, she saw a large tree.[p]

#Maria:hamehura_Maria_cos1_def
Yes, if I climb that tree,[r]
I might figure out where I am...[p]

#
Maria, in her skirt,[r]
placed her foot on the tree.[p]
#
But...[l][r]
Just as she thought she could climb,[r]
and was about to pull herself up...[p]

[v storage="h1"]
#？？？
—Oh.[r]
What are you doing there?[p]

#Maria:hamehura_Maria_cos1_odo
Huh?[p]

#Maria	
...Ah![p]

#
Still in her climbing pose, Maria[r]
opened her eyes wide.[l][r]
Because standing there was—[p]

[chara_move name="maria" left="&f.left" face="hamehura_Maria_cos1_ase"]

#Geordo
[chara_show name="gio" top="&f.top" left="&f.right" face="hamehura_Giord_cos1_doya"]


#Maria	
P-Prince Geordo...?[p]

[v storage="h2"]
#
Geordo Stuart.[l][r]
The third prince of this kingdom.[p]

#
Maria quickly adjusted her posture[r]
and bowed deeply.[p]

#Maria
I apologize.[r]
For showing such improper behavior,[r]
...to Your Highness![p]

#Geordo	
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]

[v storage="17"]
Trying to climb a tree[r]
in those clothes?[r]
You're quite the tomboy.[p]

*dev4

#Maria	
W-well...[p]
What should I say?

[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="Tell the truth"  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="Make an excuse" target="*select_01_02" ]

[s]

;正直に話す
*select_01_01
[cm]

#Maria
I thought I could see better from up high...[r]
I just wanted to find my way...[p]

#Geordo	
[chara_mod  name="gio" face="hamehura_Giord_cos1_doya"]

#Geordo	

I see.[l][r]
So, you were lost, huh?[p]

#
He said it with a smile, hitting the mark,[r]
causing Maria to mutter, 'Ugh...'[r]
and struggle to find words.[p]

[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]
[v storage="h2"]

#Geordo
[celanim anim="red_rose_1" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="red_rose_2" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]

[love_up]

#
Seeing Maria like this,[r]
Geordo chuckled softly.[p]

#
Even the way he laughed[r]
was incredibly graceful.[l][r]
But to Maria right now...[p]

[chara_mod  name="maria" face="hamehura_Maria_cos1_ai"]

#
being laughed at by the prince was...[p]

#
Too embarrassed, Maria[r]
looked down, her face burning.[p]

#

But...[r]
The next words from Geordo[r]
were gentle and gentlemanly.[p]

[jump target="*common_01"]

;ごまかす

*select_01_02
[cm]

[chara_mod  name="maria" face="hamehura_Maria_cos1_ase" ]

#Maria
(If I admit I was lost,[r]
he'll laugh again...[p]

#Maria
I-it's nothing, really.[l][r]
Please, don't worry about it...![p]

#Geordo
When you say 'nothing,'[r]
it only makes me more curious.[p]

[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

#
Geordo tilted his head slightly.[p]

[chara_mod  name="maria" face="hamehura_Maria_cos1_ai"]

#
Even that gesture was graceful, but[l][r]
Maria felt the prince thought she was ridiculous.[r]
and she could only look down, her face flushed.[p]

[chara_mod  name="gio" face="hamehura_Giord_cos1_ai"]

#Geordo
Ah, don't look so sad.[l][r]
I don't mean to be cruel.[p]

#
Geordo's voice was very gentle,[r]
and full of chivalry.[p]

#Geordo
[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

#Geordo
So, you were lost, weren't you?[p]

#Maria	
...Yes...[p]


*common_01


#Geordo
[v storage="25"]
Then let me escort you back.[p]

#Geordo
[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]

#
[v storage="h2"]
This way, said Geordo, starting to walk.[l][r]
Maria was surprised, but she couldn't possibly refuse[r]
the kindness of the third prince.[p]

#Maria
Th-thank you so much...![p]

#
He might really be kind.[l][r]
Maria thought as she[r]
followed Geordo.[p]

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

#Maria
—That sure happened, didn't it?[p]

#
Remembering her first meeting with Geordo,[r]
Maria smiled softly.[p]

#
Since then, she learned the academy's layout,[r]
and no longer got lost like back then.[r]
[p]

#Maria
To the student council room,[r]
this is the shortcut, right?[l][r]
...Will everyone like them?[p]

#
Maria held a basket[r]
filled with homemade muffins.[p]
Imagining their happy faces,[r]
Maria felt lighter on her feet.[p]

[fadeoutbgm time=1000]

#
—But.[p]

[playbgm  volume=30   storage="M43_FinalMix.ogg"]

[chara_move name="maria" left="&f.left" ]
[chara_show name="kata" face="hamehura_Catalina_cos1_do" top="&f.top" left="&f.right" ]

#Katarina
[v storage="36"]
Maria, where are you going?[p]

#Maria
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase"]
Ah...[p]

#
A voice full of hostility and malice[r]
called out to Maria.[p]

#
Before she realized, Maria was surrounded[r]
by several noble girls.[p]

#
Leading them was[r]
Lady Katarina Claes, daughter of a duke.[l][r]
She was Geordo's fiancée.[p]

#
Before Maria could say anything,[r]
Katarina strode up to Maria[r]
and raised her hand—[p]

[if exp="sf.btn_volume==true"]
[playse storage="se/punch-middle2.ogg" ]
[endif]

;[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=2 easing=linear]
@quake_camera

#
—Smack![p]

#
She knocked the basket to the ground.[l][r]
The sweet-smelling pastries[r]
spilled out onto the ground.[p]

#Katarina
[chara_mod  name="kata" face="hamehura_Catalina_cos1_aku"]
[v storage="43"]

[kanim layer=0 name="kata" keyframe=quake time=300 count=1 easing=linear]

Just because you have Light Magic,[r]
you think you're so special[r]
and that everyone will praise you![p]

#
Katarina raised her eyebrows[r]
and, shouting angrily,[r]
glared at the fallen muffins.[p]

#Katarina
[v storage="45"]

You think this pathetic food made by a commoner[r]
is fit for the student council?[r]
How ridiculous![p]

#
Katarina lifted her foot.[r]
She was about to crush the muffins.[p]

#Maria
[kanim layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]
[font size="40"]
Stop—[p]
[resetfont]

#
Maria reached out her hand[l][r]
but just then...[p]

[chara_hide name="maria" wait=false ]
[chara_hide name="kata" wait=true ]	

[wait time=1000]

;[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=1 easing=linear]
@quake_camera


#？？？
[font size="40"]
Stop that![p]
[resetfont]

#Geordo
[chara_show name="gio" top="&f.top" left="&f.left" face="hamehura_Giord_cos1_do" ]
[chara_show name="kata" face="hamehura_Catalina_cos1_do" top="&f.top" left="&f.right" ]
 
#Katarina

[chara_mod  name="kata" face="hamehura_Catalina_cos1_odo" ]
[kanim layer=0 name="kata" keyframe=quake time=300 count=1 easing=linear]

[v storage="50"]
P-Prince Geordo!?[p]

#Geordo
[v storage="51"]

In front of me,[r]
you dare disrupt order?[r]
I won't allow it.[p]

#Katarina	
[chara_mod  name="kata" face="hamehura_Catalina_cos1_ai" ]
[v storage="52"]

Tch...![r]
But, Prince Geordo—[p]

#Geordo	
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]

Katarina, I thought you were smarter than this...[r]
[p]

You aren't seriously expecting[r]
me to explain this twice?[l][r]
If so, what a funny joke.[p]

#Katarina	
[chara_mod  name="kata" face="hamehura_Catalina_cos1_ai"]
[v storage="54"]
Grrrr...![p]

#
Faced with Geordo's cold demeanor,[r]
even Katarina couldn't argue back.[p]

#
Her face red, Katarina[r]
glared at Maria and, with her entourage,[r]
quickly left the scene.[p]

[fadeoutbgm]

[if exp="sf.btn_volume==true"]
[playse storage="se/dash-asphalt1.ogg" ]
[endif]

[chara_hide name="kata" time=2000 wait=true]
[stopse ]

[playbgm  volume=30   storage="M17_FinalMix.ogg" ]

#Maria
[chara_move name="gio" left="&f.right"]
[chara_show name="maria" top=&f.top left="&f.left" face="hamehura_Maria_cos1_ai"]
Um, Prince Geordo...[p]

#
Should she apologize for causing trouble,[l][r]
or thank him for helping her?[l][r]
Maria wasn't sure which to say.[p]


#

Meanwhile, Geordo[r]
calmly picked up one of the muffins[l][r]
and, without hesitation, took a bite.[p]

[chara_hide_all ]

[bg storage="hamehura_jiorudo1.png" ]
[eval exp="sf.gio_cg_1=true" ]
#Maria
Eh—!?[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#Geordo	
[v storage="61"]

Mmm.[r]
It's really delicious.[p]

#
[v storage="h2"]
It's like flowers blooming all at once.[l][r]
With a gentle smile like that,[r]
Geordo smiled at Maria.[p]

#
—Thump.[l][r]
At that moment, Maria's heart was set aflame...[p]

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
The end of the year was approaching.[p]

[bg storage="HF04_283.png" time=1000 ]

[chara_show name="maria" top="&f.top" left="&f.left" time=1000 face="hamehura_Maria_cos1_mu" ]

#
Maria sat atop a tree,[r]
looking out at the academy.[p]

#Maria
This past year...[r]
So much has happened...[p]

[chara_mod  name="maria" face="hamehura_Maria_cos1_def"]

#Maria
I met Prince Geordo here, didn't I?[l][r]
He's done so much for me...[p]


#
Now that I think about it,[r]
Geordo is always in my memories.[p]

When I remember his kind smile,[r]
Maria couldn't help but feel her face grow warm.[p]

[chara_hide name="maria"]

#？？？
[v storage="h3"]
...Maria.[p]

#
It was then that she heard her name being called.[l][r]
Geordo was standing beneath the tree.[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" face="hamehura_Giord_cos1_def"]


#Geordo

You are always as free as a butterfly,[r]
aren't you?[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#Maria
[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]
Ah.[p]


#
[v storage="h2"]
Geordo chuckled softly.[l][r]
Feeling like she was being teased,[r]
Maria quickly tried to say something.[p]

#
But before Maria could speak,[r]
Geordo spoke, still smiling.[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#Geordo
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]
[v storage="75"]

Maria, come down.[p]

#

Geordo spread his arms wide.[l][r]
I'll catch you.[l][r]
Hearing this, Maria panicked.[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]


#Maria
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase" ]
B-but—[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#Geordo	

It's okay.[l][r]
[chara_mod  name="gio" face="hamehura_Giord_cos1_ai"]

...Or do you not trust me?[p]
[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#Maria
No, it's not that...![p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#Geordo
[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

Then come on.[p]

#

Geordo kept smiling as he[r]
looked up at Maria.[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#Maria
What should I do?

;[glink  color="white"  size="20"  x="360"  width="400"  y="100"  text="Jump"  target="*select_02_01"  ]
;[glink  color="white"  size="20"  x="360"  width="400"  y="170"  text="Hesitate"  target="*select_02_02"  ]

[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text="Jump"  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="Hesitate" target="*select_02_02" ]


[s]

;;;;;;跳ぶ　
*select_02_01
[cm]

#
That smile was one Maria knew she couldn't refuse.[r]
[p]

#Maria
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase"]
...[p]

#
Feeling Geordo's gaze,[r]
Maria turned her flushed face away.[r]
[p]

#Maria
(Prince Geordo...[l][r]
is waiting for me...)[p]

#
Gathering her courage despite her embarrassment,[r]
Maria jumped towards Geordo.[p]

;白転
[chara_hide name="maria" time=100]
[chara_hide name="gio" time=100]
[bg storage="white.png" time=100] 

[wait time=1000 ]

#
—Fwoosh.[p]

[bg storage="HF04_292.png" time=1000] 

#
His arms gently caught her.[p]

[chara_show name="maria" top="&f.top" left="&f.left" wait=false]
[chara_show name="gio" top="&f.top" left="&f.right" wait=true]

#Geordo
[chara_mod  name="gio" face="hamehura_Giord_cos1_man" ]	
[v storage="85"]
Got you.[p]

#Geordo
[celanim anim="red_rose_1" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="red_rose_2" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]

[love_up]


[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]

#

Geordo's whisper tickled Maria's ear[r]
sweetly, while his warm and strong arms[r]
held her firmly.[p]

#Geordo
[chara_mod  name="gio" face="hamehura_Giord_cos1_def"]

...Heh.[l][r]
You're so honest... and such a good girl.[p]

#
Geordo's finger gently stroked Maria's cheek[r]
as if praising her...[p]

@jump target="common_02"

;;;;;;;;;;ためらう
*select_02_02

[cm]
#Maria
[chara_mod  name="maria" face="hamehura_Maria_cos1_ai"]

I-it's dangerous, you know?[r]
What if something had happened to you...?[p]

#
Maria made such an excuse, but in reality,[r]
the truth was,[r]
she was just embarrassed.[p]

#
Of course, Geordo knew that all too well.[r]
[p]

[chara_hide name="maria"]
[chara_show name="gio" top="&f.top" left="&f.right" ]

#Geordo
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]
[v storage="h1"]

Oh?[r]
Do I look that unreliable to you?[l][r]
How surprising... That hurts my feelings.[p]

#

Geordo sighed dramatically,[r]
[l][r]
Of course, he was still smiling.[p]

[chara_hide name="gio"]
[chara_show name="maria" top="&f.top" left="&f.left" ]

#Maria
[chara_mod  name="maria" face="hamehura_Maria_cos1_ase"]
(Ugh... That's not fair...)[p]

#
At this point, Maria had no choice but to follow.[l][r]
Maria jumped towards Geordo.[p]


;白転
[chara_hide name="maria" time=100]
[chara_hide name="gio" time=100]
[bg storage="white.png" time=100] 

[wait time=1000 ]

#
—Fwoosh.[p]

[bg storage="HF04_292.png" time=1000] 
;[kanim layer=0 name="layer_camera" keyframe=quake time=300 count=2 easing=linear]
@quake_camera

#
His arms gently caught her.[p]

[chara_show name="maria" top="&f.top" left="&f.left" wait=false]
[chara_show name="gio" top="&f.top" left="&f.right" wait=true]

[chara_mod  name="maria" face="hamehura_Maria_cos1_odo"]
[chara_mod  name="gio" face="hamehura_Giord_cos1_man"]

#Geordo	
[v storage="85"]

Got you.[p]

#
Geordo's whisper tickled Maria's ear[r]
sweetly, while his warm and strong arms[r]
held her firmly.[p]

;;;;;;;;;

*common_02


#Geordo
[chara_mod  name="gio" face="hamehura_Giord_cos1_doya"]

[v storage="88"]

There's something I want to tell you.[r]
Tomorrow evening, meet me at the chapel.[p]

#
With that, Geordo finished speaking[r]
and let go of Maria.[p]

#Geordo
[v storage="90"]
I'll be waiting.[p]

#
He said with a smile,[r]
as he turned on his heel and gracefully[r]
walked away, cloak billowing behind him.[p]

*dev3
[chara_hide_all ]

[bg storage="black.png" time=1000] 
[wait time=1000 ]

[bg storage="HF04_251.png"]
[playbgm  volume=30   storage="M28_FinalMix.ogg" ]
	
#
As Geordo instructed,[r]
Maria walked through the twilight[r]
heading towards the chapel.[p]

#
Whisper, whisper...[p]

#
In Maria's ears,[r]
came the gossip of noble girls.[p]

[chara_show name="reijo1" top="&f.top" face="hamehura_DVDmob1_do"]
[chara_show name="reijo2" top="&f.top" face="hamehura_DVDmob2_do" ]
[chara_show name="reijo3" top="&f.top" face="hamehura_DVDmob3_do"]


#Noblewoman 1
Did you hear?[l][r]
Lady Katarina has been exiled from the kingdom.[p]

#Noblewoman 2:hamehura_DVDmob2_fear
Oh my...[l][r]
Then what about Prince Geordo?[p]

#Noblewoman 1
Rumor has it, he's interested in a commoner...[p]

#Noblewoman 3
Katarina's exile was probably[r]
that commoner's doing, wasn't it...?[p]

#Noblewoman 2
Could it be that Prince Geordo[r]
is being seduced by that common girl?[p]

#Noblewoman 3:hamehura_DVDmob3_fear
She may look innocent, but[r]
she's quite the wicked woman.[p]

#Noblewoman 1
I'm so worried about Prince Geordo...[l][r]
If that woman damages Prince Geordo's reputation,[r]
he'll never recover.[p]

#Noblewoman 3:hamehura_DVDmob3_do
Hmph, choosing a woman like that? I am[r]
so disappointed in Prince Geordo![p]

#Noblewoman 2:hamehura_DVDmob2_do
Doesn't he realize what that means[r]
for a future king?[p]

It's as if he's choosing his own ruin.[r]
[p]

#Noblewoman 3:hamehura_DVDmob3_fear
Shh, that's the commoner girl...[l][r]
If we get too close,[r]
we might get dragged into it...[p]

[chara_hide_all]

#
Baseless black rumors.[l][r]

The thorns of malice pricked at Maria's heart.[r]
[p]

[chara_show name="maria" top=&f.top face="hamehura_Maria_cos1_ai"]

#Maria
...Ugh.[p]

#
Maria bit her lip and held it in.[p]

#
—It hurt.[p]

#
More than being insulted herself,[r]
the fact that someone dear to her[r]
was being spoken ill of because of her.[p]

#
That hurt Maria the most,[r]
and she couldn't bear it.[p]

At the same time,[r]
she felt guilty towards Geordo.[p]

#
Maria, trying to shake off the rumors and her feelings,[r]
hurried her pace.[r]
[p]

[chara_hide name="maria" ]

[bg storage="black.png" ]


[bg storage="kyokai.png" ]
	
#
When Maria opened the chapel doors,[r]
Geordo was already there.[p]

[playbgm  volume=30   storage="M21_FinalMix.ogg"]

[chara_show name="gio" top="&f.top" left="&f.right" face="hamehura_Giord_cos1_doya"]


#
The evening light[r]
shone red through the stained glass,[r]
illuminating Geordo in a mystical light.[p]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_def"]

#Maria
So beautiful—[p]

#
It was like something not of this world.[r]
Maria let out a soft sigh.[p]

[chara_mod name="gio" face="hamehura_Giord_cos1_doya"]

#Geordo
[v storage="119"]
Maria, come here.[p]

[chara_mod name="maria" face="hamehura_Maria_cos1_mu"]

#
Geordo motioned for her to come.[r]
Coming back to her senses, Maria stood beside him.[p]

#Maria
Prince Geordo, you wanted to talk—[p]

#Geordo:hamehura_Giord_cos1_def
[v storage="122"]
...I've never met someone like you before.[p]

#Maria:hamehura_Maria_cos1_odo
Huh?[p]

#Geordo
[v storage="124"]
You're so vivid in everything you do...[r]
I thought my days would always be the same,[r]
but ever since I met you, they've been full of color.[p]

#Geordo:hamehura_Giord_cos1_doya
[v storage="125"]
Before I knew it, I was always watching you—[r]
I wanted you.[p]

#Geordo:hamehura_Giord_cos1_def
[v storage="126"]
But every time I reached out, you slipped away like a butterfly.[r]
Then, like a kitten,[r]
you'd look at me so endearingly...[p]

#Geordo
[v storage="127"]
Everyone else tries to become mine on their own,[r]
you know? Heh heh.[p]

#Geordo:hamehura_Giord_cos1_doya
[v storage="128"]
...But today,[r]
I want to say this to you.[p]

#
Geordo took Maria's hand[r]
and knelt down like a prince.[p]

#Geordo:hamehura_Giord_cos1_man
[v storage="130"]

Maria.[r]
Be my princess and mine alone.[p]

#Maria
Prince Geordo...[p]

#
Maria stared in amazement[r]
into Geordo's eyes.[p]

#
She wasn't so dense as to not realize[r]
that this was a proposal.[p]

#
I'm so happy.[p]

[chara_mod name="maria" face="hamehura_Maria_cos1_ase"]

#
...But.[p]

#
What came to Maria's mind was[r]
the dark rumors from earlier.[p]

#Maria:hamehura_Maria_cos1_ai
...With me, Prince Geordo,[r]
I'll just cause you trouble.[p]

[chara_mod name="gio" face="hamehura_Giord_cos1_ai"]

#Maria
Prince Geordo, you're[r]
a candidate for the next king.[l][r]
A woman like me would just tarnish your position.[p]

#Maria
That's what everyone is saying.[l][r]
That I'll be the one to bring about[r]
Prince Geordo's ruin.[p]

#Geordo
[v storage="139"]

—Ah, goodness.[p]

#
Interrupting Maria as she hung her head,[r]
Geordo gave a troubled smile.[p]

#Geordo
[v storage="141"]

Do I have to come catch you[r]
all over again?[p]

[chara_mod name="gio" face="hamehura_Giord_cos1_ai"]

#
His smiling, rose-colored lips brushed softly[r]
against the back of Maria's hand in a gentle kiss.[p]

[kanim layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#
Maria flinched slightly,[r]
as Geordo stood up and[r]
looked into her eyes.[p]

#Geordo:hamehura_Giord_cos1_doya
[v storage="144"]
I will eventually become the king of this country.[r]
A king can't be swayed by the petty rumors[r]
of the lower ranks.[p]

#Geordo
[v storage="145"]
One must simply remain dignified.[p]
Both you and I.[l][r]
Because that's the truth,[r]
there's nothing to be ashamed of, is there?[p]

#Geordo:hamehura_Giord_cos1_def
[v storage="146"]

...So please, don't give up?[p]

#

No matter who you are, I'll accept you—[l][r]
That determination filled[r]
his gentle, flame-like gaze.[p]

#Maria
How should I respond?

;[glink  color="white"  size="20"  x="360"  width="400"  y="100"  text="Are you really sure it's me?"  target="*select_03_01"  ]
;[glink  color="white"  size="20"  x="360"  width="400"  y="170"  text="I'll gladly accept."  target="*select_03_02"  ]

[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text="Are you really sure it's me?"  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="I'll gladly accept." target="*select_03_02" ]

[s]

*select_03_01
[eval exp="f.end=1"]

[cm]
#Maria:hamehura_Maria_cos1_ai
Prince Geordo...[l][r]
Are you really sure... it's okay?[p]

#
Maria's voice trembled.[l][r]
How kind he is.[p]

Tears of joy welled up in her eyes.[p]

#Maria
If I give you all of myself...[r]
Is that okay?[p]

#Geordo:hamehura_Giord_cos1_man
[v storage="151"]
Of course, Maria.[p]



[chara_hide_all]
[bg storage="white.png" time=1000] 

[wait time=1000 ]

[bg storage="hamehura_jiorudo2.png" time=3000 ]
[eval exp="sf.gio_cg_2=true" ]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1000 mode=screen wait=false loop=false ]
[endif]

#
Geordo smiled and spread his arms.[p]

Maria, of her own will,[r]
entrusted herself to his arms.[p]

#
[v storage="h2"]
It was the gentlest embrace they'd ever shared.[p]

In the shimmering light of the stained glass,[r]
they gazed into each other's eyes.[p]

#
Geordo slowly leaned in.[l][r]
Maria closed her eyes, ready to accept it.[p]

#
[v storage="h4"]

—A warm kiss.[p]

@jump target="common_03"

*select_03_02

[eval exp="f.end=2"]

[cm]

#Maria:hamehura_Maria_cos1_def2
Prince Geordo—[l][r]
I'll gladly accept.[p]

#
Maria's voice trembled.[p]

She was allowed to walk by his side.[l][r]
The joy melted Maria's heart.[p]

#Geordo
[celanim anim="red_rose_1" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="red_rose_2" layer="1" x=680 y=150 count=1 speed=0.5 wait=true]

[love_up]

#
Geordo, full of happiness,[r]
narrowed his eyes in satisfaction.[p]

#Geordo:hamehura_Giord_cos1_man
...You're such a good girl.[p]

#
It was a small, sweet whisper[r]
meant only for Maria to hear.[p]

[chara_hide_all]
[bg storage="white.png" time=1000] 

[bg storage="hamehura_jiorudo2.png" time=3000 ]
[eval exp="sf.gio_cg_2=true" ]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1000 mode=screen wait=false loop=false ]
[endif]

#
In the next moment, Geordo[r]
pulled Maria firmly into his arms.[p]

#Maria
Prince Geordo...![p]

#
Maria, of her own will,[r]
hugged him back with all her strength.[p]

#

It was the most passionate embrace they'd ever shared.[l][r]
In the shimmering light of the stained glass,[r]
they gazed into each other's eyes.[p]

#
Geordo slowly leaned in.[l][r]
Maria closed her eyes, ready to accept it.[p]

#
[v storage="h4"]
—A kiss so hot, it felt like she might melt.[p]
*common_03

#
When they pulled apart,[r]
Geordo was smiling.[p]

#Geordo
[v storage="157"]

So, for now, can you tell me[r]
who's been spreading these ridiculous rumors?[r]
[p]

#
[v storage="h2"]

Still smiling gently, Geordo[r]
showed a glimpse of his dark side.[p]

#
—Ah, it's the usual Prince Geordo.[p]

[free_layermode time=1000 ]

#
Maria couldn't help but[r]
let out a giggle.[p]
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

