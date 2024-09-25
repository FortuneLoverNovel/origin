;=========================================
; スペシャル画面作成
;=========================================

@layopt layer=message0 visible=false

@clearfix
[hidemenubutton]
[cm]

[iscript]
    
    tf.page = 0;
    tf.selected_cg_image = ""; //選択されたCGを一時的に保管
    
[endscript]

[bg storage="special.png" time=100]
[layopt layer=1 visible=true]

[layopt layer=1 visible=true]

[cm]
[button graphic="btn_special_top.png" target="*backtitle" x=550 y=560 ]

[if exp="sf.gio_cg_1==true"]
	[button graphic="sp1_on.png" x=100 y=200 width=520 exp="tf.cg='hamehura_jiorudo1.png'" target="*clickcg" folder="image" ]
[else]
    [button graphic="sp1_off.png" x=100 y=200 width=520 role="none" folder="image" ]	
[endif]

[if exp="sf.gio_cg_2==true"]
	[button graphic="sp2_on.png" x=650 y=200 width=520 exp="tf.cg='hamehura_jiorudo2.png'" target="*clickcg" folder="image" ]
[else]
    [button graphic="sp2_off.png" x=650 y=200 width=520 role="none" folder="image" ]	
[endif]






@jump target="*common"

*common



[s]

*backtitle
[cm]
[freeimage layer=1]
@clearfix
@jump storage=title.ks

*clickcg

[cm]
[freeimage layer=1]
@clearfix

[bg storage="&tf.cg" time=1000]
[p]
[jump storage="main/special.ks"]

[eval exp="tf.cg_index=0"]


[s]

*no_image

@jump  target=*cgpage

