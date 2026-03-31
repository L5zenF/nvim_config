return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    event = "VeryLazy",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      -- Add cursors with mouse
      mc.addKey("map", "<C-leftmouse>", mc.addCursor)
      mc.addKey("map", "<C-leftdrag>", mc.cursorDrag)

      -- Add/skip cursor above/below
      mc.addKey("n", "<c-k>", mc.cursorUp)
      mc.addKey("n", "<c-j>", mc.cursorDown)
      mc.addKey("n", "<s-up>", mc.cursorSkipUp)
      mc.addKey("n", "<s-down>", mc.cursorSkipDown)

      -- Add all matches
      mc.addKey("n", "<c-a>", mc.matchAllAdd)

      -- Rotate cursor
      mc.addKey("n", "<c-n>", mc.nextCursor)
      mc.addKey("n", "<c-p>", mc.prevCursor)

      -- Delete cursor
      mc.addKey("n", "<c-x>", mc.deleteCursor)

      -- Align cursors
      mc.addKey("n", "<leader>a", mc.alignCursors)
    end,
  },
}
