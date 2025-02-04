= キーマップ

GUI でキーマップを設定する：

- ひらがなモード            Ctrl-J, Kana
- かなカナモード切り替え    // not mapped
- 入力中のかなカナ切り替え  Ctrl-;
- 半角カナモード            // not mapped
- 直接入力                  Ctrl-L
- 全角英数モード            Shift-Ctrl-L
- Abbrev モード             Shift-.
- 未確定入力開始            Shift-,
- Sticky Shift              // not mapped
- Enter                     Retern
- Space                     Space
- 前の変換候補を選択        // not mapped
- Tab                       Tab
- Backspace                 Delete, Ctrl-H
- Delete                    Delete Forward, Ctrl-D
- キャンセル                Esc, Ctrl-G
- 左                        Left, Ctrl-B
- 右                        Right, Ctrl-F
- 下                        Down, Ctrl-N
- 上                        Up, Ctrl-P
- 行頭へ移動                Ctrl-A
- 行末へ移動                Ctrl-E
- 登録モードでペースト      Ctrl-Y
- 選択中の変換候補の削除    Ctrl-X
- 英数キー                  Eisuu
- かなキー                  // not mapped

「ひらがなモード」に Kana を登録するのは、変換を Ctrl-J で確定するために必要。
（Karabiner で Ctrl-J -> Kana とした上で）
「かなキー」にも Kana を登録すると、「ひらがなモード」のほうの Kana が利かなくなるので、こちらは未登録にする。

「直接入力」で同じようにすると、Ctrl-L の入力時に DLE 制御文字が入力されてしまう。
Mac 標準の IME には Control-Kana/Eisuu で制御文字が入力されるバグがあるそうなので、類似の現象かもしれない。
Kana/Eisuu で登録の仕方が非対称なのが座りが悪いが、これで良しとする。


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
