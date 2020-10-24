# How to Initialize macOS


## クリーンインストール前の作業

### Homebrew
* `Brewfile` を手動で更新。

### Mackup
. `.mackup.cfg` から管理対象のアプリを確認。必要に応じて追加・削除。
. `$ mackup -f backup`：管理対象アプリの設定ファイルを Mackup フォルダにコピーし、元の場所にはシンボリックリンクを生成。
. `$ mackup uninstall`：Mackup フォルダ内の設定ファイルを元の場所にコピー（Mackup フォルダ内のファイルはそのまま残る）。

### AquaSKK ユーザー辞書をバックアップ
AquaSKK のユーザー辞書はシンボリックリンクでは機能しないようなので、都度バックアップする必要がある。

```
sudo cp \
~/Library/Application\ Support/AquaSKK/skk-jisyo.utf8 \
~/Box/Setting_files/AquaSKK/skk-jisyo.utf8
```


## クリーンインストール

### クリーンインストール手順
1. `Command-R` を押しながら Mac を起動 →「macOSユーティリティ」が起動する。
2. 「ディスクユーティリティ」を開く。
3. `Macintosh HD - Data` を選択し、`ボリューム` の `−` をクリックして削除する。
4. `Macintosh HD` を選択し、`消去` する（フォーマットは `APFS`）。
5. 「ディスクユーティリティ」を閉じる。
6. 「macOSを再インストール」を開いてインストールを進める。

### インストール時の設定
* 「コンピュータアカウントを作成」：

| 項目           | 入力内容 | メモ                                                     |
| ---            | ---      | ---                                                      |
| `フルネーム`   | `kazu`   | ユーザー名。コンピュータ名やローカルホスト名にも影響する |
| `アカウント名` | `kazu`   | ホームディレクトリ名                                     |

* 「エクスプレス設定」：
    * `設定をカスタマイズ` から不必要なものを無効化。


## Homebrew

### Homebrew のインストール
1. `$ xcode-select --install`：Command Line Tools をインストール（Xcode 自体は不要）。
2. [Homebrew 公式サイト](https://brew.sh/)のコマンドを実行。
    * `$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

### アプリケーションをインストール
1. App Store にサインイン（mas-cli 用）。
2. `$ cd ~/Downloads/`
3. `$ curl -LO https://raw.githubusercontent.com/ichichou/dotfiles/master/Brewfile`
4. `$ brew bundle`


## シェルスクリプトによる初期化

### init.sh
1. `$ cd ~`
2. `$ git clone https://github.com/ichichou/dotfiles.git`
3. `$ sh ~/dotfiles/init.sh`

### pm.sh
**NOTE:** `pm.sh` 自体は実行しない（うまく機能しないため）。以下のコードを手動で実行する。

Fisher：

1. `$ curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish`
2. `$ fisher self-update`
3. `$ fisher`： `fishfile` をもとに自動インストール。

Gem：

1. `$ which gem`： `/usr/local/opt/ruby/bin/gem` にパスが通っているか確認。
2. `$ gem update --system`
3. `$ gem install asciidoctor asciidoctor-pdf asciidoctor-pdf-cjk asciidoctor-diagram rouge`

NPM：

1. `$ npm -g install npm`
2. `$ npm -g install eslint prettier eslint-plugin-prettier htmlhint`

### macos.sh
**NOTE:** `macos.sh` の中には効き目が不明なものもあるため、下記のものだけ手動で設定する。

* `defaults write -g InitialKeyRepeat -int 10`：キーリピートが始まるまでのミリ秒
* `defaults write -g KeyRepeat -int 1`：キーリピートの速度
* `defaults write com.apple.dock expose-animation-duration -float 0`：Expose のアニメーション速度
* `defaults write com.apple.dock autohide-time-modifier -float 0.15`：Dock が隠れるときの速度
* `defaults write com.apple.dock autohide-delay -float 0`：Dock が隠れるまでの時間
* `defaults write com.apple.dock showhidden -bool true`：ウィンドウが隠れている Dock アイコンを半透明にする


## Mackup

**NOTE:** 設定が反映されないアプリが一部あるため、Mackup は使わず、ひとまず手動で設定してみる。

* `$ mackup restore`： Mackup 管理対象アプリの設定ファイルを復元（シンボリックリンク）。
* 後述の BetterTouchTool と Dash は、Mackup で復元できれば手動設定は不要。


## 手動設定

### AquaSKK のユーザー辞書を復元
**NOTE:** 現状、AquaSKK はうまく機能しない。

1: Box Drive にサインイン。

2: 以下のコマンドを実行：

```
sudo cp \
~/Box/Setting_files/AquaSKK/skk-jisyo.utf8 \
~/Library/Application\ Support/AquaSKK/skk-jisyo.utf8
```

3: AquaSKK の環境設定から辞書を `~/Library/Application\ Support/AquaSKK/skk-jisyo.utf8` に設定する。\
`変更…` からではなくパスを直接入力する必要がある。

### Terminal
1. https://cocopon.github.io/iceberg.vim/[Iceberg プロファイル]をインポートする。
2. 環境設定：
    * 開くシェル： `/usr/local/bin/fish`
    * フォント： `Hack Regular 12 pt.`
    * サイズ： `160 × 50`
    * 曖昧幅文字を全角で表示する。

### Google Chrome
* アカウントを同期する前に、`kabankobo` と `private` のユーザーを作成する。
* Mouse Dictionary に[英辞郎データ](https://booth.pm/ja/items/777563)を読み込む。
* [ZenzaWatch](https://greasyfork.org/ja/scripts/14391-zenzawatch) をインストールする。

### Box Drive
* `Setting_files` を `オフライン利用可` にする。

### Alfred
* 「Google Search with Selected Text」のワークフローを設定。

### diff-highlight にパスを通す
```
sudo ln -snfv \
/usr/local/share/git-core/contrib/diff-highlight/diff-highlight \
/usr/local/bin/diff-highlight
```

### Dash
（長いので最終セクションに記載する）

### BetterTouchTool
（長いので最終セクションに記載する）


## Mac のシステム環境設定

### Finder
1. 環境設定からもろもろ設定。
2. 表示オプション：
    * `表示 > 表示オプションを表示` からもろもろ設定し、`デフォルトとして使用` から反映。
    * ホームディレクトリで表示オプションを表示すると `“ライブラリ”フォルダを表示` が出現する。
3. 次のコマンドを実行（fish 以外で）：
    1. `$ sudo find / -name ".DS_Store" | xargs rm -rf`：すべてのディレクトリから `.DS_Store` を探し出して削除。
    2. `$ killall Finder`

### キーボードショートカット
（長いので最終セクションに記載する）

### 入力ソース
`U.S.` や `英語` を消すには、`日本語` の設定で `英字` にチェックを入れる。`U.S.` や `英語` を消したあとは `日本語` も消していい。


## GitHub
### 公開鍵・秘密鍵を生成
1: `$ ssh-keygen -t rsa -b 4096`

2: 以下のコマンドを実行：

```
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/{user}/.ssh/id_rsa):
（何も入力せずに Enter を押す）

Enter passphrase (empty for no passphrase):
（パスフレーズを入力する）

Enter same passphrase again:
（もう一度入力する）
```

3: 生成した鍵を確認する：

```
$ ls -l ~/.ssh/


id_rsa
id_rsa.pub
```

### 秘密鍵を ssh-agent に登録
1: 秘密鍵を ssh-agent に登録：

```
$ ssh-add -K ~/.ssh/id_rsa

Enter passphrase for /Users/{user}/.ssh/id_rsa:
（パスフレーズを入力）

Identity added: /Users/{user}/.ssh/id_rsa ({local host})
```

2: `$ vim ~/.ssh/config` で以下を追加：

```
Host *
  UseKeychain yes
  AddKeysToAgent yes
```

### 公開鍵を GitHub に登録
1: `$ pbcopy < ~/.ssh/id_rsa.pub`

2: GitHub の `Settings > SSH and GPG keys > SSH keys` に公開鍵を登録する。

3: `$ vim ~/.ssh/config` で以下を追加：

```
Host github
  HostName github.com
  IdentityFile ~/.ssh/id_rsa
  User git
```

4: 接続を確認する。

```
$ ssh -T git@github.com

Hi {user}! You've successfully authenticated, but GitHub does not provide shell access.
```

5: HTTPS 接続したことがあるリポジトリの `.git/config` を編集：

（編集前）

```
[remote "origin"]
	url = https://github.com/{user}/{repository}.git
```

（編集後）

```
[remote "origin"]
	url = github:{user}/{repository}.git
```

### リポジトリを復元
1. `$ mkdir ~/repos; cd ~/repos/`
2. 必要なリポジトリを `git clone` する。


## その他の設定

### プリンタ設定
* システム環境設定の「プリンタとスキャナ」からプリンタを登録する。
* 基本的に Mac 標準のドライバで OK。

### Dash
Placeholder：

| 項目  | 設定         |
| ---   | ---          |
| @time | `H:mm`       |
| @date | `yyyy-MM-dd` |

Snippets：

| 入力     | 割り当て        |
| ---      | ---             |
| `;date`  | `@date`         |
| `;time`  | `@time`         |
| `@k***`  | `@k***.com`     |
| `@gmail` | `@gmail.com`    |
| `***@`   | `***@k***.com`  |
| `***@`   | `***@gmail.com` |

### BetterTouchTool
#### 環境設定
ウィンドウスナップと移動：

| 項目                   | 設定                                    |
| ---                    | ---                                     |
| ウィンドウの移動       | `Control - Option - ドラッグ`           |
| ウィンドウのサイズ変更 | `Control - Option - Command - ドラッグ` |

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

| アクション          | 割り当て       |
| ---                 | ---            |
| 2本指で左にスワイプ | `Command - \]` |
| 2本指で右にスワイプ | `Command - \[` |
| 3本指で上にスワイプ | `Command - T ` |

Chrome：

| アクション                  | 割り当て                     |
| ---                         | ---                          |
| 3本指で上にスワイプ         | `Command - T`                |
| Shift + 3本指で左にスワイプ | `Shift - Command - PageDown` |
| Shift + 3本指で右にスワイプ | `Shift - Command - PageUp`   |

#### マウスジェスチャー
すべてのアプリ：

| ジェスチャー | 割り当て             |
| ---          | ---                  |
| `↓→`       | なし                 |
| `↓←`       | なし                 |
| `↑→`       | `Command+\]`         |
| `↑←`       | `Command+\[`         |
| `←→`       | `スペースを右に移動` |
| `→←`       | `スペースを左に移動` |

#### キーボードショートカット
すべてのアプリ：

| アクション              | 割り当て                   |
| ---                     | ---                        |
| `Control - Option - ↑` | ウィンドウを最大化         |
| `Control - Option - →` | ウィンドウを右に最大化     |
| `Control - Option - ←` | ウィンドウを左に最大化     |
| `Control - Option - ↓` | 古いウィンドウサイズに復元 |

### キーボードショートカット
LaunchpadとDock：

| 項目                                 | 設定                              |
| ---                                  | ---                               |
| Dockを自動的に表示/非表示のオン/オフ | チェック外す                      |
| Launchpadを表示                      | `Control - Option - Command - ↓` |

Mission Control：

| 項目                       | 設定                              |
| ---                        | ---                               |
| Mission Control            | `Control - Option - Command - ↑` |
| アプリケーションウインドウ | `Control - Option - Command - A`  |
| 左の操作スペースに移動     | `Control - Option - Command - ←` |
| 右の操作スペースに移動     | `Control - Option - Command - →` |
| デスクトップ1へ切り替え    | `Control - Option - Command - 1`  |
| デスクトップ2へ切り替え    | `Control - Option - Command - 2`  |
| （以下デスクトップ10まで） | （同様に）                        |

入力ソース：

| 項目                           | 設定         |
| ---                            | ---          |
| 前の入力ソースを選択           | チェック外す |
| 入力メニューの次のソースを選択 | チェック外す |

**NOTE:** `前の入力ソースを選択` はチェックを外しても、入力ソースを追加したときに勝手にチェックが入るので注意。都度チェックを外す必要がある。

サービス：

| 項目         | 設定         |
| ---          | ---          |
| Googleで検索 | チェック外す |
| Spotlight    | チェック外す |
| 辞書で調べる | なし         |

Spotlight：

| 項目                | 設定         |
| ---                 | ---          |
| Spotlight検索を表示 | チェック外す |

アプリケーション：

| 項目         | 設定                                     |
| ---          | ---                                      |
| すべてしまう | `Shift - Control - Option - Command - M` |
| しまう       | `Control - Option - Command - M`         |
| 最小化       | `Control - Option - Command - M`         |
| Minimize All | `Shift - Control - Option - Command - M` |
| Minimize     | `Control - Option - Command - M`         |
