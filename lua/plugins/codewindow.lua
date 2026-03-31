return {
  {
    "wfxr/minimap.vim",
    event = "VeryLazy",
    build = "cargo install --locked code-minimap",
    init = function()
      vim.g.minimap_width = 10
      vim.g.minimap_auto_start = 0
      vim.g.minimap_auto_start_win_enter = 0
      vim.g.minimap_highlight_range = 1
      vim.g.minimap_highlight_search = 1
      vim.g.minimap_git_colors = 1
      vim.g.minimap_block_filetypes = {
        "fugitive",
        "nerdtree",
        "tagbar",
        "fzf",
        "neo-tree",
        "NvimTree",
        "Trouble",
        "dashboard",
        "lazy",
        "mason",
        "snacks_picker_list",
        "snacks_picker_input",
        "minimap",
      }
    end,
    keys = {
      { "<leader>um", "<cmd>MinimapToggle<cr>", desc = "Toggle Minimap" },
    },
  },
}
