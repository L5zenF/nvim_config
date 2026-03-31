return {
  {
    "gorbit99/codewindow.nvim",
    event = "VeryLazy",
    opts = {
      auto_toggle = false,
      max_minimap_height = 20,
      minimap_width = 20,
      use_treesitter = true,
      use_lsp = true,
      exclude_filetypes = { "help", "dashboard", "lazy", "mason", "neo-tree", "NvimTree", "Trouble" },
    },
    keys = {
      { "<leader>um", function() require("codewindow.window").toggle_minimap() end, desc = "Toggle Minimap" },
    },
    config = function(_, opts)
      local cw = require("codewindow")
      cw.setup(opts)
    end,
  },
}
