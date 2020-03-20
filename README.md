# Mac のクリーンインストール手順

## クリーンインストール前の作業

### Homebrew
* `Brewfile` を手動で更新

### Mackup
1. `.mackup.cfg` で管理対象のアプリを確認。必要に応じて追加／削除
2. `$ mackup -f backup`：指定した設定ファイルを Mackup フォルダにコピーし、元の場所にはシンボリックリンクを生成
3. `$ mackup uninstall`：Mackup フォルダ内の設定ファイルを元の場所にコピー（Mackup フォルダ内のファイルはそのまま残る）

## Mac のクリーンインストール

1. `Command-R` を押しながら Mac を起動
2. 「macOSユーティリティ」が起動する
3. `ディスクユーティリティ` で Macintosh HD を選択し、`消去` する（`フォーマット` は `APFS`）
4. `ディスクユーティリティ` のウィンドウを閉じる
5. `macOSを再インストール`

### インストール時の設定
1. 「コンピュータアカウントを作成」
    * `フルネーム`：`kazu`（ユーザー名。コンピュータ名やローカルホスト名にも影響）
    * `アカウント名`：`kazu`（ホームディレクトリ名）
2. 「エクスプレス設定」
    * `設定をカスタマイズ` から不必要なものを無効化

## Homebrew

### Homebrew のインストール
1. `$ xcode-select --install`：Command Line Tools をインストール（Xcode は不要）
2. [Homebrew 公式サイト](https://brew.sh/)のコマンドを実行

### Homebrew Bundle
1. App Store にサインイン（mas-cli 用）
2. `$ cd ~/Downloads/`
3. `$ curl -LO https://raw.githubusercontent.com/ichichou/dotfiles/master/Brewfile`
4. `$ brew bundle`

（インストールの待ち時間に Mac のシステム環境設定をやるといい）

## シェルスクリプト

### setup.sh
`$ bash -c "$(curl -L https://raw.githubusercontent.com/ichichou/dotfiles/master/setup.sh)"`

上記でうまくいかない場合：

1. `$ cd ~/Downloads/`
2. `$ curl -LO https://raw.githubusercontent.com/ichichou/dotfiles/master/setup.sh`
3. `$ ./setup.sh`

### packages.sh
`$ bash -c "$(curl -L https://raw.githubusercontent.com/ichichou/dotfiles/master/packages.sh)"`

上記でうまくいかない場合：

1. `$ cd ~/Downloads/`
2. `$ curl -LO https://raw.githubusercontent.com/ichichou/dotfiles/master/packages.sh`
3. `$ ./packages.sh`

## Mackup

* `$ mackup restore`：Mackup 管理化のアプリの設定ファイルを復元（シンボリックリンク）
* BetterTouchTool と Dash は、Mackup で復元できれば手動設定は不要

## 手動設定

### AquaSKK のユーザー辞書
1. Box Drive にサインイン
2. `$ cp ~/Box/Setting_files/AquaSKK/skk-jisyo.utf8 ~/Library/Application\ Support/AquaSKK/`
3. AquaSKK の環境設定から辞書を `~/Library/Application\ Support/AquaSKK/skk-jisyo.utf8` に設定する
    * `変更…` からではなくパスを直接入力する必要あり

### diff-highlight にパスを通す
`$ sudo ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight`

### BetterTouchTool（メモ）
（Mackup で設定できていれば不要）

* Fn キー
  * `Fn-ドラッグ` でウィンドウを移動
  * `Fn-Control-ドラッグ` でウィンドウサイズを変更
* Global
  * Single Finger Force Click: `Command-Click`
  * 3 finger Tap: `Command-Click`
  * 3 Finger Swipe Up: `Command-N`
  * 3 Finger Swipe Down: `Command-W`
  * 3 Finger Swipe Left: `Control-Tab`
  * 3 Finger Swipe Right: `Shift-Control-Tab`
  * 4 Finger Tap: `Application Expose`
  * 4 Finger Swipe Up: `Mission Control`
  * 4 Finger Swipe Down: `Open Launchpad`
* Finder
  * 2 Finger Swipe Left: `Command-]`
  * 2 Finger Swipe Right: `Command-[`
  * 3 Finger Swipe Up: `Command-T`
* Chrome
  * 3 Finger Swipe Up: `Command-T`
  * Shift - 3 Finger Swipe Left: `Shift-Command-Fn-Down`
  * Shift - 3 Finger Swipe Right: `Shift-Command-Fn-Up`

### Dash（メモ）
（Mackup で設定できていれば不要）

* Preferences で Placeholder を変更：
  * @time: `H:mm`
  * @date: `yyyy-MM-dd`
* `;date`: `@date`
* `;time`: `@time`
* `@kaban`: `@kabankobo.com`
* `@gmail`: `@gmail.com`
* `kazu@`: `kazu@kabankobo.com`
* `flower@`: `flower.sun.rain.silver@gmail.com`

## Mac のシステム環境設定

### Finder
1. 環境設定から諸々設定
2. 表示オプション
    * `表示 > 表示オプションを表示` から諸々設定
    * `$ sudo find / -name ".DS_Store" | xargs rm -rf` （すべてのディレクトリから `.DS_Store` を探し出して削除）
    * `$ killall Finder`

### キーボードショートカット
* LaunchpadとDock
  * `Launchpadを表示`：なし、チェック外す
* Mission Control
  * `Mission Control`：`Command-Option-Up`
  * `アプリケーションウインドウ`：`Command-Option-Down`
  * `左の操作スペースに移動`：`Command-Option-Left`
  * `右の操作スペースに移動`：`Command-Option-Right`
  * `デスクトップ1へ切り替え`：`Option-1`
  * `デスクトップ2へ切り替え`：`Option-2`
  * `デスクトップ3へ切り替え`：`Option-3`
* 入力ソース
  * `前の入力ソースを選択`：チェック外す
  * `入力メニューの次のソースを選択`：チェック外す
* サービス
  * `Googleで検索`：チェック外す
  * `Spotlight`：チェック外す
  * `辞書で調べる`：なし
* Spotlight
  * `Spotlight検索を表示`：チェック外す

## その他の設定

### Microsoft Office
//TODO: Homebrew でインストールできる？

* Office 365 の公式サイトからインストール

### プリンタの設定
* システム環境設定の「プリンタとスキャナ」からプリンタを登録する
* 基本的に Mac 標準のドライバで OK
