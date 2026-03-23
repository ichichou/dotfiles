// 99_minimum.jsonnet
// Jsonnet rewrite of 99_minimum.yml

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

local basic = "basic";

// simultaneous(k1, k2, to): 2キーの同時押しマッピング
local simultaneous(k1, k2, to) = {
  type: basic,
  from: {
    simultaneous: [
      { key_code: k1 },
      { key_code: k2 },
    ],
  },
  to: to,
};

// modMap(key, modifier, to): modifier+key → to  (optional: any 付き)
local modMap(key, modifier, to) = {
  type: basic,
  from: {
    key_code: key,
    modifiers: {
      mandatory: [modifier],
      optional: ["any"],
    },
  },
  to: to,
};

// toKey(key, mods?, repeat?): to 配列の各エントリを構築
local toKey(key, mods=null, repeat=null) =
  { key_code: key }
  + (if mods != null then { modifiers: mods } else {})
  + (if repeat != null then { repeat: repeat } else {});

// ---------------------------------------------------------------------------
// ショートカット関数
// ---------------------------------------------------------------------------

// LCmd + key → カーソル移動
local lcmdCursor(key, arrow) = modMap(key, "left_command", [{ key_code: arrow }]);

// LCtrl + key → テンキー
local lctrlNumpad(key, numpadKey) = modMap(key, "left_control", [{ key_code: numpadKey }]);

// タッチ中のキー → マウスボタン (multitouch_extension 使用時のみ有効)
local clickKey(key, button) = {
  type: basic,
  from: {
    key_code: key,
    modifiers: { optional: ["any"] },
  },
  to: [{ pointing_button: button }],
  conditions: [{
    type: "variable_unless",
    name: "multitouch_extension_finger_count_total",
    value: 0,
  }],
};

// ---------------------------------------------------------------------------
// Rules
// ---------------------------------------------------------------------------

{
  title: "99. Minimum Mappings",
  rules: [

    // ------------------------------------------------------------------
    // FG/HJ → 「」/（）
    // ------------------------------------------------------------------
    {
      description: "FG/HJ → 「」/（）",
      manipulators: [
        // FG → 「」 + Left
        simultaneous("f", "g", [
          toKey("open_bracket"),
          toKey("close_bracket"),
          toKey("left_arrow", repeat=false),
        ]),
        // HJ → （） + Left
        simultaneous("h", "j", [
          toKey("9", mods=["shift"]),
          toKey("0", mods=["shift"]),
          toKey("left_arrow", repeat=false),
        ]),
      ],
    },

    // ------------------------------------------------------------------
    // Combo → Symbol
    // ------------------------------------------------------------------
    {
      description: "Combo → Symbol",
      manipulators: [
        // RG → ・
        simultaneous("r", "g", [toKey("slash", repeat=false)]),
        // RF → ・ (代替)
        simultaneous("r", "f", [toKey("slash", repeat=false)]),
        // UH → ／
        simultaneous("u", "h", [toKey("backslash"), toKey("slash", repeat=false)]),
        // FB → ！
        simultaneous("f", "b", [toKey("1", mods=["shift"], repeat=false)]),
        // FV → ！ (代替)
        simultaneous("f", "v", [toKey("1", mods=["shift"], repeat=false)]),
        // JN → ？
        simultaneous("j", "n", [toKey("slash", mods=["shift"], repeat=false)]),
      ],
    },

    // ------------------------------------------------------------------
    // Command Key
    // ------------------------------------------------------------------
    {
      description: "LCmd + Space → Return",
      manipulators: [
        modMap("spacebar", "left_command", [toKey("return_or_enter", repeat=false)]),
      ],
    },

    {
      description: "LCmd + RCmd → Esc",
      manipulators: [
        // LCmd-RCmd → Esc
        {
          type: basic,
          from: {
            key_code: "right_command",
            modifiers: { mandatory: ["left_command"] },
          },
          to: [toKey("escape", repeat=false)],
        },
        // RCmd-LCmd → Esc
        {
          type: basic,
          from: {
            key_code: "left_command",
            modifiers: { mandatory: ["right_command"] },
          },
          to: [toKey("escape", repeat=false)],
        },
      ],
    },

    // LCmd + I/J/K/L → カーソル移動 (IJKL配列)
    {
      description: "LCmd + I/J/K/L → Cursor Keys",
      manipulators: [
        lcmdCursor("i", "up_arrow"),
        lcmdCursor("j", "left_arrow"),
        lcmdCursor("k", "down_arrow"),
        lcmdCursor("l", "right_arrow"),
      ],
    },

    // LCmd + H/J/K/L → カーソル移動 (Vim配列)
    {
      description: "LCmd + H/J/K/L → Cursor Keys",
      manipulators: [
        lcmdCursor("h", "left_arrow"),
        lcmdCursor("j", "down_arrow"),
        lcmdCursor("k", "up_arrow"),
        lcmdCursor("l", "right_arrow"),
      ],
    },

    {
      description: "LCmd + N/M → Delete / Delete Forward",
      manipulators: [
        modMap("n", "left_command", [{ key_code: "delete_or_backspace" }]),
        modMap("m", "left_command", [{ key_code: "delete_forward" }]),
      ],
    },

    {
      description: "LCmd/RCmd → Eisuu/Kana",
      manipulators: [
        // LCmd → 英数 (単押し) / LCmd (修飾)
        {
          type: basic,
          from: { key_code: "left_command" },
          to: [{ key_code: "left_command", lazy: true }],
          to_if_alone: [{ key_code: "japanese_eisuu" }],
        },
        // RCmd → かな (単押し) / RCmd (修飾)
        {
          type: basic,
          from: { key_code: "right_command" },
          to: [{ key_code: "right_command", lazy: true }],
          to_if_alone: [{ key_code: "japanese_kana" }],
        },
      ],
    },

    // ------------------------------------------------------------------
    // Control Key
    // ------------------------------------------------------------------
    {
      description: "Caps Lock → Esc & Ctrl",
      manipulators: [
        // Caps Lock → Esc (単押し) / LCtrl (修飾)
        {
          type: basic,
          from: {
            key_code: "caps_lock",
            modifiers: { optional: ["any"] },
          },
          to: [{ key_code: "left_control", lazy: true }],
          to_if_alone: [{ key_code: "escape" }],
        },
        // Esc → Esc (単押し) / LCtrl (修飾)
        {
          type: basic,
          from: {
            key_code: "escape",
            modifiers: { optional: ["any"] },
          },
          to: [{ key_code: "left_control", lazy: true }],
          to_if_alone: [{ key_code: "escape" }],
        },
      ],
    },

    // ------------------------------------------------------------------
    // Numpad Layer: LCtrl + 右手側 → テンキー
    // ------------------------------------------------------------------
    {
      description: "LCtrl + Right Hand Side → Numpad Layer",
      manipulators: [
        // YUIOP 段
        lctrlNumpad("u", "keypad_7"),
        lctrlNumpad("i", "keypad_8"),
        lctrlNumpad("o", "keypad_9"),
        modMap("p", "left_control", [{ key_code: "keypad_period" }]),

        // HJKL; 段
        modMap("h", "left_control", [{ key_code: "delete_or_backspace" }]),
        lctrlNumpad("j", "keypad_4"),
        lctrlNumpad("k", "keypad_5"),
        lctrlNumpad("l", "keypad_6"),
        modMap("semicolon", "left_control", [{ key_code: "keypad_comma" }]),

        // NM,. 段
        lctrlNumpad("n", "keypad_0"),
        lctrlNumpad("m", "keypad_1"),
        lctrlNumpad("comma", "keypad_2"),
        lctrlNumpad("period", "keypad_3"),
      ],
    },

    // ------------------------------------------------------------------
    // Hyper Key
    // ------------------------------------------------------------------
    {
      description: "Tab → Tab & Hyper Key",
      manipulators: [
        {
          type: basic,
          from: { key_code: "tab" },
          to_if_alone: [{ key_code: "tab" }],
          to: [{
            key_code: "right_shift",
            modifiers: ["right_control", "right_option", "right_command"],
            lazy: true,
          }],
        },
      ],
    },

    // ------------------------------------------------------------------
    // SandS (Space and Shift)
    // ------------------------------------------------------------------
    {
      description: "Space → Space & Shift",
      manipulators: [
        {
          type: basic,
          from: {
            key_code: "spacebar",
            modifiers: { optional: ["any"] },
          },
          to_if_alone: [{ key_code: "spacebar" }],
          to: [{ key_code: "left_shift", lazy: true }],
        },
      ],
    },

    // ------------------------------------------------------------------
    // Click Key (multitouch_extension 使用中のみ有効)
    // ------------------------------------------------------------------
    {
      description: "Click Key",
      manipulators: [
        clickKey("w", "button2"),  // W → 右クリック
        clickKey("e", "button1"),  // E → 左クリック
        clickKey("r", "button3"),  // R → 中クリック
      ],
    },

  ],
}
