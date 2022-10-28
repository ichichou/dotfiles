# How to Initialize macOS


## クリーンインストール前の作業

* **Homebrew**……`Brewfile` を更新。
* **AquaSKK**……ユーザー辞書をバックアップ。
    * ユーザー辞書はシンボリックリンクでは機能しないため（Box に実体を置けない）。
    * `$ cp -fv ~/Library/Application Support/AquaSKK/skk-jisyo.utf8 ~/dotfiles/aquaskk/skk-jisyo.utf8`
* **Alfred**……スニペットをエクスポート（各スニペットコレクションを右クリック）。


## クリーンインストール

### クリーンインストール手順
**NOTE:** 最新版の macOS では手順が異なるかもしれない。

1. `Command-R` を押しながら Mac を起動 →「macOSユーティリティ」が起動する。
1. 「ディスクユーティリティ」を開く。
1. `Macintosh HD - Data` を選択し、`ボリューム` の `−` をクリックして削除する。
1. `Macintosh HD` を選択し、`消去` する（フォーマットは `APFS`）。
1. 「ディスクユーティリティ」を閉じる。
1. 「macOSを再インストール」を開いてインストールを進める。

### インストール時の設定
* 「コンピュータアカウントを作成」：

| 項目           | 入力内容 | メモ                                                     |
| ---            | ---      | ---                                                      |
| `フルネーム`   | `kazu`   | ユーザー名。コンピュータ名やローカルホスト名にも影響する |
| `アカウント名` | `kazu`   | ホームディレクトリ名                                     |

* 「エクスプレス設定」：
    * `設定をカスタマイズ` から不必要なものを無効化。


## システム環境設定

### 一般
* `書類を開くときはタブで開く`：`常に`……プレビューアプリで複数の PDF がひとつのウィンドウで開かれるようになる。

### Dock とメニューバー
不要なメニューバーアイコンを非表示にする。

### Spotlight
`検索結果` ですべてのチェックを外す。

### 通知と集中モード
* `集中モード` → `おやすみモード`
    * `即時通知を許可`：チェック
    * `着信を許可`：`すべての人`
    * `自動的にオンにする`：`0:00 毎日`
    * `集中モード状況を共有`：チェックを外す
* `集中モード` → `睡眠`
    * `即時通知を許可`：チェックを外す
    * `着信を許可`：`すべての人`
    * `集中モード状況を共有`：チェックを外す

### キーボード
* `入力ソース`……`U.S.` や `英語` を外すには、`日本語` の設定で `英字` にチェックを入れる。`U.S.` や `英語` を消したあとは `日本語` も消していい。
* `ショートカット`……（最終セクションに記載）

### トラックパッド
BetterTouchTool が使えるようになった後は以下の設定にする：

* `調べる＆データ検出`：チェックを外す
* `フルスクリーンアプリケーション間をスワイプ`：`4本指で左右にスワイプ`
* `Mission Control`：：チェックを外す
* `Application Expose`：チェックを外す
* `Launchpad`：チェックを外す
* `デスクトップを表示`：チェックを外す

### 共有
* `コンピューター名`……他のデバイスなどで表示される。
* `ローカルホスト名`……ローカルネット上でユニークである必要がある。

### プリンタとスキャナ
ネットワーク上のプリンタを選択する。ドライバは Mac 標準のドライバが対応していれば自動選択される。


## Homebrew

### 1. Homebrew のインストール
1. `$ xcode-select --install`……Command Line Tools をインストール。
1. [Homebrew 公式サイト](https://brew.sh/)のコマンドを実行。

### 2. Brewfile でインストール
1. App Store にサインイン（mas-cli 用）。
1. `$ cd ~/Downloads/`
1. `$ curl -LO https://raw.githubusercontent.com/ichichou/dotfiles/master/Brewfile`
1. `$ brew bundle`


## CLI によるセットアップ

### 1. init.sh
1. `$ cd ~`
1. `$ git clone https://github.com/ichichou/dotfiles.git`
1. `$ sh ~/dotfiles/init.sh`

**NOTE:** init.sh を2回以上実行すると、`~/.config/karabiner/complex_modifications` の中にシンボリックリンクが入れ子になってしまうかもしれない。これが起こったら `unlink` コマンドで修正する。

### 2. プラグインマネージャー
#### Fisher
1. [Fisher のインストールコマンド](https://github.com/jorgebucaran/fisher)を実行。
1. `$ fisher jethrokuan/z jethrokuan/fzf rafaelrinaldi/pure`

#### NPM
1. `$ npm -g install npm`
1. `$ npm -g install eslint htmlhint prettier`

### 3. システム環境設定（CLI）
* `defaults write -g InitialKeyRepeat -int 10`……キーリピートが始まるまでの時間（ミリ秒）
* `defaults write -g KeyRepeat -int 1`……キーリピートの速度
* `defaults write com.apple.dock expose-animation-duration -float 0.15`……Expose などのアニメーション速度（効果なし？）
* `defaults write com.apple.dock autohide-delay -float 0`……Dock が隠れるまでの時間
* `defaults write com.apple.dock autohide-time-modifier -float 0.15`……Dock が隠れるときの速度
* `defaults write com.apple.dock showhidden -bool true`……ウィンドウが隠れている Dock アイコンを半透明にする


## アプリケーション設定

### Finder
1. ホームディレクトリを開く。
1. 環境設定から設定。
1. 表示オプション：
    * `表示 → 表示オプションを表示` から設定し、`デフォルトとして使用` をクリック。
    * ホームディレクトリで表示オプションを出すと `“ライブラリ”フォルダを表示` が出現するのでチェック。
1. 次のコマンドを実行（fish 以外で）：
    1. `$ sudo find / -name ".DS_Store" | xargs rm -rf`……すべてのディレクトリから `.DS_Store` を探し出して削除（権限の関係で実施できないディレクトリもある）
    1. `$ killall Finder`

### Terminal
1. 環境設定：
    * `開くシェル`：`デフォルトのログインシェル`……fish は .zshrc／.bash_profile から起動する。
    * `フォント`：`Hack Regular 12`
    * `ウィンドウサイズ`：`120 × 50`
    * `Unicode 東アジア A（曖昧）の文字を W（広）にする`：チェック

### Karabiner-Elements
* Simple modifications……`caps_lock`：`right_control`
* Complex modifications → Parameters……`to_if_alone_timeout_milliseconds`：`200`

### BetterTouchTool
* トラックパッドとマウスジェスチャの設定：（最終セクションに記載）
* ベーシック：
    * `ウィンドウスナップを有効にする`：チェックを外す
* Drawings / Mouse Gestures：
    * `マウスを動かした後、右マウスボタンの描画認識を有効にします`：チェック
    * `描画ストロークカラー`：`スカイ・不透明度70％`
    * `マウスの位置を復元する`：チェックを外す

### Alfred
* キーマップを変更：
    * Hotkey：`Control - Return`
    * Clipboard History：`Control - Command - V`
    * Snippets：`Control - Command - S`
* スニペットをインポート。

### Google Chrome
* Chrome で `Work` と `Private` のユーザーを作成する。
* Mouse Dictionary に[英辞郎データ](https://booth.pm/ja/items/777563)を読み込む。
* ZenzaWatch をインストールする：
    1. [開発版ページ](https://github.com/kphrx/ZenzaWatch/tree/playlist-deploy/dist)で `ZenzaWatch-dev.user.js` をクリック。
    1. `Raw` をクリック。
    1. Tampermonkey の画面が開くので `インストール` をクリック。

### Git
diff-highlight にシンボリックリンクを貼る。

M1 Mac 版 Homebrew の場合：

```
sudo ln -snfv \
/opt/homebrew/share/git-core/contrib/diff-highlight/diff-highlight \
/usr/local/bin/diff-highlight
```

Intel Mac 版 Homebrew の場合：

```
sudo ln -snfv \
/usr/local/share/git-core/contrib/diff-highlight/diff-highlight \
/usr/local/bin/diff-highlight
```

### Box Drive
* `Config/` を `オフライン利用可` にする。

### AquaSKK
1. AquaSKK をインストールする。
    * Brewfile からインストール済みのはず（Homebrew 版と PKG 版に違いはない）。
    * インストールは、設定ファイルを格納するディレクトリや関連ファイルを何も作成していない状態でやる必要がある。
    * AquaSKK に追加した辞書が消えてしまう場合は上記の要件を満たしていない可能性がある。その際は AppCleaner で AquaSKK を関連ファイル含めてアンインストールし、さらに設定ファイルのディレクトリを削除してから、再度インストールすることで改善するかもしれない。
1. 環境設定：
    * 入力設定：
        * `Enter による確定で改行しない`：チェック
        * `数値変換を有効にする`：チェック
    * 補完：
        * `補完オプション・一般辞書も検索する`：チェック
        * `補完フィルター`：`0` 文字以下を無視
        * `ダイナミック補完`：`3` 個まで表示する
    * 変換：
        * `インライン表示`：`4` 番目の候補まで表示する
        * `選択ラベル`：`01234567`
        * `フォント`：`W3・14`
    * その他：
        * `localhost 以外からの接続を拒否する`：チェック
        * `送りの開始・見出し語の再入を送りと見なす`：チェック
        * `送りあり変換・キャンセルで送り仮名を削除する`：チェック
1. 辞書の追加：
    1. [辞書ファイル](https://github.com/skk-dev/dict)をダウンロードする（基本辞書・専門辞書）。
    1. `~/dotfiles/aquaskk/skk-jisyo` などに格納する。
    1. 環境設定で辞書を追加する。
        * `辞書の種類`：`SKK 辞書 (EUC-JP)`
        * デフォルトで存在する自動ダウンロード辞書の上に配置する（まとめて移動可能）。
    1. 自動ダウンロード辞書のうち、特殊辞書を無効化する。
1. 設定ファイル・ユーザー辞書の配置：
    1. アクティビティモニタで AquaSKK のプロセスを終了する。
    1. 設定ファイルのシンボリックリンクを貼る：
        * `$ ln -snfv ~/dotfiles/aquaskk/kana-rule.conf ~/Library/Application\ Support/AquaSKK/kana-rule.conf`
        * `$ ln -snfv ~/dotfiles/aquaskk/keymap.conf ~/Library/Application\ Support/AquaSKK/keymap.conf`
    1. ユーザー辞書をコピーする：
        * `$ cp -fv ~/dotfiles/aquaskk/skk-jisyo.utf8 ~/Library/Application\ Support/AquaSKK/skk-jisyo.utf8`


## 秘密鍵の作成・登録

### 1. 公開鍵・秘密鍵を生成
**NOTE:** 鍵の生成はローカルホスト名を変更した後にやったほうがいいかもしれない。

1: `$ ssh-keygen -t rsa -b 4096`

2: メッセージに対して以下のように入力：

```
> Generating public/private rsa key pair.
> Enter file in which to save the key (/Users/USER_NAME/.ssh/id_rsa):
$（何も入力せずに Return を押す）

> Enter passphrase (empty for no passphrase):
$（パスフレーズを入力する）

> Enter same passphrase again:
$（もう一度入力する）
```

3: 生成した鍵を確認する：

```
$ ls -l ~/.ssh/


> id_rsa
> id_rsa.pub
```

### 2. 秘密鍵を ssh-agent に登録
1: 以下のコマンドを実行：

```
$ ssh-add -K ~/.ssh/id_rsa

> Enter passphrase for /Users/USER_NAME/.ssh/id_rsa:
$（パスフレーズを入力）

> Identity added: /Users/USER_NAME/.ssh/id_rsa (LOCAL_HOST_NAME)
```

2: `$ vim ~/.ssh/config` で以下を追記：

```
Host *
  UseKeychain yes
  AddKeysToAgent yes
```

### 3. 公開鍵を GitHub に登録
1: `$ pbcopy < ~/.ssh/id_rsa.pub`

2: GitHub の `Settings → SSH and GPG keys → SSH keys` に公開鍵を登録する。

3: `$ vim ~/.ssh/config` で以下を追記：

```
Host github
  HostName github.com
  IdentityFile ~/.ssh/id_rsa
  User git
```

4: 接続を確認する：

```
$ ssh -T git@github.com

> Hi USER_NAME! You've successfully authenticated, but GitHub does not provide shell access.
```

5: HTTPS 接続したことがあるリポジトリの `.git/config` を編集（dotfiles など）。

編集前：

```
[remote "origin"]
	url = https://github.com/USER_NAME/REPOSITORY_NAME.git
```

編集後：

```
[remote "origin"]
	url = github:USER_NAME/REPOSITORY_NAME.git
```

### 4. リポジトリを復元
1. `$ mkdir ~/repos; cd ~/repos/`
1. 必要なリポジトリを `git clone` する。


## その他の設定

### フォントのインストール
Adobe フォントは Homebrew でサポートされていないため、手動でインストールする必要がある：

* [Source Han Code JP](https://github.com/adobe-fonts/source-han-code-jp/releases)
* [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro)

### キーボード → ショートカット
#### Launchpad と Dock
| 項目                                 | 設定                              |
| ---                                  | ---                               |
| Dockを自動的に表示/非表示のオン/オフ | チェック外す                      |
| Launchpadを表示                      | `Control - Option - Command - ↓` |

#### Mission Control
| 項目                       | 設定                                     |
| ---                        | ---                                      |
| Mission Control            | `Control - Option - Command - ↑`        |
| アプリケーションウインドウ | `Control - Option - Command - A`         |
| 左の操作スペースに移動     | `Control - Option - Command - ←`        |
| 右の操作スペースに移動     | `Control - Option - Command - →`        |
| デスクトップ1へ切り替え    | `Shift - Control - Option - Command - 1` |
| デスクトップ2へ切り替え    | `Shift - Control - Option - Command - 2` |
| （以下デスクトップ10まで） | （同様に）                               |

#### 入力ソース
| 項目                           | 設定           |
| ---                            | ---            |
| 前の入力ソースを選択           | チェックを外す |
| 入力メニューの次のソースを選択 | チェックを外す |

**NOTE:** `前の入力ソースを選択` はチェックを外しても、入力ソースを追加したときに勝手にチェックが入るので注意。都度チェックを外す必要がある。

#### サービス
| 項目         | 設定           |
| ---          | ---            |
| Googleで検索 | チェックを外す |
| Spotlight    | チェックを外す |
| 辞書で調べる | なし           |

#### Spotlight
| 項目                | 設定           |
| ---                 | ---            |
| Spotlight検索を表示 | チェックを外す |

#### アプリケーション
| 項目         | 設定                                     |
| ---          | ---                                      |
| すべてしまう | `Shift - Control - Option - Command - M` |
| しまう       | `Control - Option - Command - M`         |
| 最小化       | `Control - Option - Command - M`         |
| Minimize All | `Shift - Control - Option - Command - M` |
| Minimize     | `Control - Option - Command - M`         |

### BetterTouchTool
#### トラックパッド
すべてのアプリ：

| アクション                         | 割り当て                |
| ---                                | ---                     |
| シングルフィンガーフォースクリック | `Command - クリック`    |
| 3本指でタップ                      | `Command - クリック`    |
| 3本指で上にスワイプ                | `Command - N`           |
| 3本指でスワイプダウン              | `Command - W`           |
| 3本指で左にスワイプ                | `Control - Tab`         |
| 3本指で右にスワイプ                | `Shift - Control - Tab` |
| 4本指でクリック                    | `Application Expose`    |
| 4本指で上にスワイプ                | `Mission Control`       |
| 4本指で下にスワイプ                | `Open Launchpad`        |

Finder：

| アクション          | 割り当て      |
| ---                 | ---           |
| 2本指で左にスワイプ | `Command - ]` |
| 2本指で右にスワイプ | `Command - [` |
| 3本指で上にスワイプ | `Command - T` |

Chrome：

| アクション                  | 割り当て                    |
| ---                         | ---                         |
| 3本指で上にスワイプ         | `Command - T`               |
| Shift + 3本指で左にスワイプ | `Shift - Command - Fn - ↓` |
| Shift + 3本指で右にスワイプ | `Shift - Command - Fn - ↑` |

#### マウスジェスチャー
すべてのアプリ：

| ジェスチャー | 割り当て      |
| ---          | ---           |
| `↑→`       | `Command - ]` |
| `↑←`       | `Command - [` |
| `↓→`       | `Command - W` |
| `↓←`       | `Command - T` |
| `→↑`       | `Home`        |
| `→↓`       | `End`         |
