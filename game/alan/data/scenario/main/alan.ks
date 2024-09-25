
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

#マリア


疲れた……。[p]

[playbgm  volume=15   storage="M33_FinalMix.ogg" ]


#
マリアは図書室の片隅で机に突っ伏していた。[p]

#マリア
期末試験が終わって[r]
やっと一段落したと思ったのに……。[p]

[chara_hide name="maria"]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

#
マリアが思い出すのは[r]
第四王子アラン・スティアートだ。[p]

#
双子の兄であるジオルドだけでなく[r]
女で平民のマリアにも試験結果が及ばなかったことで[r]
アランはささくれ立っていた。[p]

[chara_hide name="alan"]
[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ai" wait=true]

#マリア
顔を合わせるたびに、キツイこと[r]
言われちゃうんだよね……。[p]

#

しかし、それは悔しさからの言葉であり[r]
カタリナのような悪意をぶつけられているのではない[r]
とはわかっている。[p]

[md name="maria" face="無表情"]

#
自分の存在がアランのストレスになるのなら、[r]
マリアはアランを避けた方がいいと考えていた。[p]

[stopbgm]

#
と、その時だ。[p]

[playbgm  volume=15   storage="M40_FinalMix.ogg" ]
[playse storage="se/door-open1.ogg" ]
[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]


[md name="maria" face="焦り"]
#
図書室の扉が開く音が聞こえ、[r]
マリアはびくっととび起きた。[p]

#
本棚の影から入室者を確認すると、[r]
不機嫌そうな顔の彼がいた。[p]

[chara_hide name="maria"]

[v storage="h1" ]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]


[wait time=1000]
	
[chara_hide name="alan"]	
[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" wait=true]

#マリア
うう……アラン様だ……。[p]

#マリア

（どうしよう？）
	
[button name="button" graphic="select/ans_01_01.png" enterimg="select/ans_01_01_on.png" x=220 y=100 text="隠れておこう"  target="*select_01_01"]
[button name="button" graphic="select/ans_01_02.png" enterimg="select/ans_01_02_on.png" x=220 y=240 text="そっと出ていこう" target="*select_01_02" ]

[s]

;隠れておこう
*select_01_01
[cm]

[md name="maria" face="焦り"]

[love_up]

#マリア
（見つかっちゃったら[r]
また何か言われてしまうかも……）[p]

;[anim name="maria" left=-1000 ]
;[wa]

[chara_hide name="maria"]

#
マリアは本棚の影に身を潜めた。[p]

[playse storage="se/walk-asphalt1.ogg"]

#
……アランの足音が近づいてくる。[p]

#
マリアにとっては、その足音から[r]
彼の不機嫌が伝わってくるようで[r]
バレませんように、と身をすくませる。[p]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_do" wait=true]

[stopse]

#アラン	
……チッ。[p]


#
本棚を隔ててすれ違うその時[r]
アランは舌打ちをひとつした。[p]

[chara_hide name="alan" pos_mode=false ]

[wait time=1000]

;[anim name="maria" left="&f.left" time=2300 ]
;[wa]


[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" wait=true]

#
マリアはびくっと震えるも、幸いにして[r]
アランに見つかっていなかったようだ。[p]

[md name="maria" face="悲しみ"]

#マリア
（アラン様、今日も不機嫌みたい。[r]
はぁ、見つからなくてよかった……）[p]

[md name="maria" face="無表情"]

#
マリアは安堵の息を吐くと[r]
そのまま本棚に身を隠し[r]
そっと図書室から離脱するのであった。[p]

[jump target="*common1" ]

*select_01_02
[cm]

[md name="maria" face="焦り"]

#マリア
（本棚に隠れながら遠回りすれば[r]
きっと見つからないよね……）[p]

#
マリアは本棚の影に隠れながら[r]
図書室の扉を目指す。[p]

[chara_hide name="maria"]

[playse storage="se/walk-asphalt1.ogg"]

#
遠くからアランの[r]
不機嫌そうな足音が聞こえる。[p]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_ase" wait=true]

#マリア
（どうかバレませんように……）[p]

#
扉はもう目の前。[r]
マリアは音を立てないようにしながら[r]
ゆっくりと扉を開いた。[p]

[md name="maria" face="驚き" ]

[playse storage="se/door-open1.ogg"]

#
だが、それでも[r]
わずかな音が出てしまい――[p]

[stopbgm]
[md name="maria" face="焦り" ]

#マリア
あ。[p]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_odo" wait=true]

#アラン	
あ。[p]

[playbgm  volume=15 storage="M46_FinalMix.ogg" ]

#
アランが振り返ったのと[r]
ちょうどマリアが扉から[r]
出ようとしていたのは同時。[p]

#
目が合う二人の声が重なった。[p]

[md name="alan" face="怒り"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#マリア
し、失礼しますっ！[p]

[playse storage="se/dash-asphalt2.ogg" ]

[chara_hide name="maria"]

[md name="alan" face="驚き"]

[v storage="h2"]

#
マリアはアランから何か言われる前に[r]
慌てて図書室から脱出するのであった。[p]

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
今日も今日とて[r]
アランと遭遇しないように[r]
こそこそと隠れる日々。[p]

#
マリアはキョロキョロしながら[r]
中庭を歩いていた。[p]

[md name="maria" face="微笑み" ]

#マリア
アラン様、この辺りにはいないみたい……。[p]

#
ホッと息を吐く。[r]
その時であった。[p]

[fadeinbgm  volume=15 storage="M02_FinalMix.ogg" time=2000 ]
[wait time=2000]

[md name="maria" face="驚き" ]

#
花垣の向こう側から、バイオリンの[r]
美しい旋律が聞こえてくる。[p]

[md name="maria" face="笑顔" ]

#マリア
なんて綺麗な音色――。[p]

[md name="maria" face="微笑み" ]

#マリア
（誰が演奏しているんだろう？）[p]

[chara_hide name="maria"]

[bg storage="HF04_292.png" ]


[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_def" wait=true]

#
マリアはそーっと[r]
花垣から顔をのぞかせた。[r]
そこにいたのは……。[p]

[chara_move name="maria" top="&f.top" left="&f.left" wait=true]
[md name="maria" face="驚き"]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]


#マリア
アラン様……!?[p]

[stopbgm]
[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

[md name="alan" face="怒り"]

#アラン	

[v storage="22"]

[font size=30]
――だ、誰だッ!?
[resetfont]
[p]

[playbgm  volume=15   storage="M09_FinalMix.ogg" ]

#
人の気配に[r]
演奏を止めたアランが鋭く振り返る。[p]

[md name="maria" face="焦り"]

#マリア
あっ！[r]
え、ええと、ごめんなさい……！[p]

#マリア
盗み聞きするつもりはなくて[r]
すごく綺麗な音色が聞こえたので……！[p]

[md name="alan" face="驚き"]

#アラン	
……綺麗な音色？[p]

[v storage="h6"]

#
アランは顔をしかめた。[r]
まるで忌々しいものを見るように[r]
バイオリンに視線を落とす。[p]

[md name="alan" face="悲しみ"]

[v storage="27"]

#アラン	
綺麗なものかよ。[r]
ジオルドの方がもっと上手いはずだ。[r]
お前だってそう思ってるんだろ。[p]

[md name="maria" face="怒り"]

#マリア
そんなことないです！[p]

[md name="maria" face="微笑み"]

#マリア
本当に……素敵な演奏でした。[p]

[md name="maria" face="焦り"]

[v storage="29_A"]

#アラン	
俺はしょせん、二番手以下だ。[p]

[v storage="29_B"]

#アラン	
勉強もバイオリンも、何もかも……。[r]
どれだけ努力したって……。[r]
追いつけやしないんだ……。[p]

#
アランは重く溜息を吐いて背を向けた。[r]
アランが抱える悲しい重責を、マリアは察する。[p]

[md name="maria" face="悲しみ"]
[md name="alan" face="驚き"]

#
マリアは一歩[r]
アランの背に歩み寄った。[p]

#マリア
アラン様には、アラン様の得意なものや[r]
苦手なものがあるのでしょうから。[p]

#マリア

向き不向きがあっても[r]
当たり前なのではないでしょうか。[p]

[md name="maria" face="微笑み"]
[md name="alan" face="無表情"]

#マリア
……きっと、全てが完璧な人なんていないんです。[p]

#マリア
私も、ジオルド様も、アラン様も……[r]
誰にだって、何かしらの苦手があって[r]
そして、得意もあるんだと思います。[p]

[md name="maria" face="笑顔"]


#マリア
だからきっと[r]
アラン様はアラン様のままでいいんだと[r]
私は思いますよ。[p]

[md name="maria" face="微笑み"]
[md name="alan" face="悲しみ"]


#アラン
……お前……。[p]

#
アランが振り返る。[r]
まるで叱られた子どものような顔だった。[p]

[v storage="38"]

#アラン
……本当に、そう思うか？[p]

[md name="maria" face="笑顔"]

#マリア
はい、思います。[p]

[md name="maria" face="微笑み"]

#アラン	
……。[p]

[md name="alan" face="微笑み"]

#アラン	
[font size=18]
……そうか。……そうかもな。
[resetfont]

[p]

[md name="maria" face="笑顔"]

#マリア
きっとそうです。[p]

[md name="maria" face="照れ"]

#マリア
それから、改めて……[p]

[md name="maria" face="笑顔"]
[md name="alan" face="驚き"]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

#マリア
アラン様の演奏、私は好きですよ！[r]
とっても素敵でした。[r]
また聴かせてほしいです！[p]

[md name="alan" face="微笑み"]

#アラン	
おう。[p]

[md name="maria" face="微笑み"]
[md name="alan" face="無表情"]

#アラン	
…………。[p]

[v storage="45"]

[md name="alan" face="照れ"]

#アラン	
[font size="18"]
……ありがとな。
[resetfont]
[p]

#
視線を惑わせ[r]
アランはもごもごと呟く。[p]

[md name="maria" face="驚き"]
[md name="alan" face="悲しみ"]

[v storage="47"]

#アラン	
……俺、酷いこと言ったろ、お前に。[r]
八つ当たりしてた。……悪かった。[p]

[md name="maria" face="微笑み"]
[md name="alan" face="驚き"]

#マリア
じゃあ……仲直りしませんか？[p]

[md name="alan" face="悲しみ"]

#アラン
仲直りって……どうやって？[p]

[md name="maria" face="照れ"]

#マリア
うーん。[r]
握手、とかですかね？[p]

[md name="alan" face="無表情"]

#アラン
握手……。[p]

[md name="maria" face="微笑み"]
[md name="alan" face="照れ"]

#
アランは自分の掌を見る。[r]
それから「ん」とちょっと照れ臭そうに[r]
片手を差し出した。[p]

[md name="maria" face="笑顔"]
[md name="alan" face="微笑み"]

#
マリアはその手を取る。[p]

[md name="maria" face="照れ"]

#マリア
（大きな手……[r]
だけど、子どもみたいな人……）[p]
[md name="maria" face="微笑み"]
[md name="alan" face="怒り"]

[v storage="h2"]

#
くすっと笑うマリアに、アランは[r]
「笑うんじゃない」と恥ずかしそうに[r]
そっぽを向くのであった。[p]


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
季節は巡り[r]
また試験の日がやってきて[r]
そして、今日やっと終わった。[p]


[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_ai" wait=true]

#マリア
疲れた～……。[r]
ここ最近は、ずっと勉強漬けだったもの……。[p]

[md name="maria" face="無表情"]

#
あとは試験結果を待つのみだ。[r]
解放感はあるが、疲労感も大きい。[p]

マリアは気分転換のため[r]
中庭へ足をのばしていた。[p]

#

……のだが。[p]

[chara_hide name="maria" ]

[bg storage="HF04_078.png"]


[chara_show name="maria" top="&f.top" face="hamehura_Maria_cos1_odo" wait=true]
	
#
お気に入りの木陰には先客がいた。[r]
アランが寝転がっていたのだ。[p]

#アラン
……。[p]

#マリア
寝てる、のかな……？[p]

#マリア
（どうしよう？）

[button name="button" graphic="select/ans_02_01.png" enterimg="select/ans_02_01_on.png" x=220 y=100 text="寝顔を見守る"  target="*select_02_01"]
[button name="button" graphic="select/ans_02_02.png" enterimg="select/ans_02_02_on.png" x=220 y=240 text="声をかけてみる" target="*select_02_02" ]

[s]

*select_02_01
[cm]

[md name="maria" face="照れ"]

#マリア
（アラン様の寝顔なんて[r]
なかなか貴重かも……？）[p]

#
ちょっとした好奇心から[r]
マリアは静かにアランへと近づいて[r]
その顔をゆっくりと覗き込んだ。[p]

[md name="maria" face="驚き"]

#
木漏れ日の中、目を閉じた彼の顔は[r]
まるで彫刻と見紛うほどに[r]
凛と整っていた。[p]

[md name="maria" face="微笑み"]

#
それでいてどこかあどけなくて[r]
愛おしさが込み上げてくる。[p]

#マリア
（……綺麗……）[p]

#
マリアはそんな感想を抱くと同時に[r]
今、彼のこの顔を見ているのは自分だけなのだ、[r]
という幸福感で少しだけ頬が緩んだ。[p]

[md name="maria" face="笑顔"]

#マリア
ふふ。[p]

#
と、その時だ。[r]
アランの目がパチリと開く。[p]

[md name="maria" face="驚き"]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

[v storage="h2"]

#アラン
……おい。[p]

[md name="maria" face="焦り"]
[chara_move name="maria" left="&f.left" time=500 ]

#マリア
あ……ごめんなさい。[r]
起こしちゃいました……？[p]

#アラン
……足音で気づいていた。[p]

#マリア
起きてらっしゃったのですね……。[p]

#
彼の顔を覗き込んで、[r]
自分はだらしない顔をして[r]
しまっていたのではないだろうか……。[p]

#
そんな恥ずかしい気持ちに[r]
マリアは頬が熱くなった。[p]

#
アランはそんなマリアに対し、[p]

[jump target="common2"]

*select_02_02
[cm]

[md name="maria" face="悲しみ"]

#マリア
（寝てるのかな……。[r]
起こしちゃうのは悪いかな……）[p]

[md name="maria" face="微笑み"]

#マリア
（でも、せっかくだし、アラン様と[r]
少しだけ、お話ししたいな……）[p]

[md name="maria" face="照れ"]

#マリア
アラン様ー……？[p]

#
少しためらいながら、マリアは[r]
控えめな声量で呼びかけてみた。[p]

#アラン
……。[p]

[md name="maria" face="無表情"]

#
アランからの返事はない。[p]

#マリア
（やっぱり寝てる……。[r]
アラン様も、試験で忙しかったのかな）[p]

#
と、その時だ。[r]
アランの目がパチリと開く。[p]

[md name="maria" face="驚き"]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

[kanim_chara layer=0 name="maria" keyframe=quake time=300 count=1 easing=linear]

[v storage="h2"]

#アラン
……おい。[p]

[md name="maria" face="焦り"]

[chara_move name="maria" left="&f.left" time=500 ]
;[wa]

#マリア
あ……ごめんなさい。[r]
起こしちゃいました……？[p]

[md name="alan" face="ドヤ顔"]

#アラン
呼ぶのは一回だけか？　俺の名前。[p]

[md name="maria" face="驚き"]

#マリア
えっ――[p]

#マリア
（あ、最初から起きて……）[p]

[md name="maria" face="照れ"]

#
からかうように細められた[r]
アランの眼差しに捉えられ、[r]
マリアは頬が熱くなった。[p]

#マリア
ア……アラン様。[r]
おはよう、ござい、ます……。[p]

[md name="maria" face="微笑み"]
[md name="alan" face="微笑み"]

[celanim anim="blue_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="blue_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]


#アラン
おう。[p]

#
しどろもどろにうつむいたマリアに[r]
アランは小さく含み笑った。[p]

*common2

[md name="maria" face="驚き"]
[md name="alan" face="微笑み"]


[v storage="65"]

#アラン
……こっちに来い。[p]

#
アランが手招きをする。[r]
マリアが傍に寄れば[r]
「座れ」と彼は自分の傍を示した。[p]

[v storage="67"]

#アラン
もっと近くに寄れ。[p]

#マリア
（もしかして、アラン様……[r]
膝枕、してほしい……のかな？）[p]


;スチル表示
[chara_hide_all ]

[wait time=1000 ]

[eval exp="sf.alan_cg_1=true" ]
[bg storage="alan1.png" time=2000] 


#
そう考えながら言われたとおりにすると[r]
予想どおり、アランはマリアの足の上に[r]
のしり、と頭を乗せてきた。[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
横を向いてマリアの方を見ないのは[r]
甘えたい気持ちと恥ずかしい気持ちが[r]
せめぎあっているからだろうか。[p]

#
かわいらしい様子に[r]
マリアは口元がちょっと緩んでしまう。[p]

[v storage="72"]

#アラン
試験、どうだった？[p]

#マリア
あ、ええと……[r]
悪くない手応えかな、って感じです。[r]
アラン様は？[p]

[v storage="h5"]

#アラン
まあ、それなりに。[p]

#マリア
そうですか。[r]
お疲れ様でした。[p]

[v storage="h1"]

#
他愛もない会話だ。[r]
話題が途切れると[r]
少しだけ沈黙が流れる。[p]

#
優しい風がそよそよと吹いて[r]
木漏れ日が柔らかく瞬いた。[p]

[fadeoutbgm time=1000] 

[wait time=1000]
[playbgm volume=15 storage="M21_FinalMix.ogg" ]

[v storage="78"]

#アラン
お前のおかげなんだ。[p]

#
唐突に、アランが口を開く。[p]

[v storage="80"]

#アラン
お前と出会ったことで……[r]
俺は、背負ってた重いものを[r]
下ろすことができた。[p]

[v storage="81"]

#アラン	
前しか向いちゃダメなんだと[r]
ずっと思ってた俺に……[r]
力を抜いていいことを教えてくれた。[p]

[v storage="82_A"]

#アラン
努力すること、真面目に取り組むこと。[r]
勉強もバイオリンも――[p]

[v storage="82_B"]

#アラン
どうせダメなんだって諦めてたそれらに[r]
正面から向き合えるようになったのは[r]
全部……お前のおかげだ。[p]

#マリア
アラン様……。[p]

;要チェック
[v storage="84"]

#アラン
マリアと会ってから[r]
俺の日々が変わったんだ。[r]
明るくて、眩しくて、大切で……。[p]

[v storage="85_A"]

#アラン
誰かとの優劣にすがるんじゃなくて[r]
自分のままでいていいんだ、って。[p]

[v storage="85_B"]

#アラン
そうお前に教えてもらって、[r]
……嬉しかったんだ、すごく。[p]

[v storage="86"]

#アラン
マリア。[r]
……ありがとな。[p]

#マリア
どういたしまして、アラン様。[p]

#
マリアはアランの額を優しく撫でた。[p]

#
――きっと、これまでアランは[r]
頭を撫でて褒めてくれる手を[r]
求めても得られなかったのだろうと思いながら。[p]

#マリア
（ひょっとして、アラン様は……[r]
私と話をするために、ここにいたのかな）[p]

#マリア
（……なんて）[p]

#
穏やかで静かなひとときが過ぎる。[p]

#
しかし、静寂を破ったのは[r]
やはりアランからだった。[p]

[free_layermode time=1000 ]


[bg storage="HF04_078.png"]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_def" wait=false]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

#
彼はパッと跳ね起きると[r]
意を決したかのようにこう言った。[p]

[md name="maria" face="驚き"]
[md name="alan" face="怒り"]

[v storage="94"]

#アラン
伝えたいことがある。[r]
だが、その前に俺は[r]
やらなきゃいけないことがある。[p]

[md name="alan" face="無表情"]

[v storage="95"]

#アラン
……だからまた明日[r]
今日と同じ時間に、ここに来い。[p]

[fadeoutbgm time=1000]
[playse storage="se/dash-asphalt2.ogg" ]

[chara_hide name="alan"]

#
そう言って[r]
アランは「絶対だぞ」と念押しをして[r]
どこかへと駆けて行った。[p]

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
マリアはアランとの約束を思い出しながら[r]
中庭への道を歩いていた。[p]

#
しかし、その道を塞ぐように立つ人影がある。[r]
その正体は――[p]

[md name="maria" face="焦り"]
[chara_show name="mary" top="&f.top" left="&f.right" face="hamehura_Mary_cos1_mu" wait=true]

#メアリ
こんにちは、マリアさん。[p]

#
アランの婚約者であるメアリだった。[p]

#メアリ
マリアさん。[r]
あなたにひとつだけ[r]
たずねたいことがございます。[p]

#
メアリの眼差しは真っ直ぐで[r]
凛として真剣だった。[p]


[md name="maria" face="無表情"]

#
マリアは表情を引き締めて[r]
彼女の言葉を促した。[p]

[md name="mary" face="怒り"]

#メアリ
――あなたにとって[r]
アラン様とはどういう存在ですか？[p]

[md name="maria" face="驚き"]
[md name="mary" face="無表情"]

#マリア
私にとって、ですか？[p]

[md name="maria" face="無表情"]

#
マリアは少しだけ考えると[r]
メアリの目を見すえ、しっかりと語り始めた。[p]

#マリア
強がりで、意地っ張りで[r]
でも素直で頑張り屋で優しくて[r]
……本当は誰よりも等身大な人。[p]

[md name="maria" face="微笑み"]

#マリア
そんな彼を、愛しいと……[r]
支えたいと、思います。[p]

#マリア
そんな彼の近くに……。[p]

#マリア
ずっと、お傍にいたいです。[p]

[md name="maria" face="悲しみ"]
[md name="mary" face="悲しみ"]

#マリア
第四王子だから[r]
スティアート家だから、じゃない――[r]
アラン様、だからです。[p]

[md name="maria" face="無表情"]

#マリア
私はずっと、彼と一緒にいたい。[r]
傍にいて、彼の笑顔を見ていたい。[r]
彼を支えて、彼と共に歩いていきたい。[p]

#マリア
……心から、そう思っています。[p]

[md name="maria" face="悲しみ"]

#
罪悪感がない、と言えば嘘になる。[r]
メアリはアランの婚約者。[p]

#
今の言葉は、婚約者に対し[r]
真っ向から相手を奪うと[r]
宣言しているようなものだった。[p]

#
だけど、今この時は[r]
本当の気持ちを伝えねば[r]
メアリに不敬だと、マリアは感じた。[p]

#メアリ	
……。[p]

#
メアリはじっと[r]
マリアの言葉を聴いていた。[p]

[md name="mary" face="微笑み"]

#
だが、その表情が[r]
ふっとほころぶ。[p]

[md name="maria" face="驚き"]

#メアリ
……敵いませんね、あなたには。[p]

[md name="maria" face="悲しみ"]

#マリア
メアリ様……。[p]

[md name="mary" face="悲しみ"]

#メアリ
私には、あの方にあんな笑顔を[r]
浮かべさせることはできなかった。[p]

#メアリ
あの方の人生を本当に照らせるのは――[r]
マリアさん、あなただけなんですね。[p]

[md name="mary" face="微笑み"]

#メアリ
あなたの、アラン様へのその気持ち……[r]
どうか大切になさってください。[p]

#メアリ
では、ごきげんよう。[p]

[md name="mary" face="悲しみ"]

#メアリ	
[font size="18"]
……どうか、お幸せに。
[resetfont]
[p]

#
浮かべたメアリの笑みは柔らかくて。[r]
だけど――きびすを返すその瞬間。[p]

[chara_hide name="mary"]

[md name="maria" face="焦り"]

#マリア
あっ……。[p]

#
マリアは、彼女の目に[r]
涙が煌いているのを、確かに見た。[p]

[md name="maria" face="悲しみ"]


#マリア
メアリ様……ありがとうございます。[p]

[chara_hide name="maria"]

#
マリアは彼女の背が見えなくなるまで[r]
深々とお辞儀をしていた。[p]


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

約束の場所。[r]
木漏れ日の下。[p]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=true]

#
マリアが空を見上げていると[r]
一つの足音がやってくる。[p]

[playse volume=50 storage="se/dash-in-room1.ogg" ]
[wse]

[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_do" wait=true]

[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

[v storage="130"]

#アラン
[font size=36]マリア……！
[resetfont]
[p]

[md name="maria" face="笑顔"]
[md name="alan" face="無表情"]

#マリア
アラン様！[p]

#
ずっと走ってきたのだろう。[r]
アランは息を弾ませてマリアの傍で立ち止まる。[p]

[chara_hide_all ]

[eval exp="sf.alan_cg_2=true" ]
[bg storage="alan2.png" ]

#
そのまま息を整えて……[r]
深呼吸の後、アランは背筋を伸ばして[r]
マリアの手を取った。[p]

[if exp="f.mixmode==true"]
[layermode_movie mute=true video=kirakira.webm time=1500 mode=screen wait=false loop=false ]
[endif]

#
そして、マリアに伝えたいことを[r]
遂に言葉にする。[p]

[v storage="135"]

#アラン
マリア。[r]
俺の傍にいてほしい。[r]
これからも、ずっと。[p]

#
飾らない言葉。[r]
どこまでもシンプルで[r]
真っ直ぐな想い。[p]

#
マリアはアランを見つめた。[p]

#マリア
それがどういうことか[r]
アラン様は、ご理解の上ですか？[p]

[v storage="139"]

#アラン
わかってる。[p]

[v storage="140"]

#アラン
……俺のものになってくれ。[p]

[v storage="141"]

#アラン
俺と――結婚してくれ。[p]

#
かつてない、アランの真面目な眼差し。[r]
彼は言葉を続けた。[p]

[v storage="143"]

#アラン
昨日、メアリとジオルドに[r]
話をつけてきた。両方の親ともだ。[p]

[v storage="144"]

#アラン
しっかりと話し合った。[r]
……二人共[r]
俺の背中を押してくれた。[p]

#マリア
（だから、メアリ様は――）[p]

#
マリアは先ほどの邂逅を思い出す。[r]
同時に、託された想いを噛み締める。[p]

#
アランも、メアリも[r]
覚悟を決めたのだ。[p]

#

アランはかしずき、マリアを見上げる。[p]

[v storage="149"]

;@quake_camera

#アラン	
[font size="36"]お前の人生、俺にくれ！
[resetfont]
[p]

[free_layermode time=1000 ]


#マリア
（なんて答えよう？）

[button name="button" graphic="select/ans_03_01.png" enterimg="select/ans_03_01_on.png" x=220 y=100 text="喜んで"  target="*select_03_01"]
[button name="button" graphic="select/ans_03_02.png" enterimg="select/ans_03_02_on.png" x=220 y=240 text="本当にいいんですか？" target="*select_03_02" ]

[s]

*select_03_01
[cm]

[bg storage="HF04_078.png"]
[playbgm  volume=15   storage="M17_FinalMix.ogg" ]

[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=false]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

#
大きな声。[r]
大きな想い。[p]

#
マリアは受け止める覚悟を決める。[r]
それが自分を応援してくれている人たち。[p]

#
そして自分の恋心への[r]
最大の敬意と誠意なのだから。[p]

[md name="maria" face="微笑み"]

#マリア
――喜んで。[p]

[md name="maria" face="笑顔"]

#マリア
私の全てを、あなたにさしあげます。[r]
どうか……私をもらってください。[p]

[kanim_chara layer=0 name="alan" keyframe=quake time=300 count=1 easing=linear]

[celanim anim="blue_rose_1" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]
@wait time=200
[celanim anim="blue_rose_2" layer="1" x=680 y=200 count=1 speed=0.5 wait=true]

[love_up]

[md name="alan" face="照れ"]

#アラン
……！[p]

[md name="maria" face="微笑み"]
[md name="alan" face="微笑み"]

[v storage="154"]

#アラン
ああ！　もちろんだ！[p]

[md name="maria" face="笑顔"]

#
ぱぁっと少年のように笑うアランは[r]
マリアを両腕で力いっぱい抱きしめた。[p]

#
マリアもまた、アランの大きな体を[r]
抱きしめ返す。[p]

#
優しい木漏れ日の中[r]
二人はずっとずっと抱き合っていた。[p]

@jump target="common_03"

*select_03_02
[cm]

[bg storage="HF04_078.png"]
[playbgm  volume=15   storage="M17_FinalMix.ogg" ]


[chara_show name="maria" top="&f.top" left="&f.left" face="hamehura_Maria_cos1_mu" wait=true]
[chara_show name="alan" top="&f.top" left="&f.right" face="hamehura_Alan_cos1_mu" wait=true]

#
大きな声。[r]
大きな想い。[p]

[md name="maria" face="悲しみ"]

#
でも、本当に[r]
自分が受け止めてもいいのだろうか。[p]

[md name="alan" face="悲しみ"]

#
これは複数の貴族の家を巻き込む、[r]
ただの『男女の恋』では済まされない代物なのだ。[p]

#
この恋の先には、まだ子どもの二人には[r]
想像もつかないような苦難が[r]
待ち受けているのだろう。[p]

#マリア
（本当に、いいんですか？）[p]

#
けれど――[r]
マリアは、メアリとのやりとりを[r]
思い出す。[p]

#
アランが愛しい。[r]
彼を支えたい。[p]

[md name="maria" face="無表情"]

#
――彼の傍にいたい。[p]

#マリア
（ここで私が迷うのは……[r]
メアリ様への、アラン様への裏切りだ）[p]

#
だからマリアは[r]
真っ直ぐにアランを見つめ――[p]

[md name="maria" face="微笑み"]
[md name="alan" face="照れ"]

#
心からの気持ちを込めて、頷いた。[p]

[md name="alan" face="微笑み"]

#
きっと、この恋は[r]
幸せなことばかりじゃないだろう。[p]

#
もしかしたら苦難の方が[r]
多いかもしれない。[p]

[md name="alan" face="微笑み"]

#マリア
（それでも、私たちは……）[p]

[md name="maria" face="笑顔"]

#
微笑むアランに抱きしめられ、[r]
マリアは力いっぱい[r]
彼を抱きしめ返した。[p]

#
優しい木漏れ日の中[r]
二人は共に歩む未来を誓い合う――。[p]

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




