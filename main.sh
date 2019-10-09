#!/bin/bash

# profileの読み込み
PROFILE=$(cd $(dirname $0); pwd)'/profile/'$1
values=()
i=0
while IFS=$'\n' read -r line; do
    values[i]="${line}"
    ((++i))
done < $PROFILE
account=${values[0]}
address=${values[1]}

# debug
echo "set account => "$account
echo "set address => "$address

# globalアカウントを変更
git config --global user.name "$account"
git config --global user.email "$address"

# 確認
git config --global -l