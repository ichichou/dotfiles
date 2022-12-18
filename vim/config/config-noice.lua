require("noice").setup({
  views = {
    mini = {
      timeout = 5000,
      position = {
        row = 0
      },
    },
    cmdline_popup = {
      border = {
        style = "none",
        padding = {2, 3},
      },
      win_options = {
        winhighlight = {
          Normal = "NormalFloat",
          FloatBorder = "FloatBorder",
        },
      },
    },
  },
})
