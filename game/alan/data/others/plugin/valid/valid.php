<?php
    
    $input_code = $_POST["passcode"];
    
    //ini_set('display_errors', "On");
    
    $sqlite_path = "metu03.sqlite";
    
    $db = new SQLite3($sqlite_path, SQLITE3_OPEN_CREATE | SQLITE3_OPEN_READWRITE);
    
    $code_id = SQLite3::escapeString($input_code);
    
    $query = 'SELECT * FROM "users" where code_id="'.$code_id.'";';
    
    $row = $db->querySingle($query,true);
    
    //カウントが０以上の場合
    if($row == NULL){
        echo "ng";
    }else if($row["flag"]==0){
        
        //データが存在する場合はアップデートする
        $sql = 'UPDATE users SET flag = 1  WHERE code_id ="'.$code_id.'";';
        $res = $db->query($sql);
        
        echo "ok";
        return;
        
    }else if($row["flag"]==1){
        //使用済み
        echo "done";
        return;
        
    }else{
    
        echo "ng";
        return;
        
    }
           
?>