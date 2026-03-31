return {
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      enable_builtin = true,
    },
    keys = {
      { "<leader>gi", "<cmd>Octo issue list<cr>", desc = "Issues" },
      { "<leader>gp", "<cmd>Octo pr list<cr>", desc = "Pull Requests" },
      { "<leader>gr", "<cmd>Octo review start<cr>", desc = "Start Review" },
    },
  },
}
