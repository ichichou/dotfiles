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
;     LCtrl … LAlt へリマップ (Tap/Hold とも LAlt)
;     RCtrl … RAlt へリマップ (Tap/Hold とも RAlt)
;     Copilot キー (LShift+LWin+F23) を無効化
;
;   [ノーマル]
;     CapsLock … Tap: Esc / Hold: LCtrl / Special: capsSpecialMap 有効
;     RAlt     … Tap: Enter
;
;   [ゲーム]
;     CapsLock … Tap: Esc / Hold: LCtrl / Special: 無効
;     RAlt     … Tap: IME On (vk16)
; ============================================================

; ---- 共通設定 ----
tapTimeout := 200  ; 単押し判定の閾値 (ms)。0 で時間無制限

; ---- 現在モード ("normal" / "game")。起動時はノーマル ----
mode := "normal"

; ---- CapsLock 押下中の特別マッピング (ノーマルのみ有効) ----
capsSpecialMap := Map(
    "h", "{Backspace}",
    "d", "{Delete}",
    "j", "{vk1A}",
    "l", "{vk16}"
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

SetCapsLockState "AlwaysOff"  ; CapsLock トグルを無効化
UpdateTrayTip()               ; 起動時のツールチップを設定

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
; CapsLock -> Tap: Esc / Hold: LCtrl
;   Special (capsSpecialMap) はノーマルモードのみ有効
; ============================================================

; 「Caps 保持中 かつ ノーマルモード」のときだけ有効なホットキーとして動的登録。
; HotIf のコールバックは押下ごとに評価されるため、mode を切り替えれば即反映される。
HotIf (*) => capsHeld && mode = "normal"
for key, output in capsSpecialMap
    Hotkey "*" key, capsSpecial.Bind(output)
HotIf

capsSpecial(output, *) {
    Send "{Blind}{LCtrl Up}" output  ; Caps 由来の Ctrl を外して目的の入力を送出
    if GetKeyState("CapsLock", "P")  ; まだ Caps 保持中なら Ctrl を戻す
        Send "{Blind}{LCtrl Down}"
}

*CapsLock:: {
    global capsHeld, capsTick
    if !capsHeld {
        capsHeld := true
        capsTick := A_TickCount
        Send "{Blind}{LCtrl Down}"
    }
}
*CapsLock Up:: {
    global capsHeld
    capsHeld := false
    Send "{Blind}{LCtrl Up}"
    if isTap("CapsLock", capsTick)
        Send "{Esc}"
}

; ============================================================
; LAlt -> Tap: IME Off / Hold: LCtrl / Special: lAltSpecialMap
; ============================================================

; lAltSpecialMap の各キーを「LAlt 保持中のみ有効」なホットキーとして動的登録
HotIf (*) => lAltHeld
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
; LCtrl -> LAlt へリマップ (Tap/Hold とも LAlt)
; RCtrl -> RAlt へリマップ (Tap/Hold とも RAlt)
; ============================================================

*LCtrl::Send "{Blind}{LAlt DownR}"
*LCtrl Up::Send "{Blind}{LAlt Up}"

*RCtrl::Send "{Blind}{RAlt DownR}"
*RCtrl Up::Send "{Blind}{RAlt Up}"

; ============================================================
; Copilot キー (LShift + LWin + F23) を無効化
; ============================================================

#+F23::return
