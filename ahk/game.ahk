#Requires AutoHotkey v2.0
#SingleInstance Force

; ============================================================
; Mod-Tap 設定 (ゲーム用)
;   Space     … Tap: Space / Hold: LShift
;   Caps Lock … Tap: Esc / Hold: LCtrl
;   LAlt      … Tap: IME Off / Hold: LCtrl / Special: Map 参照
;   RAlt      … Tap: IME On  / Hold: RAlt
;   Copilot   … 無効化
;
;   ※Caps Lock はドライバ層で F13 に再マップ済み前提
; ============================================================

; ---- 共通設定 ----
tapTimeout := 200  ; 単押し判定の閾値 (ms)

; ---- IME On/Off のキーコード ----
ime_on  := "{vk16}"
ime_off := "{vk1A}"

; ---- LAlt の特別マッピング ----
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
    if !spaceHeld {
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
; Caps Lock (F13) -> Tap: Esc / Hold: LCtrl
; ============================================================

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
; ゲートは物理 LAlt キー自体 (Hold の LCtrl ではない)。
HotIf (*) => GetKeyState("LAlt", "P")
for key, output in lAltSpecialMap
    Hotkey "*" key, lAltSpecial.Bind(output)
HotIf

; Hold は LCtrl。矢印はプレーンに出したいので、一度 LCtrl を外して送出し、
; まだ物理 LAlt を保持していれば Ctrl を戻す (Caps 版と同じ方式)。
lAltSpecial(output, *) {
    Critical
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
        Send ime_off
}

; ============================================================
; RAlt -> Tap: IME On / Hold: RAlt
; ============================================================

*RAlt:: {
    global rAltHeld, rAltTick
    if !rAltHeld {
        rAltHeld := true
        rAltTick := A_TickCount
        Send "{Blind}{RAlt Down}"
    }
}
*RAlt Up:: {
    global rAltHeld
    rAltHeld := false
    Send "{Blind}{RAlt Up}"
    if isTap("RAlt", rAltTick)
        Send ime_on
}

; ============================================================
; Copilot (LShift + LWin + F23) -> 無効化
; ============================================================

#+F23::return
