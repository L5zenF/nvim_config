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
      set("n", "<C-leftmouse>", mc.handleMouse)
      set("n", "<C-leftdrag>", mc.handleMouseDrag)

      -- Add/skip cursor above/below
      set("n", "<c-k>", function() mc.lineAddCursor(-1) end)
      set("n", "<c-j>", function() mc.lineAddCursor(1) end)
      set("n", "<s-up>", function() mc.lineSkipCursor(-1) end)
      set("n", "<s-down>", function() mc.lineSkipCursor(1) end)

      -- Add all matches
      set("n", "<c-a>", mc.matchAllAddCursors)

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
