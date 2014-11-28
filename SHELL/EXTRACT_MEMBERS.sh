#!/bin/bash 
#-----------------------------
# メンバー一覧リストを作る
#   $1 HTMLまたはJSONを指定 デフォルト：HTML
#   $2 ページあたり行数 　　デフォルト：10行
#   $3 ページ数 　　　　　　デフォルト：1ページ目
#-----------------------------
dir=/home/action/workspace/StaffingSupportSystem  
dbd=$dir/db
tmp=$dir/tmp
arg1=${1:-HTML}
arg2=${2:-10}
arg3=${3:-1}

# echo hello
# echo ${arg1}
# echo ${arg2}
# echo ${arg3}

top=`expr ${arg2} \* \( ${arg3} - 1 \) + 1`          # 表示位置先頭行を算出 
#end=`expr ${arg2} \* ${arg3}`
#sta=`expr ${end} - ${arg2} + 1`
#echo $sta
#echo $end


#echo "select name, code, email from mambers;"     | # SQLite3のエクスポートユーティリティを使う場合
#sqlite3 $dbd/development.sqlite3                  | # 同上
#tr "|" " "                                        | # 同上
rake extract:extract_members                       | # rakeスクリプトでメンバーを出力
cat > ${tmp}/extract_members.dat                     # 一旦、中間ファイルに保存

trows=`gyo ${tmp}/extract_members.dat`               # 中間ファイルを使って件数カウント
tpages=`expr ${trows} / ${arg2} + 1`                 # トータルページ数を計算

# JSONのヘッダ行を出力
echo {\"page\":${arg3},\"total\":${tpages},\"records\":${trows},\"rows\":[

cat ${tmp}/extract_members.dat                     | # 中間ファイルを再度読み込み
tail -n +${top}                                    | # 表示位置先頭以前をカット
head -n ${arg2}                                    | # 表示行数より後をカット
# sed -n  ${sta},${end}p                           | # 第２引数を開始行、第３引数を終了行として１ページ分のデータを抜く(tailとheadでの実装に変更)
awk '{print $0 " ,"}'                              | # 各行の最後にカンマを付与
sed -e '$s/,$//g'                                  | # 最終行だけカンマをブランクに変換する
mojihame -lRECORDS SHELL/MEMBERS_$arg1.TEMPLATE    | # テンプレートを使ってHTMLやJSONに編集する
cat
exit 0