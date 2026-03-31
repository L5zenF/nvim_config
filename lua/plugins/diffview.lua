return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    keys = {
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
      { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", desc = "File History" },
      { "<leader>gdH", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
    },
    opts = {
      enhanced_diff_hl = true,
    },
  },
}
