
[layopt layer="message0" visible=false]
[layopt layer="0" visible=true]

[iscript]

if(typeof sf.ninsho =="undefined"){
    sf.ninsho = 0;
}
[endscript]

;一度認証が済んでる
[if exp="sf.ninsho==1"]

[jump target="success"];

[endif]



*input_passcode
[cm]

[preload storage="data/bgimage/bg_serial_code.png"]
[bg storage="bg_serial_code.png" time=500]

;[image name="panel" layer=0 storage="name_bg.png" width=500 folder="image" left=400 top=100 ]
;[layopt layer=1 visible=true ]
;[ptext layer=1 size=30 x=170 y=120 text="先に進むにはシリアルコードが必要です" ]

[ptext layer=0 x=320 y=240 align="center" width=600 name="valid_message" overwrite=true color="gray" visible="true" size=24 text="" ]

[edit left=420 top=290 width=435 size=24 name="sf.passcode"]
[button target="*sbm_passcode" x=575 y=380 width=150 graphic="ok_button.png"]

[s]

*sbm_passcode
[free layer=0 name="panel"]
[commit]
[cm]

[layopt layer=1 visible=false ]

;名前が未入力の場合
/*
[if exp="sf.passcode==''"]
    パスコードが入力されていません。
    [wait time=2000]
    @jump target=*input_passcode
[endif]
*/

[iscript]

    $(".valid_message").html("認証中………");
    
    $.ajax({
      
      type: 'POST',
      url: "./data/others/plugin/valid/valid.php",
      data: {"passcode":sf.passcode},
      success: function(data){
        
        if(data=="ok"){
            TG.ftag.startTag("jump",{target:"success"});
        }else if(data=="done"){
            TG.ftag.startTag("jump",{target:"done"});
        }else{
            TG.ftag.startTag("jump",{target:"error"});
        }   
        
      }
      
    });
    
[endscript]

;確認中。。。

[s]


[l][cm]

*error
[cm]
;認証コードに誤りがあります。もう一度確認してください
[ptext layer=0 x=340 y=240 name="valid_message" overwrite=true color="red" visible="true" size=24 text="シリアルコードが正しくありません。" ]

[wait time=1000]
@jump target="*input_passcode"

*done
[cm]
;認証コードに誤りがあります。もう一度確認してください
[ptext layer=0 x=340 y=240 name="valid_message" overwrite=true color="red" visible="true" size=24 text="このシリアルコードは使用済みです。" ]

[wait time=1000]
@jump target="*input_passcode"


*success
[cm]
[eval exp="sf.ninsho=1"]
[free layer=0 name="valid_message"]
[freeimage layer=1 ]

;メッセージボックスは非表示
@layopt layer="message" visible=false

@jump storage="title.ks"

