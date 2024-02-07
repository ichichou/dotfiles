require("noice").setup({
  cmdline = {
    -- view = "cmdline",
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
