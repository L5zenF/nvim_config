return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      -- 自动保存 session 的目录（nil = 当前目录）
      dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
      -- 自动恢复上次 session
      options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" },
      -- 在这些分支中不保存 session
      filter = function(buf)
        return vim.bo[buf].buftype == ""
      end,
    },
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
}
