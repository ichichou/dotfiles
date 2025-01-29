#!/bin/bash
set -eu

dict_dir=${HOME}/repos/dict
macskk_dir=${HOME}/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries

if [[ ! -e $dict_dir ]]; then
  echo "${dict_dir} does not exist."
  exit 0
fi

cp -f "$dict_dir"/SKK-JISYO.jinmei                 "$macskk_dir"/.
cp -f "$dict_dir"/SKK-JISYO.fullname               "$macskk_dir"/.
cp -f "$dict_dir"/SKK-JISYO.geo                    "$macskk_dir"/.
cp -f "$dict_dir"/SKK-JISYO.propernoun             "$macskk_dir"/.
cp -f "$dict_dir"/SKK-JISYO.station                "$macskk_dir"/.
cp -f "$dict_dir"/SKK-JISYO.law                    "$macskk_dir"/.
cp -f "$dict_dir"/SKK-JISYO.okinawa                "$macskk_dir"/.
cp -f "$dict_dir"/SKK-JISYO.china_taiwan           "$macskk_dir"/.
cp -f "$dict_dir"/SKK-JISYO.assoc                  "$macskk_dir"/.
cp -f "$dict_dir"/SKK-JISYO.edict                  "$macskk_dir"/.
cp -f "$dict_dir"/zipcode/SKK-JISYO.zipcode        "$macskk_dir"/.
cp -f "$dict_dir"/zipcode/SKK-JISYO.office.zipcode "$macskk_dir"/.
