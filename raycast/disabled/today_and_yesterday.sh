#!/bin/bash
set -eu

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Today's & Yesterday's Journals
# @raycast.mode silent
# @raycast.currentDirectoryPath ~/Library/CloudStorage/Box-Box/Journal

# Optional parameters:
# @raycast.icon 🤖

# source "$script_dir"/journal.sh
# source "$script_dir"/yesterday.sh
#
# 上記のようにしないのは、今日と過去のファイルを一度に開きたいから。
# スクリプトを順次実行すると、まず今日のファイルを作って開き、それから過去のファイルを探して開く、という処理になる。
# ファイルを一つずつ開くと Bike の表示ががたついているような感覚を受ける。
# これを回避するため、複数のファイルを一度に開くようにする。

# Create Today's Journal
today=$(date +%Y-%m-%d)
today_file=${today}.bike

if [ ! -e "$today_file" ]; then
  touch "$today_file"
fi

# Find Yesterday's Journal
num=-1
past_day=$(date -v ${num}d +%Y-%m-%d)
temp_past_file=${past_day}.bike
past_file=""

while true; do
  if [ -e "$temp_past_file" ]; then
    past_file=$temp_past_file
    break
  else
    num=$(( num - 1 ))
    past_day=$(date -v ${num}d +%Y-%m-%d)
    temp_past_file=${past_day}.bike
  fi
done

# Open Today's & Yesterday's Journals
open -a "bike" "$today_file" "$past_file"
