#!/bin/bash 
#-----------------------------
# メンバー一覧リストを作る
#-----------------------------
dir=/home/action/workspace/StaffingSupportSystem  
dbd=$dir/db 
#echo "select name, code, email from mambers;"     | # SQLite3のエクスポートユーティリティを使う場合
#sqlite3 $dbd/development.sqlite3                  | # 同上
#tr "|" " "                                        | # 同上
rake extract:extract_members                       | # rakeスクリプトでメンバーを出力
awk '{print $0 " ,"}'                              | # 各行の最後にカンマを付与
sed -e '$s/,$//g'                                  | # 最終行だけカンマをブランクに変換する
mojihame -lRECORDS SHELL/MEMBERS_$1.TEMPLATE       | # テンプレートを使ってHTMLやJSONに編集する
cat
exit 0