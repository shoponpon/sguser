#!/bin/bash

# profileの読み込み
PROFILE=$(cd $(dirname $0); pwd)'/profile/'$1
values=()
i=0
while IFS=$'\n' read -r line; do
    values[i]="${line}"
    ((++i))
done < $PROFILE
name=${values[0]}
email=${values[1]}

# debug
echo "set name => "$name
echo "set email => "$email

# globalアカウントを変更
git config --global user.name "$name"
git config --global user.email "$email"

# 確認
git config --global -l