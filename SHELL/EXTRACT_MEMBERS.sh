#!/bin/bash 
#-----------------------------
# リストを作る
#-----------------------------
dir=/home/action/workspace/StaffingSupportSystem  
dbd=$dir/db 
#echo "select name, code, email from mambers;"     |
#sqlite3 $dbd/development.sqlite3                  |
#tr "|" " "                                        |
rake extract:extract_members                       |
mojihame -lRECORDS SHELL/MEMBERS_$1.TEMPLATE       |
cat
exit 0