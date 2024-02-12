require("noice").setup({
  cmdline = {
    -- view = "cmdline",
    format = {
      cmdline = {
        title = "",
        icon = ">",
      },
      search_down = {
        title = "",
        icon = "⇣",
      },
      search_up = {
        title = "",
        icon = "⇡",
      },
      filter = {
        title = "",
        icon = "$",
      },
      lua = {
        title = "",
        icon = "☾",
      },
      help = {
        title = "",
        icon = "?",
      },
    },
  },

  messages = {
    view = "mini",
    view_error = "mini",
    view_warn = "mini",
  },

  views = {

    cmdline_popup = {
      border = {
        style = "single"
      },
    },

    -- cmdline_popup = {
    --   border = {
    --     style = "none",
    --     padding = { 1, 2 },
    --   },
    --   win_options = {
    --     winhighlight = {
    --       NormalFloat = "NormalFloat",
    --       FloatBorder = "FloatBorder",
    --     },
    --   },
    -- },

    mini = {
      timeout = 5000,
      position = {
        row = 0,
      },
    },

  },
})
