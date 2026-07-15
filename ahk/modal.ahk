#Requires AutoHotkey v2.0
#SingleInstance Force

; ============================================================
; Mod-Tap 設定 (モード切替式)
;   Win + K でノーマル / ゲームをトグル。
;   現在モードはトレイアイコンのツールチップと、
;   切替時の画面ツールチップで表示する。
;
;   [共通]
;     Space … Tap: Space   / Hold: LShift
;     LAlt  … Tap: IME Off / Hold: LCtrl  / hjkl: Arrows
;     RCtrl … RAlt へリマップ (Tap/Hold とも RAlt)
;     Copilot キー (LShift+LWin+F23) を Backspace にリマップ
;     ※ CapsLock はドライバ層で F13 に再マップ済み前提 (LCtrl は素のまま)
;
;   [ノーマル]
;     F13(旧Caps) … Tap: Esc / Hold: LCtrl / Special: capsSpecialMap 有効
;     RAlt        … Tap: Enter
;
;   [ゲーム]
;     F13(旧Caps) … Tap: Esc / Hold: LCtrl / Special: 無効
;     RAlt        … Tap: IME On (vk16)
; ============================================================

; ---- 共通設定 ----
tapTimeout := 200  ; 単押し判定の閾値 (ms)。0 で時間無制限

; ---- 現在モード ("normal" / "game")。起動時はノーマル ----
mode := "normal"

; ---- F13 押下中の特別マッピング (ノーマルのみ有効) ----
capsSpecialMap := Map(
    "h", "{Backspace}",
    "d", "{Delete}",
    "j", "{vk16}",
    "l", "{vk1A}"
)

; ---- LAlt 押下中の特別マッピング (両モード共通) ----
lAltSpecialMap := Map(
    "h", "{Left}",
    "j", "{Down}",
    "k", "{Up}",
    "l", "{Right}"
)

; ---- 内部状態 ----
spaceHeld := false
spaceTick := 0
capsHeld  := false
capsTick  := 0
lAltHeld  := false
lAltTick  := 0
rAltHeld  := false
rAltTick  := 0

UpdateTrayTip()  ; 起動時のツールチップを設定

; ---- 共通ヘルパ: タップ判定 ----
; 直前キーが自分自身 = 間に他キーを挟んでいない、
; かつ閾値内 (または tapTimeout = 0) なら true
isTap(keyName, downTick) {
    global tapTimeout
    return A_PriorKey = keyName && (!tapTimeout || A_TickCount - downTick < tapTimeout)
}

; ============================================================
; モード切替: Win + K
; ============================================================

#k:: {
    global mode
    mode := (mode = "normal") ? "game" : "normal"
    UpdateTrayTip()
    ; 画面中央付近に現在モードを一瞬表示 (1 秒で自動消去)
    ToolTip "モード: " (mode = "normal" ? "ノーマル" : "ゲーム")
    SetTimer () => ToolTip(), -1000
}

; トレイアイコンのツールチップへ現在モードを反映
UpdateTrayTip() {
    global mode
    A_IconTip := "Mod-Tap [" (mode = "normal" ? "ノーマル" : "ゲーム") "]"
}

; ============================================================
; Space -> Tap: Space / Hold: LShift
; ============================================================

*Space:: {
    global spaceHeld, spaceTick
    if !spaceHeld {                  ; オートリピートの2回目以降は無視
        spaceHeld := true
        spaceTick := A_TickCount
        Send "{Blind}{LShift Down}"
    }
}
*Space Up:: {
    global spaceHeld
    spaceHeld := false
    Send "{Blind}{LShift Up}"
    if isTap("Space", spaceTick)
        Send "{Space}"
}

; ============================================================
; F13 (旧CapsLock) -> Tap: Esc / Hold: LCtrl
;   Special (capsSpecialMap) はノーマルモードのみ有効
; ============================================================

; 「F13 を物理的に保持中 かつ ノーマルモード」のときだけ有効なホットキーとして動的登録。
; ゲートは物理 F13 キー自体 (Hold の LCtrl ではない) なので LAlt 側と干渉しない。
; HotIf のコールバックは押下ごとに評価されるため、mode 切替も即反映される。
HotIf (*) => GetKeyState("F13", "P") && mode = "normal"
for key, output in capsSpecialMap
    Hotkey "*" key, capsSpecial.Bind(output)
HotIf

capsSpecial(output, *) {
    Send "{Blind}{LCtrl Up}" output  ; F13 由来の Ctrl を外して目的の入力を送出
    if GetKeyState("F13", "P")       ; まだ F13 保持中なら Ctrl を戻す
        Send "{Blind}{LCtrl Down}"
}

*F13:: {
    global capsHeld, capsTick
    if !capsHeld {
        capsHeld := true
        capsTick := A_TickCount
        Send "{Blind}{LCtrl Down}"
    }
}
*F13 Up:: {
    global capsHeld
    capsHeld := false
    Send "{Blind}{LCtrl Up}"
    if isTap("F13", capsTick)
        Send "{Esc}"
}

; ============================================================
; LAlt -> Tap: IME Off / Hold: LCtrl / Special: lAltSpecialMap
; ============================================================

; lAltSpecialMap の各キーを「LAlt を物理的に保持中のみ有効」なホットキーとして動的登録。
; caps 側と同様、ゲートは物理 LAlt キー自体 (Hold の LCtrl ではない)。
HotIf (*) => GetKeyState("LAlt", "P")
for key, output in lAltSpecialMap
    Hotkey "*" key, lAltSpecial.Bind(output)
HotIf

; Hold は LCtrl。矢印はプレーンに出したいので、一度 LCtrl を外して送出し、
; まだ物理 LAlt を保持していれば Ctrl を戻す (Caps 版と同じ方式)。
lAltSpecial(output, *) {
    Send "{Blind}{LCtrl Up}" output
    if GetKeyState("LAlt", "P")
        Send "{Blind}{LCtrl Down}"
}

*LAlt:: {
    global lAltHeld, lAltTick
    if !lAltHeld {
        lAltHeld := true
        lAltTick := A_TickCount
        Send "{Blind}{LCtrl Down}"
    }
}
*LAlt Up:: {
    global lAltHeld
    lAltHeld := false
    Send "{Blind}{LCtrl Up}"
    if isTap("LAlt", lAltTick)
        Send "{vk1A}"
}

; ============================================================
; RAlt -> Tap: (ノーマル) Enter / (ゲーム) IME On / Hold: RCtrl
; ============================================================

*RAlt:: {
    global rAltHeld, rAltTick
    if !rAltHeld {
        rAltHeld := true
        rAltTick := A_TickCount
        Send "{Blind}{RCtrl Down}"
    }
}
*RAlt Up:: {
    global rAltHeld, mode
    rAltHeld := false
    Send "{Blind}{RCtrl Up}"
    if isTap("RAlt", rAltTick)
        Send (mode = "normal") ? "{Enter}" : "{vk16}"
}

; ============================================================
; RCtrl -> RAlt へリマップ (Tap/Hold とも RAlt)
;   ※ LCtrl はリマップせず素の Ctrl のまま
; ============================================================

*RCtrl::Send "{Blind}{RAlt DownR}"
*RCtrl Up::Send "{Blind}{RAlt Up}"

; ============================================================
; Copilot キー (LShift + LWin + F23) を Backspace にリマップ
;   Shift/Win を外して素の Backspace を送出 (AHK が LWin をマスク)。
; ============================================================

#+F23::Send "{Backspace}"
