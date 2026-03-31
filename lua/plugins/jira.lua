return {
  {
    "letieu/jira.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Jira" },
    keys = {
      { "<leader>xj", "<cmd>Jira<cr>", desc = "Jira" },
    },
    opts = {
      -- Config in ~/.jira.json or environment variables:
      -- JIRA_DOMAIN, JIRA_EMAIL, JIRA_API_KEY
    },
  },
}
