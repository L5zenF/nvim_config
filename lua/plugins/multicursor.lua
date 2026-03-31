return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    event = "VeryLazy",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add cursors with mouse
      set("n", "<C-leftmouse>", mc.addCursor)
      set("n", "<C-leftdrag>", mc.cursorDrag)

      -- Add/skip cursor above/below
      set("n", "<c-k>", mc.cursorUp)
      set("n", "<c-j>", mc.cursorDown)
      set("n", "<s-up>", mc.cursorSkipUp)
      set("n", "<s-down>", mc.cursorSkipDown)

      -- Add all matches
      set("n", "<c-a>", mc.matchAllAdd)

      -- Rotate cursor
      set("n", "<c-n>", mc.nextCursor)
      set("n", "<c-p>", mc.prevCursor)

      -- Delete cursor
      set("n", "<c-x>", mc.deleteCursor)

      -- Align cursors
      set("n", "<leader>a", mc.alignCursors)
    end,
  },
}
