#Requires AutoHotkey v2.0
#SingleInstance Force

; ============================================================
; Mod-Tap 設定
;   Win + K で Normal Mode / Game Mode を切り替え
;   現在モードはトレイアイコンと画面中央のツールチップで表示する
;
;   [共通]
;     Space     … Tap: Space / Hold: LShift
;     Caps Lock … (モード次第)
;     LAlt      … Tap: IME Off / Hold: LCtrl / Special: Map 参照
;     RAlt      … (モード次第)
;     RCtrl     … (モード次第)
;     Copilot   … (モード次第)
;
;   [Normal Mode]
;     Caps Lock … Tap: Esc / Hold: LCtrl / Special: Map 参照
;     RAlt      … Tap: Enter
;     RCtrl     … RAlt
;     Copilot   … Backspace
;
;   [Game Mode]
;     Caps Lock … Tap: Esc / Hold: LCtrl / Special: 無効
;     RAlt      … Tap: IME On / Hold: RAlt
;     RCtrl     … 変更なし
;     Copilot   … 無効化
;
;   ※Caps Lock はドライバ層で F13 に再マップ済み前提
; ============================================================

; ---- 共通設定 ----
tapTimeout := 200  ; 単押し判定の閾値 (ms)

; ---- 現在モード ----
mode := "normal"

; ---- IME On/Off のキーコード ----
ime_on  := "{vk16}"
ime_off := "{vk1A}"

; ---- LAlt の特別マッピング (両モード共通) ----
lAltSpecialMap := Map(
    "h", "{Left}",
    "j", "{Down}",
    "k", "{Up}",
    "l", "{Right}"
)

; ---- Caps Lock の特別マッピング (Normal Mode のみ) ----
capsSpecialMap := Map(
    "d", "{Delete}",
    "h", "{Backspace}",
    "j", ime_on,
    "l", ime_off
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
rAltMod   := ""
rCtrlHeld := false
rCtrlMod  := ""

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
    ToolTip (mode = "normal" ? "Normal Mode" : "Game Mode")
    SetTimer () => ToolTip(), -1000
}

; トレイアイコンのツールチップへ現在モードを反映
UpdateTrayTip() {
    global mode
    A_IconTip := (mode = "normal" ? "Normal Mode" : "Game Mode")
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
; Caps Lock (F13) -> Tap: Esc / Hold: LCtrl / Special: Map 参照
; ============================================================

; 「F13 を物理的に保持中かつ Normal Mode」のときだけ有効なホットキーとして動的登録。
; ゲートは物理 F13 キー自体 (Hold の LCtrl ではない) なので LAlt 側と干渉しない。
; HotIf のコールバックは押下ごとに評価されるため、mode 切替も即反映される。
HotIf (*) => GetKeyState("F13", "P") && mode = "normal"
for key, output in capsSpecialMap
    Hotkey "*" key, capsSpecial.Bind(output)
HotIf

capsSpecial(output, *) {
    Critical
    Send "{Blind}{LCtrl Up}" output
    if GetKeyState("F13", "P")
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
; LAlt -> Tap: IME Off / Hold: LCtrl / Special: Map 参照
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
; RAlt ->
;   [Normal Mode] Tap: Enter  / Hold: RCtrl
;   [Game Mode]   Tap: IME On / Hold: RAlt
; ============================================================

*RAlt:: {
    global rAltHeld, rAltTick, rAltMod, mode
    if !rAltHeld {
        rAltHeld := true
        rAltTick := A_TickCount
        rAltMod := (mode = "normal") ? "RCtrl" : "RAlt"
        Send "{Blind}{" rAltMod " Down}"
    }
}
*RAlt Up:: {
    global rAltHeld, rAltMod, mode
    rAltHeld := false
    Send "{Blind}{" rAltMod " Up}"
    if isTap("RAlt", rAltTick)
        Send (mode = "normal") ? "{Enter}" : ime_on
}

; ============================================================
; RCtrl ->
;   [Normal Mode] RAlt
;   [Game Mode]   変更なし
; ============================================================

*RCtrl:: {
    global rCtrlHeld, rCtrlMod, mode
    if !rCtrlHeld {
        rCtrlHeld := true
        rCtrlMod := (mode = "normal") ? "RAlt" : "RCtrl"
        Send "{Blind}{" rCtrlMod " Down}"
    }
}
*RCtrl Up:: {
    global rCtrlHeld, rCtrlMod
    rCtrlHeld := false
    Send "{Blind}{" rCtrlMod " Up}"
}

; ============================================================
; Copilot (LShift + LWin + F23) ->
;   [Normal Mode] Backspace
;   [Game Mode]   無効化
; ============================================================

#+F23:: {
    global mode
    if mode = "normal"
        Send "{Backspace}"
}
