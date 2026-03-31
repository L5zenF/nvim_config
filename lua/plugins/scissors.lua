return {
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
    keys = {
      { "<leader>sa", function() require("scissors").addNewSnippet() end, desc = "Add Snippet" },
      { "<leader>se", function() require("scissors").editSnippet() end, desc = "Edit Snippet" },
      { "<leader>se", function() require("scissors").editSnippet() end, mode = "v", desc = "Edit Snippet (visual)" },
    },
  },
}
