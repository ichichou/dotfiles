require("noice").setup({
  views = {
    mini = {
      timeout = 5000,
      position = {
        row = 0,
      },
    },
  },
  routes = {
    {
      view = "mini",
      filter = { event = "msg_showmode" },
    },
  },
})
