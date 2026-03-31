return {
  {
    "andythigpen/nvim-coverage",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "Coverage", "CoverageSummary", "CoverageLoad", "CoverageToggle" },
    keys = {
      { "<leader>tc", "<cmd>CoverageToggle<cr>", desc = "Toggle Coverage" },
      { "<leader>ts", "<cmd>CoverageSummary<cr>", desc = "Coverage Summary" },
    },
    opts = {
      auto_reload = true,
      load_coverage_cb = function(ft)
        require("coverage").load(true)
      end,
    },
  },
}
