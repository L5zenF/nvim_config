return {
  {
    "folke/snacks.nvim",
    opts = {
      words = { enabled = true },
      picker = {
        sources = {
          explorer = {
            hidden = true,
          },
        },
      },
    },
    keys = {
      { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    },
  },
}
