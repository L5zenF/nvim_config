return {
  {
    "danymat/neogen",
    cmd = "Neogen",
    keys = {
      { "<leader>cn", function() require("neogen").generate() end, desc = "Generate Docstring" },
      { "<leader>cn", function() require("neogen").generate({ type = "func" }) end, desc = "Generate Docstring (func)", mode = "v" },
    },
    opts = {
      snippet_engine = "luasnip",
      languages = {
        python = { template = { annotation_convention = "google_docstrings" } },
        go = { template = { annotation_convention = "godoc" } },
        rust = { template = { annotation_convention = "rustdoc" } },
        typescript = { template = { annotation_convention = "tsdoc" } },
        javascript = { template = { annotation_convention = "jsdoc" } },
      },
    },
  },
}
