#Requires AutoHotkey v2.0
#SingleInstance Force

; ============================================================
; Mod-Tap 設定
;   Space    … Tap: Space   / Hold: LShift
;   CapsLock … Tap: Esc     / Hold: LCtrl  / Special: Map 参照
;   LAlt     … Tap: IME Off / Hold: LAlt   / Special: Map 参照
;   RAlt     … Tap: IME On  / Hold: RAlt
; ============================================================

; ---- 共通設定 ----
tapTimeout := 200  ; 単押し判定の閾値 (ms)。0 で時間無制限

; ---- CapsLock 押下中の特別マッピング ----
capsSpecialMap := Map(
    "h", "{Backspace}",
    "d", "{Delete}",
    "j", "{vk1A}",
    "l", "{vk16}"
)

; ---- LAlt 押下中の特別マッピング ----
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

; ---- 共通ヘルパ: タップ判定 ----
; 直前キーが自分自身 = 間に他キーを挟んでいない、
; かつ閾値内 (または tapTimeout = 0) なら true
isTap(keyName, downTick) {
    global tapTimeout
    return A_PriorKey = keyName && (!tapTimeout || A_TickCount - downTick < tapTimeout)
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
; CapsLock -> Tap: Esc / Hold: LCtrl / Special: capsSpecialMap
; ============================================================

; capsSpecialMap の各キーを「Caps 保持中のみ有効」なホットキーとして動的登録
HotIf (*) => capsHeld
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
; LAlt -> Tap: IME Off / Hold: LAlt / Special: lAltSpecialMap
; ============================================================

; lAltSpecialMap の各キーを「LAlt 保持中のみ有効」なホットキーとして動的登録
HotIf (*) => lAltHeld
for key, output in lAltSpecialMap
    Hotkey "*" key, lAltSpecial.Bind(output)
HotIf

; Caps 版と違い Alt は戻さない。Alt を一度だけ外し ({Blind} なしで
; AHK の自動マスクを効かせて) メニューバー発火を抑止する。以降の矢印は
; Alt が外れたまま送られるので、連続移動でもメニューが出ない。
lAltSpecial(output, *) {
    Send "{LAlt Up}" output
}

*LAlt:: {
    global lAltHeld, lAltTick
    if !lAltHeld {
        lAltHeld := true
        lAltTick := A_TickCount
        Send "{Blind}{LAlt DownR}"
    }
}
*LAlt Up:: {
    global lAltHeld
    lAltHeld := false
    Send "{Blind}{LAlt Up}"
    if isTap("LAlt", lAltTick)
        Send "{vk1A}"
}

; ============================================================
; RAlt -> Tap: IME On / Hold: RAlt
; ============================================================

*RAlt:: {
    global rAltHeld, rAltTick
    if !rAltHeld {
        rAltHeld := true
        rAltTick := A_TickCount
        Send "{Blind}{RAlt DownR}"
    }
}
*RAlt Up:: {
    global rAltHeld
    rAltHeld := false
    Send "{Blind}{RAlt Up}"
    if isTap("RAlt", rAltTick)
        Send "{vk16}"
}
