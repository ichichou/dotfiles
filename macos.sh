#!/bin/bash
set -eu

## Key Repeat

### キーリピート入力認識までの時間を短縮（済）
defaults write -g InitialKeyRepeat -int 10
### キーリピートを高速化（済）
defaults write -g KeyRepeat -int 1

## Mission Control

### Mision Control のアニメーションを高速化（済）
defaults write com.apple.dock expose-animation-duration -float 0
## オートマチックウィンドウアニメーションを無効化（？）
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

## Dock

### Dock のアニメーションを高速化（済）
defaults write com.apple.dock autohide-time-modifier -float 0.15
### Dock が表示されるまでの待ち時間をゼロにする（済）
defaults write com.apple.dock autohide-delay -float 0
### アプリを隠したら Dock のアイコンを半透明にする（済）
defaults write com.apple.dock showhidden -bool true

## Finder

## Finder のファイルを開くアニメーションを無効化（？）
defaults write com.apple.finder DisableAllAnimations -bool true
### ネットワークディスク上に .DS_Store を作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## QuickLook

### QuickLook の表示を高速化（？）
defaults write -g QLPanelAnimationDuration -float 0
### 他のアプリに切り替えたら QuickLook を非表示（？）
defaults write com.apple.finder QLHidePanelOnDeactivate -bool true
