#Requires AutoHotkey v2.0
#SingleInstance Force

; ============================================================
; Mod-Tap 設定 (ゲーム時)
;   Space    … Tap: Space   / Hold: LShift
;   CapsLock … Tap: Esc     / Hold: LCtrl
;   LAlt     … Tap: IME Off / Hold: LCtrl  / Special: Map 参照
;   RAlt     … Tap: IME On  / Hold: RCtrl
;   LCtrl    … LAlt へリマップ (Tap/Hold とも LAlt)
;   RCtrl    … RAlt へリマップ (Tap/Hold とも RAlt)
; ============================================================

; ---- 共通設定 ----
tapTimeout := 200  ; 単押し判定の閾値 (ms)。0 で時間無制限

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
; CapsLock -> Tap: Esc / Hold: LCtrl
; ============================================================

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
; RAlt -> Tap: IME On / Hold: RCtrl
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
    global rAltHeld
    rAltHeld := false
    Send "{Blind}{RCtrl Up}"
    if isTap("RAlt", rAltTick)
        Send "{vk16}"
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
