= キーマップ

- ひらがなモード  Ctrl-J, Kana
- 直接入力        Ctrl-L
- 英数キー        Eisuu
- かなキー        (no map)

「ひらがなモード」に Kana を登録するのは、変換を ⌃J（Karabiner で Kana に変換）で確定するために必要。
「かなキー」にも Kana を登録すると、「ひらがなモード」のほうの Kana が利かなくなるので、こちらは未登録にする。

「直接入力」で同じようにすると、⌃L の入力時に DLE 制御文字が入力されてしまう。
Mac 標準の IME には ⌃ + Kana/Eisuu で制御文字が入力されるバグがあるらしく、類似の現象かもしれない。
Kana/Eisuu で登録の仕方が非対称なのが座りが悪いが、これで良しとする。

- 前の変換候補を選択  Backspace (no map)

「前の変換候補を選択」に Backspace を登録するのは、変換候補のページ戻りを Delete キーでやるため。
文字削除のための Backspace が利かなくなることがあったため、再発したらこの割り当てを削除する。
（何度か Backspace が利かなくなることが再発しているため、割り当てを削除している）

- かなカナモード切り替え    Shift-Ctrl-;
- 入力中のかなカナ切り替え  Shift-Ctrl-;

Ctrl-; では Ghostty でキーマップが利かないため、Shift 付きにしている。
実際の利用では Karabiner 経由で FJ 同時押しで入力するため問題ない。
Ghostty が Ctrl-; を受け付けるようになったら元に戻したい。


= 辞書

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


= kana-rule.conf

kana-rule.conf は2か所のパスに存在し得る。

- ~/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Settings/kana-rule.conf
- ~/Library/Input\ Methods/macSKK.app/Contents/Resources/kana-rule.conf

上のパスにファイルがない場合、下のパスにあるファイルが使用される。
上のパスにファイルがあるときに下のファイルを更新しても、当然反映されないため注意。
