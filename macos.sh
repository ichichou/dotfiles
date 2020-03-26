#!/bin/bash
set -eu

## Key Repeat

### キーリピート入力認識までの時間を短縮
defaults write -g InitialKeyRepeat -int 10
### キーリピートを高速化
defaults write -g KeyRepeat -int 1

## Dock

### Dock のアニメーションを高速化
defaults write com.apple.dock autohide-time-modifier -float 0.15
### Dock が表示されるまでの待ち時間をゼロにする
defaults write com.apple.dock autohide-delay -float 0
### アプリを隠したら Dock のアイコンを半透明にする
defaults write com.apple.dock showhidden -bool true

## Mission Control

### Mision Control のアニメーションを高速化
defaults write com.apple.dock expose-animation-duration -float 0
### ウィンドウを隣のデスクトップに移動するときの待ち時間を短縮
defaults write com.apple.dock workspaces-edge-delay -float 0.15
## ウィンドウのアニメーションを無効化
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

## Finder

## Finder のアニメーションを無効化
defaults write com.apple.finder DisableAllAnimations -bool true
### ネットワークディスク上に .DS_Store を作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## QuickLook

### QuickLook の表示を高速化
defaults write -g QLPanelAnimationDuration -float 0.1
### 他のアプリに切り替えたら QuickLook を非表示
defaults write com.apple.finder QLHidePanelOnDeactivate -bool true
### QuickLook で文字列を選択可能にする
defaults write com.apple.finder QLEnableTextSelection -bool true
