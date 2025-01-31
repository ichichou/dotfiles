= キーマップ

GUI でキーマップを設定する：

- ひらがなモード          Ctrl-J
- かなカナ切り替え        Ctrl-;
- 半角カナモード
- 直接入力                Ctrl-L
- 全角英数モード
- Abbrev モード           Shift-.
- 未確定入力開始          Shift-,
- Sticky Shift
- Enter                   Retern
- Space                   Space
- 前の変換候補を選択
- Tab                     Tab
- Backspace               Delete, Ctrl-H
- Delete                  Delete Forward, Ctrl-D
- キャンセル              Esc, Ctrl-G
- 左                      Left, Ctrl-B
- 右                      Right, Ctrl-F
- 下                      Down, Ctrl-N
- 上                      Up, Ctrl-P
- 行頭へ移動              Ctrl-A
- 行末へ移動              Ctrl-E
- 登録モードでペースト    Ctrl-Y
- 選択中の変換候補の削除  Ctrl-X
- 英数キー                Eisuu
- かなキー                Kana


= 辞書

辞書ファイルをクローン、macSKK ディレクトリにコピー：

```
# 辞書リポジトリをクローン：

cd ~/repos
gh repo clone skk-dev/dict

# 辞書ファイルをコピーするスクリプトを実行：

cd ~/dotfiles/macskk
./cp_dicts.sh
```

辞書ファイルを GUI で優先度順に並べる：

+ L
+ jinmei
+ fullname
+ geo
+ propernoun
+ station
+ law
+ okinawa
+ china_taiwan
+ zipcode
+ office.zipcode
+ assoc
+ edict


= ユーザー辞書（skk-jisyo.utf8）

ユーザー辞書のバックアップを macSKK ディレクトリにコピー：

```
cp -f PATH/TO/skk-jisyo.utf8 \
~/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/skk-jisyo.utf8
```


= ローマ字変換ルール（kana-rule.conf）

kana-rule.conf をコピーして macSKK ディレクトリに配置：
（kana-rule.conf は実体ファイルでなければならず、シンボリックリンクだとうまく機能しない）

```
cp -f ~/dotfiles/macskk/kana-rule.conf \
~/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Settings/kana-rule.conf
```

上のパスにファイルがない場合、下のパスにあるファイルが使用される。

```
cp -f ~/dotfiles/macskk/kana-rule.conf \
~/Library/Input\ Methods/macSKK.app/Contents/Resources/kana-rule.conf
```
