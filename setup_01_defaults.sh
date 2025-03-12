#!/bin/bash
set -eu

# キーリピートが始まるまでの時間（ミリ秒）
defaults write -g InitialKeyRepeat -int 10

# キーリピートの速度
defaults write -g KeyRepeat -int 1

# Dock が隠れるまでの待ち時間
defaults write com.apple.dock autohide-delay -float 0

# Dock が隠れる速度
defaults write com.apple.dock autohide-time-modifier -float 0.15

# 入力モードアイコンを非表示
defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled 0
