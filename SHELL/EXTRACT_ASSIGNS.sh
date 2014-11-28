#!/bin/bash 
#-----------------------------
# メンバーのIDを指定して案件リストを作る
#   $1 メンバーのID
#   $1 HTMLまたはJSONを指定
#-----------------------------
dir=/home/action/workspace/StaffingSupportSystem  
dbd=$dir/db
rake extract:extract_assigns[$1]                   | # rakeスクリプトでメンバーを出力
tr "-" " "                                         | # 日付の－をブランクにする
self 2 1 3 4 5 6 7 8 9                               | # 列の並べ替え
awk '{print $0 " ,"}'                              | # 各行の最後にカンマを付与
sed -e '$s/,$//g'                                  | # 最終行だけカンマをブランクに変換する
mojihame -lRECORDS SHELL/ASSIGNS_$2.TEMPLATE       | # テンプレートを使ってHTMLやJSONに編集する
cat
exit 0