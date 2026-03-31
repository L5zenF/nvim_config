return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
      open_fold_hl_timeout = 150,
      close_fold_kinds_for_ft = {
        default = { "imports", "comment" },
      },
    },
    keys = {
      { "zR", function() require("ufo").openAllFolds() end, desc = "Open All Folds" },
      { "zM", function() require("ufo").closeAllFolds() end, desc = "Close All Folds" },
      { "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "Open Folds Except Kinds" },
      { "zm", function() require("ufo").closeFoldsWith() end, desc = "Close Folds With" },
      { "zp", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek Fold" },
    },
    -- Required for ufo to work
    init = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
  },
}
